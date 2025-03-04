import 'package:flutter/material.dart';
import 'package:todo_app/TODO App/Categories/DefaultContainer.dart';

class TextContainer extends StatelessWidget {
  final String label;
  final String hint;
  final double? width;
  final double? height;
  final TextEditingController? textController;
  TextContainer({super.key, required this.label, required this.hint, this.width, this.height, this.textController});

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      width: width,
      height: height,
      child: TextFormField(controller: textController, style: TextStyle(fontSize: 14),
      cursorColor: Colors.black,
      cursorHeight: 14,
      cursorWidth: 1,
      decoration: InputDecoration(contentPadding: EdgeInsets.only(top: 5),
          label: Text(label, style: TextStyle(color: Color(0XFF6E6A7C), fontSize: 10)),
          hintText: hint,
          hintStyle: TextStyle(fontSize: 14),
          fillColor: Colors.white,
          border: InputBorder.none),
    ),

    );
  }
}
