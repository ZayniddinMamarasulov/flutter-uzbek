import 'package:flutter/material.dart';


class ThemeServiceProvider with ChangeNotifier {
  ThemeMode _themeMode=ThemeMode.light;


  get themMode=>_themeMode;

  toggleTheme(bool isDark){
    _themeMode=isDark?ThemeMode.dark:ThemeMode.light;
    notifyListeners();
  }
}