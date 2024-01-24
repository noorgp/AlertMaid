
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {

   late SharedPreferences _prefs;
var username = "".obs;

 String? location;
  String? watchSentPackets;
  var name = "".obs;
 var phone  = "".obs;
  String? age;

@override
void onInit() async {
  super.onInit();
  
  _prefs = await SharedPreferences.getInstance();
     username.value = _prefs.getString('name') ?? '';
       fetchData();
}

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
     location = dataMap['Location:'];
       watchSentPackets = dataMap['watch_sent_packets:'];
       name.value = dataMap['Name:'];
       phone.value = dataMap['Phone:'];
       age = dataMap['age:'];
      // ... access other values in a similar manner
print("the location is :$location");
      // Update the GetX observable
      data.value = snapshot.value.toString();
    }
  });
}





}