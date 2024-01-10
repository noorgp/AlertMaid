
import 'package:alert_maid/view/addMaid_screen.dart';
import 'package:alert_maid/view/alertDetails_screen.dart';
import 'package:alert_maid/view/maidInfo_screen.dart';
import 'package:alert_maid/view/maidList_screen.dart';
import 'package:alert_maid/view/createAccount_screen.dart';
import 'package:alert_maid/view/forgetPassword_screen.dart';
import 'package:alert_maid/view/home_screen.dart';
import 'package:alert_maid/view/login_screen.dart';
import 'package:alert_maid/view/userInfo_screen.dart';
import 'package:get/get.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () =>  const LoginScreen(),
    ),
   
     GetPage(
      name: _Paths.CREATEACCOUNT,
      page: () =>  const CreateAccountScreen(),
    ),
     GetPage(
      name: _Paths.MAINPAGE,
      page: () =>   MainPageScreen(),
    ),
    //   GetPage(
    //   name: _Paths.SETTINGS,
    //   page: () =>  const SettingsScreen(),
    // ),
      GetPage(
      name: _Paths.USERINFO,
      page: () =>  const UserInfoScreen(),
    ),
     GetPage(
      name: _Paths.MAIDLIST,
      page: () =>  const MAIDLISTScreen(),
    ),

     GetPage(
      name: _Paths.ADDMAID,
      page: () =>   AddMaidScreen(),
    ),

     GetPage(
      name: _Paths.MAIDINFO,
      page: () =>   MaidInfoScreen(),
    ),

    //  GetPage(
    //   name: _Paths.TEMPPAGE,
    //   page: () =>   TempPageScreen(),
    // ),

    //   GetPage(
    //   name: _Paths.CHILDTEMPLIST,
    //   page: () =>  const ChildTempListScreen(),
    // ),


    GetPage(
      name: _Paths.FORGETPASSWORD,
      page: () =>  const ForgetPasswordScreen(),
    ),
      GetPage(
      name: _Paths.ALERTDETAILS,
      page: () =>   MaidDetailsPage(),
    ),
  ];
}
