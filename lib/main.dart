import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:greeve/routes/app_pages.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/utils/constants/colors_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Greeve',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorsConstant.primary500),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.listChallenge,
      getPages: AppPages.routes,
    );
  }
}
