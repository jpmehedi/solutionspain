import 'package:get/get.dart';
import 'package:solutionspain/modules/screens/home/home_screen.dart';
import 'package:solutionspain/modules/screens/signin/signin_screen.dart';
import 'package:solutionspain/modules/screens/signup/signup_screen.dart';
import 'package:solutionspain/routes/routes.dart';


class AppScreens { 
  static final screens = [  
    GetPage(name: Routes.SIGNIN_SCREEN, page:()=> SigninScreen()),
    GetPage(name: Routes.SIGNUP_SCREEN, page:()=> SignUpScreen()),
     GetPage(name: Routes.HOME_SCREEN, page:()=> HomeScreen()),
  ];
} 