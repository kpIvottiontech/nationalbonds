
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color/Colors.dart';
import 'CustomRegularText.dart';

@immutable
class CustomDropdownField extends StatefulWidget {
  final ValueChanged<String?>? onChanged;
  final String hint;
  final List<String> dropdownItems;
  final Widget? icon;
  final Widget? underLineIcon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final String? changedValue;

  final FontWeight? fontWeight;
  final double? fontSize;
  final BorderRadius? borderRadius;
  final Color? fontColor;
  final AlignmentGeometry? alignment;
  final Color? dropdownColor;
  final bool? isEnable;

  const CustomDropdownField({
    required this.hint,
    required this.dropdownItems,
    this.fontWeight,
    this.fontSize,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    Key? key,
    this.borderRadius,
    this.fontColor,
    this.alignment,
    this.dropdownColor,
    this.onChanged,
    this.changedValue,
    this.icon,
    this.underLineIcon,
    this.isEnable = true,
  }) : super(key: key);

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {

  @override
  Widget build(BuildContext context) {
   // print(' widget.changedValue>>${ widget.changedValue} >>${widget.dropdownItems[0]}');
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        borderRadius: widget.borderRadius,
        alignment: widget.alignment ?? AlignmentDirectional.center,
        value: widget.changedValue ?? widget.dropdownItems[0],
        style: Get.theme.textTheme.displayMedium,
        //validator: validator,
        dropdownColor: widget.dropdownColor ?? secondaryColor,
        underline: widget.underLineIcon,
        isExpanded: true,
        hint: CustomRegularText(label: widget.hint,maxlines: 1,),
        items: widget.dropdownItems
            .map((item) => DropdownMenuItem<String>(
                  value: item ?? widget.hint,
                  child: CustomRegularText(
                    label: item ?? widget.hint,
                    fontSize: widget.fontSize,
                    fontWeight: widget.fontWeight,
                    maxlines: 2,
                    color: widget.fontColor,
                  ),
                ))
            .toList(),
        onChanged: widget.onChanged!,
        icon: widget.icon ??
            const Icon(
              Icons.keyboard_arrow_down,
              color: primaryTextColor,
            ),
        iconSize: widget.iconSize ?? 17,
        iconEnabledColor: widget.iconEnabledColor,
        iconDisabledColor: widget.iconDisabledColor,
        itemHeight: widget.itemHeight ?? 53,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
