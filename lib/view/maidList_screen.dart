import 'package:alert_maid/controller/maidList_controller.dart';
import 'package:alert_maid/routes/app_pages.dart';
import 'package:alert_maid/style/app_color.dart';
import 'package:alert_maid/style/fonts.dart';
import 'package:alert_maid/style/images.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MAIDLISTScreen extends GetView<MaidListController> {
  const MAIDLISTScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maids', style: robotoHugeWhite),
        backgroundColor: AppColor.primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: GestureDetector(
                    onTap: (){
                         Get.toNamed(Routes.MAIDINFO);
                    },
                    child: ListTile(
                      contentPadding: EdgeInsets.all(8),
                      leading: CircleAvatar(
                        backgroundColor: AppColor.primaryColor,
                        child: Icon(Icons.girl_rounded, color: AppColor.secondaryColor,),
                      ),
                      title: Text(
                        "Maid",
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: Icon(Icons.arrow_forward, color: AppColor.primaryColor),
                      onTap: () {
                      Get.toNamed(Routes.MAIDINFO);
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Get.toNamed(Routes.ADDMAID);
        },
        backgroundColor: const Color(0xFFA46CA4),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}