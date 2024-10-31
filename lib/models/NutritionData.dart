
import 'dart:convert';
class NutritionMessage {
  final int protein;
  final int carb;
  final int fat;
  final int calories;

  NutritionMessage({
    required this.protein,
    required this.carb,
    required this.fat,
    required this.calories,
  });

  factory NutritionMessage.fromJson(Map<String, dynamic> json) {
    return NutritionMessage(
      protein: json['protein'],
      carb: json['carb'],
      fat: json['fat'],
      calories: json['calories'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'protein': protein,
      'carb': carb,
      'fat': fat,
      'calories': calories,
    };
  }
}

class MealData {
  final String meal;
  final String foodID;
  final String imageUrl;
  final String name;
  final int calories;
  final int dish;

  MealData({
    required this.meal,
    required this.foodID,
    required this.imageUrl,
    required this.name,
    required this.calories,
    required this.dish,
  });

  factory MealData.fromJson(Map<String, dynamic> json) {
    return MealData(
      meal: json['meal'],
      foodID: json['foodID'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      calories: json['calories'],
      dish: json['dish'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meal': meal,
      'foodID': foodID,
      'imageUrl': imageUrl,
      'name': name,
      'calories': calories,
      'dish': dish,
    };
  }
}

class NutritionData {
  final NutritionMessage message;
  final List<MealData> data;

  NutritionData({
    required this.message,
    required this.data,
  });

  factory NutritionData.fromJson(Map<String, dynamic> json) {
    return NutritionData(
      message: NutritionMessage.fromJson(json['message']),
      data: List<MealData>.from(
        json['data'].map((item) => MealData.fromJson(item)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message.toJson(),
      'data': data.map((meal) => meal.toJson()).toList(),
    };
  }
}

// Function to parse JSON
NutritionData parseNutritionData(String jsonString) {
  final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
  return NutritionData.fromJson(jsonMap);
}
