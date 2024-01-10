import 'dart:io';

import 'package:alert_maid/routes/app_pages.dart';
import 'package:alert_maid/style/app_color.dart';
import 'package:alert_maid/style/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "Warning",
      titleStyle:const  TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),
      middleText: "Do you want to logout?",
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColor.redColor)),
            onPressed: () {
            //  exit(0);
            Get.offAllNamed(Routes.LOGIN);
            },
            child: Text("Yes", style: robotoMediumWhite,)),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              Get.back();
            },
            child: Text("No", style: robotoMediumWhite,))
      ]);
  return Future.value(true);
}