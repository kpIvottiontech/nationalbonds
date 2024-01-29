import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_bonds_app/Components/CommonSize/CustomFontSize.dart';
import 'package:national_bonds_app/Components/CustomCommonContainer.dart';
import 'package:national_bonds_app/Components/CustomRegularText.dart';
import 'package:national_bonds_app/Localization/LanguageConstants.dart';
import 'package:national_bonds_app/Routes/Routes.dart';
import '../../Theme/color/Colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogin = false;

  @override
  void initState() {
    startTime();
    super.initState();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    Timer(duration, getNavigationPage);
  }

  getNavigationPage() async {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: myBody(),
      ),
    );
  }

  Widget myBody(){
    return CustomCommnonContainer(
      color: primaryColor,
      child: Center(child: Padding(
        padding: EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width/10),
        child: CustomRegularText(
          label: getTranslated(context, 'national_bonds')?.toUpperCase() ?? 'National Bonds',
          fontSize: CustomFontSize.extraLargeFont(),
        )
      )),
    );
  }
}
