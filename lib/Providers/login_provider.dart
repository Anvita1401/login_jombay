import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jombay_login/Providers/user_provider.dart';

import '../Repository/auth_service/api_call.dart'; // Adjust the import as needed
import '../Repository/user_service/api_call.dart';
import '../Screens/login/login_states.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final AuthService _authService;
  final UserService _userService;

  LoginNotifier(this._authService, this._userService)
      : super(LoginState(value: const AsyncValue.data('')));

  Future<void> login(String username, String password) async {
    state = state.copyWith(value: const AsyncValue.loading());
    try {
      final token = await _authService.authenticate(username, password);
      await _userService.fetchUserData(token);

      state = state.copyWith(value: AsyncValue.data(token));
    } catch (e) {
      state = state.copyWith(value: AsyncValue.error(e, StackTrace.current));
    }
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

final loginNotifierProvider =
    StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  final authService = ref.read(authServiceProvider);
  final userService = ref.read(userServiceProvider);
  return LoginNotifier(authService, userService);
});
