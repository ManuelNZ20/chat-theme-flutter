import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData theme;

  bool isDarkMode = false;
  final listColors = <Color>[
    Colors.redAccent,
    Colors.blueAccent,
    Colors.tealAccent,
    Colors.orangeAccent,
    Colors.amberAccent,
  ];

  int indexColor = 0;
  ThemeProvider({required this.theme});

  ThemeData themeDataMaster({bool isDarkMode = false}) => ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: listColors[indexColor]);
  ThemeData themeDataDarkMode() => ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: listColors[indexColor]);
  ThemeData themeDataLightMode() => ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: listColors[indexColor]);

  void toggleThemeData(ThemeData themeData) {
    theme = themeData;
    notifyListeners();
  }

  void toggleColors() {
    indexColor++;
    if (indexColor >= listColors.length) indexColor = 0;
    toggleThemeData(isDarkMode ? themeDataDarkMode() : themeDataLightMode());
    notifyListeners();
  }
}
