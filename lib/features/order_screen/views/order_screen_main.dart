import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/services/shared_preferences_service.dart';
import '../../landing_screen/models/food_model.dart';
import '../../landing_screen/widgets/favorites_card_widget.dart';
import '../../landing_screen/widgets/food_widget.dart';

class OrderScreenMain extends StatefulWidget {
  const OrderScreenMain({super.key});

  @override
  State<OrderScreenMain> createState() => _OrderScreenMainState();
}

class _OrderScreenMainState extends State<OrderScreenMain> {

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40.0),

              if (_isAuthenticated)...[
                FavoritesCardWidget(),

                const SizedBox(height: 40.0),
              ],

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
