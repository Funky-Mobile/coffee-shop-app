import 'package:coffee_shop_app/core/constants/app_colors.dart';
import 'package:coffee_shop_app/shared/app_texts.dart';
import 'package:flutter/material.dart';

import '../../landing_screen/models/food_model.dart';

class ProductDetailView extends StatefulWidget {

  final Food food;

  const ProductDetailView({super.key, required this.food});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160.0,
              width: double.infinity,
              color: AppColors.freshMint,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(widget.food.imageUrl),

                  AppTexts.medium(
                    text: widget.food.name,
                    color: AppColors.frothyWhite
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTexts.medium(
                      text: "What's included",
                      fontSize: 16.0,
                      color: AppColors.black
                    ),

                    const SizedBox(height: 40.0),

                    AppTexts.medium(
                      text: "Cup Size",
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
                          text: "Large",
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
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
