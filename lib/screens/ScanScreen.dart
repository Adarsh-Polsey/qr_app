
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_app/Widgets/inputField.dart';
import 'package:qr_app/screens/HomeScreen.dart';
import 'package:qr_app/screens/ProfileScreen.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),),
              height: 300,
              width: 300,
              child: MobileScanner(
                allowDuplicates: true,
                onDetect: (capture,args) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return ProfileScreen(); }));
                  }
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return ProfileScreen(); }));
                },
                child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white)),
                    child:const Text("View Profile",
                        style: TextStyle(
                          color: Colors.white,
                        )))),
            SizedBox(height: 30),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return InputScreen(); }));
                },
                child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white)),
                    child:const Text("Authenticate",
                        style: TextStyle(
                          color: Colors.white,
                        ))))
          ],
        ),
      ),
    );
  }
}
class InputScreen extends StatelessWidget {
  InputScreen({Key? key}) : super(key: key);
  TextEditingController inputController=TextEditingController();
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
              "Authenticate",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            inputField(title: "Enter your profile id", textController: inputController,),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return ProfileScreen();
                  }));
                },
                child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white)),
                    child:const Text("View Profile",
                        style: TextStyle(
                          color: Colors.white,
                        )))),
          ],
        ),
      ),
    );
  }
}
