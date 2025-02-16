import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../services/firestore.dart';

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  FocusNode emailField = FocusNode();

  FocusNode passwordField = FocusNode();

  RxBool isLoading = false.obs;

  login() async {
    isLoading.value = true;
    if(await FirebaseService.to.handleSignInByEmail(emailController.text, passwordController.text)){
      Get.offAllNamed(Routes.home);
    }
    isLoading.value = false;
  }
}