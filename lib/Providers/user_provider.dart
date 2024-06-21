import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Repository/user_service/api_call.dart';

final userServiceProvider = Provider<UserService>((ref) {
  return UserService();
});


