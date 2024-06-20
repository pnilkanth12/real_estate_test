import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_demo/core/app_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  // Font Family text style

  static TextStyle appBarTextStyle(
    BuildContext context, {
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    double? letterSpacing,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? AppFonts.primaryFont,
      letterSpacing: letterSpacing ?? 1,
      fontSize: fontSize ?? 16.sp,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? Colors.black,
      decoration: decoration ?? TextDecoration.none,
    );
  }

  static TextStyle appTextStyle(
    BuildContext context, {
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    double? letterSpacing,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? AppFonts.primaryFont,
      letterSpacing: letterSpacing ?? 1,
      fontSize: fontSize ?? 14.sp,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? Colors.black,
      decoration: decoration ?? TextDecoration.none,
    );
  }

  static TextStyle font12w400(
    BuildContext context, {
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    double? letterSpacing,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? AppFonts.primaryFont,
      letterSpacing: letterSpacing ?? 1,
      fontSize: fontSize ?? 12.sp,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? Colors.black,
      decoration: decoration ?? TextDecoration.none,
    );
  }

  static TextStyle font12w600(
    BuildContext context, {
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    double? letterSpacing,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? AppFonts.primaryFont,
      letterSpacing: letterSpacing ?? 1,
      fontSize: fontSize ?? 12.sp,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? Colors.black,
      decoration: decoration ?? TextDecoration.none,
    );
  }

  static TextStyle font16w500(
    BuildContext context, {
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    double? letterSpacing,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? AppFonts.primaryFont,
      letterSpacing: letterSpacing ?? 1,
      fontSize: fontSize ?? 16.sp,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? Colors.black,
      decoration: decoration ?? TextDecoration.none,
    );
  }

  static TextStyle font20w700(
    BuildContext context, {
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? AppFonts.primaryFont,
      letterSpacing: letterSpacing ?? 1,
      fontSize: fontSize ?? 20.sp,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? Colors.black,
      decoration: decoration ?? TextDecoration.none,
    );
  }

  static TextStyle font14w600(
    BuildContext context, {
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? AppFonts.primaryFont,
      letterSpacing: letterSpacing ?? 1,
      fontSize: fontSize ?? 14.sp,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? Colors.black,
      decoration: decoration ?? TextDecoration.none,
    );
  }

  static TextStyle buttonStyle(
    BuildContext context, {
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    double? letterSpacing,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? AppFonts.primaryFont,
      letterSpacing: letterSpacing ?? 1,
      fontSize: fontSize ?? 16.sp,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? Colors.black,
      decoration: decoration ?? TextDecoration.none,
    );
  }

  static TextStyle font16w900(
    BuildContext context, {
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    double? letterSpacing,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? AppFonts.primaryFont,
      letterSpacing: letterSpacing ?? 1,
      fontSize: fontSize ?? 16.sp,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w900,
      color: color ?? Colors.black,
      decoration: decoration ?? TextDecoration.none,
    );
  }
}
