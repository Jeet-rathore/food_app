import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isSignIn = true.obs;
  RxBool agreedToTerms = false.obs;
  TextEditingController phoneController = TextEditingController();

  void toggleMode(bool val) {
    isSignIn.value = val;
  }

  void toggleTermsAgreement() {
    agreedToTerms.value = !agreedToTerms.value;
  }

  bool validatePhone(GlobalKey<FormState> formKey) {
    return formKey.currentState?.validate() ?? false;
  }
}
