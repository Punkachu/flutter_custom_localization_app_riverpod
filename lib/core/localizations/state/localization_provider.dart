import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/global_translations.dart';
import '../domain/locale_app.dart';
import '../repository/localization_repository.dart';

part 'localization_provider.g.dart';

@riverpod
InternationalizationRepository localizationRepository(
        LocalizationRepositoryRef ref) =>
    InternationalizationRepository(preferences: preferences);

@riverpod
Future<LocaleApp> setNewLanguage(
  SetNewLanguageRef ref, {
  required String newLanguage,
}) {
  return ref.watch(localizationRepositoryProvider).setNewLanguage(newLanguage);
}

@riverpod
Future<String> currentLanguage(CurrentLanguageRef ref) {
  return ref.watch(localizationRepositoryProvider).currentLanguage();
}
