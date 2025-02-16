import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/app/routes/app_pages.dart';
import 'package:task_management/app/screens/auth_screens/login/controller/login_controller.dart';

import '../../../utils/colors.dart';
import '../../../utils/scale_utility.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final scale = Get.find<ScalingUtility>();

  void login(context) async{
    if(_formKey.currentState!.validate()) {
      controller.login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.backgroundColor,
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Welcome Back!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34, color: Colors.black),),
                  Text("Signing to your account", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black),),
                  SizedBox(height: 10),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" Email", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
                        TextFormField(
                          controller: controller.emailController,
                          focusNode: controller.emailField,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: ColorsUtil.appBlueColor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black, width: 1),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red, width: 1),
                            ),
                            hintText: "johdoe@gmail.com",
                          ),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Enter Email";
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(controller.passwordField);
                          },
                          obscureText: false,
                          cursorColor: ColorsUtil.appBlueColor,
                        ),
                        SizedBox(height: 10),

                        // Password Text field
                        Text(" Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
                        TextFormField(
                          controller: controller.passwordController,
                          focusNode: controller.passwordField,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: ColorsUtil.appBlueColor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black, width: 1),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red, width: 1),
                            ),
                            hintText: "password (6 digits min.)",
                          ),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Enter Password";
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).unfocus();
                          },
                          obscureText: false,
                          cursorColor: ColorsUtil.appBlueColor,
                        ),
                        SizedBox(height: 8),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: (){
                            if(!controller.isLoading.value){
                              login(context);
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: scale.getScaledHeight(32),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.53),
                                    ColorsUtil.backgroundColor,
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(4,4),
                                    blurRadius: 20,
                                    spreadRadius: 0,
                                    color: ColorsUtil.shadowColor1.withOpacity(0.41),
                                  ),
                                  BoxShadow(
                                    offset: const Offset(-6,-6),
                                    blurRadius: 20,
                                    spreadRadius: 0,
                                    color: Colors.white.withOpacity(0.41),
                                  ),
                                  BoxShadow(
                                    offset: const Offset(2,2),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    color: ColorsUtil.shadowColor2.withOpacity(0.1),
                                  ),
                                ]
                            ),
                            child: Center(
                              child: Obx(
                                () => controller.isLoading.value ? CircularProgressIndicator() : Text(
                                  'Sign In',
                                  style: GoogleFonts.outfit(
                                    fontSize: scale.getScaledFont(12),
                                    fontWeight: FontWeight.w500,
                                    color: ColorsUtil.blueFontColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
                            InkWell(
                              onTap: (){
                                Get.toNamed(Routes.signUp);
                              },
                              child: Text(" SignUp", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ColorsUtil.appBlueColor)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
