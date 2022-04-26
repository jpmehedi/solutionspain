

// class SignInController extends GetxController{
  
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solutionspain/core/utils/keys.dart';
import '../../data/model/signin_model.dart';
import '../../data/provider/api_provider.dart';
import '../../core/values/strings.dart';
import '../../routes/routes.dart';



class SignInController extends GetxController{

  final _apiService = ApiProvider();
  var emailControlller = TextEditingController();
  var passwordController = TextEditingController();
  var obscuredText = true.obs;

  
  Future signIn(SignInModel signInModel)async{
    _apiService.postData(
      baseUrl: Strings.baseUrl, 
      url: Strings.loginUrl, 
      data: signInModel.toJson()
    ).then((data) {
      if(data[Keys.token] != null){
          Get.toNamed(Routes.HOME_SCREEN);
       }
    });
  }


}