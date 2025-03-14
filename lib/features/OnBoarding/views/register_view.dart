import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/TODO App/Categories/TextContainer.dart';
import 'package:todo_app/TODO App/Categories/ProfilePicture.dart';
import 'package:todo_app/core/my_navigator.dart';
import 'package:todo_app/core/widgets/start_elev_button.dart';
import 'package:todo_app/features/OnBoarding/manager/register_state.dart';
import '../../../core/AppColors.dart';
import '../manager/register_cubit.dart';
import 'login_view.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
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
                  label: "Username",
                  hint: "Type your name here",
                  textController: RegisterCubit.get(context).nameController,
                  borderColor: AppColors.green,),
                SizedBox(height: 10),
                TextContainer(
                  label: "Password",
                  hint: "Type your password here",
                  textController: RegisterCubit.get(context).passwordController,
                  borderColor: AppColors.green,),
                SizedBox(height: 10),
                TextContainer(
                  label: "Confirm Password",
                  hint: "Repeat the password",
                  textController: RegisterCubit.get(context).confirmPassword,
                  borderColor: AppColors.green,),
              ],
            )),

            SizedBox(height: 10),
            BlocConsumer<RegisterCubit, RegisterState>(builder: (context, state)
                {
                  if (state is RegisterLoadingState)
                    {
                      return CircularProgressIndicator();
                    }
                  else
                    {
                      return Column(
                        children: [
                          state is RegisterSuccessState?
                          Column(
                            children: [
                              Text("Successful Registration"),
                              SizedBox(height: 10),
                              StartElevButton(label: "Login", onPressed: ()
                              {
                                myNavigator(context, screen: LoginView());
                              })
                            ],
                          ) : state is RegisterErrorState?
                          Column(
                            children: [
                              Text(state.error),
                              SizedBox(height: 10),
                              StartElevButton(label: "Register", onPressed: (){RegisterCubit.get(context).register();})
                            ],
                          ) : Column(
                            children: [
                              SizedBox(),
                              StartElevButton(label: "Register", onPressed: (){RegisterCubit.get(context).register();})
                            ],
                          ),
                        ],
                      );
                    }
                }, listener: (context, state){print(state.toString());}),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                SizedBox(width: 20),
                InkWell(onTap: ()
                    {
                      myNavigator(context, screen: LoginView());
                    },
                    child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
