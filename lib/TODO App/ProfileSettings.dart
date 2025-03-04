import 'package:flutter/material.dart';
import 'package:todo_app/TODO App/Categories/AppColors.dart';
import 'package:todo_app/TODO App/Profile.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/TODO App/Categories/AppIcons.dart';
import 'package:todo_app/TODO App/Categories/DefaultContainer.dart';
import 'package:todo_app/TODO App/Categories/OptionContainer.dart';
import 'package:todo_app/TODO App/Settings.dart';

class ProfileSettings extends StatelessWidget {
  final String name;
  const ProfileSettings({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(margin: EdgeInsets.only(left: 20), child: OptionContainer(label: "Hello!", option: name)),
          SizedBox(height: 40),
          DefaultContainer(child: InkWell(
            child: Row(
              children: [
                SvgPicture.asset(AppIcons.person2),
                SizedBox(width: 10),
                Expanded(child: Text("Update Profile")),
                SvgPicture.asset(AppIcons.curvearrowforward)
              ],
            ),
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)
              {
                return TodoProfile();
              }
              ));
            },
          ),
          ),

          DefaultContainer(child: InkWell(
            child: Row(
              children: [
                SvgPicture.asset(AppIcons.settings),
                SizedBox(width: 10),
                Expanded(child: Text("Settings")),
                SvgPicture.asset(AppIcons.curvearrowforward)
              ],
            ),
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)
              {
                return Settings();
              }
              ));
            },
          ),
          ),
        ],
      ),
    );
  }
}
