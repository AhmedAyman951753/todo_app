import 'package:dartz/dartz.dart';

import '../models/task_model.dart';

class TaskRepo
{
  final TaskUseCase taskUseCase = TaskUseCase();
  Either<String, TaskModel> addTask({required TaskModel task})
  {
    try{
      if ((task.title == (null)) || (task.title == ''))
        {
          return left('Enter task title');
        }
      if ((task.description == (null)) || (task.description == ''))
        {
          return left('Enter task description');
        }
      taskUseCase.addTask(task);
      return right(task);
    }catch(e){
      return left('Invalid Task');
    }
  }

  int tasksLength()
  {
    return taskUseCase.tasksLength();
  }

  List<TaskModel> getTasks()
  {
    return taskUseCase.getTasks();
  }
}

