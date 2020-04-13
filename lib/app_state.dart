import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool isDarkMode = false;

  void toggleThemeMode() {
    this.isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
