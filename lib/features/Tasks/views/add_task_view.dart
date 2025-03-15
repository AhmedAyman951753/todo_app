import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/TODO App/Categories/TextContainer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/AppImages.dart';
import 'package:todo_app/core/widgets/start_elev_button.dart';
import 'package:todo_app/features/Tasks/data/models/task_model.dart';
import 'package:todo_app/features/Tasks/manager/task_cubit.dart';
import 'package:todo_app/features/Tasks/manager/task_state.dart';
import '../../../core/AppColors.dart';
import '../../../core/AppIcons.dart';
import 'home_view.dart';
import 'no_tasks_view.dart';

class AddTask extends StatelessWidget {
  final String name;
  AddTask({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => TaskCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Column(
          children: [
            SizedBox(height: 20),
            Container(
              child: Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(AppIcons.curvearrowbackward),
                    onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)
                      {
                        return NoTasks(name: name);
                      }
                      ));
                    },
                    ),

                  SizedBox(width: 90),
                  Text("Add Task", style: TextStyle(fontSize: 19))
                ],
              ),
            ),
            Container(
              width: 261,
              height: 207,
              margin: EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(image: AssetImage(AppImages.Palestine), fit: BoxFit.cover)
            ),
            ),
            SizedBox(height: 30),
            Builder(builder: (context) => Column(
              children: [
                TextContainer(label: "Task Name", hint: "Enter task name", borderColor: AppColors.green, textController: TaskCubit.get(context).titleController),
                SizedBox(height: 30),
                TextContainer(label: "Description", hint: "Enter task description ...", borderColor: AppColors.green, textController: TaskCubit.get(context).descriptionController),
                SizedBox(height: 30),
              ],
            )),
            BlocConsumer<TaskCubit, TaskState>(builder: (context, state)
                {
                  if (state is TaskLoadingState)
                    {
                      return CircularProgressIndicator();
                    }
                  else
                    {
                      return Column(
                        children: [
                          state is TaskSuccessState?
                          Column(
                            children: [
                              Text('Task added successfully'),
                              SizedBox(height: 10),
                              StartElevButton(label: "Go To Home", onPressed: ()
                              {
                                Navigator.push(context, MaterialPageRoute(builder: (context)
                                {
                                  return Home(name: name, title: state.task.title, description: state.task.description);
                                }
                                ));
                              })
                              ],
                          ) : state is TaskErrorState?
                          Column(
                            children: [
                              Text(state.error),
                              SizedBox(height: 10),
                              StartElevButton(label: "Save", onPressed: ()
                              {
                                TaskCubit.get(context).addTask();

                              })
                            ],
                          ): Column(
                              children: [
                                SizedBox(height: 10),
                                StartElevButton(label: "Save", onPressed: ()
                                {
                                  TaskCubit.get(context).addTask();
                  })
                        ],
                      )
                  ]);
                    }
                }, listener: (context, state){print(state.toString());})
          ],
        ),
      ),
    );
  }
}

//Drop Down Button Form Field

/*Padding(
            padding: const EdgeInsets.all(20),
            child: DropdownButtonFormField
              (
                decoration: InputDecoration(
                  label: Text("Task Group", style: TextStyle(fontSize: 10, color: AppColors.semiPurple)),
                  filled: true,
                  fillColor: AppColors.white,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.white))
                ),
                isExpanded: true,
                hint: Text("Select task group", style: TextStyle(fontWeight: FontWeight.normal, color: Color(0XFF6E6A7C))),
                items:
                [
                  DropdownMenuItem(value: 'Work', child: Row(children: [MyIcon(IconColor: AppColors.brown, iconData: SvgPicture.asset(AppIcons.bag), width: 35, height: 35, padding: 7), SizedBox(width: 10), Text("Work")])),
                  DropdownMenuItem(value: 'Personal', child: Row(children: [MyIcon(IconColor: AppColors.semiGreen, iconData: SvgPicture.asset(AppIcons.greenperson), width: 35, height: 35, padding: 7), SizedBox(width: 10), Text("Personal")],)),
                  DropdownMenuItem(value: 'Home', child: Row(children: [MyIcon(IconColor: AppColors.backcolorIcon, iconData: SvgPicture.asset(AppIcons.home2), width: 35, height: 35, padding: 7), SizedBox(width: 10), Text("Home")]))
                ],
                onChanged: (value){print(value);},
                icon: SvgPicture.asset(AppIcons.curvearrowbottom)),
          ),*/

// Drop Down Button

/*DefaultContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Task Group", style: TextStyle(color: AppColors.semiPurple, fontSize: 9)),
                SizedBox(height: 20,
                  child: DropdownButton
                    (
                      underline: Container(),
                      isExpanded: true,
                      hint: Text("Select task group", style: TextStyle(fontWeight: FontWeight.normal, color: Color(0XFF6E6A7C))),
                      items:
                      [
                        DropdownMenuItem(value: 'Work', child: Row(children: [MyIcon(IconColor: AppColors.brown, iconData: SvgPicture.asset(AppIcons.bag), width: 35, height: 35, padding: 7), SizedBox(width: 10), Text("Work")])),
                        DropdownMenuItem(value: 'Personal', child: Row(children: [MyIcon(IconColor: AppColors.semiGreen, iconData: SvgPicture.asset(AppIcons.greenperson), width: 35, height: 35, padding: 7), SizedBox(width: 10), Text("Personal")],)),
                        DropdownMenuItem(value: 'Home', child: Row(children: [MyIcon(IconColor: AppColors.backcolorIcon, iconData: SvgPicture.asset(AppIcons.home2), width: 35, height: 35, padding: 7), SizedBox(width: 10), Text("Home")]))
                      ],
                      onChanged: (value){print(value);},
                      icon: SvgPicture.asset(AppIcons.curvearrowbottom)),
                ),
              ],
            ),
          ),*/