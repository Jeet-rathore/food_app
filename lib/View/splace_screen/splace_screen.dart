import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_app/Them/colour.dart' show AppColors;
import 'package:food_app/Them/sizeconfig.dart';
import 'package:food_app/Them/spacing.dart';
import 'package:food_app/appconfig/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      // Yahan pe go_router ki context.go() use karo
      context.go('/user'); // '/user' route aapke router me defined hona chahiye
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: Spacing.space(10)),
            Center(
              child: Container(
                width: SizeConfig.getProportionalWidth(context, 100),
                height: SizeConfig.getProportionalHeight(context, 100),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(
                  child: Image.asset(Assets.Applogo, fit: BoxFit.cover),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: Spacing.px(5),
              child: const Text(
                '"Delicious meals at your fingertips – \n fast, fresh, and hassle-free!"',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: Spacing.space(5)),
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: SizeConfig.getProportionalHeight(context, 400),
                  child: Image.asset(
                    Assets.Building,
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                Positioned(
                  bottom: Spacing.space(4),
                  left: Spacing.space(2),
                  child: SizedBox(
                    width: SizeConfig.getProportionalWidth(context, 130),
                    height: SizeConfig.getProportionalHeight(context, 360),
                    child: Image.asset(Assets.cartoonman, fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
