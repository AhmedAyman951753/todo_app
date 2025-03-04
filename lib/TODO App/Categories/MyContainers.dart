import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'MyButtons.dart';
import 'MyIcon.dart';
class MyContainers extends StatelessWidget {
  final String title;
  final Color iconColor;
  final SvgPicture iconData;
  final String buttonLabel;
  final Color labelColor;
  final Color buttonColor;
  final String task;
  const MyContainers({super.key, required this.title, required this.iconData, required this.iconColor, required this.buttonLabel, required this.buttonColor, required this.labelColor, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334,
      height: 90,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              MyIcon(IconColor: iconColor, iconData: iconData),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style:const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              MyButtons(radius: 14,
                        margin: EdgeInsets.only(top: 5, right: 10),
                        color: buttonColor,
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        child: Center(child: Text(buttonLabel, style: TextStyle(color: labelColor, fontSize: 10, fontWeight: FontWeight.bold))))
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(task)
            ],
          )
        ],
      ),
    );
  }
}
