import 'package:flutter/material.dart';

class Login {
  final String token;

  const Login({
    required this.token,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      token: json['token'],
    );
  }
}
