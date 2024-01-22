
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class AlertsController extends GetxController {
    var alertId = Get.arguments;
 @override
  void onInit() {
    super.onInit();
 fetchData() ;
  }
var name = "".obs;
var age = "".obs;
var phone = "".obs;
 var location = "".obs;
var watchSentPackets = "".obs;
var buttonStatus = "".obs;
  final databaseReference = FirebaseDatabase.instance.reference();
  RxString data = ''.obs;


void fetchData() {
  databaseReference.child('Worker_Wrist_Watch').onValue.listen((event) {
    DataSnapshot snapshot = event.snapshot;

    // Explicitly cast snapshot.value to Map<dynamic, dynamic>
    Map<dynamic, dynamic>? dataMap = snapshot.value as Map<dynamic, dynamic>?;

    // Check if dataMap is not null before using it
    if (dataMap != null) {
      // Iterate through the map and print key-value pairs
      dataMap.forEach((key, value) {
        print('$key: $value');
      });

      // If you want to access specific values, you can do it like this:
     location.value = dataMap['Location:'];
       watchSentPackets..value = dataMap['watch_sent_packets:'];
       name.value = dataMap['Name:'];
       phone.value = dataMap['Phone:'];
       age.value = dataMap['age:'];
       buttonStatus.value = dataMap['button_status:'];
      // ... access other values in a similar manner
  print("the location is :$location");
      // Update the GetX observable
      data.value = snapshot.value.toString();
    }
  });
}




void updateAlert() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    CollectionReference alertsCollection = firestore.collection('alerts');
    DocumentReference alertReference = alertsCollection.doc(alertId);
    await alertReference.update({
      'checked': true 
    });
  } catch (error) {
    print("error is $error");
  }
}

}
