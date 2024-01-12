import 'package:alert_maid/controller/alerts_controller.dart';
import 'package:alert_maid/style/app_color.dart';
import 'package:alert_maid/style/fonts.dart';
import 'package:alert_maid/style/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MaidDetailsPage extends GetView<AlertsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Alert Details',
          style: robotoHugeWhite,
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
                Obx(() => Text("Name: ${controller.name.value}", style: robotoHuge)),
                Icon(Icons.girl_rounded)
              ],
            ),
            SizedBox(height: 8),
            Obx(() => Text("Age: ${controller.age.value}", style: robotoMedium)),
            Row(
              children: [
                Obx(() => Text("Phone: ${controller.phone.value}", style: robotoMedium)),
                   Icon(Icons.phone)
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _openLocationOnMap,
                icon: Icon(Icons.map, color: Colors.white,),
                label: Text(
                  'View Location',
                  style: robotoHugeWhite
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
        'https://www.google.com/maps?q=${controller.latitude},${controller.longitude}';
    if (await canLaunch(mapLink)) {
      await launch(mapLink);
    } else {
      // Handle error
      print("Could not launch $mapLink");
    }
  }
}