
import 'package:alert_maid/controller/addMaid_controller.dart';
import 'package:alert_maid/controller/alerts_controller.dart';
import 'package:alert_maid/controller/maidList_controller.dart';
import 'package:alert_maid/controller/createAccount_controller.dart';
import 'package:alert_maid/controller/forgetPassword_controller.dart';
import 'package:alert_maid/controller/home_controller.dart';
import 'package:alert_maid/controller/manageMaid_controller.dart';
import 'package:alert_maid/controller/userInfo_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';




import '../controller/login_controller.dart';

Future init() async {
  final sharedPreferences = await SharedPreferences.getInstance();



 //Get.lazyPut(() => LoginController(), fenix: true);
       Get.lazyPut(() => LoginController(sharedPreferences: Get.find()),
      fenix: true);
      Get.lazyPut(() => CreateAccountController(), fenix: true);
        Get.lazyPut(() => sharedPreferences, fenix: true);

  Get.lazyPut(() => HomeController(), fenix: true);
  Get.lazyPut(() => ManageMaidController(), fenix: true);
   Get.lazyPut(() => AlertsController(), fenix: true);
  // Get.lazyPut(() => TempController(), fenix: true);
  Get.lazyPut(() => UserInfoController(), fenix: true);
   Get.lazyPut(() => MaidListController(), fenix: true);
    Get.lazyPut(() => AddMaidController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);



}
