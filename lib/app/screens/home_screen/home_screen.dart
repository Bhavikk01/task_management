import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../utils/colors.dart';
import '../../utils/scale_utility.dart';
import 'controller/home_screen_controller.dart';
import 'widgets/button_design.dart';

class HomeScreen extends GetView<HomeScreenController> {
  HomeScreen({super.key});

  final scale = Get.find<ScalingUtility>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.backgroundColor,
      body: Container(
        color: ColorsUtil.backgroundColor,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: scale.getPadding(
                  left: 16,
                  top: 43,
                  bottom: 33,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: scale.getScaledFont(22),
                    backgroundColor: Colors.transparent,
                    backgroundImage: const AssetImage(
                      'assets/profile.png',
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good afternoon',
                        style: GoogleFonts.outfit(
                          fontSize: scale.getScaledFont(12),
                          fontWeight: FontWeight.w600,
                          color: ColorsUtil.blueFontColor,
                        ),
                      ),
                      Text(
                        'Bhavik Kothari',
                        style: GoogleFonts.outfit(
                          fontSize: scale.getScaledFont(16),
                          fontWeight: FontWeight.w600,
                          color: ColorsUtil.darkTextColor,
                        ),
                      )
                    ],
                  ),
                  trailing: SizedBox(
                    width: scale.getScaledWidth(80),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: scale.getScaledFont(16),
                          backgroundColor: ColorsUtil.backgroundShadowColor,
                          child: Center(
                            child: Image.asset(
                              'assets/message.png',
                              height: scale.getScaledHeight(13),
                              width: scale.getScaledWidth(13),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: scale.getScaledWidth(10),
                        ),
                        CircleAvatar(
                          radius: scale.getScaledFont(16),
                          backgroundColor: ColorsUtil.backgroundShadowColor,
                          child: Center(
                            child: Image.asset(
                              'assets/notification_bell.png',
                              height: scale.getScaledHeight(13),
                              width: scale.getScaledWidth(13),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: scale.getMargin(horizontal: 10),
                decoration: BoxDecoration(
                  color: ColorsUtil.backgroundShadowColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(4,4),
                      blurRadius: 20,
                      spreadRadius: 0,
                      color: ColorsUtil.shadowColor1.withOpacity(0.41),
                    ),
                    const BoxShadow(
                      offset: Offset(-6,-6),
                      blurRadius: 20,
                      spreadRadius: 0,
                      color: Colors.white,
                    ),
                  ]
                ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        IconButton(
                          onPressed: () {},
                          iconSize: scale.getScaledFont(65),
                          highlightColor: Colors.transparent,
                          icon: Icon(
                            Icons.circle_outlined,
                            color: ColorsUtil.backgroundShadowColor,
                            shadows: [
                              const Shadow(
                                color: Color(0xffC1D5EE),
                                offset: Offset(4, 4),
                                blurRadius: 14,
                              ),
                              Shadow(
                                color: Colors.white.withOpacity(0.88),
                                offset: const Offset(-2, -2),
                                blurRadius: 9,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          left: 22.5,
                          top: 22.5,
                          child: CircularPercentIndicator(
                            radius: 25,
                            progressColor: Colors.blue,
                            lineWidth: 10,
                            circularStrokeCap: CircularStrokeCap.round,
                            backgroundColor: Colors.transparent,
                            center: Container(
                              height: scale.getScaledHeight(25),
                              width: scale.getScaledWidth(25),
                              decoration: BoxDecoration(
                                color: ColorsUtil.backgroundShadowColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(4,4),
                                    blurRadius: 20,
                                    color: ColorsUtil.shadowColor1.withOpacity(0.41),
                                  ),
                                  const BoxShadow(
                                    offset: Offset(-6,-6),
                                    blurRadius: 20,
                                    color: Colors.white,
                                  ),
                                  BoxShadow(
                                    offset: const Offset(2,2),
                                    blurRadius: 4,
                                    color: ColorsUtil.shadowColor2.withOpacity(0.10),
                                  )
                                ]
                              ),
                              child: Container(
                                height: scale.getScaledHeight(20),
                                width: scale.getScaledWidth(20),
                                padding: scale.getPadding(
                                  horizontal: 1,
                                  vertical: 1,
                                ),
                                decoration: BoxDecoration(
                                    color: ColorsUtil.backgroundShadowColor,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(4,4),
                                        blurRadius: 20,
                                        color: ColorsUtil.shadowColor1.withOpacity(0.41),
                                      ),
                                      const BoxShadow(
                                        offset: Offset(-6,-6),
                                        blurRadius: 20,
                                        color: Colors.white,
                                      ),
                                      BoxShadow(
                                        offset: const Offset(2,2),
                                        blurRadius: 4,
                                        color: ColorsUtil.shadowColor2.withOpacity(0.10),
                                      )
                                    ]
                                ),
                                child: Center(
                                  child: Text(
                                    '1%',
                                    style: GoogleFonts.outfit(
                                      fontSize: scale.getScaledFont(8),
                                      fontWeight: FontWeight.w800,
                                      color: ColorsUtil.blueColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            percent: 0.5,
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: scale.getPadding(
                        left: 5
                      ),
                      width: scale.getScaledWidth(210),
                      child: Text(
                        "This is a task completion indicator, representing the progress",
                        maxLines: 2,
                        style: GoogleFonts.outfit(
                          fontSize: scale.getScaledFont(12),
                          fontWeight: FontWeight.w500,
                          color: ColorsUtil.blueFontColor,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                        size: 12,
                      ),
                      onPressed: () {  },
                    )
                  ],
                ),
              ),
              Container(
                margin: scale.getMargin(
                  vertical: 15,
                  horizontal: 10
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "These are your tasks",
                      style: GoogleFonts.outfit(
                        fontSize: scale.getScaledFont(20),
                        fontWeight: FontWeight.w500,
                        color: ColorsUtil.blueFontColor,
                      ),
                    ),
                    CircleAvatar(
                      radius: scale.getScaledFont(20),
                      backgroundColor: ColorsUtil.backgroundShadowColor,
                      child: IconButton(
                        onPressed: () {
                          Get.bottomSheet(
                            Container(
                              width: double.infinity,
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
                              child: Column(
                                children: [
                                  Container(
                                    margin: scale.getMargin(
                                      bottom: 10,
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: Text(
                                      "Filter your task",
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
                                        value: controller.filterPriority.value,
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
                                          controller.filterPriority.value = value!;
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
                                        value: controller.filterStatus.value,
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
                                          controller.filterStatus.value = value!;
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
                                    height: scale.getScaledHeight(5),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.applyFilter();
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
                                        child: Text(
                                          'Apply Filter',
                                          style: GoogleFonts.outfit(
                                            fontSize: scale.getScaledFont(12),
                                            fontWeight: FontWeight.w500,
                                            color: ColorsUtil.blueFontColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          );
                        },
                        icon: Icon(
                          Icons.filter_list_alt,
                          size: scale.getScaledHeight(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              controller.loadingData.value.isSuccess ? Expanded(
                child: Container(
                  color: ColorsUtil.backgroundColor,
                  width: scale.fw,
                  padding: scale.getPadding(
                    left: 16,
                    top: 10,
                    right: 16,
                  ),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: Obx(
                      () => ListView.builder(
                        itemCount: controller.taskList.length,
                        itemBuilder: (context, index) {
                          return ButtonDesign(
                            task: controller.taskList[index],
                            controller: controller,
                            index: index,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ) : controller.loadingData.value.isLoading ? Center(child: CircularProgressIndicator()) : Container() ,
            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsUtil.backgroundColor,
        onPressed: () {
          Get.bottomSheet(
            Container(
              width: double.infinity,
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
                      "Create a new task",
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
                      log("printing message");
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
                  InkWell(
                    onTap: () {
                      if(controller.createTaskLoading.value.isEmpty) {
                        controller.createTask();
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
                        child: Text(
                          'Create Task',
                          style: GoogleFonts.outfit(
                            fontSize: scale.getScaledFont(12),
                            fontWeight: FontWeight.w500,
                            color: ColorsUtil.blueFontColor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        child: Icon(Icons.add),
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
