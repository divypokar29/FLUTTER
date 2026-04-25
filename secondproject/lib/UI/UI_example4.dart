import 'package:flutter/material.dart';

class LoginScreen2State extends StatefulWidget {
  const LoginScreen2State({super.key});

  @override
  State<LoginScreen2State> createState() => LoginScreen2StateState();
}

class LoginScreen2StateState extends State<LoginScreen2State> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange[300],
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Image.asset("assest/image.png",height: 100,width: 100,),
            )
          ],
        ),
    );
  }
}