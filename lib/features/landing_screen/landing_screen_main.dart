import 'package:coffee_shop_app/core/constants/app_assets.dart';
import 'package:coffee_shop_app/core/constants/app_colors.dart';
import 'package:coffee_shop_app/features/landing_screen/models/food_model.dart';
import 'package:coffee_shop_app/features/landing_screen/widgets/bonus_rewards_card_widget.dart';
import 'package:coffee_shop_app/features/landing_screen/widgets/favorites_card_widget.dart';
import 'package:coffee_shop_app/features/landing_screen/widgets/food_widget.dart';
import 'package:coffee_shop_app/features/landing_screen/widgets/login_card_widget.dart';
import 'package:coffee_shop_app/features/landing_screen/widgets/salutation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../core/services/shared_preferences_service.dart';
import '../../shared/app_texts.dart';

class LandingScreenMain extends StatefulWidget {
  const LandingScreenMain({super.key});

  @override
  State<LandingScreenMain> createState() => _LandingScreenMainState();
}

class _LandingScreenMainState extends State<LandingScreenMain> {

  bool _isAuthenticated = false;

  final List<FoodModel> foodList = [
    FoodModel(
      category: "Food",
      foods: [
        Food(id: 1, name: "Croissant", imageUrl: AppAssets.bakery),
        Food(id: 3, name: "Espresso", imageUrl: AppAssets.espresso),
        Food(id: 8, name: "Sandwich", imageUrl: AppAssets.lunch),
        Food(id: 10, name: "Macarons", imageUrl: AppAssets.sweets),
        Food(id: 12, name: "Brownie", imageUrl: AppAssets.treats),
      ],
    ),
    FoodModel(
      category: "Drink",
      foods: [
        Food(id: 4, name: "Frappucino", imageUrl: AppAssets.frappucino),
        Food(id: 5, name: "Chocolate", imageUrl: AppAssets.hotChocolate),
        Food(id: 9, name: "Coffee", imageUrl: AppAssets.mixedBlackCoffee),
        Food(id: 11, name: "Tea", imageUrl: AppAssets.teaBags),
      ],
    ),
    FoodModel(
      category: "Coffee",
      foods: [
        Food(id: 6, name: "Ice-Coffee", imageUrl: AppAssets.iceCoffee),
        Food(id: 7, name: "Iced-Coffee", imageUrl: AppAssets.icedCoffee),
      ],
    ),
    FoodModel(
      category: "Merchandise",
      foods: [
        Food(id: 2, name: "Mug", imageUrl: AppAssets.customizeMug),
        Food(id: 13, name: "Beans", imageUrl: AppAssets.wholeBeans),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final bool authState = await SharedPreferencesService.hasAuthenticated();

      setState(() {
        _isAuthenticated = authState;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.frothyWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24.0),

              SalutationWidget(
                title: AppStrings.salutation,
                subtitle: AppStrings.loginAndForFreeTea,
                showProfilePicture: _isAuthenticated
              ),

              const SizedBox(height: 24.0),

              if (_isAuthenticated)...[
                BonusRewardsCardWidget(),

                const SizedBox(height: 8.0),

                FavoritesCardWidget()

              ] else ...[
                LoginCardWidget()
              ],

              const SizedBox(height: 40.0),

              Column(
                children: List.generate(foodList.length, (index) {

                  final FoodModel food = foodList[index];

                  return Column(
                    children: [
                      if (food.category == foodList[index].category)...[
                        FoodWidget(
                          foodModel: food
                        )
                      ],

                      const SizedBox(height: 40.0),
                    ],
                  );
                })
              )
            ],
          ),
        ),
      ),
    );
  }
}
