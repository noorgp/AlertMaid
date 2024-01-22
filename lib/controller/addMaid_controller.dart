
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
  // Assuming you have a reference to your Firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Check if any of the required fields are empty
  if (nameC.text.isEmpty || ageC.text.isEmpty || phoneC.text.isEmpty) {
    CustomToast.errorToast('Please fill in all fields');
    return;
  }

  try {
    // Set loading to true
    isLoading(true);

    // Reference to the "maids" collection
    CollectionReference maidsCollection = firestore.collection('maids');

    // Add a new document to the "maids" collection
    await maidsCollection.add({
      'name': nameC.text,
      'age': ageC.text,
      'phone': phoneC.text,
      // Add other fields as needed
    });

    // Set loading to false after successfully adding the maid
    isLoading(false);
 Clear();
    // Show success message or navigate to a different screen if needed
    CustomToast.successToast('Maid added successfully');
  } catch (error) {
    // Handle errors, e.g., show an error message
    CustomToast.errorToast('Failed to add maid: $error');
    isLoading(false);
  }
}


}