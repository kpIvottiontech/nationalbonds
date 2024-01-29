import 'package:flutter/material.dart';
import 'package:national_bonds_app/Components/CommonSize/CommonHeightWidth.dart';

/// *********** General use Sizes  ***************

SizedBox customChildWrappedSizeBox({
  Widget? child,
  double? height,
  double? width,
}) =>
    SizedBox(
      height: height,
      width: width,
      child: child,
    );

SizedBox customExtraSmallSizeBox({
  double? height,
  double? width,
  Widget? child,
}) =>
    SizedBox(
      height: height ?? AppDimensions.instance!.height * .08,
      width: width ?? AppDimensions.instance!.width * .08,
      child: child,
    );

SizedBox customSmallSizeBox({
  double? height,
  double? width,
  Widget? child,
}) =>
    SizedBox(
      height: height ?? AppDimensions.instance!.height * .010,
      width: width ?? AppDimensions.instance!.width * .010,
      child: child,
    );

SizedBox customMediumSizeBox({
  double? height,
  double? width,
  Widget? child,
}) =>
    SizedBox(
      height: height ?? AppDimensions.instance!.height * .028,
      width: width ?? AppDimensions.instance!.width * .020,
      child: child,
    );

SizedBox customLargeSizeBox({
  double? height,
  double? width,
  Widget? child,
}) =>
    SizedBox(
      height: height ?? AppDimensions.instance!.height * .086,
      width: width ?? AppDimensions.instance!.width * .086,
      child: child,
    );

SizedBox customExtraLargeSizeBox({
  double? height,
  double? width,
  Widget? child,
}) =>
    SizedBox(
      height: height ?? AppDimensions.instance!.height * .16,
      width: width ?? AppDimensions.instance!.width * .16,
      child: child,
    );

/// *********** General use Padding  ***************

EdgeInsets customSmallPadding({
  double? top,
  double? right,
  double? bottom,
  double? left,
}) =>
    EdgeInsets.only(
      top: top ?? AppDimensions.instance!.height * .02,
      right: right ?? AppDimensions.instance!.width * .02,
      bottom: bottom ?? AppDimensions.instance!.height * .02,
      left: left ?? AppDimensions.instance!.width * .02,
    );

EdgeInsets customMediumPadding({
  double? top,
  double? right,
  double? bottom,
  double? left,
}) =>
    EdgeInsets.only(
      top: top ?? AppDimensions.instance!.height * .04,
      right: right ?? AppDimensions.instance!.width * .04,
      bottom: bottom ?? AppDimensions.instance!.height * .04,
      left: left ?? AppDimensions.instance!.width * .04,
    );

EdgeInsets customLargePadding({
  double? top,
  double? right,
  double? bottom,
  double? left,
}) =>
    EdgeInsets.only(
      top: top ?? AppDimensions.instance!.height * .012,
      right: right ?? AppDimensions.instance!.width * .012,
      bottom: bottom ?? AppDimensions.instance!.height * .012,
      left: left ?? AppDimensions.instance!.width * .012,
    );
EdgeInsets customRegularPadding({
  double? top,
  double? right,
  double? bottom,
  double? left,
}) =>
    EdgeInsets.only(
      top: top ?? AppDimensions.instance!.height * .020,
      right: right ?? AppDimensions.instance!.width * .030,
      bottom: bottom ?? AppDimensions.instance!.height * .020,
      left: left ?? AppDimensions.instance!.width * .030,
    );

EdgeInsets customExtraLargePadding({
  double? top,
  double? right,
  double? bottom,
  double? left,
}) =>
    EdgeInsets.only(
      top: top ?? AppDimensions.instance!.height * .14,
      right: right ?? AppDimensions.instance!.width * .14,
      bottom: bottom ?? AppDimensions.instance!.height * .14,
      left: left ?? AppDimensions.instance!.width * .14,
    );

EdgeInsets customSymmetricPadding({
  double? horizontal,
  double? vertical,
}) =>
    EdgeInsets.symmetric(
      horizontal: horizontal ?? AppDimensions.instance!.width * .020,
      vertical: vertical ?? AppDimensions.instance!.height * .020,
    );
