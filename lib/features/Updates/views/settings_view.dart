import 'package:flutter/material.dart';
import 'package:todo_app/TODO App/Categories/OptionContainer.dart';
import 'package:todo_app/features/Updates/views/change_password_view.dart';
import 'package:todo_app/features/Updates/views/update_profile_view.dart';
import 'package:todo_app/features/Updates/views/widgets/SettingContainer.dart';
import '../../../core/AppColors.dart';
import '../../../core/AppIcons.dart';
import 'multiple_settings_view.dart';

class SettingsView extends StatelessWidget {
  final String name;
  const SettingsView({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          SizedBox(height: 50),
          Container(margin: EdgeInsets.only(left: 20), child: OptionContainer(label: "Hello!", option: name)),
          SizedBox(height: 40),
          SettingContainer(label: 'Update Profile', icon: AppIcons.person2, screen: UpdateProfileView(name: name,)),
          SizedBox(height: 20),
          SettingContainer(label: 'Change Password', icon: AppIcons.lock, screen: ChangePasswordView()),
          SizedBox(height: 20),
          SettingContainer(label: 'Settings', icon: AppIcons.settings, screen: Settings(name: name)),
        ],
      ),
    );
  }
}
