import 'package:alert_maid/widgets/custom_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {

   FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController nameC = TextEditingController();
    TextEditingController phoneC = TextEditingController();

    TextEditingController emailC = TextEditingController();

  TextEditingController passC = TextEditingController();

 var isLoading = false.obs;


  Future<void> createUser() async {
 isLoading = true.obs;

  if (emailC.text.isNotEmpty && passC.text.isNotEmpty && nameC.text.isNotEmpty && phoneC.text.isNotEmpty ) {
    try {
           

      UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: emailC.text.trim(),
        password: passC.text,
      );

      if (userCredential.user != null) {
        RxString uid = userCredential.user!.uid.obs; 

        DocumentReference user =
            firestore.collection("user").doc(uid.value); 
        await user.set({
          "name": nameC.text,
           "phone":phoneC.text,
          "email": emailC.text,
          "userId": uid.value,
          "createdAt": DateTime.now().toIso8601String(),
         
        });

        Get.back();

        CustomToast.successToast('Your Account Created Successfully');
              isLoading = false.obs;

      }
    } on FirebaseAuthException catch (e) {
                                    isLoading = false.obs;

      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
                CustomToast.successToast('Your password is too week it should be at least 6 characters');


      } else if (e.code == 'email-already-in-use') {
        CustomToast.errorToast('This account is already registered');
      } else if (e.code == 'wrong-password') {
        CustomToast.errorToast('password is wrong');
      } else {
        CustomToast.errorToast('error : ${e.code}');
        print("the problem is ${e.code}");
      }
    } catch (e) {
      CustomToast.errorToast(' error: $e');
      print('the error is $e');
    }
     } else {
 CustomToast.errorToast('Please complete all the fields');
    isLoading.value = false;
  }
  }
 


}
