import 'package:alert_maid/controller/alerts_controller.dart';
import 'package:alert_maid/controller/home_controller.dart';
import 'package:alert_maid/routes/app_pages.dart';
import 'package:alert_maid/style/app_color.dart';
import 'package:alert_maid/style/fonts.dart';
import 'package:alert_maid/style/images.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class AlertsPageScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
          StreamBuilder(
  stream: FirebaseDatabase.instance.reference().child("maids").onValue,
  builder: (context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      var data = snapshot.data!.snapshot.value;
      print(data);
      if (data != null) {
List<String> ids = List.from(data.keys.map((key) => key.toString()));
 
        return ListView.builder(
          shrinkWrap: true,
          itemCount: ids.length,
          itemBuilder: (context, index) {
            var id = ids[index];
          
            var phone = data[id]['phone'];
            // Check if the necessary fields are present and are of the expected type
        
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
                              " ${data[id]["name"]}",
                                      style: robotoHuge,
                                    ),
                                    subtitle: Text(
                                     " $phone",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    trailing:
                                        Icon(Icons.arrow_forward, color: AppColor.primaryColor,),
                                    onTap: () {
                                     Get.toNamed(Routes.ALERTDETAILS, arguments: id);
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