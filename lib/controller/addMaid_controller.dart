
import 'package:alert_maid/widgets/custom_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddMaidController extends GetxController {
    TextEditingController ageC = TextEditingController();
  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
  TextEditingController phoneC = TextEditingController();
 var isLoading = false.obs;
  TextEditingController nameC = TextEditingController();

  late SharedPreferences _prefs;
String? uId ;
 @override
  void onInit() async {
    super.onInit();
    _prefs = await SharedPreferences.getInstance();
    uId = _prefs.getString('userId') ?? '';
  }


 void Clear(){
   nameC.clear();
      ageC.clear();
      nameC.clear();
      phoneC.clear();
 }




void ADDMAID() async {

  if (nameC.text.isEmpty || ageC.text.isEmpty) {
    CustomToast.errorToast('Please fill in all fields');
    return;
  }

  try {
     isLoading(true);
    DatabaseReference maidsRef = databaseReference; // Reference to the root node

    // Retrieve the current count of maids
    DataSnapshot snapshot = await maidsRef.once().then((value) => value.snapshot);

    int maidsCount = snapshot.value == null ? 0 : (snapshot.value as Map).length;

    String childKey = "Worker_Wrist_Watch ${maidsCount + 1}";

    DatabaseReference newMaidRef = maidsRef.child(childKey);

    await newMaidRef.set({
      'Location:': "",
      'Name:': nameC.text,
      'Phone:': phoneC.text,
      'age:': ageC.text,
      'button_status:':"Idle..",
      'watch_sent_packets:':""
    });

     isLoading(false);
    CustomToast.successToast('Maid added successfully');
    Clear();
  } catch (error) {
      isLoading(false);
   CustomToast.errorToast('Failed to add maid: $error');
  }
}


}

