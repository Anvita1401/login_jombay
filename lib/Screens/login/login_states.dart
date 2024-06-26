import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_states.freezed.dart';

@freezed
class LoginState with _$LoginState {


    factory LoginState({required AsyncValue<String> value}) = _LoginState;

}
