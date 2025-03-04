import 'package:flutter/material.dart';
import 'package:todo_app/TODO App/Categories/AppColors.dart';
import 'package:todo_app/TODO App/Categories/AppIcons.dart';
import 'package:todo_app/TODO App/Categories/MyIcon.dart';
import 'package:todo_app/TODO App/Categories/TextContainer.dart';
import 'package:todo_app/TODO App/Home.dart';
import 'package:todo_app/TODO App/NoTasks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/TODO App/Categories/MyElevatedButton.dart';

class AddTask extends StatelessWidget {
  final String name;
  const AddTask({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            child: Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset(AppIcons.curvearrowbackward),
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)
                    {
                      return NoTasks(name: name);
                    }
                    ));
                  },
                  ),

                SizedBox(width: 90),
                Text("Add Task", style: TextStyle(fontSize: 19))
              ],
            ),
          ),
          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(20),
            child: DropdownButtonFormField
              (
                decoration: InputDecoration(
                    label: Text("Task Group", style: TextStyle(fontSize: 10, color: AppColors.semiPurple)),
                    filled: true,
                    fillColor: AppColors.white,
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.white))
                ),
                isExpanded: true,
                hint: Text("Select task group", style: TextStyle(fontWeight: FontWeight.normal, color: Color(0XFF6E6A7C))),
                items:
                [
                  DropdownMenuItem(value: 'Work', child: Row(children: [MyIcon(IconColor: AppColors.brown, iconData: SvgPicture.asset(AppIcons.bag), width: 35, height: 35, padding: 7), SizedBox(width: 10), Text("Work")])),
                  DropdownMenuItem(value: 'Personal', child: Row(children: [MyIcon(IconColor: AppColors.semiGreen, iconData: SvgPicture.asset(AppIcons.greenperson), width: 35, height: 35, padding: 7), SizedBox(width: 10), Text("Personal")],)),
                  DropdownMenuItem(value: 'Home', child: Row(children: [MyIcon(IconColor: AppColors.backcolorIcon, iconData: SvgPicture.asset(AppIcons.home2), width: 35, height: 35, padding: 7), SizedBox(width: 10), Text("Home")]))
                ],
                onChanged: (value){print(value);},
                icon: SvgPicture.asset(AppIcons.curvearrowbottom)),
          ),

          SizedBox(height: 10),
          TextContainer(label: "Task Name", hint: "Enter task name", borderColor: AppColors.white),
          SizedBox(height: 20),
          TextContainer(label: "Description", hint: "Enter task description ...", height: 142, borderColor: AppColors.white),
          SizedBox(height: 20),
          Elevbutton(label: "Save",
                     borderColor: AppColors.green,
                     buttonColor: AppColors.green,
                     textColor: AppColors.white,
                     shadowColor: AppColors.green,
                     onPressed: ()
                     {
                       Navigator.push(context, MaterialPageRoute(builder: (context)
                       {
                         return Home(name: name);
                       }
                       ));
                     })
        ],
      ),
    );
  }
}

//Drop Down Button Form Field

/*Padding(
            padding: const EdgeInsets.all(20),
            child: DropdownButtonFormField
              (
                decoration: InputDecoration(
                  label: Text("Task Group", style: TextStyle(fontSize: 10, color: AppColors.semiPurple)),
                  filled: true,
                  fillColor: AppColors.white,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.white))
                ),
                isExpanded: true,
                hint: Text("Select task group", style: TextStyle(fontWeight: FontWeight.normal, color: Color(0XFF6E6A7C))),
                items:
                [
                  DropdownMenuItem(value: 'Work', child: Row(children: [MyIcon(IconColor: AppColors.brown, iconData: SvgPicture.asset(AppIcons.bag), width: 35, height: 35, padding: 7), SizedBox(width: 10), Text("Work")])),
                  DropdownMenuItem(value: 'Personal', child: Row(children: [MyIcon(IconColor: AppColors.semiGreen, iconData: SvgPicture.asset(AppIcons.greenperson), width: 35, height: 35, padding: 7), SizedBox(width: 10), Text("Personal")],)),
                  DropdownMenuItem(value: 'Home', child: Row(children: [MyIcon(IconColor: AppColors.backcolorIcon, iconData: SvgPicture.asset(AppIcons.home2), width: 35, height: 35, padding: 7), SizedBox(width: 10), Text("Home")]))
                ],
                onChanged: (value){print(value);},
                icon: SvgPicture.asset(AppIcons.curvearrowbottom)),
          ),*/

// Drop Down Button

/*DefaultContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Task Group", style: TextStyle(color: AppColors.semiPurple, fontSize: 9)),
                SizedBox(height: 20,
                  child: DropdownButton
                    (
                      underline: Container(),
                      isExpanded: true,
                      hint: Text("Select task group", style: TextStyle(fontWeight: FontWeight.normal, color: Color(0XFF6E6A7C))),
                      items:
                      [
                        DropdownMenuItem(value: 'Work', child: Row(children: [MyIcon(IconColor: AppColors.brown, iconData: SvgPicture.asset(AppIcons.bag), width: 35, height: 35, padding: 7), SizedBox(width: 10), Text("Work")])),
                        DropdownMenuItem(value: 'Personal', child: Row(children: [MyIcon(IconColor: AppColors.semiGreen, iconData: SvgPicture.asset(AppIcons.greenperson), width: 35, height: 35, padding: 7), SizedBox(width: 10), Text("Personal")],)),
                        DropdownMenuItem(value: 'Home', child: Row(children: [MyIcon(IconColor: AppColors.backcolorIcon, iconData: SvgPicture.asset(AppIcons.home2), width: 35, height: 35, padding: 7), SizedBox(width: 10), Text("Home")]))
                      ],
                      onChanged: (value){print(value);},
                      icon: SvgPicture.asset(AppIcons.curvearrowbottom)),
                ),
              ],
            ),
          ),*/