import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Repository/user_service/user_api_call.dart';

final userServiceProvider = Provider<UserService>((ref) {
  return UserService();
});


final userDataProvider = FutureProvider.family<Map<String, dynamic>, String>((ref, token) async {
  final userService = ref.read(userServiceProvider);
  return await userService.fetchUserData(token);
});