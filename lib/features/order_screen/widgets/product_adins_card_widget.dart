import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/app_texts.dart';

class ProductAdinsCardWidget extends StatelessWidget {

  final String title;
  final String subtitle;

  const ProductAdinsCardWidget({super.key, required this.title, required this.subtitle});

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
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              decoration: BoxDecoration(
                border: Border.all(
                    color: AppColors.primaryLight
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: IntrinsicWidth(
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          ///Todo: Decrement quantity
                        },
                        child: Icon(
                          CupertinoIcons.minus,
                          size: 16.0,
                          color: AppColors.roastedCaramel,
                        )
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.primaryLight
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: AppTexts.regular(
                          text: "1", ///Todo: Increase or decrease
                          fontSize: 16.0
                      ),
                    ),

                    InkWell(
                        onTap: () {
                          ///Todo: Increase quantity
                        },
                        child: Icon(
                          CupertinoIcons.plus,
                          size: 16.0,
                          color: AppColors.roastedCaramel,
                        )
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
