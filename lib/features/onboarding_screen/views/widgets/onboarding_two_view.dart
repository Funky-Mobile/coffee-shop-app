import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../shared/app_texts.dart';

class OnboardingTwoView extends StatelessWidget {
  const OnboardingTwoView({super.key});

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
                    AppAssets.onboardingImageTwo,
                    height: 240.0,
                  ),

                  const SizedBox(height: 80.0),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTexts.bold(
                        text: "No time to waste when you\nneed your coffee",
                        color: Colors.black
                      ),

                      const SizedBox(height: 16.0),

                      AppTexts.medium(
                          text: "We’ve crafted a quick and easy way for you to order your favorite coffee or treats that's fast!",
                          fontSize: 16.0,
                          align: TextAlign.start,
                          color: Colors.black
                      )
                    ],
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
