// lib/api/authentication/signin.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  // Define the function that accepts email and password
  static Future<String> signIn(String email, String password) async {
    var url = Uri.parse('http://10.0.2.2:80/signin'); // Change to match your server's URL
    
    try {
      // Send JSON data with Content-Type set to application/json
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email, // Use the provided email
          'password': password, // Use the provided password
        }),
      );

      // Check the response status and return appropriate messages
      if (response.statusCode == 200) {
        return 'Sign-in successful: ${response.body}';
      } else {
        return 'Sign-in failed with status: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
