import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:internationalization/core/localizations/utils.dart';
import 'package:intl/intl.dart';

import 'constants.dart';

const Locale kDefaultLocale = Locale("en");

const List<String> _kSupportedLanguages = <String>["en", "fr"];
// root Bundle is always starting with "assets" as a racine directory
const String _assetLocaleDirectoryPath = "assets/locale";

class AppLocalization {
  AppLocalization(this.locale, this.localizedValues);

  final Locale locale;
  final Map<dynamic, dynamic> localizedValues;

  final Map<dynamic, dynamic> _cache = <String, String>{};

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization)!;
  }

  String text(
    String key, {
    Map<String, dynamic>? values,
    num? plural,
    GlobalTranslationsGender? gender,
  }) {
    // [gender] and [plural] cannot be set at the same time
    assert(() {
      if (gender != null && plural != null) {
        throw FlutterError(
            'gender and plural cannot be defined at the same time');
      }
      return true;
    }());

    // Return the requested string
    String string = '** $key not found';

    // Check if the requested [key] is in the cache
    if (_cache[key] != null) {
      return _processTemplate(values, _cache[key]!);
    }

    // Iterate the key until found or not
    bool found = true;
    Map<dynamic, dynamic> _values = localizedValues;
    List<String> _keyParts = key.split('.');
    int _keyPartsLen = _keyParts.length;
    int index = 0;
    int lastIndex = _keyPartsLen - 1;

    while (index < _keyPartsLen && found) {
      var value = _values[_keyParts[index]];

      if (value == null) {
        // Not found => STOP
        found = false;
        break;
      }
      // Check if we deal with plural or gender
      if ((plural != null || gender != null) &&
          index == lastIndex &&
          value is Map) {
        if (plural != null) {
          /// Process Plural
          Tuple2<String, bool> pluralResult = _processPlural(plural, value);
          found = pluralResult.value2;
          string = pluralResult.value1;
          if (found) {
            break;
          }
        } else if (gender != null) {
          /// Process Gender
          Tuple2<String, bool> genderResult = _processGender(gender, value);
          found = genderResult.value2;
          string = genderResult.value1;
        }
      }
      // Check if we found the requested key
      if (value is String && index == lastIndex) {
        string = value;
        // Add to cache
        _cache[key] = string;
        break;
      }
      // go to next subKey
      _values = value;
      index++;
    }

    return _processTemplate(values, string);
  }

  ///
  /// NumberToString
  ///
  /// Stringify a value, based on a format (also based on the current Locale)
  ///
  String valueToString(
    num value, {
    GlobalTranslationsNumberFormat format =
        GlobalTranslationsNumberFormat.normal,
    int numberOfDecimals = 2,
  }) {
    NumberFormat numberFormat;

    switch (format) {
      case GlobalTranslationsNumberFormat.currency:
        numberFormat = NumberFormat.currency(locale: locale.languageCode);
        break;

      case GlobalTranslationsNumberFormat.compact:
        numberFormat = NumberFormat.compact(locale: locale.languageCode);
        break;

      case GlobalTranslationsNumberFormat.compactCurrency:
        numberFormat =
            NumberFormat.compactCurrency(locale: locale.languageCode);
        break;

      case GlobalTranslationsNumberFormat.compactLong:
        numberFormat = NumberFormat.compactLong(locale: locale.languageCode);
        break;

      case GlobalTranslationsNumberFormat.compactSimpleCurrency:
        numberFormat =
            NumberFormat.compactSimpleCurrency(locale: locale.languageCode);
        break;

      case GlobalTranslationsNumberFormat.fixedNumberOfDecimals:
        final String decimals =
            "0000000000000000".substring(0, numberOfDecimals);
        numberFormat = NumberFormat("0.$decimals", locale.languageCode);
        break;

      default:
        numberFormat = NumberFormat(null, locale.languageCode);
    }

    return numberFormat.format(value);
  }

  Tuple2<String, bool> _processPlural(num plural, var value) {
    if (plural == 0 && value.containsKey("=0")) {
      return Tuple2(value["=0"], true);
    } else if (plural == 1 && value.containsKey("=1")) {
      return Tuple2(value["=1"], true);
    } else if (plural > 1 && value.containsKey(">1")) {
      return Tuple2(value[">1"], true);
    }
    return const Tuple2("", false);
  }

  Tuple2<String, bool> _processGender(
      GlobalTranslationsGender gender, var value) {
    if (gender == GlobalTranslationsGender.male && value.containsKey("male")) {
      return Tuple2<String, bool>(value["male"], true);
    } else if (gender == GlobalTranslationsGender.female &&
        value.containsKey("female")) {
      return Tuple2<String, bool>(value["female"], true);
    } else if (gender == GlobalTranslationsGender.other &&
        value.containsKey("other")) {
      return Tuple2<String, bool>(value["other"], true);
    }
    return const Tuple2<String, bool>("", false);
  }

  ///
  /// Processes the template replacements if any
  ///
  String _processTemplate(Map<String, dynamic>? values, String template) {
    if (values == null) {
      return template;
    }

    String output = template;

    values.forEach((String key, dynamic value) {
      if (value != null && (value is String || value is num)) {
        output = output.replaceAll('{{$key}}', value.toString());
      }
    });

    return output;
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  AppLocalizationDelegate();

  final CheckFileKeys checker = CheckFileKeys(
    supportedLanguagesCodes: _kSupportedLanguages,
    assetLocaleDirectoryPath: _assetLocaleDirectoryPath,
  );

  @override
  bool isSupported(Locale locale) =>
      _kSupportedLanguages.contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) async {
    /// check whether all files contains the same amount of keys
    /// Raise assertion error if there are any errors in the localise files
    /// ⚠️⚠️🚨 FOr optimization purpose, run this in DEV only
    bool allFilesComplete = await checker.checkLocalizeFileKeys();
    assert(allFilesComplete,
        "All Supported files must contain the same amount of keys");

    /// Load translation file from assets directory
    Map<dynamic, dynamic> localizedValues = await _loadStringsFile(locale);

    return AppLocalization(locale, localizedValues);
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  Iterable<Locale> supportedLocales() =>
      _kSupportedLanguages.map<Locale>((String lang) => Locale(lang, ''));

  Future<Map<dynamic, dynamic>> _loadStringsFile(Locale locale) async {
    // Load the language strings
    String jsonContent = await rootBundle
        .loadString("${_assetLocaleDirectoryPath}_${locale.languageCode}.json");
    Map<dynamic, dynamic> value = json.decode(jsonContent);

    return value;
  }
}
