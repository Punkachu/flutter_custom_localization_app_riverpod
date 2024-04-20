import 'package:flutter/material.dart';

import '../../../utils/global_translations.dart';
import '../../../utils/preferences.dart';
import '../domain/locale_app.dart';

class InternationalizationRepository {
  const InternationalizationRepository(
      {required this.currentLocale, required this.currentLanguage});
  final Locale currentLocale;
  final String currentLanguage;

  Future<LocaleApp> setNewLanguage(String newLanguage) async {
    // Save the selected language as a user preference
    await preferences.setPreferredLanguage(newLanguage);

    // Notification the translations module about the new language
    await allTranslations.setNewLanguage(newLanguage);

    return LocaleApp(language: newLanguage, locale: allTranslations.locale);
  }
}
