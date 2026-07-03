import 'package:coffee_shop_app/core/constants/app_assets.dart';
import 'package:coffee_shop_app/core/constants/app_strings.dart';
import 'package:coffee_shop_app/shared/app_texts.dart';
import 'package:flutter/cupertino.dart';

class SalutationWidget extends StatelessWidget {

  final bool showProfilePicture;

  const SalutationWidget({super.key, required this.showProfilePicture});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTexts.bold(text: AppStrings.salutation),
            AppTexts.regular(text: AppStrings.loginAndForFreeTea)
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
