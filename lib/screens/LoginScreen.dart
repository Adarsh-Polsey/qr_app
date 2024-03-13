import 'package:flutter/material.dart';
import 'package:qr_app/Widgets/inputField.dart';
import 'package:qr_app/screens/HomeScreen.dart';
import 'package:qr_app/screens/Registration.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController rollnoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  print("${rollnoController.value}  ${passwordController.value}");
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
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
                    return const RegistrationScreen();
                  }));
                },
                child: const Text("don't have an account?register",
                    style: const TextStyle(
                      color: Colors.white,
                    )))
          ],
        ),
      ),
    );
  }
}
