
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:task_management/app/models/TaskModel.dart';
import 'package:task_management/app/services/user.dart';

import '../models/user_model.dart';

class FirebaseService extends GetxController {
  static FirebaseService get to => Get.find();
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId = '';

  Future<void> addUser(UserModel user) async {
    await fireStore.collection("Users").doc(user.uid).set(user.toJson());
  }

  Future<UserModel?> getUser(String userId) async {
    final doc = await fireStore.collection("Users").doc(userId).get();
    return doc.exists ? UserModel.fromJson(doc.data()!) : null;
  }

  Future<bool> handleSignInByEmail(String email, String password) async {
    UserModel? userModel;
    try {
      UserCredential userValue = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      userModel = await getUser(userValue.user!.uid);
      await UserStore.to.saveProfile(userModel!.uid ?? '');
      return true;
    } catch (e) {
      log('$e Occurred');
      Get.snackbar("Authentication", e.toString());
      return false;
    }
  }

  Future<bool> handleSignUpByEmail(String email, String password,
      String username, String phoneNumber) async {
    UserModel? userModel;
    try {
      UserCredential userValue = await auth.createUserWithEmailAndPassword(email: email, password: password);
      if(userValue.user != null){
        userModel = UserModel(
            uid: userValue.user!.uid,
            name: username,
            email: email,
            password: password,
            mobile: phoneNumber,
        );
        await addUser(userModel);
        await UserStore.to.saveProfile(userModel.uid ?? '');
        return true;
      }else{
        return false;
      }

    } catch (e) {
      Get.snackbar("Authentication", e.toString());
      log('$e Occurred');
      return false;
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getTaskList() async {
    return await fireStore
        .collection("Tasks")
        .where("uid", isEqualTo: UserStore.to.uid)
        .get();
  }

  updateUser(UserModel user) async {
    await fireStore
        .collection("Users")
        .doc(UserStore.to.uid)
        .update(user.toJson());
    await UserStore.to.getProfile();
  }

  Future<TaskModel?> createTask(TaskModel task) async {
    final id = fireStore.collection("Tasks").doc().id;
    task = task.copyWith(id: id);
    await fireStore.collection("Tasks")
     .doc(id)
    .set(task.toJson());
    return task;
  }

  Future<TaskModel?> updateTask(TaskModel task) async {
    await fireStore.collection("Tasks")
     .doc(task.id)
    .update(task.toJson());
    return task;
  }

  void deleteTask(String id) {
    fireStore.collection("Tasks").doc(id).delete();
  }
}
