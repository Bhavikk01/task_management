import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../services/firestore.dart';

class SignUpController extends GetxController{
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode usernameField = FocusNode();
  FocusNode emailField = FocusNode();
  FocusNode passwordField = FocusNode();
  FocusNode confirmPasswordField = FocusNode();

  RxBool isLoading = false.obs;

  signUp() async {
    if (await FirebaseService.to.handleSignUpByEmail(
      emailController.text,
      passwordController.text,
      usernameController.text,
      phoneController.text
    )) {
      Get.toNamed(Routes.home);
    }
  }
}