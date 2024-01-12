

import 'package:alert_maid/style/app_color.dart';
import 'package:alert_maid/style/images.dart';
import 'package:flutter/material.dart';
import '../../style/fonts.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
          style: robotoHugeWhite,
        ),
        backgroundColor: AppColor.primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset(Images.logo)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Our Housemaid security alert system is more than a technological innovation, it is a humanitarian endeavor and an innovative system designed to create secure environments for those who earnestly contribute to the cleanliness of our homes. It provides a confidential way for the maid to request assistance in case of danger. By pressing the button on the bracelet, an alert is sent to the company with the maid's location, ensuring a quick response and appropriate action for safety assurance.",
              style: robotoMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}