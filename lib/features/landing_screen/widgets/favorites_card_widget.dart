import 'package:coffee_shop_app/features/order_screen/views/product_detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/app_texts.dart';
import '../models/food_model.dart';

class FavoritesCardWidget extends StatefulWidget {

  const FavoritesCardWidget({super.key});

  @override
  State<FavoritesCardWidget> createState() => _FavoritesCardWidgetState();
}

class _FavoritesCardWidgetState extends State<FavoritesCardWidget> {

  final FoodModel foodModel = FoodModel(
    category: "Favorites",
    foods: [
      Food(id: 1, name: "Croissant", imageUrl: AppAssets.bakery),
      Food(id: 3, name: "Espresso", imageUrl: AppAssets.espresso),
      Food(id: 8, name: "Sandwich", imageUrl: AppAssets.lunch),
      Food(id: 10, name: "Macarons", imageUrl: AppAssets.sweets),
      Food(id: 12, name: "Brownie", imageUrl: AppAssets.treats),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTexts.bold(text: "Your favorites"),

        const SizedBox(height: 24.0),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(foodModel.foods.length, (index) {

              final Food food = foodModel.foods[index];

              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (builder) {
                      return ProductDetailView(
                        food: food,
                      );
                    }));
                  },
                  child: Container(
                    width: 120.0,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              CupertinoIcons.heart_solid,
                              color: AppColors.primaryRed
                            )
                          ],
                        ),

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
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
