import 'package:flutter/material.dart';
import '../../core/AppImages.dart';
class ProfilePicture extends StatelessWidget {
  final double height;
  final double width;
  const ProfilePicture({super.key, required this.height, required this.width});

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
