import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/app_color.dart';

class Helpers {
static late DateTime currentBackPressTime;


static showSnackBar({String? message, String? title}){
  if(Platform.isAndroid){
    Get.snackbar(
      title!, message!, 
      backgroundColor: AppColor.kBlackColor,
      colorText: AppColor.kWhiteColor,
      borderRadius: 4.0,
    );
  } else {
    Get.snackbar(
      title!, message!, 
      borderRadius: 4.0
    );
  }
}

static keyboardhide (){
  return  FocusManager.instance.primaryFocus?.unfocus();
}

}

