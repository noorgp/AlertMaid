import 'package:alert_maid/style/app_color.dart';
import 'package:alert_maid/style/fonts.dart';
import 'package:alert_maid/style/images.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MaidDetailsPage extends StatelessWidget {
  final String maidName = "Mary";
  final String maidDescription =
      "Experienced and reliable maid with excellent cleaning skills.";
  final String locationLink = "https://maps.app.goo.gl/uSHNA66NRcMbjRMF8";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text( 'Alert Details', style: robotoHugeWhite,),
       backgroundColor:  AppColor.primaryColor, iconTheme: const IconThemeData(
    color: Colors.white,),
       ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Images.warning),
            Text(
              maidName,
              style: robotoExtraHuge
            ),
            SizedBox(height: 8),
            Text(
              maidDescription,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                _openLocationOnMap();
              },
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'View Location',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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
    if (await canLaunch(locationLink)) {
      await launch(locationLink);
    } else {
      // Handle error
      print("Could not launch $locationLink");
    }
  }
}