
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
    var alertId = Get.arguments;
 @override
  void onInit() {
    super.onInit();
 retrieveCheckedAlert() ;
  }
var name = "".obs;
var age = "".obs;
var phone = "".obs;
 var location = "".obs;
var watchSentPackets = "".obs;
var buttonStatus = "".obs;

  final databaseReference = FirebaseDatabase.instance.reference();


Future<void> retrieveCheckedAlert() async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot alertSnapshot = await firestore.collection('alerts').doc(alertId).get();

    if (alertSnapshot.exists) {
      if (alertSnapshot['checked'] == true) {
        name.value = alertSnapshot['name'];
         phone.value = alertSnapshot['phone'];
         location.value = alertSnapshot['location'];
        print('Name: $name, Phone: $phone, Location: $location');
      } else {
        print('The alert is not checked.');
      }
    } else {
      print('Alert not found.');
    }
  } catch (error) {
    print('Error retrieving alert: $error');
  }
}

}
