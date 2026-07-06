import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/app_texts.dart';

class ProductDetailCardWidget extends StatelessWidget {

  final String title;
  final String subtitle;

  const ProductDetailCardWidget({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTexts.medium(
            text: title,
            fontSize: 16.0,
            color: AppColors.black
        ),

        const SizedBox(height: 8.0),

        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                    color: AppColors.black.withValues(alpha: .15),
                    blurRadius: 4.0
                )
              ]
          ),
          child: ListTile(
            leading: AppTexts.regular(
                text: subtitle,
                fontSize: 16.0
            ),
            trailing: Container(
              decoration: BoxDecoration(
                  color: AppColors.espressoBrown,
                  shape: BoxShape.circle
              ),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.frothyWhite,
                size: 16.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}
