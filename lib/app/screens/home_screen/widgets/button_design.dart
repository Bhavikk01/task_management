import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:task_management/app/screens/home_screen/controller/home_screen_controller.dart';
import 'package:task_management/app/utils/colors.dart';

import '../../../models/TaskModel.dart';
import '../../../utils/scale_utility.dart';

class ButtonDesign extends StatelessWidget {
  ButtonDesign({required this.task, required this.index, required this.controller, super.key});
  final TaskModel task;
  final int index;
  final HomeScreenController controller;
  final scale = Get.find<ScalingUtility>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.taskTitle.text = task.title!;
        controller.taskDesc.text = task.desc!;
        controller.dueDate.value = task.dueDate!;
        controller.priority.value = task.priority!;
        Get.bottomSheet(
          Container(
            width: double.infinity,
            height: scale.getScaledHeight(700),
            decoration: BoxDecoration(
              color: ColorsUtil.backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            padding: scale.getPadding(
                horizontal: 15,
                vertical: 10
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: scale.getMargin(
                      top: 15,
                      bottom: 10,
                      left: 10,
                      right: 10,
                    ),
                    child: Text(
                      "Update you task",
                      style: GoogleFonts.outfit(
                        fontSize: scale.getScaledFont(20),
                        fontWeight: FontWeight.w500,
                        color: ColorsUtil.blueFontColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Title',
                      style: GoogleFonts.outfit(
                        fontSize: scale.getScaledFont(12),
                        fontWeight: FontWeight.w500,
                        color: ColorsUtil.blueFontColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(5),
                  ),
                  TextFormField(
                    controller: controller.taskTitle,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorsUtil.appBlueColor, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorsUtil.appBlueColor, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorsUtil.appBlueColor, width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      hintText: "Task title",
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Enter title";
                      }
                      return null;
                    },
                    obscureText: false,
                    cursorColor: ColorsUtil.appBlueColor,
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Description',
                      style: GoogleFonts.outfit(
                        fontSize: scale.getScaledFont(12),
                        fontWeight: FontWeight.w500,
                        color: ColorsUtil.blueFontColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(5),
                  ),
                  TextFormField(
                    controller: controller.taskDesc,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorsUtil.appBlueColor, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorsUtil.appBlueColor, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorsUtil.appBlueColor, width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      hintText: "Enter description",
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Enter description of task";
                      }
                      return null;
                    },
                    obscureText: false,
                    cursorColor: ColorsUtil.appBlueColor,
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Select Status',
                      style: GoogleFonts.outfit(
                        fontSize: scale.getScaledFont(12),
                        fontWeight: FontWeight.w500,
                        color: ColorsUtil.blueFontColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(5),
                  ),
                  Container(
                    padding: scale.getPadding(
                        horizontal: 2
                    ),
                    child: Obx(
                      () => DropdownButtonFormField2(
                        value: controller.taskStatus.value,
                        isDense: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 2
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 2
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onChanged: (value) {
                          controller.taskStatus.value = value!;
                        },
                        items: ["INCOMPLETE", "COMPLETED"].map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.only(right: 8),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 24,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Select Priority',
                      style: GoogleFonts.outfit(
                        fontSize: scale.getScaledFont(12),
                        fontWeight: FontWeight.w500,
                        color: ColorsUtil.blueFontColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(5),
                  ),
                  Container(
                    padding: scale.getPadding(
                        horizontal: 2
                    ),
                    child: Obx(
                          () => DropdownButtonFormField2(
                        value: controller.priority.value,
                        isDense: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 2
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 2
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onChanged: (value) {
                          controller.priority.value = value!;
                        },
                        items: ["LOW", "MEDIUM", "HIGH"].map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.only(right: 8),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 24,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Due date',
                      style: GoogleFonts.outfit(
                        fontSize: scale.getScaledFont(12),
                        fontWeight: FontWeight.w500,
                        color: ColorsUtil.blueFontColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(5),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                            content: SizedBox(
                              height: 300,
                              width: 300,
                              child: selectDueDate(context),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: scale.getPadding(
                        horizontal: 2,
                        vertical: 5,
                      ),
                      margin: scale.getMargin(
                        top: 5,
                        bottom: 15,
                      ),
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
                      child: Obx(
                            () => Text(
                          DateFormat("dd/MM/yy").format(controller.dueDate.value),
                          style: GoogleFonts.outfit(
                            fontSize: scale.getScaledFont(16),
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.deleteTask(task.id!);
                        },
                        child: Container(
                          height: scale.getScaledHeight(32),
                          padding: scale.getPadding(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          margin: scale.getMargin(
                            left: 5,
                            right: 5,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.53),
                                  Colors.red,
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
                            child: Text(
                              'Delete Task',
                              style: GoogleFonts.outfit(
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w500,
                                color: ColorsUtil.blueFontColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: scale.getScaledWidth(20),
                      ),
                      InkWell(
                        onTap: () {
                          controller.updateTask(task.id!, index);
                        },
                        child: Container(
                          height: scale.getScaledHeight(32),
                          padding: scale.getPadding(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          margin: scale.getMargin(
                            left: 5,
                            right: 5,
                          ),
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
                            child: Text(
                              'Update Task',
                              style: GoogleFonts.outfit(
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w500,
                                color: ColorsUtil.blueFontColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        width: scale.getScaledWidth(97),
        padding: scale.getPadding(
          top: 12,
          bottom: 12,
          left: 14,
          right: 12,
        ),
        margin: scale.getMargin(
          vertical: 5,
          horizontal: 5
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(2,2),
              blurRadius: 5,
              spreadRadius: 0,
              color: const Color(0xff6F8CB0).withOpacity(0.41),
            ),
          ],
          color: const Color(0xffE3EDF7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.title!,
                  style: GoogleFonts.outfit(
                    fontSize: scale.getScaledFont(15),
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff3D5284),
                  ),
                ),
                Text(
                  task.priority!,
                  style: GoogleFonts.outfit(
                    fontSize: scale.getScaledFont(10),
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff3D5284),
                  ),
                ),
              ],
            ),
            Text(
              task.desc!,
              style: GoogleFonts.outfit(
                fontSize: scale.getScaledFont(13),
                fontWeight: FontWeight.w500,
                color: const Color(0xff3D5284),
              ),
            ),
            SizedBox(
              height: scale.getScaledHeight(6),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Due At: ${DateFormat("dd MMM, yyyy").format(task.dueDate!)}",
                style: GoogleFonts.outfit(
                  fontSize: scale.getScaledFont(10),
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff3D5284),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  selectDueDate(context){
    return SfDateRangePicker(
      view: DateRangePickerView.month,
      cancelText: 'Cancel',
      initialDisplayDate: controller.dueDate.value,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      rangeSelectionColor: Theme.of(context).colorScheme.secondary,
      selectionMode: DateRangePickerSelectionMode.single,
      todayHighlightColor: const Color(0xff041c50),
      selectionShape: DateRangePickerSelectionShape.rectangle,
      monthCellStyle: DateRangePickerMonthCellStyle(
        cellDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        todayTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
        todayCellDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: const Color(0xff041c50),
          ),
        ),
      ),
      showActionButtons: true,
      enablePastDates: false,
      selectionTextStyle: const TextStyle(color: Colors.white),
      rangeTextStyle: const TextStyle(color: Colors.white),
      selectionColor: const Color(0xff041c50),
      onCancel: () => Navigator.pop(context),
      onSubmit: (value) {
        controller.dueDate.value = value as DateTime;
        Get.back();
      },
    );
  }

}
