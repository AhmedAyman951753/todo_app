import '../../OnBoarding/data/models/user_model.dart';

class UpdateState{}

class UpdateInitState extends UpdateState{}
class UpdateLoadingState extends UpdateState{}
class UpdateSuccessState extends UpdateState
{
  final UserModel userModel;
  UpdateSuccessState(this.userModel);
}
class UpdateErrorState extends UpdateState
{
  final String error;
  UpdateErrorState(this.error);
}