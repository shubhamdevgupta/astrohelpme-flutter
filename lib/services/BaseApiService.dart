import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

class BaseApiService {
  final String _baseUrl = 'https://astrohelpme.in/astrologer/api/';

  Future<dynamic> post(
      String endpoint, {
        Map<String, String>? headers,
        Map<String, dynamic>? body,
      }) async {
    final Uri url = Uri.parse('$_baseUrl$endpoint');

    // Log the request
    log('POST Request: URL: $url');
    log('Headers: ${headers?.toString() ?? "No Headers"}');
    log('Body: ${body?.toString() ?? "No Body"}');

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      // Log the response
      log('Response: ${response.statusCode}');
      log('Response Body: ${response.body}');

      return _processResponse(response);
    } catch (e) {
      log('Error during POST request: $e');
      throw Exception('Error occurred during POST request: $e');
    }
  }

  Future<dynamic> get(
      String endpoint, {
        Map<String, String>? headers,
      }) async {
    final Uri url = Uri.parse('$_baseUrl$endpoint');

    // Log the request
    log('GET Request: URL: $url');
    log('Headers: ${headers?.toString() ?? "No Headers"}');

    try {
      final response = await http.get(
        url,
        headers: headers,
      );

      // Log the response
      log('Response: ${response.statusCode}');
      log('Response Body: ${response.body}');

      return _processResponse(response);
    } catch (e) {
      log('Error during GET request: $e');
      throw Exception('Error occurred during GET request: $e');
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw Exception('Bad Request: ${response.body}');
      case 401:
        throw Exception('Unauthorized: ${response.body}');
      case 500:
        throw Exception('Internal Server Error: ${response.body}');
      default:
        throw Exception('Unexpected error: ${response.statusCode}');
    }
  }
}
