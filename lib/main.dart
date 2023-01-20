import 'package:flutter/material.dart';
import 'package:restapi/api/apiservice.dart';
import 'package:dio/dio.dart';
import 'package:restapi/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
