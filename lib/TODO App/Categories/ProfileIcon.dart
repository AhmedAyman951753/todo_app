import 'package:flutter/material.dart';
import 'package:todo_app/TODO App/Categories/AppImages.dart';
class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 15, top: 15),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(AppImages.Palestine), fit: BoxFit.cover))
    );
  }
}
