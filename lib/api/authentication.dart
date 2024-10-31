// lib/api/authentication/signin.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  // Define the function that accepts email and password
  static Future<Map<String, dynamic>> signIn(String email, String password) async {
    var url = Uri.parse('http://10.0.2.2:80/signin'); 
    
    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        return {
          'status': 'success',
          'email': responseData['email'],
          'idToken': responseData['idToken'],
          'userId': responseData['userId'],
        };
      } else {
        return {'status': 'error', 'message': 'Sign-in failed with status: ${response.statusCode}'};
      }
    } catch (e) {
      return {'status': 'error', 'message': 'Error: $e'};
    }
  }
  static Future<String> SignUp(String email, String password) async {
    var url = Uri.parse('http://10.0.2.2:80/signup');
    try {
      var response = await http.post(
        url,
        headers:{
          'Content-Type':'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        })
      );

      if (response.statusCode == 200){
        return 'Sign-up successful : ${response.body}';
      } else {
        return 'Sign-up failed with status: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
    // Method to get the current user
  static Future<Map<String, dynamic>> getCurrentUser(String idToken) async {
    var url = Uri.parse('http://10.0.2.2:80/getCurrentUser'); // Update to your actual API endpoint

    try {
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $idToken', // Send the ID token to get current user info
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body); // Returning the full response as a Map
      } else {
        return {'error': 'Failed to get current user. Status code: ${response.statusCode}'};
      }
    } catch (e) {
      return {'error': 'Error: $e'};
    }
  }
  static Future<String> changePassword(String idToken, String newPassword) async {
    var url = Uri.parse('http://10.0.2.2:80/changepassword'); // Your backend endpoint for password change

    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'idToken': idToken,
          'password': newPassword,
        }),
      );

      if (response.statusCode == 200) {
        return 'Password changed successfully';
      } else {
        return 'Failed to change password with status: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}