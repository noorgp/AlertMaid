
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {

   late SharedPreferences _prefs;
var username = "".obs;

@override
void onInit() async {
  super.onInit();
  _prefs = await SharedPreferences.getInstance();
     username.value = _prefs.getString('name') ?? '';
       
}






}