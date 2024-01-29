import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_bonds_app/Components/CommonSize/CustomFontSize.dart';
import 'package:national_bonds_app/Components/CustomCommonContainer.dart';
import 'package:national_bonds_app/Components/CustomRegularText.dart';
import 'package:national_bonds_app/Localization/LanguageConstants.dart';
import 'package:national_bonds_app/UI/HomeScreen/HomeController.dart';
import '../../Theme/color/Colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'login',
        init: HomeController(),
        builder: (home) {
          return Container(
            color: primaryColor,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: backgroundColor,
                body: myBody(home),
              ),
            ),
          );
        });
  }

  Widget myBody(HomeController home){
    return CustomCommnonContainer(
      color: primaryColor,
      child: Center(child: Padding(
        padding: EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width/10),
        child: CustomRegularText(
          label: getTranslated(context, 'homeScreen')?.toUpperCase() ?? 'Home Screen',
          fontSize: CustomFontSize.extraLargeFont(),
        )
      )),
    );
  }
}
