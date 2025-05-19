import 'package:flutter/material.dart';
import 'package:food_app/Them/corner.dart';
import 'package:food_app/Them/sizeconfig.dart';
import 'package:food_app/Them/spacing.dart';
import 'package:food_app/appconfig/assets.dart';
import 'package:food_app/widgets/common_card_widget.dart';
import 'package:go_router/go_router.dart';

class Userscreen extends StatelessWidget {
  const Userscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig
    SizeConfig.init(context);

    // Get screen height for calculations
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // Using SingleChildScrollView to prevent overflow
      body: SingleChildScrollView(
        child: Padding(
          padding: Spacing.p(5),
          child: ConstrainedBox(
            // Set minimum height to screen height to ensure content fits
            constraints: BoxConstraints(
              minHeight: screenHeight - Spacing.space(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top navigation row
                SafeArea(
                  bottom: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        borderRadius: Corners.borderFull,
                        child: const Icon(Icons.arrow_back, size: 28),
                      ),
                      TextButton(
                        onPressed: () {
                          // Skip logic
                        },
                        child: const Text(
                          "Skip",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),

                // Logo - with flexible height based on screen size
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: Image.asset(
                    Assets.lob2met,
                    height: screenHeight * 0.2, // Proportional height
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: screenHeight * 0.2,
                        width: screenHeight * 0.2,
                        color: Colors.grey.shade200,
                        child: const Icon(Icons.image_not_supported),
                      );
                    },
                  ),
                ),

                SizedBox(height: Spacing.space(4)),

                // User type cards with flexible spacing
                CommonCardWidget(
                  imagePath: Assets.Buyer,
                  labelTop: 'Buyer Sign In /',
                  labelBottom: 'Sign Up',
                  onTap: () {
                    context.go('/buyer-login');
                  },
                ),

                SizedBox(height: Spacing.space(3)),

                CommonCardWidget(
                  imagePath: Assets.Seller,
                  labelTop: 'Seller Sign In /',
                  labelBottom: 'Sign Up',
                  onTap: () {
                    // Seller login logic
                  },
                ),

                // Add bottom padding to ensure space at the end
                SizedBox(height: Spacing.space(2)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
