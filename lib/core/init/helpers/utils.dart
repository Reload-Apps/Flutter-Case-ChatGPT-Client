import 'package:flutter/services.dart';

import '../../core_shelf.dart';

class Utils {
  static final Utils _instance = Utils();
  static Utils get instance => _instance;

  void setSystemUi(bool isDark) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: isDark ? Brightness.light : Brightness.dark,
        statusBarIconBrightness: isDark ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: Color(isDark ? 0xffffff : 0xff121212),
        statusBarColor: Color(isDark ? 0xff16151A : 0xffF6F8FA),
        systemNavigationBarIconBrightness: isDark ? Brightness.dark : Brightness.light,
      ),
    );
  }

  Future<void> onThemeChanged(bool isDark, ThemeProvider themeNotifier) async {
    Utils.instance.setSystemUi(isDark);
    isDark ? themeNotifier.theme = getDarkTheme() : themeNotifier.theme = getLightTheme();
    await GVariables.spService.setIsDark(isDark);
  }
}
