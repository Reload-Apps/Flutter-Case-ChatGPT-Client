import 'package:chatgpt_flutter_case/core/constants/global_variables.dart';
import 'package:flutter/material.dart';

import '../theme/dark_theme.dart';
import '../theme/light_theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = getLightTheme();
  static final ThemeProvider _instance = ThemeProvider();
  static ThemeProvider get instance => _instance;

  ThemeData get theme => _instance._themeData;

  set theme(ThemeData themeData) {
    _instance._themeData = themeData;
    GVariables.spService.setIsDark(theme == getDarkTheme());
    notifyListeners();
  }

  Future<void> fetchLocale() async {
    var isDark = GVariables.spService.getIsDark();
    if (!isDark) {
      _instance._themeData = getLightTheme();
      _themeData = getLightTheme();
    } else {
      _instance._themeData = getDarkTheme();
      _themeData = getDarkTheme();
    }
    notifyListeners();
  }

  changeTheme() {
    if (_instance.theme == getDarkTheme()) {
      _instance.theme = getLightTheme();
    } else {
      _instance.theme = getDarkTheme();
    }
    notifyListeners();
  }

  bool isDark() {
    return _instance.theme == getDarkTheme();
  }
}
