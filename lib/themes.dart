import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
      iconTheme: IconThemeData(color: Colors.white),
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Color.fromRGBO(29, 28, 30, 1),
      colorScheme: ColorScheme.dark().copyWith(secondary: Colors.white));
  static final lightTheme = ThemeData(
    iconTheme: IconThemeData(color: Colors.black),
    scaffoldBackgroundColor: Color.fromRGBO(243, 242, 247, 1),
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light().copyWith(secondary: Colors.black),
  );
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool get isSystem => themeMode == ThemeMode.system;
  bool get isDark => themeMode == ThemeMode.dark;

  void toggleSystemTheme(bool isSystem, bool isOn) {
    var chosenThemeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    themeMode = isSystem ? ThemeMode.system : chosenThemeMode;
    notifyListeners();
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
