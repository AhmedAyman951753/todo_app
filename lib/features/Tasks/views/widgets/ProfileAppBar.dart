import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/TODO App/Categories/OptionContainer.dart';
import 'package:todo_app/features/Updates/views/settings_view.dart';
import '../../../../core/AppIcons.dart';
import '../add_task_view.dart';

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
                  return SettingsView(name: name);
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
          ),
    );
  }
}
