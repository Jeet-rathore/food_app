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

    // Navigate after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/user');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig in build method instead of post-frame callback
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: Spacing.space(10)),
            // App Logo
            Center(
              child: Container(
                width: SizeConfig.getProportionalWidth(context, 100),
                height: SizeConfig.getProportionalHeight(context, 100),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  Assets.Applogo,
                  fit: BoxFit.cover,
                  // Adding errorBuilder to handle image loading failures
                  errorBuilder: (context, error, stackTrace) {
                    return const CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.restaurant, color: Colors.white),
                    );
                  },
                ),
              ),
            ),
            const Spacer(),
            // App tagline
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
            // Bottom images stack with fixed height
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.4,
              ),
              child: Stack(
                children: [
                  Image.asset(
                    Assets.Building,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade800,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: const Center(
                          child: Icon(
                            Icons.image_not_supported,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: Spacing.space(4),
                    left: Spacing.space(2),
                    child: Image.asset(
                      Assets.cartoonman,
                      fit: BoxFit.cover,
                      width: SizeConfig.getProportionalWidth(context, 130),
                      errorBuilder: (context, error, stackTrace) {
                        return SizedBox(
                          width: SizeConfig.getProportionalWidth(context, 130),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
