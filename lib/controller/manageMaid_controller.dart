
import 'package:alert_maid/widgets/custom_toast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageMaidController extends GetxController {
     @override
  void onInit() async {
    super.onInit();
fetchMaid();
  }

    var maidID = Get.arguments;

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

void updateChild() {
 
  isLoading = true.obs;

  if (nameC.text.isEmpty ||
      ageC.text.isEmpty ||
      phoneC.text.isEmpty
     ) {
    CustomToast.errorToast('Please fill in all fields');
    return;
  }

  databaseReference.child(maidID).update({
    'name': nameC.text,
    'age': ageC.text,
    'phone': phoneC.text,
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
          databaseReference = FirebaseDatabase.instance.ref().child('maids');
 DataSnapshot snapshot = await databaseReference.child(maidID).get();
 
    Map child = snapshot.value as Map;
 
    nameC.text = child['name'];
    ageC.text = child['age'];
    phoneC.text = child['phone'];
}
}
