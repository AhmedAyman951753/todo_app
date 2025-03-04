import 'package:flutter/material.dart';
import 'package:todo_app/TODO%20App/AddTask.dart';
import 'package:todo_app/TODO%20App/ProfileSettings.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/TODO App/Categories/AppIcons.dart';
import 'package:todo_app/TODO App/Categories/OptionContainer.dart';

class ProfileAppBar extends StatelessWidget {
  final String name;
  const ProfileAppBar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 20, left: 20),
        child: Row(
          children: [
            Expanded(child: InkWell(onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  {
                    return ProfileSettings(name: name);
                  }
                  ));
                }, child: OptionContainer(label: "Hello!", option: name))),
            Container(margin: EdgeInsets.only(top: 10), child: InkWell(onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)
              {
                return AddTask(name: name);
              }
              ));
            }, child: SvgPicture.asset(AppIcons.plus))),
          ],
        ));
  }
}
