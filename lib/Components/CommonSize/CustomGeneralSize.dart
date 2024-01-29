import 'dart:io';
import 'package:flutter/material.dart';
import 'package:national_bonds_app/Components/CommonSize/CommonHeightWidth.dart';

class CustomGeneralSize {
  static double customIconSize({double? iconSize}) =>
      iconSize ?? AppDimensions.instance!.height * 0.03;

  static double customCommonBorderRadius({double? borderRadius}) =>
      borderRadius ?? 8.0;

  static double customCommonButtonBorderRadius({double? borderRadius}) =>
      borderRadius ?? 16.0;

  static double custom20BorderRadius({double? borderRadius}) =>
      borderRadius ?? 20.0;

  static FontWeight customGeneralFontWeight({FontWeight? fontWeight}) =>
      fontWeight ?? FontWeight.w400;

  static FontWeight customBoldFontWeight({FontWeight? fontWeight}) =>
      fontWeight ?? FontWeight.bold;

  static ScrollPhysics commonPysics({ScrollPhysics? physics}) =>
      Platform.isAndroid
          ? physics ?? const AlwaysScrollableScrollPhysics()
          : physics ?? const AlwaysScrollableScrollPhysics();
}
