import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyIcon extends StatelessWidget {
  final Color IconColor;
  final SvgPicture iconData;
  final double width;
  final double height;
  final double padding;
  const MyIcon({required this.IconColor, required this.iconData, this.width = 22, this.height = 22, this.padding = 5});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: IconColor,
      ),
      child: iconData,
    );
  }
}
