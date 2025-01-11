import 'package:shared_preferences/shared_preferences.dart';

class AvatarHelper {
  static Future<String?> getAvatarImagePath() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('avatar_image_path'); // استرجاع المسار
  }
}
