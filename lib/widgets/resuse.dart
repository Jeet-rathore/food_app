import 'package:flutter/material.dart';
import 'package:food_app/Them/colour.dart';
import 'package:food_app/Them/corner.dart' show Corners;
import 'package:food_app/Them/sizeconfig.dart' show SizeConfig;
import 'package:food_app/Them/spacing.dart';
import 'package:food_app/appconfig/assets.dart';

class SingleHeaderScreen extends StatelessWidget {
  final bool isSignIn;
  final Function(bool) onToggle;

  const SingleHeaderScreen({
    Key? key,
    required this.isSignIn,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // Initialize screen config

    return Column(
      children: [
        SizedBox(height: SizeConfig.getProportionalHeight(context, 40)),

        Center(
          child: Image.asset(
            Assets.lob2met,
            height: SizeConfig.getProportionalHeight(context, 200),
            width: SizeConfig.getProportionalWidth(context, 200),
            fit: BoxFit.cover,
          ),
        ),

        SizedBox(height: Spacing.space(5)),

        // Toggle Button
        Center(
          child: SizedBox(
            width: SizeConfig.getProportionalWidth(context, 250),
            height: SizeConfig.getProportionalHeight(context, 45),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: Corners.borderFull,
              ),
              child: Row(
                children: [
                  // Login Toggle
                  Expanded(
                    child: GestureDetector(
                      onTap: () => onToggle(true),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              isSignIn
                                  ? AppColors.darkYellow
                                  : Colors.transparent,
                          borderRadius: Corners.left(Corners.sm),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: isSignIn ? AppColors.white : AppColors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Guest Toggle
                  Expanded(
                    child: GestureDetector(
                      onTap: () => onToggle(false),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              !isSignIn
                                  ? AppColors.darkYellow
                                  : Colors.transparent,
                          borderRadius: Corners.right(Corners.sm),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Guest",
                          style: TextStyle(
                            color:
                                !isSignIn ? AppColors.white : AppColors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        SizedBox(height: Spacing.space(5)),

        if (isSignIn) ...[
          const Text(
            "Hello!",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: Spacing.space(1)),
          const Text(
            "Login to Your Account",
            style: TextStyle(
              color: Color(0xFF461B02),
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: Spacing.space(4)),
        ],
      ],
    );
  }
}
