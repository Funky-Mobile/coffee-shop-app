import 'package:coffee_shop_app/core/constants/app_assets.dart';
import 'package:coffee_shop_app/core/constants/app_colors.dart';
import 'package:coffee_shop_app/shared/app_texts.dart';
import 'package:flutter/material.dart';

class BonusRewardsCardWidget extends StatelessWidget {
  const BonusRewardsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Card(
            elevation: 4,
            shadowColor: AppColors.black.withValues(alpha: .25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: AppColors.freshMint,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTexts.medium(
                          text: "BONUS REWARDS",
                          fontSize: 10.0,
                          color: AppColors.frothyWhite
                        ),

                        const SizedBox(height: 8.0),

                        AppTexts.bold(
                          text: "Coffee Delivered to your house",
                          color: AppColors.frothyWhite,
                          fontSize: 16.0
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTexts.medium(
                          text: "Order 2 bags of coffee and get bonus stars!",
                          fontSize: 12.0
                        ),

                        const SizedBox(height: 16.0),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: AppTexts.regular(
                                text: "Order any of our coffee and get an additional 30 Stars! Now that’s how you get free coffee!",
                                fontSize: 12.0
                              ),
                            ),

                            const SizedBox(width: 16.0),

                            FilledButton(
                              onPressed: () {
                                ///Todo: Open shop now screen
                              },
                              style: FilledButton.styleFrom(
                                backgroundColor: AppColors.espressoBrown,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(100.0)
                                )
                              ),
                              child: AppTexts.medium(
                                text: "Shop now",
                                fontSize: 12.0,
                                color: AppColors.frothyWhite
                              )
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

        Positioned(
          right: 16.0,
          top: 8.0,
          child: Image.asset(
            AppAssets.coffeeBag,
            height: 120.0,
          ),
        )
      ],
    );
  }
}
