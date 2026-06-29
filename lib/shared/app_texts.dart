import 'package:coffee_shop_app/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';

class AppTexts {

  static Text regular({required String text, Color? color, double? fontSize}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 20.0,
        fontWeight: FontWeight.normal,
        color: color ?? AppColors.black
      ),
    );
  }

  static Text medium({required String text, Color? color, TextAlign? align, double? fontSize}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 20.0,
        fontWeight: FontWeight.w600,
        color: color ?? AppColors.black,
        height: 1
      ),
      textAlign: align ?? TextAlign.center,
    );
  }

  static Text bold({required String text, Color? color, double? fontSize}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 20.0,
        fontWeight: FontWeight.bold,
        color: color ?? AppColors.black
      ),
    );
  }
}