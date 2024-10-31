class FoodCalculated {
  final int calories;
  final int fats;     // เปลี่ยนเป็น 'fats'
  final int protein;
  final int carbs;

  FoodCalculated({
    required this.calories,
    required this.fats,
    required this.protein,
    required this.carbs,
  });

  factory FoodCalculated.fromJson(Map<String, dynamic> json) {
    return FoodCalculated(
      calories: json['calories'],
      fats: json['fats'],      // ใช้ 'fats' แทน 'fat'
      protein: json['protein'],
      carbs: json['carbs'],
    );
  }


}
