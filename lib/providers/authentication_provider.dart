import 'package:astrohelpme/repository/UserRepository.dart';
import 'package:astrohelpme/screens/login/register_screen.dart';
import 'package:astrohelpme/utils/Loader.dart';
import 'package:flutter/material.dart';

import '../model/LoginResponse.dart';

class AuthenticationProvider extends ChangeNotifier {
  final UserRepository _userRepository = UserRepository();
  String? _loginStatus;
  String? _accessToken;
  User? _loggedInUser;
  bool? _isLoading; // Track loading state

  String? get loginStatus => _loginStatus;

  String? get accessToken => _accessToken;

  User? get loggedInUser => _loggedInUser;

  bool? get isLoading => _isLoading;

  Future<void> loginUser(
      BuildContext context, String phoneNumber, String password) async {
    bool isValid = await validateInput(phoneNumber, password, context);
    if (!isValid) {
      return;
    }
    Loader.circularLoader();
    try {
      _isLoading = true;
      notifyListeners();
      final loginResponse =
          await _userRepository.loginUser(phoneNumber, password);

      if (loginResponse.statusCode == 200) {
        print('login success ${loginResponse.statusCode}');
        _accessToken = loginResponse.accessToken;
        _loggedInUser = loginResponse.user;
        _loginStatus = 'Login Successful';
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => RegisterScreen()));
      } else {
        _loginStatus = 'Login Failed';
      }
    } catch (e) {
      _loginStatus = 'Error: $e';
    } finally {
      _isLoading = false;

      notifyListeners();
    }
  }

  Future<bool> validateInput(
      String phoneNumber, String password, BuildContext context) async {
    if (phoneNumber.isEmpty || phoneNumber.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Enter Valid Mobile Number')));
      return false;
    }
   else if (password.isEmpty || password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pasword cannot be empty or less then 6 ')));
      return false;
    }
    return true;
  }
}
