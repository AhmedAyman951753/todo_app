import 'package:flutter/material.dart';
import 'package:todo_app/TODO App/Categories/AppImages.dart';
class ProfilePicture extends StatelessWidget {
  final double height;
  const ProfilePicture({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            image: DecorationImage(image: AssetImage(AppImages.Palestine), fit: BoxFit.cover))
    );
  }
}
