import 'package:get/get.dart';
import 'package:task_management/app/screens/auth_screens/sign_up/controller/sign_up_controller.dart';

class SignUpBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(SignUpController());
  }

}