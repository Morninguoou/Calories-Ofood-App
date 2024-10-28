import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projectapp/models/mealplanPage.dart'; // Import the Planner model

class MealPlanService {
  static Future<MealPlanModel> getPlannersByPlanID(String plannerID) async {
    // Assume you're using a hypothetical API endpoint
    final response = await http.get(Uri.parse('http://10.0.2.2/planners/${plannerID}/meals'));

    if (response.statusCode == 200) {
      // Decode JSON into a Map
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      // Create a PlanDateListModel object from the response
      return MealPlanModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load planners');
    }
  }
}