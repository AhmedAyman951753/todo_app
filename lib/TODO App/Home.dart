import 'package:flutter/material.dart';
import 'package:todo_app/TODO App/Categories/AppColors.dart';
import 'package:todo_app/TODO App/Categories/ProfileAppBar.dart';
import 'Categories/TasksList.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/TODO App/Categories/AppIcons.dart';
import 'package:todo_app/TODO App/Categories/MyButtons.dart';
import 'package:todo_app/TODO App/Categories/TaskCounter.dart';
import 'Categories/TaskGroupContainer.dart';
class Home extends StatelessWidget {
  final String name;
  const Home({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileAppBar(name: name),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                width: 335,
                height: 135,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: AppColors.green
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your today’s tasks\nalmost done!", style: TextStyle(color: Colors.white),),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text("80", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                        Text("%", style: TextStyle(color: Colors.white, fontSize: 25),),
                        SizedBox(width: 90),
                        MyButtons(radius: 18, width: 121, height: 34, color: Colors.white, child: Center(child: Text("View Tasks", style: TextStyle(color: AppColors.green),)),)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              TaskCounter(label: "In Progress", number: 5),
              SizedBox(height: 20),
              TasksList(),
              SizedBox(height: 20),
              Row(children: [SizedBox(width: 20), Text("Task Groups"),],),
              SizedBox(height: 10),
              TaskGroupContainer(iconColor: AppColors.semiGreen, iconData: SvgPicture.asset(AppIcons.greenperson), label: "Personal Task", counter: 5, counterColor: AppColors.green, counterContainerColor: AppColors.semiGreen),
              TaskGroupContainer(iconColor: AppColors.backcolorIcon, iconData: SvgPicture.asset(AppIcons.home2), label: "Home Task", counter: 3, counterColor: AppColors.pink, counterContainerColor: AppColors.backcolorIcon),
              TaskGroupContainer(iconColor: AppColors.brown, iconData: SvgPicture.asset(AppIcons.bag), label: "Work Task", counter: 1, counterColor: AppColors.white, counterContainerColor: AppColors.black)
            ],
          ),
        ),
      ),

    );
  }
}