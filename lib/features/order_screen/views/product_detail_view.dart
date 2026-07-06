import 'package:coffee_shop_app/core/constants/app_colors.dart';
import 'package:coffee_shop_app/features/order_screen/widgets/customize_product_details_widget.dart';
import 'package:coffee_shop_app/features/order_screen/widgets/product_details_widgets.dart';
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

  final PageController _pageController = PageController();

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

            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ProductDetailsWidgets(pageController: _pageController),
                  CustomizeProductDetailsWidget(pageController: _pageController)
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
