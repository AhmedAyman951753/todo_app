class TaskModel
{
  String title;
  String description;

  TaskModel({required this.title, required this.description});
}

class TaskUseCase {

  static final TaskUseCase _instance = TaskUseCase._private();

  factory TaskUseCase() {
    return _instance;
  }

  TaskUseCase._private();
  List<TaskModel> tasks = [];
  void addTask(TaskModel task) {
    tasks.add(task);
    print(tasks.length);
  }

  int tasksLength() => tasks.length;

  List<TaskModel> getTasks() => tasks;
}