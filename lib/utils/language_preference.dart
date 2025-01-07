import 'package:shared_preferences/shared_preferences.dart';

class LanguagePreference {
  static const String _key = 'selected_language';

  Future<void> saveLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, languageCode);
  }

  Future<String?> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }
}
