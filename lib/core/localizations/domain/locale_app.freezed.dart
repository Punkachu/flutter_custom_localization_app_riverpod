// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locale_app.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocaleApp {
  String get language => throw _privateConstructorUsedError;
  Locale get locale => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocaleAppCopyWith<LocaleApp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocaleAppCopyWith<$Res> {
  factory $LocaleAppCopyWith(LocaleApp value, $Res Function(LocaleApp) then) =
      _$LocaleAppCopyWithImpl<$Res, LocaleApp>;
  @useResult
  $Res call({String language, Locale locale});
}

/// @nodoc
class _$LocaleAppCopyWithImpl<$Res, $Val extends LocaleApp>
    implements $LocaleAppCopyWith<$Res> {
  _$LocaleAppCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? locale = null,
  }) {
    return _then(_value.copyWith(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocaleAppBasicImplCopyWith<$Res>
    implements $LocaleAppCopyWith<$Res> {
  factory _$$LocaleAppBasicImplCopyWith(_$LocaleAppBasicImpl value,
          $Res Function(_$LocaleAppBasicImpl) then) =
      __$$LocaleAppBasicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String language, Locale locale});
}

/// @nodoc
class __$$LocaleAppBasicImplCopyWithImpl<$Res>
    extends _$LocaleAppCopyWithImpl<$Res, _$LocaleAppBasicImpl>
    implements _$$LocaleAppBasicImplCopyWith<$Res> {
  __$$LocaleAppBasicImplCopyWithImpl(
      _$LocaleAppBasicImpl _value, $Res Function(_$LocaleAppBasicImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? locale = null,
  }) {
    return _then(_$LocaleAppBasicImpl(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$LocaleAppBasicImpl implements _LocaleAppBasic {
  _$LocaleAppBasicImpl({required this.language, required this.locale});

  @override
  final String language;
  @override
  final Locale locale;

  @override
  String toString() {
    return 'LocaleApp(language: $language, locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocaleAppBasicImpl &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocaleAppBasicImplCopyWith<_$LocaleAppBasicImpl> get copyWith =>
      __$$LocaleAppBasicImplCopyWithImpl<_$LocaleAppBasicImpl>(
          this, _$identity);
}

abstract class _LocaleAppBasic implements LocaleApp {
  factory _LocaleAppBasic(
      {required final String language,
      required final Locale locale}) = _$LocaleAppBasicImpl;

  @override
  String get language;
  @override
  Locale get locale;
  @override
  @JsonKey(ignore: true)
  _$$LocaleAppBasicImplCopyWith<_$LocaleAppBasicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
