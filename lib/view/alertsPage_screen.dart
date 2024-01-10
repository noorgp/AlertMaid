import 'package:alert_maid/controller/alerts_controller.dart';
import 'package:alert_maid/controller/home_controller.dart';
import 'package:alert_maid/style/app_color.dart';
import 'package:alert_maid/style/fonts.dart';
import 'package:alert_maid/style/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class AlertsPageScreen extends GetView<HomeController> {
  HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('maid')
                  //.where('uId', isEqualTo: homeController.uId)
                  .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data?.docs;

                  if (data != null && data.isNotEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        var document = data[index];

                        return Card(
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
                                      document["name"],
                                      style: robotoHuge,
                                    ),
                                    subtitle: Text(
                                      "730010012",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    trailing:
                                        Icon(Icons.arrow_forward, color: AppColor.primaryColor,),
                                    onTap: () {
                                      // Handle tap on the ListTile
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text("No data available."));
                  }
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}