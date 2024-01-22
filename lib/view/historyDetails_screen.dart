import 'package:alert_maid/controller/alerts_controller.dart';
import 'package:alert_maid/controller/history_controller.dart';
import 'package:alert_maid/style/app_color.dart';
import 'package:alert_maid/style/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryDetailsPage extends GetView<HistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Alert Details',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: AppColor.primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(Images.warning)),
            Row(
              children: [
                Obx(() => Text("Name: ${controller.name.value}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                Icon(Icons.girl_rounded)
              ],
            ),
                    Row(
              children: [
                Obx(() => Text("Phone: ${controller.phone.value}", style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                   Icon(Icons.phone)
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: (){
_openLocationOnMap();
                },
                icon: Icon(Icons.map, color: Colors.white,),
                label: Text(
                  'View Location',
                  style: TextStyle(fontSize: 18, color: Colors.white)
                ),
                style: ElevatedButton.styleFrom(
                  primary: AppColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openLocationOnMap() async {
    final String mapLink =
        'https://www.google.com/maps?q=${controller.location}';
    if (await canLaunch(mapLink)) {
      await launch(mapLink);
    } else {
      // Handle error
      print("Could not launch $mapLink");
    }
  }
}