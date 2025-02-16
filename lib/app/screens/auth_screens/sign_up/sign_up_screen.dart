import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/app/screens/auth_screens/sign_up/controller/sign_up_controller.dart';
import 'package:task_management/app/utils/colors.dart';

class SignUpScreen extends GetView<SignUpController> {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  void signup() {
    if(_formKey.currentState!.validate()){
      if(controller.passwordController.text.toString().trim() == controller.confirmPasswordController.text.toString().trim()){
        controller.signUp();
      }else{
        Get.snackbar("Credentials not matching!", "Either password or confirm-password is incorrect.");
      }
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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text("Create an account", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34, color: Colors.black),),
                  Text("Register to Global Connect", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black),),
                  SizedBox(height: 30),

                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Username : Text field
                          Text(" Username", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
                          TextFormField(
                            controller: controller.usernameController,
                            focusNode: controller.usernameField,
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
                              hintText: "John Doe",
                            ),
                            validator: (value) {
                              if(value!.isEmpty){
                                return "Enter Username";
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(controller.emailField);
                            },
                            obscureText: false,
                            cursorColor: ColorsUtil.appBlueColor,
                          ),
                          SizedBox(height: 10),

                          // Email : Text field
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
                              hintText: "johndoe@gmail.com",
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

                          // Password : Text field
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
                                return "Enter password";
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(controller.confirmPasswordField);
                            },
                            obscureText: true,
                            cursorColor: ColorsUtil.appBlueColor,
                          ),
                          SizedBox(height: 10),

                          // Confirm Password : Text field
                          Text(" Confirm Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
                          TextFormField(
                            controller: controller.confirmPasswordController,
                            focusNode: controller.confirmPasswordField,
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
                                return "Please confirm password";
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) {},
                            obscureText: true,
                            cursorColor: ColorsUtil.appBlueColor,
                          ),
                          SizedBox(height: 10),
                        ],
                      )
                  ),

                  // signup Button
                  SizedBox(
                    height: 46,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: ()=> signup(),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Color(0xff5782BB)),
                        ),
                        child: Obx(
                              () => controller.isLoading.value
                              ? Center(child: CircularProgressIndicator(color: Colors.white))
                              : Text("Register", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                        )
                    ),
                  ),

                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
                      InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Text(" SignIn", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ColorsUtil.appBlueColor)),
                      ),
                    ],
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
