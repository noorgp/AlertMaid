import 'package:alert_maid/controller/home_controller.dart';
import 'package:alert_maid/helper/alertExitApp.dart';
import 'package:alert_maid/style/app_color.dart';
import 'package:alert_maid/style/fonts.dart';
import 'package:alert_maid/view/alertsPage_screen.dart';
import 'package:alert_maid/view/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class MainPageScreen extends GetView<HomeController> {
  final List<Widget> _pages = [
   const SettingsScreen(),
   
    AlertsPageScreen(),
    
 
  ];

  final RxInt _selectedIndex = 1.obs;

   MainPageScreen({super.key});

         

  @override
  Widget build(BuildContext context) {
     
String? uId;
print(uId);
    return WillPopScope(
       onWillPop:alertExitApp ,
      child: Scaffold(
        
       appBar: AppBar(
        title: Padding(
        padding: const EdgeInsets.all(20),
        child:  Obx(
              () =>  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text( 'Wellcome ${controller.username}', style: robotoHuge,),
              ),  ),),
         backgroundColor: AppColor.whiteColor,   automaticallyImplyLeading: false, elevation: 0,), 
         
        body: Obx(
          () => _pages[_selectedIndex.value],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: AppColor.primaryColor,
          backgroundColor: AppColor.whiteColor,
          index: _selectedIndex.value,
          height:55,
          items: <Widget>[
           
            Icon(Icons.more_horiz_rounded, size: 23, color: AppColor.secondaryColor,),
            Icon(Icons.add_alert_rounded,size: 23, color: AppColor.secondaryColor,),
     
            
          ],
          onTap: (index) {
            _selectedIndex.value = index;
          },
        ),
      ),
    );
  }
}
