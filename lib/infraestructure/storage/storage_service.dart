import 'package:learn_full_flutter/infraestructure/storage/abstract/storage_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future<void> save(String key, StorageModel model) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, model.toJson().toString());
  }

  static Future<String> getKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  static Future<void> clearKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
