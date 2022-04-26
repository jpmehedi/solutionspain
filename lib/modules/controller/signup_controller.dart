import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:get/get.dart';
import 'package:solutionspain/core/utils/keys.dart';
import '../../core/utils/log.dart';
import '../../data/model/send_otp_model.dart';
import '../../data/provider/api_provider.dart';
import '../../routes/routes.dart';
import '../../widgets/verify_dialog.dart';
import '../../core/utils/helpers.dart';
import '../../core/values/strings.dart';
import '../../data/model/signup_model.dart';

class SignUpController extends GetxController{

  final _apiServie = ApiProvider();

    var formKey = GlobalKey<FormState>();
    var countryCode = "".obs;
    var otpNumberForEmail = "".obs;
    var otpNumberForPhone = "".obs;
    var newPasswordObscureText = true.obs;
    var confirmPasswordObscureText = true.obs;
    var dialCode = "".obs;
    var nameController = TextEditingController();
    var phoneNumberController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confiromPasswordController  = TextEditingController();
    PhoneContact? _phoneContact;


  Future sendOTP (SendOtpModel sendOtpModel) async{
    _apiServie.postData(
      baseUrl: Strings.baseUrl,
      url: Strings.sendOtpUrl,
      data: sendOtpModel.toJson(),
    ).then((data){
      if(data != null){
        Logger(key: "key", value: data);
        if(data['status'] == "success"){
          Get.dialog(
            VerifyDialog(
              onPressed: (){
              if(otpNumberForPhone.value.length < 5 || otpNumberForEmail.value.length < 5){
                Helpers.showSnackBar(title: "Error", message: "Invalid field");
              }else {
                var signup = SignUpModel(
                  phoneNumber: dialCode.value + phoneNumberController.text,
                  password:passwordController.text,
                  email:emailController.text,
                  name:nameController.text,
                  countryCode:countryCode.value,
                  otpNumberForEmail: otpNumberForEmail.value,
                  otpNumberForPhone: otpNumberForPhone.value
                );
                Logger(key: "signup", value: signup.toJson());
                signUp(signup);
              }
              },
            ),
            barrierDismissible: false
          );
        }
      }
    }).catchError((e){
      Get.snackbar('', e['message']);
    });
  }


  Future signUp (SignUpModel signuUpModel) async{
    _apiServie.postData(
      baseUrl: Strings.baseUrl,
      url: Strings.registerUrl,
      data: signuUpModel.toJson(),
    ).then((data){
      if(data != null){
        if(data[Keys.token] != null){
          Get.toNamed(Routes.SIGNIN_SCREEN);
        }
      }
    }).catchError((e){
      Get.snackbar('', e['message']);
    });
  }


  Future pickcontact ()async{
    final PhoneContact contact = await FlutterContactPicker.pickPhoneContact();
    _phoneContact = contact;
    if(_phoneContact != null){
      if(_phoneContact!.phoneNumber!.number!.length <= 13){
        phoneNumberController.text = "${_phoneContact!.phoneNumber!.number.toString().replaceFirst(RegExp(r'^0+(?=.)'),"").replaceAll("-", "")}";
      }
    }else{
      return null;
    }
    update();
  }
  
}