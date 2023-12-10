import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  final SharedPreferences shardPref;
  LanguageCacheHelper({required this.shardPref});

  Future<void> cacheLanguageCode(String languageCode) async {
    await shardPref.setString("LOCALE", languageCode);
  }

  String getCachedLanguageCode() {
    final cachedLanguageCode = shardPref.getString("LOCALE");
    return cachedLanguageCode ?? "ar";
  }
}
