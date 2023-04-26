import 'package:chatgpt_flutter_case/core/constants/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPService {
  late SharedPreferences prefs;
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setIsDark(bool isDark) async {
    return prefs.setBool(SPKeys.isDark, isDark);
  }

  bool getIsDark() {
    return prefs.getBool(SPKeys.isDark) ?? false;
  }
}
