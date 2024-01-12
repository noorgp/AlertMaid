
import 'package:alert_maid/controller/home_controller.dart';
import 'package:alert_maid/helper/alertExitApp.dart';
import 'package:alert_maid/routes/app_pages.dart';
import 'package:alert_maid/style/app_color.dart';
import 'package:alert_maid/style/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SettingsScreen extends GetView<HomeController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildListTile(
              label: 'My Account',
              icon: Icons.account_circle,
              route: Routes.USERINFO,
            ),
            SizedBox(height: 8),
            buildListTile(
              label: 'Maids',
              icon: Icons.girl_rounded,
              route: Routes.MAIDLIST,
            ),
            SizedBox(height: 8),
            buildListTile(
              label: 'About',
              icon: Icons.info,
              route: Routes.ABOUT,
            ),
             SizedBox(height: 8),
         Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        height: 80, // Adjust the height as needed
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          leading: Icon(
            Icons.logout_rounded,
            color: Colors.red,
          ),
          title: Text(
            "Logout",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontFamily: 'Cairo',
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color:Colors.red),
          onTap: () {
          alertExitApp ();
          },
        ),
      ),
         )
          ],
        ),
      ),
    );
  }

  Widget buildListTile({
    required String label,
    required IconData icon,
    required String route,
  }) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        height: 80, // Adjust the height as needed
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          leading: Icon(
            icon,
            color: Color.fromARGB(255, 236, 188, 99),
          ),
          title: Text(
            label.tr,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontFamily: 'Cairo',
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 236, 188, 99)),
          onTap: () {
            Get.toNamed(route);
          },
        ),
      ),
    );
  }
}