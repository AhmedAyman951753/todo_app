import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/Tasks/manager/task_cubit.dart';
import 'package:todo_app/features/Tasks/manager/task_state.dart';
import 'package:todo_app/features/Tasks/views/widgets/task_container.dart';

import '../../data/models/task_model.dart';

class TasksList extends StatelessWidget {
  TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => TaskCubit(),
      child: SizedBox(
        child: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state)
              {
                List<TaskModel> tasks = TaskCubit.get(context).taskRepo.getTasks();
                List<TaskContainer> tasksStyle = [];
                tasksStyle.length = tasks.length;
                for (int i = 0 ; i < tasks.length ; i++)
                {
                  TaskContainer taskContainer = TaskContainer(title: tasks[i].title, description: tasks[i].description);
                  tasksStyle.add(taskContainer);
                  tasksStyle.length++;
                }
                return ListView.separated(padding: EdgeInsets.only(left: 20, right: 20),
                    itemBuilder: (context, index) => tasksStyle[index],
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    itemCount: tasksStyle.length
                );
              }
        ),
      ),
    );
  }
}


