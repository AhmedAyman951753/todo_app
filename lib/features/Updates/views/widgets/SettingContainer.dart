import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/my_navigator.dart';

import '../../../../TODO App/Categories/DefaultContainer.dart';
import '../../../../core/AppIcons.dart';

class SettingContainer extends StatelessWidget {
  final String label;
  final String icon;
  final Widget screen;
  const SettingContainer({super.key, required this.label, required this.icon, required this.screen});

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(child: InkWell(
      child: Row(
        children: [
          SvgPicture.asset(icon),
          SizedBox(width: 10),
          Expanded(child: Text(label)),
          SvgPicture.asset(AppIcons.curvearrowforward)
        ],
      ),
      onTap: ()
      {
        myNavigator(context, screen: screen);
      },
    ),
    );
  }
}
