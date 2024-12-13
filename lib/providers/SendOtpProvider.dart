import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../repository/UserRepository.dart';

class SendOtpProvider extends ChangeNotifier {
  final UserRepository _userRepository = UserRepository();
  String? _sendOtpStatus;
  bool? _isLoading;
  int? _stausCode;
  bool? _isOtpSend;

  bool? get isLoading => _isLoading;

  String? get loginStatus => _sendOtpStatus;

  int? get statusCode => _stausCode;

  bool? get otpSend => _isOtpSend;

  Future<void> sendOtp(BuildContext context, String mobileNumber) async {
    try {
      _isLoading = true;
      final sendOtpResponse = await _userRepository.sendOtp(mobileNumber);
      print('login success ${sendOtpResponse}');
      log('login success---> ${sendOtpResponse}');
      notifyListeners();
      if (sendOtpResponse.status_code == 200) {
        _isOtpSend = true;
        print('login success ${sendOtpResponse.status_code}');
        _sendOtpStatus = 'OTP Send Successful';
        _stausCode = sendOtpResponse.status_code;
        print('SEND Otp response -->> $sendOtpResponse');
        //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));
      } else if(sendOtpResponse.status_code!=200) {
        print("otp api error ${sendOtpResponse.status_code}");
        _isOtpSend = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${sendOtpResponse.status_code}')),
        );
      }
    } catch (e) {
      _isOtpSend=false;
      _sendOtpStatus = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
