class UserModel
{
  late String name;
  late String password;

  UserModel({required this.name, required this.password});
}

class UserUseCase {

  static final UserUseCase _instance = UserUseCase._();

  factory UserUseCase() {
    return _instance;
  }

  UserUseCase._();
  List<UserModel> users = [];
  void addUser(UserModel user) {
    users.add(user);
    print(users.length);
  }

  List<UserModel> getUsers() => users;
}