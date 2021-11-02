import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_1cs/home.dart';
import 'package:projet_1cs/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: Login(),
    );
  }
}
