import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:national_bonds_app/Components/CommonSize/CommonHeightWidth.dart';

class CustomFontSize {
  const CustomFontSize._();

  static double extraSmallFont({double? extraSmallFont}) =>
      extraSmallFont ?? _textScaleFactor() * 4;

  static double smallFont({double? smallFont}) =>
      smallFont ?? _textScaleFactor() * 8;

  static double mediumFont({double? mediumFont}) =>
      mediumFont ?? _textScaleFactor() * 10;

  static double regularFont({double? regularFont}) =>
      regularFont ?? _textScaleFactor() * 14;

  static double largeFont({double? largeFont}) =>
      largeFont ?? _textScaleFactor() * 20;

  static double extraLargeFont({double? extraLargeFont}) =>
      extraLargeFont ?? _textScaleFactor() * 30;

  static double _textScaleFactor({double maxTextScaleFactor = 2}) {
    final width = AppDimensions.instance?.width ??
        WidgetsBinding.instance.window.physicalSize.height;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
