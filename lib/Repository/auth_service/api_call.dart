
import 'package:dio/dio.dart';
import 'package:jombay_login/Repository/auth_service/authResponse.dart';

class AuthService {
  final Dio _dio = Dio();

  Future<String> authenticate(String username, String password) async {
    final response = await _dio.post(
      'https://authapi.ur-nl.com/sign_in.json',
    /*  options: Options(
        headers: {
          'Content-Type': 'application/json',
          'X-Subdomain': 'idevjourney',
        },
      ),
      data: {
        'user_name': username,
        'password': password,
      },
    );*/
        data: {
          "user": {
            "username": username,
            "password": password,
          }
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'X-Subdomain': 'idevjourney',
          },
        ),);

    if (response.statusCode == 200) {
      final authResponse = AuthResponse.fromJson(response.data);
      String accessToken = authResponse.user!.access_token!;
      return accessToken;
    } else {
      throw Exception('Failed to authenticate');
    }
  }
}
