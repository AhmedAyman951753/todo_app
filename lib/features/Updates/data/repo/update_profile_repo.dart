import 'package:dartz/dartz.dart';
import '../../../OnBoarding/data/models/user_model.dart';

class UpdateProfileRepo
{
  late UserModel userModel;
  final UserUseCase userUseCase = UserUseCase();
  Either<String, UserModel> update({required String name, required String oldName})
  {
    try{
      for (int i = 0 ; i < userUseCase.users.length ; i++)
        {
          if (oldName == userUseCase.getUsers()[i].name)
            {
              userModel = userUseCase.getUsers()[i];
            }
        }
      if (name == (null) || (name == ''))
      {
        return left('Enter valid name');
      }
      userModel.name = name;
      print(userUseCase.users.length);
      print(userModel.name);
      print(userModel.password);
      return right(userModel);
    }catch(e)
    {
      return left(e.toString());
    }
  }
}