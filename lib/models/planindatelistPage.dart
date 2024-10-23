class PlanDateListModel {
  final DateTime firstDate;
  final DateTime lastDate;
  final String planName;
  final List<Planner> planners;

  PlanDateListModel({
    required this.firstDate,
    required this.lastDate,
    required this.planName,
    required this.planners,
  });

  // Factory method to create a Plan object from JSON
  factory PlanDateListModel.fromJson(Map<String, dynamic> json) {
    return PlanDateListModel(
      firstDate: DateTime.parse(json['firstDate']),
      lastDate: DateTime.parse(json['lastDate']),
      planName: json['planName'],
      planners: (json['planners'] as List)
          .map((planner) => Planner.fromJson(planner))
          .toList(),
    );
  }

  // Convert Plan object to JSON
  Map<String, dynamic> toJson() {
    return {
      'firstDate': firstDate.toIso8601String(),
      'lastDate': lastDate.toIso8601String(),
      'planName': planName,
      'planners': planners.map((planner) => planner.toJson()).toList(),
    };
  }
}

class Planner {
  final DateTime plannerDate;
  final int totalCalories;
  final int totalCarb;
  final int totalFat;
  final int totalProtein;

  Planner({
    required this.plannerDate,
    required this.totalCalories,
    required this.totalCarb,
    required this.totalFat,
    required this.totalProtein,
  });

  // Factory method to create a Planner object from JSON
  factory Planner.fromJson(Map<String, dynamic> json) {
    return Planner(
      plannerDate: DateTime.parse(json['plannerDate']),
      totalCalories: json['totalCalories'],
      totalCarb: json['totalCarb'],
      totalFat: json['totalFat'],
      totalProtein: json['totalProtein'],
    );
  }

  // Convert Planner object to JSON
  Map<String, dynamic> toJson() {
    return {
      'plannerDate': plannerDate.toIso8601String(),
      'totalCalories': totalCalories,
      'totalCarb': totalCarb,
      'totalFat': totalFat,
      'totalProtein': totalProtein,
    };
  }
}