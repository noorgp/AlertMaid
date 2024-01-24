
import 'package:alert_maid/widgets/custom_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  try {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('maids').doc(maidID).get();

    // Check if the document exists
    if (snapshot.exists) {
      // Access the data and update your text controllers
      Map<String, dynamic> maidData = snapshot.data() as Map<String, dynamic>;
      nameC.text = maidData['name'];
      ageC.text = maidData['age'];
      phoneC.text = maidData['phone'];
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
