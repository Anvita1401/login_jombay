
import 'package:dio/dio.dart';

class UserService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> fetchUserData(String token) async {
    final response = await _dio.get(
      ' https://authapi.ur-nl.com/users/current',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
          'X-Subdomain':'idevjourney'

        },
      ),
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to fetch user data');
    }
  }
}