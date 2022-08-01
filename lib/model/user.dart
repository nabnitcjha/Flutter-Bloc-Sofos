import 'package:flutter/material.dart';

class User {
  final int userId;
  final int id;
  final String title;

  const User({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
