import 'package:flutter/material.dart';
import 'package:food_app/Router/router.dart';
import 'package:food_app/View/Buyer_screens/auth_screens/otp_screen.dart';
import 'package:food_app/View/Buyer_screens/auth_screens/profile_detail.dart';
import 'package:get/get.dart';
import 'package:food_app/View/Buyer_screens/auth_screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: appRouter,
    );
  }
}
