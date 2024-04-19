import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

///
/// Class to check the existence of exact number of elements
///
class CheckFileKeys {
  /// Patch of the locale files
  final String assetLocaleDirectoryPath;

  /// List of language codes to check , ignore the file that are not listed here
  final List<String> supportedLanguagesCodes;

  final String localFilePrefix;

  CheckFileKeys({
    required this.assetLocaleDirectoryPath,
    required this.supportedLanguagesCodes,
    this.localFilePrefix = 'locale_',
  });

  ///
  /// Check Number of total keys (nested included)
  /// of all the provided supported locale file
  /// contained in [supportedLanguagesCodes]
  /// return True if all the provided files contains the same amount of keys
  /// False otherwise.
  ///
  Future<bool> checkLocalizeFileKeys() async {
    List<int> numberKeyList = [];

    for (String code in supportedLanguagesCodes) {
      /// Load translation file from assets directory
      Map<dynamic, dynamic> localizedValues = await loadStringsFile(code);
      numberKeyList.add(collectKeys(localizedValues).length);
    }

    return allElementsSame(numberKeyList);
  }

  List<String> collectKeys(Map<dynamic, dynamic> map) {
    List<String> keys = [];

    map.forEach((key, value) {
      keys.add(key);
      if (value is Map<dynamic, dynamic>) {
        keys.addAll(collectKeys(value));
      }
    });

    return keys;
  }

  ///
  /// Check whether a list of element are the same
  ///
  bool allElementsSame<T>(List<T> list) {
    if (list.isEmpty) {
      return true; // If the list is empty, all elements are technically the same
    }

    T firstElmt = list[0];

    for (int i = 1; i < list.length; i++) {
      if (list[i] != firstElmt) {
        return false; // If any element is different, return false
      }
    }

    return true; // All elements are the same
  }

  Future<Map<dynamic, dynamic>> loadStringsFile(String localeLangCode) async {
    // Load the language strings
    String jsonContent = await rootBundle.loadString(
        "$assetLocaleDirectoryPath/$localFilePrefix$localeLangCode.json");
    Map<dynamic, dynamic> value = json.decode(jsonContent);

    return value;
  }
}
