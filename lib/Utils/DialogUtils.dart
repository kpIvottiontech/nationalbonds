import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_bonds_app/theme/color/Colors.dart';

class DialogUtils {
  static BuildContext? context;

  static showLoader(BuildContext ctx) {
    context = ctx;
    showDialog(
      //barrierColor: Colors.white,
      context: ctx,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(
            color: primaryButtonColor,
          ),
        );
      },
    );
  }

  static void hideLoader() {
    if (context != null) {
      Get.back();
      context = null;
    }
  }
}
