import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_bonds_app/DioApiHandler/ApiServices.dart';
import 'package:national_bonds_app/Localization/LanguageConstants.dart';
import 'package:national_bonds_app/Routes/Routes.dart';
import 'package:national_bonds_app/SessionTimeOut/SessionController.dart';
import 'package:national_bonds_app/Utils/DialogUtils.dart';
import 'package:national_bonds_app/theme/color/colors.dart';
import 'package:national_bonds_app/utils/session/sessionmanager.dart';

class LoginController extends GetxController {
  SessionController sessionController =Get.put(SessionController());
  ApiServices apiWorker = ApiServices();
  final formKey = GlobalKey<FormState>();
  final userNameTC = TextEditingController();
  final passwordTC = TextEditingController();
  bool isVisible1 = false;
  String languageSelected = 'English';
  String? loggedOutReason = '';

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  updateScreen(String value) {
    update([value]);
  }

  setLanguage() {
    getLocale().then((value) async {
      print('>>>check value    $value');
      languageSelected = value.languageCode == 'en' ? 'Arabic' : 'English';
      updateScreen('login');
    });
  }

  void changeLanguage({BuildContext? context}) async {
    getLocale().then((value) async {
      print('>>>check value    $value');
      Locale locale = await setLocale(value.languageCode == 'en' ? 'ar' : 'en');
      print('>>>print language>>first>>   ${value.languageCode}');
      Get.updateLocale(locale);
      setLanguage();
    });
  }

  login({BuildContext? context}) async {
    DialogUtils.showLoader(context!);
    await apiWorker
        .getToken(username: userNameTC.text, password: passwordTC.text)
        .then((value) async {
      if (value.accessToken != null) {
        await SessionManager.setTokenResponse(value);
        await apiWorker
            .login(username: 'fSubB%2b%2fCOd%2b59nC5pUCWlw%3d%3d', password: 'QRx1f1mtGuPTmoa17QVxVg%3d%3d',token: value.accessToken,lang: languageSelected == 'English'?'0':'1')
            .then((value) async {
          await SessionManager.setAuthResponse(value);
          await SessionManager.getAuthResponse().then((value) {
            print('>>>print login response as saved>>>>    ${value!.toJson()}');
          });
          DialogUtils.hideLoader();
          Get.snackbar(getTranslated(context, 'successful') ?? 'Successful',
              getTranslated(context, 'loginSuccessful') ?? 'Login Successful!!',
              snackPosition: SnackPosition.BOTTOM, colorText: lightBlueColor);
          sessionController.resetSessionTimer();
          Get.offAndToNamed(AppRoutes.home);
        });
      } else {
        DialogUtils.hideLoader();
        Get.snackbar(
            getTranslated(context, 'unsuccessful') ?? 'Unsuccessful',
            getTranslated(context, 'loginUnsuccessful') ??
                'Login UnSuccessful!!',
            snackPosition: SnackPosition.BOTTOM,
            colorText: lightBlueColor);
      }
    });
  }

}
