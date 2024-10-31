import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projectapp/models/plannermainPage.dart'; // Import the Planner model

class PlannerService {
  static Future<List<PlannermainPageModel>> getPlannersByUserID(String userID) async {
    // Assume you're using a hypothetical API endpoint
    final response = await http.get(Uri.parse('http://10.0.2.2/planners/$userID'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((plannerJson) => PlannermainPageModel.fromJson(plannerJson)).toList();
    } else {
      throw Exception('Failed to load planners');
    }
  }
}