class FoodModel {
  final String mealId;
  final String foodId;
  final String imageUrl;
  final String name;
  final List<String> tags;
  final int calories;
  final int dish;

  FoodModel({
    required this.mealId,
    required this.foodId,
    required this.imageUrl,
    required this.name,
    required this.tags,
    required this.calories,
    required this.dish,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      mealId: json['mealID'] as String,
      foodId: json['foodID'] as String,
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      tags: json['tags'] != null 
          ? List<String>.from(json['tags']) 
          : [], // ถ้า tags เป็น null ให้ใช้เป็น list ว่าง
      calories: json['calories'] as int,
      dish: json['dish'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mealID': mealId,
      'foodID': foodId,
      'imageUrl': imageUrl,
      'name': name,
      'tags': tags,
      'calories': calories,
      'dish': dish,
    };
  }
}
