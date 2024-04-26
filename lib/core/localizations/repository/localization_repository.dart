import '../../../utils/global_translations.dart';
import '../../preferences/preferences.dart';
import '../domain/locale_app.dart';

class InternationalizationRepository {
  const InternationalizationRepository({required this.preferences});
  final Preferences preferences;

  Future<LocaleApp> setNewLanguage(String newLanguage) async {
    // Save the selected language as a user preference
    await preferences.setPreferredLanguage(newLanguage);

    // Notification the translations module about the new language
    await allTranslations.setNewLanguage(newLanguage);

    return LocaleApp(language: newLanguage, locale: allTranslations.locale);
  }

  Future<String> currentLanguage() async =>
      await allTranslations.currentLanguage;
}
