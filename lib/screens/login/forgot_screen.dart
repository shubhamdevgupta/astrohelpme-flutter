import 'dart:developer';

import 'package:astrohelpme/providers/SendOtpProvider.dart';
import 'package:astrohelpme/utils/Loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SendOtpProvider(),
      child: Scaffold(
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
            padding: const EdgeInsets.all(12),
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
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextField(
                    controller: mobileNumberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      // Allows only numbers
                      LengthLimitingTextInputFormatter(10),
                      // Limits input to 10 digits
                    ],
                    style: const TextStyle(color: Colors.white),
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
                  const SizedBox(
                    height: 20,
                  ),

                  Consumer<SendOtpProvider>(builder: (context, otpProvider, child) {
                    log('isLoading: ${otpProvider.isLoading}, otpSend: ${otpProvider.otpSend}');
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  final mobileNumber = mobileNumberController.text;
                                  otpProvider.sendOtp(context, mobileNumber);
                                },
                                child: const Text(
                                  'Send OTP',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          if(otpProvider.isLoading==true)
                            Loader.circularLoader(height: 30),
                          if(otpProvider.otpSend==true)...[
                            TextField(
                              controller: otpController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                // Allows only numbers
                                LengthLimitingTextInputFormatter(6),
                                // Limits input to 10 digits
                              ],
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                labelText: "Enter 6 digit OTP",
                                labelStyle: TextStyle(color: Colors.white),
                                hintStyle: TextStyle(color: Colors.white70),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Verify OTP',
                                      style: TextStyle(color: Colors.black),
                                    )),
                              ),
                            ),
                          ]
                        ],
                      ),

                    );
                  }),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
