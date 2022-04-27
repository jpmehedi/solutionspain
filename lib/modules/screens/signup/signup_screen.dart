
// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utils/helpers.dart';
import '../../../core/utils/log.dart';
import '../../../data/model/send_otp_model.dart';
import '../../../core/utils/validator.dart';
import '../../../core/values/app_color.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_phone_number_field.dart';
import '../../../widgets/custom_textfield.dart';
import '../../controller/signup_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final formkey = GlobalKey<FormState>();
  final SignUpController _signUpController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBlueColor,
      appBar: null,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(height: 4.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/logo/logo.jpeg"),
                    SizedBox(height: 16,), 
                    Text(
                      'createNewAccount'.tr, 
                      style: TextStyle(color: AppColor.kWhiteColor, fontSize: 16 )
                    ),
                    SizedBox(height: 4,), 
                    Text(
                      'registerToAccessYourAccount'.tr, 
                      style: TextStyle(color: AppColor.kWhiteColor, fontSize: 16 )
                    ), 
                  ],
                ),
                SizedBox(height: 32,),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.kWhiteColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight:  Radius.circular(20))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'name'.tr, 
                          style: TextStyle(color: AppColor.kGreyColor, fontSize: 16 )
                        ),
                        SizedBox(height: 4,), 
                        CustomTextField(
                          controller: _signUpController.nameController,
                          suffixIcon: Icon(Icons.person),
                          hintText:"Enter your name",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (_value)=>Validator.nameValidator(value: _value, data: "firstNameIsRequired".tr),
                        ),
                        SizedBox(height: 8,),
                        Text('Email address', style: TextStyle(color: AppColor.kGreyColor, fontSize: 16 )),
                        SizedBox(height: 4),         
                        CustomTextField(
                          controller: _signUpController.emailController,
                          suffixIcon: Icon(Icons.email),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value)=> Validator.emailValidator(value),
                          hintText: 'Email Address',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 8,),
                        Text('Phone Number',style: TextStyle(color: AppColor.kGreyColor, fontSize: 16 )),
                        SizedBox(height: 4),
                        CustomPhoneNumberField(
                          onCountryChanged: (value){
                            _signUpController.countryCode.value = value.code;
                            _signUpController.dialCode.value =  value.dialCode;
                          },
                          suffixIcon: InkWell(
                            onTap: (){
                              _signUpController.pickcontact();
                            },
                            child: Icon(Icons.contact_page,color: AppColor.kGreenColor,),
                          ),
                          controller: _signUpController.phoneNumberController,
                        ),
                        SizedBox(height: 8,),
                        Text('Password'),
                        SizedBox(height: 4),         
                        Obx(()=> CustomTextField(
                            controller: _signUpController.passwordController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(8),
                            ],
                            hintText: 'New Password',
                            validator: (value)=> Validator.passwordValidator(value),
                            keyboardType: TextInputType.emailAddress,
                            obscureText: _signUpController.newPasswordObscureText.value,
                            suffixIcon: GestureDetector(
                              onTap: (){
                                _signUpController.newPasswordObscureText.value = !_signUpController.newPasswordObscureText.value;
                              },
                              child: Icon( _signUpController.newPasswordObscureText.value ? Icons.visibility_off:Icons.visibility, color: AppColor.kBlackColor,),
                          ),
                        ),
                    ),
                    SizedBox(height: 8,),
                    Text('confirmPassword'.tr,),
                    SizedBox(height: 4),         
                    Obx(()=> CustomTextField(
                      hintText: 'Confirm Password',
                      controller:_signUpController.confiromPasswordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(8),
                      ],
                      validator: (value)=> Validator.confirmPasswordValidator(value,_signUpController.passwordController.text, _signUpController.confiromPasswordController.text),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: _signUpController.confirmPasswordObscureText.value,
                      suffixIcon: GestureDetector(
                        onTap: (){
                          _signUpController.confirmPasswordObscureText.value = !_signUpController.confirmPasswordObscureText.value;
                        },
                        child: Icon( _signUpController.confirmPasswordObscureText.value ? Icons.visibility_off : Icons.visibility, color: AppColor.kBlackColor,),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      children: [
                        CustomButton(
                          buttonLevel: "next".tr,
                          color: AppColor.kBlueColor,
                          onPressed: (){
                            final _sendOTP = SendOtpModel(
                              phoneNumber: _signUpController.dialCode.value + _signUpController.phoneNumberController.text,
                              password: _signUpController.passwordController.text,
                              email: _signUpController.emailController.text,
                              name: _signUpController.nameController.text,
                              countryCode: _signUpController.countryCode.value
                            );
                           if(formkey.currentState!.validate()){
                              formkey.currentState!.save();
                              if(_signUpController.countryCode.value.isNotEmpty && _signUpController.dialCode.value.isNotEmpty){
                                Logger(key: "otp", value: _sendOTP.toJson());
                                _signUpController.sendOTP(_sendOTP);
                              }else {
                                Helpers.showSnackBar(title: "Country code  error", message: "Country code must be seleted");
                              }
                           }
                         },
                        ),
                      ],
                     ),
                    SizedBox(height: 10.h,),
                    ],
                   ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}