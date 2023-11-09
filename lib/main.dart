import 'package:flutter/material.dart';
import 'package:personal_project/HomePage.dart';
import 'package:get/get.dart';
import 'Bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: myBindings(),
      debugShowCheckedModeBanner: false,
      home:const  HomePage(),
    );
  }
}




