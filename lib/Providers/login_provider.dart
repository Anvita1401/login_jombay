
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Repository/auth_service/api_call.dart';

class LoginData {
  final String username;
  final String password;
  LoginData(this.username, this.password);
}


final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});


final loginProvider = FutureProvider.family<String, LoginData>((ref, loginData) async {
  final authService = ref.read(authServiceProvider);
  return await authService.authenticate(loginData.username, loginData.password);
});
