import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/TODO App/Categories/ProfileAppBar.dart';
import 'package:todo_app/features/Tasks/manager/task_cubit.dart';
import 'package:todo_app/features/Tasks/views/widgets/task_container.dart';
import 'package:todo_app/features/Tasks/views/widgets/tasks_list.dart';
import '../../../core/AppColors.dart';
import 'package:todo_app/TODO App/Categories/TaskCounter.dart';
import '../../OnBoarding/manager/register_cubit.dart';
import '../../OnBoarding/manager/register_state.dart';
import '../data/models/task_model.dart';
import '../manager/task_state.dart';

class Home extends StatelessWidget {
  final String name;
  final String? title;
  final String? description;
  Home({super.key, required this.name, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => TaskCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state)
              {
                return Column(
                  children: [
                    ProfileAppBar(name: name)
                  ],
                );
              },
              ),
              SizedBox(height: 30),
              BlocBuilder<TaskCubit, TaskState>(builder: (context, state)
                  {
                    final tasks = TaskCubit.get(context).taskRepo.getTasks();
                    return Column(
                      children: [
                        TaskCounter(label: "Tasks", number: TaskCubit.get(context).taskRepo.tasksLength()),
                        SizedBox(height: 480,
                          child: ListView.separated(padding: EdgeInsets.all(20), itemBuilder: (context, index) => TaskContainer(title: tasks[index].title, description: tasks[index].description),
                                             separatorBuilder: (context, index) => SizedBox(height: 20),
                                             itemCount: TaskCubit.get(context).taskRepo.getTasks().length),
                        )
                      ],
                    );
                  })
              /*TasksList(),
              SizedBox(height: 20),
              Row(children: [SizedBox(width: 20), Text("Task Groups"),],),
              SizedBox(height: 10),
              TaskGroupContainer(iconColor: AppColors.semiGreen, iconData: SvgPicture.asset(AppIcons.greenperson), label: "Personal Task", counter: 5, counterColor: AppColors.green, counterContainerColor: AppColors.semiGreen),
              SizedBox(height: 20),
              TaskGroupContainer(iconColor: AppColors.backcolorIcon, iconData: SvgPicture.asset(AppIcons.home2), label: "Home Task", counter: 3, counterColor: AppColors.pink, counterContainerColor: AppColors.backcolorIcon),
              SizedBox(height: 20),
              TaskGroupContainer(iconColor: AppColors.brown, iconData: SvgPicture.asset(AppIcons.bag), label: "Work Task", counter: 1, counterColor: AppColors.white, counterContainerColor: AppColors.black)*/
            ],
          ),
        ),

      ),
    );
  }
}


/*Container(
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
                ),*/