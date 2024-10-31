import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  // Get Current User Information
  static Future<Map<String, dynamic>?> getUserInfo(String userID) async {
    var url = Uri.parse('http://10.0.2.2:80/users/$userID');

    try {
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> userInfo = jsonDecode(response.body);
        return userInfo;
      } else {
        print('Failed to get user info with status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  // Edit User Information
  static Future<String> editUserInfo(String userID,  Map<String, dynamic> updatedUserInfo) async {
    var url = Uri.parse('http://10.0.2.2:80/users/$userID'); // Adjust the URL for your API

    try {
      var response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(updatedUserInfo),
      );
      if (response.statusCode == 200) {
        return 'User updated successfully';
      } else {
        return 'Failed to update user info with status: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
