import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projectapp/models/planindatelistPage.dart'; // Import the Planner model

class PlanDateListService {
  static Future<PlanDateListModel> getPlannersByPlanName(String planName) async {
    // Assume you're using a hypothetical API endpoint
    final response = await http.get(Uri.parse('http://10.0.2.2/planners/planname/$planName'));

    if (response.statusCode == 200) {
      // Decode JSON into a Map
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      // Create a PlanDateListModel object from the response
      return PlanDateListModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load planners');
    }
  }
}