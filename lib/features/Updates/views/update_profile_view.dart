import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/OnBoarding/views/login_view.dart';
import 'package:todo_app/features/Updates/manager/update_profile_cubit.dart';
import 'package:todo_app/features/Updates/manager/update_profile_state.dart';
import '../../../TODO App/Categories/ProfilePicture.dart';
import '../../../TODO App/Categories/TextContainer.dart';
import '../../../core/AppColors.dart';
import '../../../core/my_navigator.dart';
import '../../../core/widgets/start_elev_button.dart';

class UpdateProfileView extends StatelessWidget {
  final String name;
  const UpdateProfileView({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(),
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
                  textController: UpdateProfileCubit.get(context).nameController,
                  borderColor: AppColors.green,),
                SizedBox(height: 10),
              ],
            )),

            SizedBox(height: 10),
            BlocConsumer<UpdateProfileCubit, UpdateState>(builder: (context, state)
            {
              if (state is UpdateLoadingState)
              {
                return CircularProgressIndicator();
              }
              else
              {
                return Column(
                  children: [
                    state is UpdateSuccessState?
                    Column(
                      children: [
                        Text("Welcome ${state.userModel.name}"),
                        SizedBox(height: 10),
                        StartElevButton(label: "Go To Profile", onPressed: ()
                        {
                          myNavigator(context, screen: LoginView());
                        })
                      ],
                    ) : state is UpdateErrorState?
                    Column(
                      children: [
                        Text(state.error),
                        SizedBox(height: 10),
                        StartElevButton(label: "Update", onPressed: ()
                        {
                          UpdateProfileCubit.get(context).update(name: UpdateProfileCubit.get(context).nameController.text, oldName: name);})
                      ],
                    ) : Column(
                      children: [
                        SizedBox(),
                        StartElevButton(label: "Update", onPressed: (){UpdateProfileCubit.get(context).update(name: UpdateProfileCubit.get(context).nameController.text, oldName: name);})
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