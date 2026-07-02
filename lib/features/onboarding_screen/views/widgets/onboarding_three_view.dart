import 'package:coffee_shop_app/core/constants/app_assets.dart';
import 'package:coffee_shop_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../shared/app_texts.dart';

class OnboardingThreeView extends StatelessWidget {
  const OnboardingThreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 56.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    AppAssets.onboardingImageThree,
                    height: 240.0,
                  ),

                  const SizedBox(height: 80.0),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTexts.bold(
                        text: "Who doesn’t love rewards?\nWe LOVE rewards!",
                        color: AppColors.black
                      ),

                      const SizedBox(height: 16.0),

                      AppTexts.medium(
                        text: "If you’re like us you love getting freebies and rewards! That’s why we have the best reward program in the coffee game!",
                        fontSize: 16.0,
                        align: TextAlign.start,
                        color: AppColors.black
                      )
                    ]
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
