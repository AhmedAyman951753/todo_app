import 'package:todo_app/features/Tasks/data/models/task_model.dart';

class TaskState{}

class TaskLoadingState extends TaskState{}
class TaskSuccessState extends TaskState
{
  late TaskModel task;
  TaskSuccessState(this.task);
}
class TaskErrorState extends TaskState
{
  final String error;
  TaskErrorState(this.error);
}