import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qr_app/Widgets/inputField.dart';
import 'package:http/http.dart' as http;

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  final TextEditingController rollnoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  String? rollno;
  String? password;
  String? name;
  String? mail;
  Register()async{
    Uri uri =Uri.parse("https://scnner-web.onrender.com/api/register");
    rollno=rollnoController.text;
    name=nameController.text;
    password=passwordController.text;
    mail=mailController.text;
    print("$rollno $password $name $mail");
    var res= await http.post(uri,headers: <String,String>{'Content-Type':'application/json;charset=UTF-8'},body: jsonEncode({
      "name":nameController.text,
      "email":mailController.text,
      "password":passwordController.text,
      "rollno":rollnoController.text
    }
    ));
    if(res.statusCode==200) {
      // Navigator.pop;
      print("Success");
    }
    else if(res.statusCode==400)
      print("error 404");
    else
      // ScaffoldMessenger.of()
      print("something wrong");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Registration",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            inputField(title:"Enter your Name",textController: nameController,),
            const SizedBox(
              height: 15,
            ),
            inputField(title:"Enter your Roll no",textController: rollnoController,),
            const SizedBox(
              height: 15,
            ),
            inputField(title: "Enter your Email",textController: mailController,),
            const SizedBox(
              height: 15,
            ),
            inputField(title:"Enter your password",isPassword:true,textController: passwordController,),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
                onTap: () {
                  // Navigator.pop(context);
                  Register();
                },
                child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white)),
                child:const Text("Register",
                        style: TextStyle(
                          color: Colors.white,
                        )))),
          ],
        ),
      ),
    );
  }
}
