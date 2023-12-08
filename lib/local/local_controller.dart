import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class mylocaleconroller extends GetxController {
  //Locale intiallang = sharepref
  void changelang(String codelang) {
    Locale locale = Locale(codelang);
    Get.updateLocale(locale);
  }
}
