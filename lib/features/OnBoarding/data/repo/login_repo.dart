import 'package:dartz/dartz.dart';
import '../models/user_model.dart';

class LoginRepo
{
  final UserUseCase dataUseCase = UserUseCase();
  Either<String, UserModel> login({required String name, required String password})
  {
    try{
      for (int i = 0 ; i < dataUseCase.users.length ; i++)
      {
        if ((name == dataUseCase.users[i].name) && (password == dataUseCase.users[i].password))
        {
          return right(dataUseCase.users[i]);
        }
      }
      return left('Invalid Login');
    }catch(e)
    {
      return left(e.toString());
    }
  }
}