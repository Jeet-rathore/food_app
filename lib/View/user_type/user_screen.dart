import 'package:flutter/material.dart';
import 'package:food_app/Them/corner.dart';
import 'package:food_app/Them/sizeconfig.dart';
import 'package:food_app/Them/spacing.dart';
import 'package:food_app/View/Buyer_screens/auth_screens/Login_screen.dart';
import 'package:food_app/appconfig/assets.dart';
import 'package:food_app/widgets/common_card_widget.dart';
import 'package:go_router/go_router.dart';

class Userscreen extends StatelessWidget {
  const Userscreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // Initialize once

    return Scaffold(
      body: Padding(
        padding: Spacing.p(5), // Uniform padding using spacing utility
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Top Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: Corners.borderFull,
                  child: const Icon(Icons.arrow_back, size: 28),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Handle skip logic
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.getProportionalHeight(context, 10)),

            // 🔹 Logo
            Center(
              child: Image.asset(
                Assets.lob2met,
                height: SizeConfig.getProportionalHeight(context, 180),
              ),
            ),

            SizedBox(height: Spacing.space(5)),

            // 🔹 Buyer Card
            CommonCardWidget(
              imagePath: Assets.Buyer,
              labelTop: 'Buyer Sign In /',
              labelBottom: 'Sign Up',
              onTap: () {
                context.go('/buyer-login');
              },
            ),

            SizedBox(height: Spacing.space(5)),

            // 🔹 Seller Card
            CommonCardWidget(
              imagePath: Assets.Seller,
              labelTop: 'Seller Sign In /',
              labelBottom: 'Sign Up',
              onTap: () {
                // TODO: Implement seller logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
