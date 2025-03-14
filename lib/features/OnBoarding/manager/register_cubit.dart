import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/OnBoarding/data/models/user_model.dart';
import 'package:todo_app/features/OnBoarding/manager/register_state.dart';

import '../data/repo/register_repo.dart';

class RegisterCubit extends Cubit<RegisterState>
{
  RegisterCubit(): super(RegisterState());
  RegisterRepo registerRepo = RegisterRepo();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  static RegisterCubit get(context) => BlocProvider.of(context);

  void register() async
  {
    emit(RegisterLoadingState());
    await Future.delayed(Duration(milliseconds: 2000));
    var response = registerRepo.register(user: UserModel(name: nameController.text, password: passwordController.text), confirmpassword: confirmPassword.text);
    response.fold((error)
    {
      emit(RegisterErrorState(error));
    }, (r)
    {
      emit(RegisterSuccessState());
    });
  }
}