import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authResponse.freezed.dart';
part 'authResponse.g.dart';

@freezed
class AuthResponse with _$AuthResponse {
  factory AuthResponse({User? user}) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

@freezed
class User with _$User {
  factory User({

    String? access_token,


  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}


