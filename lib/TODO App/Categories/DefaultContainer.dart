import 'package:flutter/material.dart';

class DefaultContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  const DefaultContainer({super.key, this.child, this.width = 331, this.height = 63});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        padding: EdgeInsets.all(15),
        width: width,
        height: height,
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14)),
      child: child
        );
  }
}
