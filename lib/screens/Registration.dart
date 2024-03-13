import 'package:flutter/material.dart';
import 'package:qr_app/Widgets/inputField.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);
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
            inputField(title:"Enter your Name"),
            const SizedBox(
              height: 15,
            ),
            inputField(title:"Enter your Roll no"),
            const SizedBox(
              height: 15,
            ),
            inputField(title: "Enter your Email"),
            const SizedBox(
              height: 15,
            ),
            inputField(title:"Enter your password",isPassword: true,),
            const SizedBox(
              height: 25,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white)),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Register",
                        style: TextStyle(
                          color: Colors.white,
                        )))),
          ],
        ),
      ),
    );
  }
}
