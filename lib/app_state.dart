import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool isDarkMode = true;

  void toggleThemeMode() {
    this.isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
