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
    return Column(
      children: [
        const SizedBox(height: 40),
        Center(
          child: Image.asset(
            Assets.lob2met,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: SizedBox(
            width: 250,
            height: 45,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => onToggle(true),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              isSignIn
                                  ? AppColors.darkYellow
                                  : Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
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
                  Expanded(
                    child: GestureDetector(
                      onTap: () => onToggle(false),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              !isSignIn
                                  ? AppColors.darkYellow
                                  : Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
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
        const SizedBox(height: 20),
        if (isSignIn) ...[
          const Text(
            "Hello!",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Login to Your Account",
            style: TextStyle(
              color: Color(0xFF461B02),
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ],
    );
  }
}
