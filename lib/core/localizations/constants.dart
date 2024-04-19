import 'package:equatable/equatable.dart';

enum GlobalTranslationsGender {
  male,
  female,
  other,
}

enum GlobalTranslationsNumberFormat {
  normal,
  currency,
  compact,
  compactCurrency,
  compactLong,
  compactSimpleCurrency,
  fixedNumberOfDecimals,
}

class GlobalTranslationArgument with EquatableMixin {
  GlobalTranslationArgument(this.key);

  final String key;

  Map<String, dynamic>? values;
  num? plural;
  GlobalTranslationsGender? gender;

  @override
  List<Object?> get props => <Object?>[
        key,
        gender,
        plural,
        values,
      ];
}
