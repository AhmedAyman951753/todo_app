import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/OnBoarding/views/login_view.dart';
import 'package:todo_app/features/Tasks/views/home_view.dart';
import 'package:todo_app/features/Updates/manager/change_password_cubit.dart';
import 'package:todo_app/features/Updates/manager/change_password_state.dart';
import 'package:todo_app/features/Updates/manager/update_profile_cubit.dart';
import 'package:todo_app/features/Updates/manager/update_profile_state.dart';
import '../../../TODO App/Categories/ProfilePicture.dart';
import '../../../TODO App/Categories/TextContainer.dart';
import '../../../core/AppColors.dart';
import '../../../core/my_navigator.dart';
import '../../../core/widgets/start_elev_button.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Column(
          children: [
            SizedBox(height: 24),
            ProfilePicture(height: 250, width: double.infinity),
            SizedBox(height: 20),
            Builder(builder: (context) => Column(
              children: [
                TextContainer(
                  label: "Old Password",
                  hint: "Type old password here",
                  textController: ChangePasswordCubit.get(context).oldPasswordController,
                  borderColor: AppColors.green,),
                SizedBox(height: 10),
                TextContainer(
                  label: "New Password",
                  hint: "Type new password here",
                  textController: ChangePasswordCubit.get(context).newPasswordController,
                  borderColor: AppColors.green,),
                SizedBox(height: 10),
                TextContainer(
                  label: "Confirm Password",
                  hint: "Confirm password here",
                  textController: ChangePasswordCubit.get(context).confirmPasswordController,
                  borderColor: AppColors.green,),
                SizedBox(height: 10),
              ],
            )),

            SizedBox(height: 10),
            BlocConsumer<ChangePasswordCubit, ChangeState>(builder: (context, state)
            {
              if (state is ChangeLoadingState)
              {
                return CircularProgressIndicator();
              }
              else
              {
                return Column(
                  children: [
                    state is ChangeSuccessState?
                    Column(
                      children: [
                        Text("Password changed successfully"),
                        SizedBox(height: 10),
                        StartElevButton(label: "Go To Profile", onPressed: ()
                        {
                          myNavigator(context, screen: LoginView());
                        })
                      ],
                    ) : state is ChangeErrorState?
                    Column(
                      children: [
                        Text(state.error),
                        SizedBox(height: 10),
                        StartElevButton(label: "Update", onPressed: ()
                         {
                            ChangePasswordCubit.get(context).change();
                         })
                      ],
                    ) : Column(
                      children: [
                        SizedBox(),
                        StartElevButton(label: "Update", onPressed: (){ChangePasswordCubit.get(context).change();})
                      ],
                    ),
                  ],
                );
              }
            }, listener: (context, state){print(state.toString());}),
          ],
        ),
      ),
    );
  }
}