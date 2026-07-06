import 'package:coffee_shop_app/features/order_screen/widgets/product_adins_card_widget.dart';
import 'package:coffee_shop_app/features/order_screen/widgets/product_detail_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/app_texts.dart';

class ProductDetailsWidgets extends StatelessWidget {

  final PageController pageController;

  const ProductDetailsWidgets({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40.0),

            AppTexts.medium(
              text: "What's included",
              fontSize: 16.0,
              color: AppColors.black
            ),

            const SizedBox(height: 40.0),
            ProductDetailCardWidget(title: "Cup Size", subtitle: "Large"),

            const SizedBox(height: 40.0),
            ProductDetailCardWidget(title: "Add-Ins", subtitle: "Normal Ice"),

            const SizedBox(height: 40.0),
            ProductAdinsCardWidget(title: "Sweetener", subtitle: "Splenda® packet"),

            const SizedBox(height: 40.0),
            ProductAdinsCardWidget(title: "Flavor", subtitle: "Pumpkin spice"),

            const SizedBox(height: 40.0),
            ProductDetailCardWidget(title: "Creamer", subtitle: "Oatmilk"),

            const SizedBox(height: 40.0),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                      onPressed: () {
                        ///Todo: Open shop now screen
                      },
                      style: FilledButton.styleFrom(
                          backgroundColor: AppColors.espressoBrown,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(16.0)
                          )
                      ),
                      child: AppTexts.medium(
                          text: "Add to Cart \$5.34",
                          fontSize: 12.0,
                          color: AppColors.frothyWhite
                      )
                  ),
                ),

                const SizedBox(width: 16.0),

                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      ///Todo: Go to customize screen
                      pageController.jumpToPage(1);
                    },
                    style: FilledButton.styleFrom(
                        backgroundColor: AppColors.freshMint,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(16.0)
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          CupertinoIcons.pen
                        ),

                        AppTexts.medium(
                          text: "Customize",
                          fontSize: 12.0,
                          color: AppColors.frothyWhite
                        )
                      ],
                    )
                  ),
                )
              ],
            ),

            const SizedBox(height: 40.0)
          ],
        ),
      ),
    );
  }
}
