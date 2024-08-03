import 'package:ai_master_mind/ai/widget/custom_loding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialog {
  static void info(String msg) {
    Get.snackbar('Info', msg,
        backgroundColor: Colors.blue.withOpacity(.7), colorText: Colors.white);
  }

  static void success(String msg) {
    Get.snackbar('Success', msg,
        backgroundColor: Colors.green.withOpacity(.7), colorText: Colors.white);
  }

  static void error(String msg) {
    Get.snackbar('Error', msg,
        backgroundColor: Colors.redAccent.withOpacity(.7),
        colorText: Colors.white);
  }

  static void showLoadingDialog() {
    Get.dialog(const Center(child: CustomLoading()));
  }
}
