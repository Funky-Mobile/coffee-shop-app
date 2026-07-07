import 'package:coffee_shop_app/core/constants/app_assets.dart';
import 'package:coffee_shop_app/core/constants/app_strings.dart';
import 'package:coffee_shop_app/shared/app_texts.dart';
import 'package:flutter/cupertino.dart';

class SalutationWidget extends StatelessWidget {

  final String title;
  final String subtitle;
  final double? titleFontSize;

  final bool showProfilePicture;

  const SalutationWidget({super.key, required this.showProfilePicture, required this.title, required this.subtitle, this.titleFontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTexts.bold(
              text: title,
              fontSize: titleFontSize ?? 20.0
            ),
            AppTexts.regular(
              text: subtitle
            )
          ],
        ),

        if (showProfilePicture)...[
          Image.asset(
            AppAssets.userProfileAvatar,
            height: 62.0,
          )
        ]
      ],
    );
  }
}
