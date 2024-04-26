import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

const String _storageKey = "demo_localization_app_";

/// TODO: add an abstract class for each network and local implementation
class Preferences {
  final String defaultLanguage;
  late SharedPreferences _prefs;

  // Private constructor
  Preferences._(this.defaultLanguage);

  // Singleton instance
  static Preferences? _instance;

  // Factory constructor
  factory Preferences({required String defaultLanguage}) {
    // If the singleton instance is not yet created, create it
    _instance ??= Preferences._(defaultLanguage);
    return _instance!;
  }

  // 🚨⚠️ Initialization method to set SharedPreferences
  Future<void> initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Generic routine to fetch a preference
  Future<String> _getApplicationSavedInformation(String name) async {
    return _prefs.getString(_storageKey + name) ?? '';
  }

  // Generic routine to save a preference
  Future<bool> _setApplicationSavedInformation(
      String name, String value) async {
    return _prefs.setString(_storageKey + name, value);
  }

  // Method that saves/restores the preferred language
  Future<String> getPreferredLanguage() async {
    return _getApplicationSavedInformation('language');
  }

  Future<bool> setPreferredLanguage(String lang) async {
    return _setApplicationSavedInformation('language', lang);
  }
}
