import 'package:flutter/material.dart';
import 'package:todo_app/TODO App/Categories/MyIcon.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:todo_app/TODO App/Categories/DefaultContainer.dart';

class TaskGroupContainer extends StatelessWidget {
  final Color iconColor;
  final SvgPicture iconData;
  final String label;
  final int counter;
  final Color counterColor;
  final Color counterContainerColor;
  const TaskGroupContainer({super.key, required this.iconColor, required this.iconData, required this.label, required this.counter, required this.counterColor, required this.counterContainerColor});

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      child: Row(
        children: [
          MyIcon(width: 35, height: 35, padding: 7, IconColor: iconColor, iconData: iconData),
          SizedBox(width: 10),
          Expanded(child: Text(label, style: TextStyle(color: Color(0XFF24252C)))),
          Container(
            width: 23,
            height: 23,
            decoration: BoxDecoration(
              color: counterContainerColor,
              borderRadius: BorderRadius.circular(5)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(counter.toString(), style: TextStyle(color: counterColor, fontWeight: FontWeight.bold))
              ],
            ),
          )
        ],
      ),
    );
  }
}