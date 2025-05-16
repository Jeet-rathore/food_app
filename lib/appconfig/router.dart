import 'package:flutter/material.dart';
import 'package:food_app/View/Buyer_screens/auth_screens/Login_screen.dart';
import 'package:food_app/View/Buyer_screens/auth_screens/otp_screen.dart';
import 'package:food_app/View/Buyer_screens/auth_screens/profile_detail.dart';
import 'package:food_app/View/Buyer_screens/home_screen/home_screen.dart';
import 'package:food_app/View/splace_screen/splace_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:food_app/View/user_type/user_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'SplashScreen',
      builder:
          (BuildContext context, GoRouterState state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/user',
      name: 'user',
      builder:
          (BuildContext context, GoRouterState state) => const Userscreen(),
    ),
    GoRoute(
      path: '/buyer-login',
      name: 'login',
      builder:
          (BuildContext context, GoRouterState state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/otp',
      name: 'otp',
      builder: (BuildContext context, GoRouterState state) => const Otpscreen(),
    ),
    GoRoute(
      path: '/profile-details',
      name: 'profileDetails',
      builder:
          (BuildContext context, GoRouterState state) =>
              const ProfileDetailsScreen(),
    ),
    GoRoute(
      path: '/Home_Page',
      name: 'HomePage',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
  ],
);
