import 'package:coffee_shop_app/features/order_screen/widgets/product_adins_card_widget.dart';
import 'package:coffee_shop_app/features/order_screen/widgets/product_detail_card_widget.dart';
import 'package:coffee_shop_app/shared/app_texts.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class CustomizeProductDetailsWidget extends StatefulWidget {

  final PageController pageController;

  const CustomizeProductDetailsWidget({super.key, required this.pageController});

  @override
  State<CustomizeProductDetailsWidget> createState() => _CustomizeProductDetailsWidgetState();
}

class _CustomizeProductDetailsWidgetState extends State<CustomizeProductDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                widget.pageController.jumpToPage(0);
              },
              icon: IntrinsicWidth(
                child: Row(
                  children: [
                    Icon(Icons.keyboard_arrow_left_outlined),
                    AppTexts.medium(
                      text: "Done customizing",
                      fontSize: 16.0
                    )
                  ],
                ),
              )
            ),

            _buildCardsMainWidget(
              label: "Cup Options",
              children: [
                ProductDetailCardWidget(title: "Cup Size", subtitle: "Large")
              ]
            ),
            const SizedBox(height: 8.0),

            _buildCardsMainWidget(
              label: "Flavors",
              children: [
                ProductAdinsCardWidget(title: "Flavor", subtitle: "Pumpkin spice Pumps(s)"),
                const SizedBox(height: 40.0),

                ProductDetailCardWidget(title: "Flavor", subtitle: "Add Syrup")
              ]
            ),
            const SizedBox(height: 8.0),

            _buildCardsMainWidget(
              label: "Sweeteners",
              children: [
                ProductAdinsCardWidget(title: "Sweetener", subtitle: "Splenda® packet"),
                const SizedBox(height: 40.0),

                ProductDetailCardWidget(title: "Sweetener", subtitle: "Add Sweetener Packets")
              ]
            ),
            const SizedBox(height: 8.0),

            _buildCardsMainWidget(
              label: "Add-ins",
              children: [
                ProductDetailCardWidget(title: "Ice", subtitle: "Normal Ice"),
                const SizedBox(height: 40.0),

                ProductDetailCardWidget(title: "Creamer", subtitle: "Oatmilk")
              ]
            ),
            const SizedBox(height: 8.0),

            _buildCardsMainWidget(
                label: "Espresso & Shot Options",
                children: [
                  ProductDetailCardWidget(title: "Espresso", subtitle: "Add Espresso Options"),
                  const SizedBox(height: 40.0),

                  ProductDetailCardWidget(title: "Shot", subtitle: "Add Shot")
                ]
            ),

            const SizedBox(height: 24.0),

            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      widget.pageController.jumpToPage(0);
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.freshMint,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(24.0)
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 24.0)
                    ),
                    child: AppTexts.medium(
                      text: "Done Customize",
                      fontSize: 12.0,
                      color: AppColors.frothyWhite
                    )
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }

  Widget _buildCardsMainWidget({required String label, required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTexts.medium(
            text: label,
            fontSize: 16.0,
            color: AppColors.black
          ),

          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 8.0, right: 8.0, bottom: 8.0),
            child: Column(
              children: [
                ...children
              ],
            ),
          )
        ],
      ),
    );
  }
}
