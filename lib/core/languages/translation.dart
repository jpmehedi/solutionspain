
import 'package:get/get.dart';
import 'package:solutionspain/core/languages/bn.dart';
import 'package:solutionspain/core/languages/en-us.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'bn': bn,
    'en_US': en_US,
  };
}