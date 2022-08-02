import 'package:flutter/material.dart';

class StudentTeacher {
  final String teacherName;

  const StudentTeacher({
    required this.teacherName,
  });

  factory StudentTeacher.fromJson(Map<String, dynamic> json) {
    return StudentTeacher(
      teacherName: json['teacherName'],
    );
  }
}
