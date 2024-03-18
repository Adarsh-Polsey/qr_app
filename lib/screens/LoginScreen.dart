import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qr_app/Widgets/inputField.dart';
import 'package:qr_app/screens/HomeScreen.dart';
import 'package:qr_app/screens/Registration.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController rollnoController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  login()async{
    Uri url=Uri.parse("https://scnner-web.onrender.com/api/login");
    var res=await http.post(url,headers: <String,String>{'Content-Type':'application/json;charset=UTF-8'},body: jsonEncode({
      "rollno":rollnoController.text,
      "password":passwordController.text
    }));
    var data=jsonDecode(res.body);
    if(data["rollno"]==rollnoController.text){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Incorrect password,Try again")));
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            inputField(title: "Enter your Roll no", textController: rollnoController,),
            const SizedBox(
              height: 10,
            ),
            inputField(title:"Enter your password",isPassword: true, textController: passwordController,),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  login();
                  print("${rollnoController.text}  ${passwordController.text}");
                },
                child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white)),
                child:const Text("Login",
                        style: TextStyle(
                          color: Colors.white,
                        )))),
            const SizedBox(height: 20),
            InkWell(
                enableFeedback: true,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegistrationScreen();
                  }));
                },
                child: const Text("don't have an account?register",
                    style: TextStyle(
                      color: Colors.white,
                    )))
          ],
        ),
      ),
    );
  }
}
