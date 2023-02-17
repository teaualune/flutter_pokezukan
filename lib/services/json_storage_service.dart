import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class JSONStorageService {

  static Future read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return null;
  }

  static Future<void> write(String key, dynamic json) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(json));
  }
}

