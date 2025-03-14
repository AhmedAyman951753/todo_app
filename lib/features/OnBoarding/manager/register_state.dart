import 'package:todo_app/features/OnBoarding/data/models/user_model.dart';

class RegisterState{}

class RegisterLoadingState extends RegisterState{}
class RegisterSuccessState extends RegisterState {}
class RegisterErrorState extends RegisterState
{
  final String error;
  RegisterErrorState(this.error);
}

