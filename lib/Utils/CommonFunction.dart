import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_bonds_app/Components/CommonSize/CommonHeightWidth.dart';
import 'package:national_bonds_app/Components/CommonSize/CustomFontSize.dart';
import 'package:national_bonds_app/Components/CommonSize/CustomGeneralSize.dart';
import 'package:national_bonds_app/Components/CommonSize/CustomSpacing.dart';
import 'package:national_bonds_app/components/CustomRegularText.dart';
import 'package:path/path.dart';
import '../theme/color/Colors.dart';

abstract class CommonFunction {
  static Duration shortDuration({Duration? shortDuration}) =>
      shortDuration ?? const Duration(milliseconds: 100);

  static Duration longDuration({Duration? longDuration}) =>
      longDuration ?? const Duration(milliseconds: 500);

  static showErrorSnakBar(String message) async {
    await snakBarCloser;
    Get.showSnackbar(GetSnackBar(
      maxWidth: AppDimensions.instance!.width / 1.5,
      barBlur: 10,
      reverseAnimationCurve: Curves.easeInOutCubicEmphasized,
      duration: longDuration(longDuration: const Duration(seconds: 2)),
      messageText: Center(
        child: CustomRegularText(
          color: buttonTextColor,
          label: message,
        ),
      ),
      message: message,
      backgroundColor: errorColor.withOpacity(0.6),
      snackPosition: SnackPosition.TOP,
      borderRadius: CustomGeneralSize.customCommonBorderRadius(),
      margin: customRegularPadding(),
      isDismissible: true,
      padding: customSmallPadding(),
      animationDuration: longDuration(longDuration: const Duration(seconds: 2)),
      icon: const Icon(
        Icons.error,
        color: primaryColor,
      ),
    ));
  }

  static get snakBarCloser async =>
      Get.isSnackbarOpen ? await Get.closeCurrentSnackbar() : null;

  static showDeleteSnakBar(
      {String? message,
      void Function()? onYesPressed,
      void Function()? onNoPressed}) {
    Get.showSnackbar(GetSnackBar(
      maxWidth: AppDimensions.instance!.width / 2,
      overlayBlur: 10,
      reverseAnimationCurve: Curves.easeInOutCubicEmphasized,
      duration: longDuration(longDuration: const Duration(seconds: 30)),
      message: message,
      backgroundColor: primaryColor,
      snackPosition: SnackPosition.TOP,
      messageText: Center(
        child: CustomRegularText(
          color: buttonTextColor,
          label: message ?? 'Are you sure you want to delete?',
        ),
      ),
      mainButton: Wrap(
        children: [
          TextButton(
              onPressed: onYesPressed,
              child: CustomRegularText(
                label: 'Yes',
                color: errorColor,
                fontWeight: CustomGeneralSize.customBoldFontWeight(),
                fontSize: CustomFontSize.largeFont(),
              )),
          TextButton(
              onPressed: onNoPressed ??
                  () {
                    Get.back();
                  },
              child: CustomRegularText(
                label: 'No',
                color: buttonTextColor,
                fontWeight: CustomGeneralSize.customBoldFontWeight(),
                fontSize: CustomFontSize.largeFont(),
              )),
        ],
      ),
      borderRadius: CustomGeneralSize.customCommonBorderRadius(),
      margin: customRegularPadding(),
      isDismissible: true,
      padding: customSmallPadding(),
      animationDuration:
          longDuration(longDuration: const Duration(milliseconds: 700)),
      icon: const Icon(Icons.delete),
    ));
  }

  static Future<dio.MultipartFile> getFormData(String imagePath,
      {required String mapKeyName}) async {
    // get file name
    String fileNameMedia = '';
    if (imagePath.isNotEmpty) {
      File fileMedia = File(imagePath);
      fileNameMedia = basename(fileMedia.path);
      //String extensionMedia = fileNameMedia.split('.').last;
    }

    return await dio.MultipartFile.fromFile(
      imagePath,
      filename: fileNameMedia,
    );
  }

  static Widget errorWidget() {
    return Container(
        color: Colors.transparent,
        child: Image.network(
          'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg',
        ));
  }
}
