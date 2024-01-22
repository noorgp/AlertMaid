import 'dart:io';
import 'dart:ui';

import 'package:alert_maid/controller/alerts_controller.dart';
import 'package:alert_maid/firebase_options.dart';
import 'package:alert_maid/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helper/git_di.dart' as di;



final FlutterLocalNotificationsPlugin flutterLocalPlugin =FlutterLocalNotificationsPlugin();
const AndroidNotificationChannel notificationChannel=AndroidNotificationChannel(
  'maid_alerts',
    "Warning",
  importance: Importance.max,
  showBadge: true

);

void main() async{
 
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPreferences.getInstance();

 await initservice();
  await di.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}


AlertsController alertsController = AlertsController();






Future<void> initservice()async{
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  var service=FlutterBackgroundService();
  //set for ios
  if(Platform.isIOS){
    await flutterLocalPlugin.initialize(const InitializationSettings(
      iOS: DarwinInitializationSettings()
    ));
  }

  await flutterLocalPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(notificationChannel);

  //service init and start
  await service.configure(
      iosConfiguration: IosConfiguration(
        onBackground: iosBackground,
        onForeground: onStart
      ),
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: true,
        isForegroundMode: true,
       initialNotificationTitle: "background service",
        initialNotificationContent: "Alert Maid",
      )
  );
  service.startService();
}


//onstart method
@pragma("vm:entry-point")
void onStart(ServiceInstance service) async{
   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  DartPluginRegistrant.ensureInitialized();

  service.on("setAsForeground").listen((event) {
    print("foreground ===============");
  });

  service.on("setAsBackground").listen((event) {
    print("background ===============");
  });

  service.on("stopService").listen((event) {
    service.stopSelf();
  });

///alertsController.fetchData();

  final databaseReference = FirebaseDatabase.instance.reference();

databaseReference.child('Worker_Wrist_Watch').onValue.listen((event) {
    DataSnapshot snapshot = event.snapshot;
    Map<dynamic, dynamic>? dataMap = snapshot.value as Map<dynamic, dynamic>?;

    if (dataMap != null) {
  
    
     String  buttonStatus = dataMap['button_status:'];
     String  name = dataMap['Name:'];
     String  location = dataMap['Location:'];
     String phone  = dataMap['Phone:'];

if (buttonStatus == "is calling"){
storeAlert(name, phone, location);
   flutterLocalPlugin.show(
        90,
        "Warning",
        "Maid $name is in danger, please check on her!!",
        NotificationDetails(android:AndroidNotificationDetails('maid_alerts',"Warning",icon: "logo"))
        
        );
}

    }
  });

}

//iosbackground
@pragma("vm:entry-point")
Future<bool> iosBackground(ServiceInstance service)async{
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  return true;
}



void storeAlert(String name, String phone, String location) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
 CollectionReference maidsCollection = firestore.collection('alerts');
    await maidsCollection.add({
      'name': name,
      'phone': phone,
      'location': location,
      'checked': false
    });
  } catch (error) {
    print(error);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Alert Maid',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.LOGIN,
      getPages: AppPages.routes,
    );
  }

}
