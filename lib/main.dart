import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Screens/login/login_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(home: LoginScreen()),
    ),
  );
}


