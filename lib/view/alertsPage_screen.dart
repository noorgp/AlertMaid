import 'package:alert_maid/controller/home_controller.dart';
import 'package:alert_maid/routes/app_pages.dart';
import 'package:alert_maid/style/app_color.dart';
import 'package:alert_maid/style/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AlertsPageScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('alerts')
            .where('checked', isEqualTo: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          var alerts = snapshot.data?.docs;

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                for (var alert in alerts!)
                  Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(Images.warning),
                          ),
                          Expanded(
                            child: ListTile(
                              contentPadding: const EdgeInsets.only(right: 10),
                              title: Text(
                                "${alert['name']}",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "${alert['phone']} ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward,
                                color: AppColor.primaryColor,
                              ),
                              onTap: () {
                                Get.toNamed(Routes.ALERTDETAILS, arguments: alert.id);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
