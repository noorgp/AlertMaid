
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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

    Map<dynamic, dynamic>? dataMap = snapshot.value as Map<dynamic, dynamic>?;
    if (dataMap != null) {
      dataMap.forEach((key, value) {
        print('$key: $value');
      });
     location.value = dataMap['Location:'];
       watchSentPackets.value = dataMap['watch_sent_packets:'];
       name.value = dataMap['Name:'];
       phone.value = dataMap['Phone:'];
       age.value = dataMap['age:'];
       buttonStatus.value = dataMap['button_status:'];
       
  print("the location is :$location");
      data.value = snapshot.value.toString();
    }
  });
}


 void openLocationOnMap() async {
    final String mapLink =
        'https://www.google.com/maps?q=${location}';
    if (await canLaunch(mapLink)) {
      await launch(mapLink);
    } else {
      // Handle error
      print("Could not launch $mapLink");
    }
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
