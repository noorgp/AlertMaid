import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class AlertsController extends GetxController {
    var MaidID = Get.arguments;
 @override
  void onInit() {
    super.onInit();
    fetchAlertDetails();
  }
var name = "".obs;
var age = "".obs;
var phone = "".obs;
RxDouble longitude = 0.0.obs;
RxDouble latitude = 0.0.obs;


  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

   void fetchAlertDetails() async {
          databaseReference = FirebaseDatabase.instance.ref().child('maids');
 DataSnapshot snapshot = await databaseReference.child(MaidID).get();
 
    Map maid = snapshot.value as Map;
 
    name.value = maid['name'];
    age.value = maid['age'];
    phone.value = maid['phone'];
    longitude.value = maid['longitude'];
  latitude.value = maid['latiude'];

}
 
}
