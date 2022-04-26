
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../data/model/signin_model.dart';
import '../../../modules/controller/signin_controller.dart';
import '../../../core/utils/validator.dart';
import '../../../core/values/app_color.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({Key? key,}) : super(key: key);
  final SignInController _signInController = Get.put(SignInController());
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhiteColor,
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                    height: 30.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/logo/logo.jpeg"),
                        SizedBox(height: 16,), 
                        Text(
                          'welcomeBack'.tr, 
                          style: TextStyle(color: AppColor.kBlackColor, fontSize: 16 )
                        ),
                        SizedBox(height: 8,), 
                        Text(
                          'continueWithEmailPhone'.tr, 
                          style: TextStyle(color: AppColor.kBlackColor, fontSize: 16 )
                        ), 
                      ],
                  ),
                ),
                SizedBox(height: 4.h),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _signInController.emailControlller,
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        level: "email".tr,
                        validator: (value)=>Validator.emailValidator(value!),
                        hintText: "Enter Your Email",
                      ),
                      SizedBox(height: 16,),
                      Obx(()=>
                         CustomTextField(
                          controller: _signInController.passwordController,
                          obscureText: _signInController.obscuredText.value,
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          level: "password".tr,
                          validator: (value)=> Validator.passwordValidator(value!),
                          hintText: "Enter Your Password",
                          suffixIcon: GestureDetector(
                            onTap: (){
                              _signInController.obscuredText.value = !_signInController.obscuredText.value;
                            },
                            child: Icon(_signInController.obscuredText.value ? Icons.visibility_off : Icons.visibility, color: AppColor.kGreyColor,),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: (){
                          }, 
                          child: Text('Forgot Pasword', style: Theme.of(context).textTheme.subtitle1,),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          CustomButton(
                            buttonLevel: "singIn".tr,
                            color: AppColor.kBlueColor,
                            onPressed: (){
                              final _signIn = SignInModel(
                                email: _signInController.emailControlller.text,
                                password: _signInController.passwordController.text,
                              );
                              if(_formKey.currentState!.validate()){
                                _formKey.currentState!.save();
                                _signInController.signIn(_signIn);
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: (){}, 
                            child: Text('createNewAccount'.tr, style: TextStyle(color: AppColor.kBlackColor, fontSize: 14)),
                          )
                        ],
                      ),
                    ],
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




