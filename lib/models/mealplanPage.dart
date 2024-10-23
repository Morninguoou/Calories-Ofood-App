class MealPlanModel {
  final DateTime firstDate;
  final DateTime lastDate;
  final String planName;

  MealPlanModel({
    required this.planName,
    required DateTime firstDate,
    required DateTime lastDate,
  })
  : firstDate = DateTime(firstDate.year, firstDate.month, firstDate.day), // Keep only the date part
    lastDate = DateTime(lastDate.year, lastDate.month, lastDate.day); // Keep only the date part

  factory MealPlanModel.fromJson(Map<String, dynamic> json) {
    return MealPlanModel(
      planName: json['planName'],
      firstDate: DateTime.parse(json['firstDate']),
      lastDate: DateTime.parse(json['lastDate']),
    );
  }
  String get formattedFirstDate => "${firstDate.day.toString().padLeft(2, '0')}-${firstDate.month.toString().padLeft(2, '0')}-${firstDate.year}";
  String get formattedLastDate => "${lastDate.day.toString().padLeft(2, '0')}-${lastDate.month.toString().padLeft(2, '0')}-${lastDate.year}";
}
