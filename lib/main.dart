import 'package:flutter/material.dart';
import 'package:restapi/api/apiservice.dart';
import 'package:dio/dio.dart';
import 'package:restapi/screen/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    ApiService apiService = ApiService(Dio());
    Get.put(apiService);
    return GetMaterialApp(
      home: Home(),
    );
  }
}
