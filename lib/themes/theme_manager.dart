import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_mode_handler/theme_mode_manager_interface.dart';

class ThemeManager implements IThemeModeManager {
  @override
  Future<String?> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("THEME_PREF");
  }

  @override
  Future<bool> saveThemeMode(String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString("THEME_PREF", value);
  }
}
