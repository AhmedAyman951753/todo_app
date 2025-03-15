import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/features/OnBoarding/manager/register_cubit.dart';
import 'package:todo_app/features/OnBoarding/manager/register_state.dart';
import 'package:todo_app/features/Tasks/views/widgets/ProfileAppBar.dart';
import '../../../core/AppColors.dart';
import '../../../core/AppIcons.dart';

class NoTasks extends StatelessWidget {
  final String name;
  const NoTasks({super.key, required this.name});
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          SizedBox(height: 50),
          BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state)
            {
              return Column(
                children: [
                  ProfileAppBar(name: name)
                ],
              );
            },
          ),
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
