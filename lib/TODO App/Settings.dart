import 'package:flutter/material.dart';
import 'package:todo_app/TODO App/Categories/AppColors.dart';
import 'package:flutter_svg/svg.dart';

import 'package:todo_app/TODO App/Categories/AppIcons.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                SvgPicture.asset(AppIcons.curvearrowbackward),
                SizedBox(width: 120),
                Text("Settings", style: TextStyle(fontSize: 19)),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(child: Text("Notification", style: TextStyle(fontSize: 20))),
                  Switch(
                      activeTrackColor: AppColors.green,
                      value: isSwitched,
                      onChanged: (value){setState((){isSwitched = value;});})
                ],
              )),
          Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(child: Text("Enable Cloud", style: TextStyle(fontSize: 20))),
                  Transform.scale(scale: 2, child: Checkbox(side: BorderSide(color: AppColors.semiPurple), activeColor: AppColors.green, value: isChecked, onChanged: (value){setState((){isChecked = value ?? false;});}))
                ],
              ))
        ],
      ),
    );
  }
}