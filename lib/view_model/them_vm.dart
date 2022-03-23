import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app_them.dart';

class ThemeServiceProvider extends ChangeNotifier {
  ThemeData? _selectedTheme;
  SharedPreferences? prefs;

  ThemeData dark = PostTheme.dark;
  ThemeData light = PostTheme.light;


  ThemeServiceProvider(bool darkThemeOn) {
    _selectedTheme = darkThemeOn ? dark : light;
  }

  Future<void> changeTheme() async {
    prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == dark) {
      _selectedTheme = light;
      await prefs?.setBool("darkTheme", false);
    } else {
      _selectedTheme = dark;
      await prefs?.setBool("darkTheme", true);
    }
    notifyListeners();
  }


  ThemeData? getTheme() => _selectedTheme;
}