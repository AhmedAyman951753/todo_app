import 'package:flutter/material.dart';
import 'package:todo_app/core/my_navigator.dart';
import 'package:todo_app/core/widgets/start_elev_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/features/OnBoarding/views/register_view.dart';
import '../../../core/AppColors.dart';
import '../../../core/AppIcons.dart';
class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(20),
            width: 302,
            height: 343,
            child: SvgPicture.asset(AppIcons.todo),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome To\n      Do It", style: TextStyle(fontSize: 20)),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Ready to conquer your tasks? Let's Do \n                      It together.", style: TextStyle(color: Color(0XFF6E6A7C)),)
            ],
          ),
          SizedBox(height: 20),
          StartElevButton(label: "Let's Start", onPressed: ()
          {
            myNavigator(context, screen: RegisterView());
          })
        ],
      ),
    );
  }
}
