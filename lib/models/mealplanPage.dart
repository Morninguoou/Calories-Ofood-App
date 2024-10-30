class Food {
  final int calories;
  final int carb;
  final int dish;
  final int fat;
  final String name;
  final int protein;
  final String imageURL; // New property for image URL
  final List<String> tags; // New property for food type tags
  final String foodID; // New property for food ID
  final String mealID; // New property for meal ID

  Food({
    required this.calories,
    required this.carb,
    required this.dish,
    required this.fat,
    required this.name,
    required this.protein,
    required this.imageURL, // Include new property in constructor
    required this.tags, // Include new property in constructor
    required this.foodID, // Include new property in constructor
    required this.mealID, // Include new property in constructor
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      calories: json['calories'],
      carb: json['carb'],
      dish: json['dish'],
      fat: json['fat'],
      name: json['name'],
      protein: json['protein'],
      imageURL: json['imageURL'] ?? '', // Handle potential nulls
      tags: List<String>.from(json['tags'] ?? []), // Convert tags to a List<String>
      foodID: json['foodID'] ?? '', // Handle potential nulls for foodID
      mealID: json['mealID'] ?? '', // Handle potential nulls for mealID
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'carb': carb,
      'dish': dish,
      'fat': fat,
      'name': name,
      'protein': protein,
      'imageURL': imageURL, // Include new property in JSON output
      'tags': _filterTags(tags), // Filter tags before including in JSON output
      'foodID': foodID, // Include foodID in JSON output
      'mealID': mealID, // Include mealID in JSON output
    };
  }

  List<String> _filterTags(List<String> tags) {
    const excludedTags = ['breakfast', 'lunch', 'dinner', 'other'];

    final filteredTags = tags.where((tag) {
      bool isExcluded = excludedTags.contains(tag.toLowerCase());
      return !isExcluded;
    }).toList();

    return filteredTags;
  }
}

class Meal {
  final List<Food> foods;
  final String meal;
  final int totalCalories;

  Meal({
    required this.foods,
    required this.meal,
    required this.totalCalories,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    var foodsJson = json['foods'] as List;
    List<Food> foodsList = foodsJson.map((i) => Food.fromJson(i)).toList();

    return Meal(
      foods: foodsList,
      meal: json['meal'],
      totalCalories: json['totalCalories'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'foods': foods.map((food) => food.toJson()).toList(),
      'meal': meal,
      'totalCalories': totalCalories,
    };
  }
}

class MealPlanModel {
  final List<Meal> meals;
  final int totalAllCalories;
  final int totalAllCarbs;
  final int totalAllFat;
  final int totalAllProtein;

  MealPlanModel({
    required this.meals,
    required this.totalAllCalories,
    required this.totalAllCarbs,
    required this.totalAllFat,
    required this.totalAllProtein,
  });

  factory MealPlanModel.fromJson(Map<String, dynamic> json) {
    var mealsJson = json['meals'] as List;
    List<Meal> mealsList = mealsJson.map((i) => Meal.fromJson(i)).toList();

    return MealPlanModel(
      meals: mealsList,
      totalAllCalories: json['totalAllCalories'],
      totalAllCarbs: json['totalAllCarbs'],
      totalAllFat: json['totalAllFat'],
      totalAllProtein: json['totalAllProtein'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meals': meals.map((meal) => meal.toJson()).toList(),
      'totalAllCalories': totalAllCalories,
      'totalAllCarbs': totalAllCarbs,
      'totalAllFat': totalAllFat,
      'totalAllProtein': totalAllProtein,
    };
  }
}