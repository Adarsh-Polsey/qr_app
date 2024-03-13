import 'package:flutter/material.dart';

class inputField extends StatelessWidget {
  inputField({Key? key, this.isPassword=false, required this.title, this.textController}) : super(key: key);
  final bool isPassword;
  TextEditingController? textController=TextEditingController();
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white)),
      child: TextField(
        obscureText: isPassword,
        controller: textController,
        decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            labelText: title,
            border: InputBorder.none),
      ),
    );
  }
}
