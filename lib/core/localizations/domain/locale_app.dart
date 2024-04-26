import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'locale_app.freezed.dart';

@freezed
class LocaleApp with _$LocaleApp {
  factory LocaleApp({
    required String language,
    required Locale locale,
  }) = _LocaleAppBasic;
}
