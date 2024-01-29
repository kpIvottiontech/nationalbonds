import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:national_bonds_app/theme/color/Colors.dart';

/// [GetXFontStyle] USE CUSTOM FONT

class CustomFontStyle {
  static const primaryCustomFontStyle = "source-sans-pro";
  static const secondaryCustomFontStyle = "play_fair_display_regular";

  static TextTheme get primaryTextTheme => ThemeData().textTheme.apply(
        fontFamily: GoogleFonts.poppins(color: primaryTextColor).fontFamily,
      );
}
