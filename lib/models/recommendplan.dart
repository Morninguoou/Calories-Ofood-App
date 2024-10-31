import 'dart:convert';

class PlanAppRecommend {
  String plannerID;
  DateTime plannerDate;
  String userID;
  String planName;
  DateTime createdAt;
  int calories;
  List<String> breakfast;
  List<String> lunch;
  List<String> dinner;
  List<String> others;

  PlanAppRecommend({
    required this.plannerID,
    required this.plannerDate,
    required this.userID,
    required this.planName,
    required this.createdAt,
    required this.calories,
    required this.breakfast,
    required this.lunch,
    required this.dinner,
    required this.others,
  });

  factory PlanAppRecommend.fromJson(Map<String, dynamic> json) {
    return PlanAppRecommend(
      plannerID: json['plannerID'],
      plannerDate: DateTime.parse(json['plannerDate']),
      userID: json['userID'] ?? '', // Handle null case if needed
      planName: json['planname'] ?? '', // Handle null case if needed
      createdAt: DateTime.parse(json['createdAt']),
      calories: json['calories'],
      breakfast: List<String>.from(json['breakfast'] ?? []),
      lunch: List<String>.from(json['lunch'] ?? []),
      dinner: List<String>.from(json['dinner'] ?? []),
      others: List<String>.from(json['others'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'plannerID': plannerID,
      'plannerDate': plannerDate.toIso8601String(),
      'userID': userID,
      'planname': planName,
      'createdAt': createdAt.toIso8601String(),
      'calories': calories,
      'breakfast': breakfast,
      'lunch': lunch,
      'dinner': dinner,
      'others': others,
    };
  }
}
