import 'package:flutter/material.dart';
import 'package:todo_app/TODO App/Categories/AppColors.dart';
import 'package:todo_app/TODO App/AddTask.dart';
import 'package:todo_app/TODO App/Categories/ProfileAppBar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/TODO App/Categories/AppIcons.dart';

class NoTasks extends StatelessWidget {
  final String name;
  const NoTasks({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          SizedBox(height: 50),
          ProfileAppBar(name: name),
          SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("There are no tasks yet,\n     Press the button\n    To add New Task ")
            ],
          ),
          SizedBox(height: 20),
          SvgPicture.asset(AppIcons.notasks)
        ],
      ),
    );
  }
}
