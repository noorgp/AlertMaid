
import 'package:alert_maid/widgets/custom_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageMaidController extends GetxController {
      var maidID = Get.arguments;

     @override
  void onInit() async {
    super.onInit();
fetchMaid();
print("the id is $maidID");
  }


  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

  TextEditingController nameC = TextEditingController();
  TextEditingController ageC = TextEditingController();
  TextEditingController phoneC = TextEditingController();

  
  var isLoading = false.obs;


 void Clear(){
      nameC.clear();
      ageC.clear();
      phoneC.clear();
    
 }

void updateMaid() {
  isLoading = true.obs;
  if (nameC.text.isEmpty ||
      ageC.text.isEmpty ||
      phoneC.text.isEmpty
     ) {
    CustomToast.errorToast('Please fill in all fields');
    return;
  }
  databaseReference.child(maidID).update({
    'Name:': nameC.text,
    'age:': ageC.text,
    'Phone:': phoneC.text,
  }).then((value) {
    isLoading = false.obs;
    CustomToast.successToast('Updated Maid successfully');
    Clear();
  }).catchError((error) {
    isLoading = false.obs;
    // Handle error
    CustomToast.errorToast('Error updating Maid: $error');
  });
}



void fetchMaid() async {
  try {
databaseReference = FirebaseDatabase.instance.ref();
 DataSnapshot snapshot = await databaseReference.child(maidID).get();
 
    Map maid = snapshot.value as Map;
    // Check if the document exists
    if (snapshot.exists) {
      // Access the data and update your text controllers
      nameC.text = maid['Name:'];
      ageC.text = maid['age:'];
      phoneC.text = maid['Phone:'];
    } else {
      print('Document does not exist');
      // Handle the case where the document does not exist
    }
  } catch (e) {
    print('Error fetching maid: $e');
    // Handle other potential errors during the fetch
  }
}

}
