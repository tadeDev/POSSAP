import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:possap_project/routes/app_routes.dart';
import 'package:possap_project/routes/app_routes_names.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

String initialRoute = introScreen;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Ubuntu"
      ),
      initialRoute: initialRoute,
      getPages: getPage,
    );
  }
}