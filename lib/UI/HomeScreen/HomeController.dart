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

class HomeController extends GetxController {
  // late final StreamController<SessionState> sessionStateStream;
  ApiServices apiWorker = ApiServices();

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


}
