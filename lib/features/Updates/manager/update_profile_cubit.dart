import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/Updates/data/repo/update_profile_repo.dart';
import 'package:todo_app/features/Updates/manager/update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateState>
{
  UpdateProfileCubit(): super(UpdateState());
  final TextEditingController nameController = TextEditingController();
  static UpdateProfileCubit get(context) => BlocProvider.of(context);
  UpdateProfileRepo updateProfileRepo = UpdateProfileRepo();

  void update({required String name, required String oldName}) async
  {
    emit(UpdateLoadingState());
    await Future.delayed(Duration(milliseconds: 2000));
    var response = updateProfileRepo.update(name: nameController.text, oldName: oldName);
    response.fold((error)
    {
      emit(UpdateErrorState(error));
    }, (userModel)
    {
      emit(UpdateSuccessState(userModel));
    });
  }
}