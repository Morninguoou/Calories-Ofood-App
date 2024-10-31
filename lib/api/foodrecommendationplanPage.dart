import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projectapp/models/planindatelistPage.dart';
import 'package:projectapp/models/recommendplan.dart'; // Import the Planner model

class PlanAppRecommendService {
  static Future<List<PlanAppRecommend>> getFoodRecommendationView() async {
    try {
      final response = await http
          .get(Uri.parse('http://10.0.2.2/FoodRecommendationView'))
          .timeout(Duration(minutes: 2)); // Set a timeout of 2 minutes

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data
            .map((dataJson) => PlanAppRecommend.fromJson(dataJson))
            .toList();
      } else {
        throw Exception(
            'Failed to load planners. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception occurred: $e');
      throw Exception('Failed to load planners');
    }
  }
}

