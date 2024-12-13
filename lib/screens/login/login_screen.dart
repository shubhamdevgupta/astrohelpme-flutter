import 'package:astrohelpme/providers/authentication_provider.dart';
import 'package:astrohelpme/screens/login/forgot_screen.dart';
import 'package:astrohelpme/screens/login/register_screen.dart';
import 'package:astrohelpme/utils/Loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthenticationProvider(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xFF8E44AD), // Purple
              Color(0xFFF39C12), // Orange
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(

                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 96.0),
                    child: Image.asset(
                      'assets/icons/ic_logo.png',
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      // Allows only numbers
                      LengthLimitingTextInputFormatter(10),
                      // Limits input to 10 digits
                    ],
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: "Mobile Number",
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white70),
                      prefix: Text('+91'),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: TextField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      inputFormatters: [
                        // Allows only numbers
                        LengthLimitingTextInputFormatter(16),
                        // Limits input to 10 digits
                      ],
                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white70),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('forgot password clicked');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotScreen()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )),
                    ),
                  ),
                  Consumer<AuthenticationProvider>(
                    builder: (context, authProvider, child) {
                      return Padding(
                        padding: EdgeInsets.only(top: 32.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  final phoneNumber = phoneController.text;
                                  final password = passwordController.text;
                                  authProvider.loginUser(
                                      context, phoneNumber, password);
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  // Text color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                  ),
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ),
                            if(authProvider.isLoading==true)
                              Loader.circularLoader(height: 30)
                          ],
                        ),
                      );
                    },
                  ),
                  InkWell(
                    onTap: () {
                      print('register clicked');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Don't Have an account? Register Now",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
