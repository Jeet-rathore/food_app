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
  bool _isLayoutReady = false;

  @override
  void initState() {
    super.initState();

    // Ensure SizeConfig runs after layout is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SizeConfig.init(context);
      setState(() {
        _isLayoutReady = true;
      });

      // Navigate after 3 seconds
      Future.delayed(const Duration(seconds: 3), () {
        context.go('/user');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLayoutReady) {
      // Prevent UI rendering until layout is ready
      return const Scaffold(
        backgroundColor: AppColors.black,
        body: Center(child: CircularProgressIndicator(color: AppColors.white)),
      );
    }

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
