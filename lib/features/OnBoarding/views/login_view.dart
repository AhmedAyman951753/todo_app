import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/OnBoarding/views/register_view.dart';
import '../../../TODO App/Categories/ProfilePicture.dart';
import '../../../TODO App/Categories/TextContainer.dart';
import '../../../core/AppColors.dart';
import '../../../core/my_navigator.dart';
import '../../../core/widgets/start_elev_button.dart';
import '../../Tasks/views/no_tasks_view.dart';
import '../manager/login_cubit.dart';
import '../manager/login_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
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
                  textController: LoginCubit.get(context).nameController,
                  borderColor: AppColors.green,),
                SizedBox(height: 10),
                TextContainer(
                  label: "Password",
                  hint: "Type your password here",
                  textController: LoginCubit.get(context).passwordController,
                  borderColor: AppColors.green,),
                SizedBox(height: 10),
              ],
            )),

            SizedBox(height: 10),
            BlocConsumer<LoginCubit, LoginState>(builder: (context, state)
            {
              if (state is LoginLoadingState)
              {
                return CircularProgressIndicator();
              }
              else
              {
                return Column(
                  children: [
                    state is LoginSuccessState?
                    Column(
                      children: [
                        Text("Welcome ${state.user.name}"),
                        SizedBox(height: 10),
                        StartElevButton(label: "Go To Profile", onPressed: ()
                        {
                          myNavigator(context, screen: NoTasks(name: state.user.name));
                        })
                      ],
                    ) : state is LoginErrorState?
                    Column(
                      children: [
                        Text(state.error),
                        SizedBox(height: 10),
                        StartElevButton(label: "Login", onPressed: ()
                        {
                          LoginCubit.get(context).login();
                        })
                      ],
                    ) : Column(
                      children: [
                        SizedBox(),
                        StartElevButton(label: "Login", onPressed: (){LoginCubit.get(context).login();})
                      ],
                    ),
                  ],
                );
              }
            }, listener: (context, state){print(state.toString());}),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                SizedBox(width: 20),
                InkWell(onTap: ()
                {
                  myNavigator(context, screen: RegisterView());
                },
                    child: Text("Register", style: TextStyle(fontWeight: FontWeight.bold),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
