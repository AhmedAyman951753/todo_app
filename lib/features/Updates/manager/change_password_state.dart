import 'package:todo_app/features/OnBoarding/data/models/user_model.dart';

class ChangeState{}

class ChangeInitState extends ChangeState{}
class ChangeLoadingState extends ChangeState{}
class ChangeSuccessState extends ChangeState
{
  final UserModel userModel;
  ChangeSuccessState(this.userModel);
}
class ChangeErrorState extends ChangeState
{
  final String error;
  ChangeErrorState(this.error);
}