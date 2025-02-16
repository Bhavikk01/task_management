import 'dart:developer';
import 'package:get/get.dart';
import 'package:task_management/app/routes/app_pages.dart';
import 'package:task_management/app/services/storage.dart';

import '../models/user_model.dart';
import 'firestore.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final _isLogin = false.obs;
  String uid = '';
  String uidKey = 'uidKey';
  String userNameKey = 'userNameKey';
  String userProfilePicKey = 'userProfilePicKey';
  String userEmailKey = 'userEmailKey';
  final _profile = UserModel().obs;

  bool get isLogin => _isLogin.value;
  UserModel get profile => _profile.value;
  bool get hasToken => uid.isNotEmpty;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getProfile();
  }

  Future<void> setToken(String value) async {
    await StorageService.to.setString(uidKey, value);
    uid = value;
  }

  Future<void> getProfile() async {
    uid = StorageService.to.getString(uidKey);
    if (uid.isNotEmpty) {
      _profile(await FirebaseService.to.getUser(uid));
    }
    log('user data: $uid');
    _isLogin.value = true;
  }

  Future<void> saveProfile(String profile) async {
    await StorageService.to.setString(uidKey, profile);
    await getProfile();
    uid = profile;
    log("data is saved: ${_profile.value}");
  }

  Future<void> onLogout() async {
    await StorageService.to.remove(userEmailKey);
    await StorageService.to.remove(uidKey);
    await StorageService.to.remove(userProfilePicKey);
    await StorageService.to.remove(userNameKey);
    _isLogin.value = false;
    uid = '';
    Get.offAllNamed(Routes.login);
  }
}
