import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';
import 'package:solutionspain/modules/controller/signup_controller.dart';
import '../core/values/app_color.dart';


class VerifyDialog extends StatelessWidget {
  final VoidCallback? onPressed;
  VerifyDialog({
    Key? key, this.onPressed
  }) : super(key: key);
  final SignUpController _signUpController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0))
      ),
      contentPadding: EdgeInsets.zero,
          insetPadding:  EdgeInsets.symmetric(
            horizontal: Get.width * 0.08,
            vertical: Get.width * 0.08,
          ),
          content: Container(
            height: Get.height < 720 ? Get.height * 0.55 : Get.height * 0.45,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(Icons.lock)
                  ),
                ),
                Align(alignment: Alignment.center,child: Text("Verifiy User")),
                SizedBox(height: 32,),
                Text("Enter your phone otp"),
                Material(
                  child: OtpTextField(
                    numberOfFields: 5,
                    autoFocus: true,
                    borderColor: AppColor.kGreenColor,
                    focusedBorderColor: AppColor.kGreenColor,
                    showFieldAsBox: false,
                    borderWidth: 2.0,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                        //handle validation or checks here if necessary         
                    },
                    //runs when every textfield is filled 
                    onSubmit: (String verificationCode) {
                      _signUpController.otpNumberForPhone.value = verificationCode;
                    }, 
                  ),
                ),
                SizedBox(height: 16,),
                Text("Enter your email OTP"),
                Material(
                  child: OtpTextField(
                    numberOfFields: 5,
                    autoFocus: true,
                    borderColor: AppColor.kGreenColor,
                    focusedBorderColor: AppColor.kGreenColor,
                    showFieldAsBox: false,
                    borderWidth: 2.0,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                        //handle validation or checks here if necessary         
                    },
                    //runs when every textfield is filled 
                    onSubmit: (String verificationCode) {
                      _signUpController.otpNumberForEmail.value = verificationCode;
                    }, 
                  ),
                ),
                SizedBox(height: 8,),
                Divider(
                  height: 0,
                  thickness: 0.5,
                  color: AppColor.kGreyColor,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: onPressed,
                        child: Text('Verify Email', style: TextStyle(color: AppColor.kGreyColor),)
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}
