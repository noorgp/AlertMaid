
import 'package:alert_maid/widgets/custom_toast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddMaidController extends GetxController {
    TextEditingController ageC = TextEditingController();
  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
  TextEditingController emgNameC = TextEditingController();
  TextEditingController emgPhoneC = TextEditingController();
 var isLoading = false.obs;
  TextEditingController nameC = TextEditingController();
  TextEditingController tempC = TextEditingController();

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
      emgNameC.clear();
      emgPhoneC.clear();
      tempC.clear();
 }
void ADDMAID() {
  isLoading = true.obs;

  if (nameC.text.isEmpty ||
      ageC.text.isEmpty ||
      emgNameC.text.isEmpty ||
      emgPhoneC.text.isEmpty ||
      tempC.text.isEmpty) {
    CustomToast.errorToast('Please fill in all fields');
    return;
  }

  double temperature = double.tryParse(tempC.text) ?? 0.0;

  if (temperature > 40 || temperature < 35) {
     isLoading = false.obs;
    CustomToast.errorToast('Invalid temperature. Temperature must be between 35 and 40.');
    return;
  }

  DatabaseReference childrenRef = databaseReference.child("Children");

  // Push the data and get the key
  DatabaseReference newChildRef = childrenRef.push();
  String? childKey = newChildRef.key;

  // Set the data along with the child key
  newChildRef.set({
    'name': nameC.text,
    'age': ageC.text,
    'emergName': emgNameC.text,
    'emergPhone': emgPhoneC.text,
    'temperature': tempC.text,
    'responded': 0,
    'id': childKey, // Add the child key here
    'time':"",
    'uId':uId,
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