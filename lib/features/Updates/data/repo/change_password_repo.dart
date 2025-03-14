import 'package:dartz/dartz.dart';
import '../../../OnBoarding/data/models/user_model.dart';

class ChangePasswordRepo
{
  late UserModel userModel;
  final UserUseCase userUseCase = UserUseCase();
  Either<String, UserModel> change({required String oldPassword, required String newPassword, required String confirmPassword})
  {
    try{
      for (int i = 0 ; i < userUseCase.users.length ; i++)
        {
          if (oldPassword != userUseCase.getUsers()[i].password)
            {
              return left('Wrong Old Password!!');
            }
          else
            {
              userModel = userUseCase.getUsers()[i];
            }
        }
      if (newPassword == (null) || (newPassword == ''))
      {
        return left('Enter valid password');
      }
      if (newPassword.length < 6)
      {
        return left('Enter password of 6 numbers at least');
      }
      if ((confirmPassword == (null)) || (confirmPassword == ''))
      {
        return left('Match passwords, Please');
      }
      if ((newPassword) != confirmPassword)
      {
        return left("Passwords doesn't match");
      }
      userModel.password = newPassword;
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