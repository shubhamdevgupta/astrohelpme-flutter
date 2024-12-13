import 'package:flutter/cupertino.dart';
import '../repository/UserRepository.dart';

class SendOtpProvider extends ChangeNotifier {
  final UserRepository _userRepository = UserRepository();
  String? _sendOtpStatus;

  bool? _isLoading;

  bool? get isLoading => _isLoading;

  String? get loginStatus => _sendOtpStatus;

  Future<void> sendOtp(BuildContext context, String mobileNumber) async {
    try {
      _isLoading = true;
      notifyListeners();
      final sendOtpResponse = await _userRepository.sendOtp(mobileNumber);

      if (sendOtpResponse.status_code == 200) {
        print('login success ${sendOtpResponse.status_code}');
        _sendOtpStatus = 'OTP Send Successful';
        print('SEND Otp response --$sendOtpResponse');
        //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));
      } else {
        _sendOtpStatus = 'Login Failed';
      }
    } catch (e) {
      _sendOtpStatus = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
