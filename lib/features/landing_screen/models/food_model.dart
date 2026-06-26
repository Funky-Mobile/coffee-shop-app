class FoodModel {
  final String category;
  final List<Food> foods;

  const FoodModel({
    required this.category,
    required this.foods
  });
}

class Food {
  final int id;
  final String name;
  final String imageUrl;

  const Food({
    required this.id,
    required this.name,
    required this.imageUrl
  });
}