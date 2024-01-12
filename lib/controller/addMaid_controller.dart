
import 'package:alert_maid/widgets/custom_toast.dart';
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
void ADDMAID() {
  isLoading = true.obs;

  if (nameC.text.isEmpty ||
      ageC.text.isEmpty ||    
      phoneC.text.isEmpty) {
    CustomToast.errorToast('Please fill in all fields');
    return;
  }


 
  DatabaseReference MaidRef = databaseReference.child("Maids");

  // Push the data and get the key
  DatabaseReference newMaidRef = MaidRef.push();
  String? maidKey = newMaidRef.key;

  // Set the data along with the child key
  newMaidRef.set({
    'name': nameC.text,
    'age': ageC.text,
   
    'emergPhone': phoneC.text,
    'id': maidKey, 
  }).then((value) {
    isLoading = false.obs;
    CustomToast.successToast('Added Maid successfully');
    Clear();
  }).catchError((error) {
    isLoading = false.obs;

    // Handle error
    CustomToast.errorToast('Error adding Maid: $error');
  });
}

}