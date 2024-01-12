import 'package:alert_maid/controller/maidList_controller.dart';
import 'package:alert_maid/controller/manageMaid_controller.dart';
import 'package:alert_maid/routes/app_pages.dart';
import 'package:alert_maid/style/app_color.dart';
import 'package:alert_maid/style/fonts.dart';
import 'package:alert_maid/style/images.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MAIDLISTScreen extends GetView<ManageMaidController> {
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
                        data[id]["name"],
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: Icon(Icons.arrow_forward, color: AppColor.primaryColor),
                      onTap: () {
                      Get.toNamed(Routes.MAIDINFO, arguments: id);
                      },
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