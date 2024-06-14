
import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio();

  Future<String> authenticate(String username, String password) async {
    final response = await _dio.post(
      'https://authapi.ur-nl.com/sign_in.json',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'X-Subdomain': 'idevjourney',
        },
      ),
      data: {
        'user_name': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return response.data['access_token'];
    } else {
      throw Exception('Failed to authenticate');
    }
  }
}
