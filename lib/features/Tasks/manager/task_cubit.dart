import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/Tasks/data/repo/task_repo.dart';
import 'package:todo_app/features/Tasks/manager/task_state.dart';

import '../data/models/task_model.dart';

class TaskCubit extends Cubit<TaskState>
{
  TaskCubit(): super(TaskState());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  static TaskCubit get(context) => BlocProvider.of(context);
  TaskRepo taskRepo = TaskRepo();
  void addTask() async
  {
    emit(TaskLoadingState());
    await Future.delayed(Duration(milliseconds: 2000));
    var response = taskRepo.addTask(task: TaskModel(title: titleController.text, description: descriptionController.text));
    response.fold(
            (error)
        {
          emit(TaskErrorState(error));
        },
            (task)
        {
          emit(TaskSuccessState(task));
        });
  }
}