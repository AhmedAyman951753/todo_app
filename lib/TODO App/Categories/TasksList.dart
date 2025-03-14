import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/AppColors.dart';
import '../../core/AppIcons.dart';
import 'TaskContainer.dart';
class TasksList extends StatelessWidget {
  final List<TaskContainer> tasks = [workTask , personalTask , homeTask];
  TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(scrollDirection: Axis.horizontal, padding: EdgeInsets.only(left: 20, right: 20),
          itemBuilder: (context, index) => tasks[index],
          separatorBuilder: (context, index) => SizedBox(width: 10),
          itemCount: tasks.length
      ),
    );
  }
}

TaskContainer workTask = TaskContainer(containerColor: Colors.black,
  label: "Work Task",
  labelStyle: TextStyle(color: Colors.white),
  iconColor: AppColors.green,
  iconData: SvgPicture.asset(AppIcons.bag),
  description: "Add New Features",
  descriptionStyle: TextStyle(color: Colors.white),);

TaskContainer personalTask = TaskContainer(containerColor: AppColors.semiGreen,
    label: "Personal Task",
    labelStyle: TextStyle(color: AppColors.semiPurple),
    iconColor: AppColors.green,
    iconData: SvgPicture.asset(AppIcons.person),
    description: "Improve my English skills\nby trying to speak",
    descriptionStyle: TextStyle(color: AppColors.black));

TaskContainer homeTask = TaskContainer(containerColor: AppColors.backcolorIcon,
    label: "Home Task",
    labelStyle: TextStyle(color: AppColors.semiBlack),
    iconColor: AppColors.pink,
    iconData: SvgPicture.asset(AppIcons.home),
    description: "Add new feature for Do It\napp and commit it",
    descriptionStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold));
