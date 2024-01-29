import 'package:flutter/material.dart';
import 'package:national_bonds_app/Components/CommonSize/CustomGeneralSize.dart';
import 'package:national_bonds_app/components/CustomRegularText.dart';
import 'package:national_bonds_app/theme/color/Colors.dart';

class CustomThemeButton extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? fontColor;
  final double? fontSize;
  final double? height;
  final double? width;
  final double? letterSpacing;
  final Widget? child;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? padding;
  final FontWeight? fontWeight;

  const CustomThemeButton({
    Key? key,
    @required this.buttonText,
    this.color = primaryButtonColor,
    this.onPressed,
    this.fontSize = 14.0,
    this.height,
    this.width,
    this.child,
    this.padding,
    this.letterSpacing,
    this.fontWeight,
    this.shape,
    this.fontColor = buttonTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return MaterialButton(
      height: height ?? 40,
      minWidth: width,
      onPressed: onPressed,
      textTheme: theme.buttonTheme.textTheme,
      shape: shape ??
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  CustomGeneralSize.customCommonBorderRadius(borderRadius: 8))),
      padding: padding,
      color: color ?? theme.buttonTheme.colorScheme?.background,
      /* focusColor: color ??
                theme.buttonTheme.colorScheme?.background.withOpacity(0.7),*/
      disabledColor: color,
      child: SizedBox(
        width: width,
        height: height,
        child: child ??
            Center(
              child: CustomRegularText(
                label: buttonText ?? "ADD NAME !!!!",
                color: fontColor,
                fontSize: fontSize,
                fontWeight: fontWeight?? FontWeight.w500,
                letterSpacing: letterSpacing,
              ),
            ),
      ),
    );
  }
}
