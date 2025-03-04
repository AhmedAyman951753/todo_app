import 'package:flutter/material.dart';
import 'package:todo_app/TODO App/Categories/AppColors.dart';
import 'package:todo_app/TODO App/NoTasks.dart';
import 'package:todo_app/TODO App/Categories/TextContainer.dart';
import 'package:todo_app/TODO App/Categories/MyElevatedButton.dart';
import 'package:todo_app/TODO App/Categories/ProfilePicture.dart';

class TodoProfile extends StatefulWidget {
  const TodoProfile({super.key});

  @override
  State<TodoProfile> createState() => _TodoProfileState();
}

class _TodoProfileState extends State<TodoProfile> {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          ProfilePicture(height: 375),
          TextContainer(label: "Your Name", hint: "Type your name here", textController: textController),
          SizedBox(height: 20),
          Elevbutton(label: "Save",
            borderColor: AppColors.green,
            buttonColor: AppColors.green,
            textColor: Colors.white,
            shadowColor: AppColors.green,
            onPressed: ()
            {
              String enteredText = textController.text;
              Navigator.push(context, MaterialPageRoute(builder: (context)
              {
                return NoTasks(name: enteredText);
              }
              ));
            },)
        ],
      ),
    );
  }
}