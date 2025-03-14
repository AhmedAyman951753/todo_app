import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/AppIcons.dart';
import 'package:todo_app/core/my_navigator.dart';
import 'package:todo_app/features/OnBoarding/views/start_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(onTap: (){myNavigator(context, screen: Start());},
              child: SvgPicture.asset(AppIcons.todo_splash))
        ],
      ),
    );
  }
}
