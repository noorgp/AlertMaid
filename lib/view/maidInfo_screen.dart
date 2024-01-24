import 'package:alert_maid/controller/manageMaid_controller.dart';
import 'package:alert_maid/style/app_color.dart';
import 'package:alert_maid/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../style/fonts.dart';

class MaidInfoScreen extends GetView<ManageMaidController> {

   @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(title:Text( 'Maid Information', style: robotoHugeWhite,),
       backgroundColor:  AppColor.primaryColor, iconTheme: const IconThemeData(
    color: Colors.white,),
       ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                   decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                     
                           CustomInput(
                  controller: controller.nameC, label:  'Maid Name', hint: ''),
                        const SizedBox(height: 16),
 CustomInput(
                  controller: controller.ageC, label:  'Maid Age', hint: ''),

                      const SizedBox(height: 16),
 CustomInput(
                  controller: controller.phoneC, label:  'Maid Phone', hint: ''),
                      ],
                    ),
                  ),
                ),

     
  Padding(
            padding: const EdgeInsets.all(8.0),
            child:SizedBox(
  width: MediaQuery.of(context).size.width,
  height: MediaQuery.of(context).size.height * 0.08,
  child: ElevatedButton(
    onPressed: () async {
   
      controller.updateMaid();
     
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    child: Obx(
      () {
        return controller.isLoading.value
            ? const CircularProgressIndicator(color: Colors.white)
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.save_rounded,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Save Changes',
                    style: robotoMediumWhite
                  ),
                ],
              );
      },
    ),
  ),
),

          ),
             const SizedBox(height: 20),
                      
              ],
            ),
          ),
        ),
   
    );
  }
}
