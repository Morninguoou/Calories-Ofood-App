import 'package:flutter/material.dart';

class SessionProvider with ChangeNotifier {
  String _idToken = '';

  String get idToken => _idToken;

  void setIdToken(String token) {
    _idToken = token;
    notifyListeners(); // This will notify any widget that listens to this provider
  }
}
