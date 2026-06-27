import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class AppInputFields {

  static Container textField({required String hint}) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius: 0,
                blurRadius: 4.0,
                offset: Offset(0, 2.0)
            )
          ],
          borderRadius: BorderRadius.circular(12.0)
      ),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: AppColors.lightGrey
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none
            )
        ),
      ),
    );
  }

  static Container passwordField({required String hint, required bool showPassword, required Function onSuffixPressed}) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius: 0,
                blurRadius: 4.0,
                offset: Offset(0, 2.0)
            )
          ],
          borderRadius: BorderRadius.circular(12.0)
      ),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: !showPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
              color: AppColors.lightGrey
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none
          ),
          suffixIcon: IconButton(
            onPressed: () {
              onSuffixPressed();
            },
            icon: Icon(showPassword
                ? CupertinoIcons.eye
                : CupertinoIcons.eye_slash
            )
          )
        ),
      ),
    );
  }
}