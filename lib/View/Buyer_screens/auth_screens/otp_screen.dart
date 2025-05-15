import 'package:flutter/material.dart';
import 'package:food_app/Them/colour.dart';
import 'package:food_app/Them/corner.dart';
import 'package:food_app/Them/sizeconfig.dart';
import 'package:food_app/Them/spacing.dart';
import 'package:food_app/View/Buyer_screens/auth_screens/profile_detail.dart';
import 'package:food_app/widgets/resuse.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({super.key});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  bool isSignIn = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Spacing.space(10)),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: Spacing.space(10)),
                child: SingleHeaderScreen(
                  isSignIn: isSignIn,
                  onToggle: (val) {
                    setState(() {
                      isSignIn = val;
                    });
                  },
                ),
              ),

              SizedBox(height: Spacing.space(5)),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: Spacing.space(8)),
                child: Text(
                  "Enter your 6-digit OTP sent to\n +91 89******42",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),

              SizedBox(height: Spacing.space(5)),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: Spacing.space(8)),
                child: Column(
                  children: [
                    Center(
                      child: Pinput(
                        length: 4,
                        defaultPinTheme: PinTheme(
                          width: 50,
                          height: 56,
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(Corners.sm),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Spacing.space(2)),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 100.0,
                        ), // yahan aap padding adjust kar sakte hain
                        child: Text(
                          "Auto Verification enabled in 0.30 sec",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: Spacing.space(10)),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: Spacing.space(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Resend OTP clicked')),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.orangeAccent),
                          padding: EdgeInsets.symmetric(
                            vertical: Spacing.space(3),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: Corners.borderMd,
                          ),
                        ),
                        child: const Text(
                          "Resend OTP",
                          style: TextStyle(color: Colors.orangeAccent),
                        ),
                      ),
                    ),
                    SizedBox(width: Spacing.space(5)),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          context.go('/profile-details');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkYellow,
                          padding: EdgeInsets.symmetric(
                            vertical: Spacing.space(3),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: Corners.borderMd,
                          ),
                        ),
                        child: const Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: Spacing.space(10)),
            ],
          ),
        ),
      ),
    );
  }
}
