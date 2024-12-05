import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF501E71),
                  Color(0xFFF07902),
                  Color(0xFFBF5552),
                  Color(0xFFD5662C),
                ],
                begin: const FractionalOffset(1.4, 0.3),
                end: const FractionalOffset(0.0, 1.5),
                stops: [0.1, 2.5,5.0,9.0],
                tileMode: TileMode.clamp)),
        child: const Column(
          children: [
            Text(
              "Hey Login Page changed",
              style: TextStyle(fontSize: 16,
              color: Colors.white),
            ),

          ],
        ),
      ),
    );
  }
}
