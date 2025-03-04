import 'package:flutter/material.dart';
import 'package:todo_app/TODO App/Categories/AppColors.dart';
import 'package:todo_app/TODO App/Categories/AppIcons.dart';
import 'package:todo_app/TODO App/Categories/MyIcon.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TaskContainer extends StatelessWidget {
  final Color containerColor;
  final String label;
  final TextStyle labelStyle;
  final String description;
  final TextStyle descriptionStyle;
  final Color iconColor;
  final SvgPicture iconData;
  const TaskContainer({super.key,
                       required this.containerColor,
                       required this.label,
                       required this.labelStyle,
                       required this.description,
                       required this.descriptionStyle,
                       required this.iconColor,
                       required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15 , right: 15 , top: 15, bottom: 5),
      width: 234,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: containerColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(label, style: labelStyle)),
              MyIcon(IconColor: iconColor, iconData: iconData),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(description, style: descriptionStyle)
            ],
          )
        ],
      ),
    );
  }
}

