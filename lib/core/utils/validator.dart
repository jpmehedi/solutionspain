import 'package:get/get.dart';
class Validator{

  static String? passwordValidator(value){
    if(value!.isEmpty){
      return 'passwordIsRequired'.tr;
    }else if(value.length != 8){
      return '''passwordmustConsistof6Characters'''.tr;
    }
    return null;
  }

  static String? confirmPasswordValidator(value, password, confrimPassword ){
    if(value!.isEmpty){
      return 'confrimPasswordIsRequired'.tr;
    }else if(password != confrimPassword){
      return "yourPasswordNotMatch".tr;
    }
    return null;
  }


  static String? emailValidator(value){
    if(value!.isEmpty){
      return 'emailIsRequired'.tr;
    }else if(!GetUtils.isEmail(value)){
      return 'emailisNotValid'.tr;
    }
    return null;
  }

  static  nameValidator ({required dynamic value, required String data}){
      if(value!.isEmpty){
        return data;
      }else if(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)){
        return "pleaseEnterValidName".tr;
      }else{
        return null;
      }
  }



  static phonenumberValidator ({required dynamic value , required String data}){
    if(value!.isEmpty){
      return data;
    }else{
      return null;
    }

  }

}


