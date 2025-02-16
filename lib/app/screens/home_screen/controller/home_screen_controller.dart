
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_management/app/services/firestore.dart';

import '../../../models/TaskModel.dart';
import '../../../services/user.dart';

class HomeScreenController extends GetxController {

  Rx<RxStatus> loadingData = RxStatus.loading().obs;
  Rx<RxStatus> createTaskLoading = RxStatus.empty().obs;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  RxList<TaskModel> taskList = <TaskModel>[].obs;
  RxList<TaskModel> temp = <TaskModel>[].obs;

  TextEditingController taskTitle = TextEditingController();
  TextEditingController taskDesc = TextEditingController();
  Rx<DateTime> dueDate = DateTime.now().obs;
  RxString priority = "LOW".obs;
  RxString taskStatus = "INCOMPLETE".obs;

  Rx<String> filterStatus = "INCOMPLETE".obs;
  Rx<String> filterPriority = "LOW".obs;


  @override
  void onInit(){
    getTaskData();
    super.onInit();
  }

  getTaskData() async {
    loadingData.value = RxStatus.loading();
    var data = await FirebaseService.to.getTaskList();
    for(var task in data.docs){
      taskList.add(TaskModel.fromJson(task.data()));
    }
    temp.addAll(taskList);
    loadingData.value = RxStatus.success();
  }

  setFilterByTime(String text){
    temp.clear();
    if(text == 'Immediate'){
      temp.addAll(taskList.where((task) => task.dueDate!.isAtSameMomentAs(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day))));
    }else if(text == 'This Month'){
      temp.addAll(taskList.where((task) => task.dueDate!.month == DateTime.now().month));
    }else if(text == 'This Week'){
      temp.addAll(taskList.where((task) => task.dueDate!.difference(DateTime.now()) <= const Duration(days: 7) && task.dueDate!.difference(DateTime.now()) >= const Duration(days: -7)));
    }else if(text == 'Select Your Task'){
      temp.addAll(taskList);
    }
  }

  void createTask() {
    if(taskTitle.text.isEmpty || taskDesc.text.isEmpty){
      Get.snackbar("Task Management", "Please fill all the details to create task");
    }
    var task = TaskModel(
      title: taskTitle.text,
      desc: taskDesc.text,
      dueDate: dueDate.value,
      priority: priority.value,
      status: "INCOMPLETE",
      uid: UserStore.to.uid,
    );
    createTaskLoading.value = RxStatus.loading();
    FirebaseService.to.createTask(task).then((value) {
      if(value != null){
        taskList.add(value);
        createTaskLoading.value = RxStatus.empty();
        Get.back();
      } else {
        Get.snackbar("Task Management", "Please fill all the details to create task");
      }
    }).catchError((error) {
      log(error);
      createTaskLoading.value = RxStatus.empty();
      Get.snackbar("Task Management", "Please fill all the details to create task");
    });
  }

  void updateTask(String id, int index) {
    if(taskTitle.text.isEmpty || taskDesc.text.isEmpty){
      Get.snackbar("Task Management", "Please fill all the details to update task");
    }
    var task = TaskModel(
      id: id,
      title: taskTitle.text,
      desc: taskDesc.text,
      status: taskStatus.value,
      dueDate: dueDate.value,
      priority: priority.value,
      uid: UserStore.to.uid,
    );
    FirebaseService.to.updateTask(task).then((value) {
      if(value != null){
        taskList[index] = value;
        Get.back();
      } else {
        Get.snackbar("Task Management", "Please fill all the details to update task");
      }
    }).catchError((error) {
      log(error.toString());
      Get.snackbar("Task Management", "Please fill all the details to update task");
    });
  }

  void deleteTask(String id){
    FirebaseService.to.deleteTask(id);
    taskList.removeWhere((task) => task.id == id);
    Get.back();
  }

  void applyFilter() {
    temp.clear();
    for(var item in taskList){
      if(item.priority == filterPriority.value && item.status == filterStatus.value) {
        temp.add(item);
      }
    }
    Get.back();
  }
}