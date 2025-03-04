import 'package:flutter/material.dart';

class SettingContainer extends StatelessWidget {
  final String? label;
  final Widget child;
  const SettingContainer({super.key, this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(child: Text("Notification", style: TextStyle(fontSize: 20))),
            Switch(value: true, onChanged: (value){})
          ],
        ));
  }
}
