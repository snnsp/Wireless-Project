import 'package:flutter/material.dart';

class StudentInfo {
  final String student_id;
  final String firstname;
  final String lastname;
  final String nickname;
  final String image;

  const StudentInfo(
      {required this.student_id,
      required this.firstname,
      required this.lastname,
      required this.nickname,
      required this.image});
}
