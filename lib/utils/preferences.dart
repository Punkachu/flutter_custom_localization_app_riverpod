import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

const String _storageKey = "demo_localization_app_";

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

Preferences preferences = Preferences();

class Preferences {
  late final String defaultLang;

  /// Generic routine to fetch a preference
  Future<String> _getApplicationSavedInformation(String name) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString(_storageKey + name) ?? '';
  }

  /// Generic routine to saves a preference
  Future<bool> _setApplicationSavedInformation(
      String name, String value) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setString(_storageKey + name, value);
  }

  /// Method that saves/restores the preferred language
  getPreferredLanguage() async {
    return _getApplicationSavedInformation('language');
  }

  setPreferredLanguage(String lang) async {
    return _setApplicationSavedInformation('language', lang);
  }

  String get defaultLanguage => defaultLang;

  /// ⚠️🚨 Must be called on top of App initialization
  set defaultLanguage(String lang) => defaultLang = lang;

  // ------------------ SINGLETON -----------------------
  static final Preferences _preferences = Preferences._internal();
  factory Preferences() {
    return _preferences;
  }
  Preferences._internal();
}
