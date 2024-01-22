import 'package:alert_maid/controller/forgetPassword_controller.dart';
import 'package:alert_maid/style/app_color.dart';
import 'package:alert_maid/style/fonts.dart';
import 'package:alert_maid/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController>{
  const ForgetPasswordScreen({super.key});
  @override
   @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        title: Text("Forget your Password", style: TextStyle(fontSize: 18, color: Colors.white),),
         backgroundColor:  AppColor.primaryColor, iconTheme: const IconThemeData(
    color: Colors.white,), 
      ),
body: Padding(
  padding: const EdgeInsets.only(top: 50),
  child:   Column(
  
    children: [
  
  Text("Enter your Email to reset your password"),
  
  
  
  CustomInput(controller: controller.emailC, label: "Email", hint: ""),
  
  
  
  Padding(
    padding: const EdgeInsets.only(top: 15),
    child: SizedBox(
    
      width: double.infinity,
    
              height: size.height * 0.09,
    
    
    
      child: ElevatedButton(onPressed: (){controller.resetPassword();}, child: Text("Reset", style: robotoHugeWhite,), style: ElevatedButton.styleFrom(
    
        backgroundColor: AppColor.primaryColor
    
      ),)),
  )
  
    ],
  
  ),
),
    );
  }
}