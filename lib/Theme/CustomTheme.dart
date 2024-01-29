import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:national_bonds_app/Components/CommonSize/CommonHeightWidth.dart';
import 'package:national_bonds_app/Components/CommonSize/CustomFontSize.dart';
import 'package:national_bonds_app/Components/CommonSize/CustomGeneralSize.dart';
import 'package:national_bonds_app/Components/CommonSize/CustomSpacing.dart';
import 'color/Colors.dart';
import 'CustomFontStyle.dart';

class CustomTheme {
  static ThemeData get lightTheme => ThemeData(
      shadowColor: shadowColor,
      primaryColor: primaryColor,
      primaryColorLight: primaryColor,
      primaryColorDark: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: appBarTheme,
      textTheme: CustomFontStyle.primaryTextTheme,
      //primaryTextTheme: NkGetXFontStyle.newFontStyle,
      dataTableTheme: dataTableTheme,
      dividerColor: dividerColor,
      listTileTheme:
      ListTileThemeData(contentPadding: customSymmetricPadding(vertical: 0)),
      expansionTileTheme: ExpansionTileThemeData(
          iconColor: primaryColor,
          collapsedBackgroundColor: backgroundColor,
          backgroundColor: Colors.transparent,
          textColor: primaryTextColor,
          collapsedTextColor: primaryTextColor,
          tilePadding: customSymmetricPadding(vertical: 0),
          childrenPadding: EdgeInsets.zero),
      colorScheme: ColorScheme.light(
          primary: primaryColor,
          error: errorColor,
          onError: errorColor,
          background: backgroundColor,
          onBackground: backgroundColor,
          primaryContainer: primaryContainerColor,
          onSecondary: secondaryColor,
          secondaryContainer: secondaryColor,
          surface: backgroundColor,
          secondary: secondaryColor,
          brightness: Get.theme.brightness),
      iconTheme: IconThemeData(
          color: primaryTextColor, size: CustomGeneralSize.customIconSize()),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: secondaryTextColor,
        selectionColor: cursorColor,
        selectionHandleColor: primaryButtonColor,
      ),
      useMaterial3: true,
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
              iconColor: MaterialStatePropertyAll(secondaryIconColor))),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedLabelStyle: CustomFontStyle.primaryTextTheme.labelMedium
              ?.copyWith(
              fontWeight: CustomGeneralSize.customGeneralFontWeight(),
              fontSize: 16.0,
              color: whiteColor),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: CustomFontStyle.primaryTextTheme.labelMedium
              ?.copyWith(
              fontWeight: CustomGeneralSize.customGeneralFontWeight(),
              fontSize: 16.0,
              color: primaryTextColor)),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: backgroundColor,
        surfaceTintColor: backgroundColor,
        modalBackgroundColor: backgroundColor,
      ),
      primaryIconTheme: IconThemeData(
          color: primaryTextColor, size: CustomGeneralSize.customIconSize()),
      brightness: Brightness.light,
      buttonTheme: ButtonThemeData(
          buttonColor: primaryTextColor,
          textTheme: ButtonTextTheme.normal,
          padding: customRegularPadding(),
          height: Get.height * 0.06,
          disabledColor: primaryButtonColor,
          focusColor: primaryButtonColor,
          layoutBehavior: ButtonBarLayoutBehavior.padded,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(CustomGeneralSize.customCommonBorderRadius()),
          )),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: primaryLight,
      surfaceTintColor: Colors.transparent,
      headerForegroundColor: primaryTextColor.withOpacity(0.8),
      elevation: 5,
      dayBackgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return yellowColor;
        }
        return primaryLight.withOpacity(0.4);
      }),
    ),
    dialogBackgroundColor: backgroundColor,
    dialogTheme: DialogTheme(
      surfaceTintColor: backgroundColor,
      backgroundColor: backgroundColor,
    )
  );

  static AppBarTheme get appBarTheme => AppBarTheme(
      color: backgroundColor,
      foregroundColor: backgroundColor,
      surfaceTintColor: backgroundColor,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      shadowColor: shadowColor,
      centerTitle: true,
      titleTextStyle: TextStyle());

  static DataTableThemeData get dataTableTheme => DataTableThemeData(
    columnSpacing: AppDimensions.instance!.width * .02,
    //dataRowMaxHeight: height * 0.1,
    headingTextStyle: Get.textTheme.displayLarge!.copyWith(
      inherit: false,
      fontWeight: CustomGeneralSize.customBoldFontWeight(),
      fontSize: CustomFontSize.largeFont(),
      color: primaryTextColor,
    ),
  );

  static void get systemChromeStyle {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: backgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}
