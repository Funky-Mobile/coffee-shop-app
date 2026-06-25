import 'package:coffee_shop_app/core/constants/app_strings.dart';
import 'package:coffee_shop_app/shared/app_texts.dart';
import 'package:flutter/cupertino.dart';

class SalutationWidget extends StatelessWidget {
  const SalutationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTexts.bold(text: AppStrings.salutation),
        AppTexts.regular(text: AppStrings.loginAndForFreeTea)
      ],
    );
  }
}
