import 'package:get/get.dart';

import 'home_screen_controller.dart';

class HomeScreenBinding implements Bindings{

  @override
  void dependencies() {
    Get.put(HomeScreenController());
  }

}