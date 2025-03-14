import 'package:dartz/dartz.dart';
import 'package:todo_app/features/OnBoarding/data/models/user_model.dart';

class RegisterRepo
{
  final UserUseCase dataUseCase = UserUseCase();
  Either<String, void> register({required UserModel user, required String confirmpassword})
  {
    try{
      if ((user.name == (null)) || (user.name == ''))
        {
          return left('Enter valid name');
        }
      if ((user.password == (null)) || (user.password == ''))
      {
        return left('Enter valid name');
      }
      if ((user.password.length) < 6)
        {
          return left('Enter password from 6 numbers at least');
        }
      if ((confirmpassword == (null)) || (confirmpassword == ''))
        {
          return left('Match passwords, Please');
        }
      if ((user.password) != confirmpassword)
        {
          return left("Passwords doesn't match");
        }
      dataUseCase.addUser(user);
      return right(0);

    }catch(e)
    {
      return left(e.toString());
    }
  }
}
