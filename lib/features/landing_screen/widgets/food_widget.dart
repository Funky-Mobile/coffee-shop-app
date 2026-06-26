import 'package:coffee_shop_app/features/landing_screen/models/food_model.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/app_texts.dart';

class FoodWidget extends StatelessWidget {

  final FoodModel foodModel;

  const FoodWidget({super.key, required this.foodModel });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTexts.bold(text: foodModel.category),

            TextButton(
              onPressed: () {
                ///Todo: Open drinks page
              },
              child: AppTexts.medium(
                text: "See all",
                fontSize: 14.0,
                color: AppColors.freshMint
              )
            )
          ],
        ),

        const SizedBox(height: 8.0),

        Wrap(
          runSpacing: 16.0,
          spacing: 16.0,
          children: [
            ...foodModel.foods.map((food) {
              return Container(
                width: 120.0,
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0)
                ),
                child: Column(
                  children: [
                    Image.asset(
                      food.imageUrl,
                      height: 120.0,
                    ),

                    AppTexts.medium(
                      text: food.name,
                      fontSize: 14.0
                    ),
                  ],
                ),
              );
            })
          ],
        )
      ],
    );
  }
}
