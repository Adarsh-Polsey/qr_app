import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.account_circle,size: 100,color: Colors.white,),
            Container(height: 200,width: 200,color: Colors.white,
              child:QrImage(
              data: '1234567890',
              version: QrVersions.auto,
              size: 200.0,
            ),),
            GestureDetector(
                onTap: () {},
                child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white)),
                    child:const Text("Scan",
                        style: TextStyle(
                          color: Colors.white,
                        )))),
          ],
        ),
      ),
    );
  }
}
