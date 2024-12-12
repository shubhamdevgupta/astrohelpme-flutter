import 'package:astrohelpme/model/LoginResponse.dart';
import 'package:astrohelpme/model/RegistrationResponse.dart';

import '../services/BaseApiService.dart';

class UserRepository {
  final BaseApiService _apiService = BaseApiService();

  Future<LoginResponse> loginUser(String phoneNumber, String password) async {
    final response = await _apiService.post(
      'login',
      body: {'phone_number': phoneNumber, 'password': password},
    );
    return LoginResponse.fromJson(response as Map<String, dynamic>);
  }

  Future<RegistrationResponse> registrationAstro()async{
    final response= await _apiService.post('store-profile',body: {
      'user_id':user_id,

    },);
  return RegistrationResponse.fromJson(response as Map<String,dynamic>);
  }

}
