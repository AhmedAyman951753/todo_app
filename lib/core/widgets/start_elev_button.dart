import 'package:flutter/material.dart';
import 'package:todo_app/core/my_navigator.dart';

import '../../../../TODO App/Categories/MyElevatedButton.dart';
import '../../../../core/AppColors.dart';

class StartElevButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  StartElevButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Elevbutton(label: label,
      borderColor: AppColors.green,
      buttonColor: AppColors.green,
      textColor: Colors.white,
      shadowColor: AppColors.green,
      onPressed: onPressed
    );
  }
}
