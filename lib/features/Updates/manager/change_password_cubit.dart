import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/Updates/manager/change_password_state.dart';
import '../data/repo/change_password_repo.dart';


class ChangePasswordCubit extends Cubit<ChangeState>
{
  ChangePasswordCubit(): super(ChangeState());
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  static ChangePasswordCubit get(context) => BlocProvider.of(context);
  ChangePasswordRepo changePasswordRepo = ChangePasswordRepo();

  void change() async
  {
    emit(ChangeLoadingState());
    await Future.delayed(Duration(milliseconds: 2000));
    var response = changePasswordRepo.change(
        oldPassword: oldPasswordController.text,
        newPassword: newPasswordController.text,
        confirmPassword: confirmPasswordController.text);

    response.fold((error)
    {
      emit(ChangeErrorState(error));
    }, (userModel)
    {
      emit(ChangeSuccessState(userModel));
    });
  }
}