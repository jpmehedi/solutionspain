
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:solutionspain/core/languages/translation.dart';
import 'package:solutionspain/routes/pages.dart';
import 'package:solutionspain/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Nec Moeny',
          locale: Get.deviceLocale,
          translations: AppTranslations(),
          builder: EasyLoading.init(),
          initialRoute: Routes.SIGNUP_SCREEN,
          getPages: AppScreens.screens
       );
      },
    );
  }
}