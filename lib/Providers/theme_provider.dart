import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isdarkMode = false;
  bool get isdarkMode => _isdarkMode;

  void toggleTheme() {
    _isdarkMode = !_isdarkMode;
    notifyListeners();
  }
}
