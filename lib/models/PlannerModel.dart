class PlannerNameModel {
  final String plannerID;
  final String planname;

  PlannerNameModel({required this.plannerID, required this.planname});

  factory PlannerNameModel.fromJson(Map<String, dynamic> json) {
    return PlannerNameModel(
      plannerID: json['plannerID'] as String,
      planname: json['planname'] as String,
    );
  }
}