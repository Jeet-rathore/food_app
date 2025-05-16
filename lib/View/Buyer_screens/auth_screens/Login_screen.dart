import 'package:flutter/material.dart';
import 'package:food_app/Them/colour.dart';
import 'package:food_app/widgets/appbutton.dart';
import 'package:food_app/widgets/resuse.dart';
import 'package:food_app/View/Buyer_screens/auth_screens/otp_screen.dart';
import 'package:food_app/appconfig/assets.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isSignIn = true;
  bool agreedToTerms = false;
  final TextEditingController phoneController = TextEditingController();

  void toggleMode(bool val) {
    setState(() {
      isSignIn = val;
    });
  }

  void toggleTermsAgreement() {
    setState(() {
      agreedToTerms = !agreedToTerms;
    });
  }

  bool validatePhone() {
    return _formKey.currentState?.validate() ?? false;
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SingleHeaderScreen(isSignIn: isSignIn, onToggle: toggleMode),
              if (isSignIn) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Enter your Mobile Number here for Both \ncreate new or login",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: IntlPhoneField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(
                        255,
                        236,
                        225,
                        184,
                      ).withOpacity(0.2),
                      hintText: 'Enter Mobile Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 20,
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {},
                    validator: (value) {
                      if (value == null || value.number.isEmpty) {
                        return "Please enter a valid phone number";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 60),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: CommonButton(
                      text: "Next",
                      onPressed: () {
                        context.go('/otp');
                      },
                      height: 48,
                      gradientColors: [AppColors.darkYellow],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: toggleTermsAgreement,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          color:
                              agreedToTerms ? Colors.green : Colors.transparent,
                        ),
                        child:
                            agreedToTerms
                                ? const Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.white,
                                )
                                : null,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "If you click you agree T&C",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Sign Up / Create Account",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ] else ...[
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(Assets.lob2met, height: 160, fit: BoxFit.cover),
                    const Icon(Icons.person, size: 60, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        Icon(Icons.shopping_bag, size: 32),
                        SizedBox(height: 8),
                        Text("Browse"),
                      ],
                    ),
                    const SizedBox(width: 40),
                    Column(
                      children: const [
                        Icon(Icons.favorite, size: 32),
                        SizedBox(height: 8),
                        Text("Wishlist"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: CommonButton(
                      text: "Continue as Guest",
                      onPressed: () {
                        // Navigate as guest
                      },
                      height: 48,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Sign up with Guest",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 100, height: 1, color: Colors.grey.shade300),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Or", style: TextStyle(color: Colors.grey)),
                  ),
                  Container(width: 100, height: 1, color: Colors.grey.shade300),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.google, height: 32),
                  const SizedBox(width: 40),
                  Image.asset(Assets.whatsapp, height: 32),
                  const SizedBox(width: 40),
                  Image.asset(Assets.instagram, height: 32),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
