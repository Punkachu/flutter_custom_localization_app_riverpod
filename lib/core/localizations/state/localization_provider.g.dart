// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localizationRepositoryHash() =>
    r'6ebd0a5e0e4e4175a8878669bec85f0cd08f28f0';

/// See also [localizationRepository].
@ProviderFor(localizationRepository)
final localizationRepositoryProvider =
    AutoDisposeProvider<InternationalizationRepository>.internal(
  localizationRepository,
  name: r'localizationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localizationRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocalizationRepositoryRef
    = AutoDisposeProviderRef<InternationalizationRepository>;
String _$setNewLanguageHash() => r'0860c10776e64176fbeffc51af873825eba9f044';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [setNewLanguage].
@ProviderFor(setNewLanguage)
const setNewLanguageProvider = SetNewLanguageFamily();

/// See also [setNewLanguage].
class SetNewLanguageFamily extends Family<AsyncValue<LocaleApp>> {
  /// See also [setNewLanguage].
  const SetNewLanguageFamily();

  /// See also [setNewLanguage].
  SetNewLanguageProvider call({
    required String newLanguage,
  }) {
    return SetNewLanguageProvider(
      newLanguage: newLanguage,
    );
  }

  @override
  SetNewLanguageProvider getProviderOverride(
    covariant SetNewLanguageProvider provider,
  ) {
    return call(
      newLanguage: provider.newLanguage,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'setNewLanguageProvider';
}

/// See also [setNewLanguage].
class SetNewLanguageProvider extends AutoDisposeFutureProvider<LocaleApp> {
  /// See also [setNewLanguage].
  SetNewLanguageProvider({
    required String newLanguage,
  }) : this._internal(
          (ref) => setNewLanguage(
            ref as SetNewLanguageRef,
            newLanguage: newLanguage,
          ),
          from: setNewLanguageProvider,
          name: r'setNewLanguageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$setNewLanguageHash,
          dependencies: SetNewLanguageFamily._dependencies,
          allTransitiveDependencies:
              SetNewLanguageFamily._allTransitiveDependencies,
          newLanguage: newLanguage,
        );

  SetNewLanguageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.newLanguage,
  }) : super.internal();

  final String newLanguage;

  @override
  Override overrideWith(
    FutureOr<LocaleApp> Function(SetNewLanguageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SetNewLanguageProvider._internal(
        (ref) => create(ref as SetNewLanguageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        newLanguage: newLanguage,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<LocaleApp> createElement() {
    return _SetNewLanguageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SetNewLanguageProvider && other.newLanguage == newLanguage;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, newLanguage.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SetNewLanguageRef on AutoDisposeFutureProviderRef<LocaleApp> {
  /// The parameter `newLanguage` of this provider.
  String get newLanguage;
}

class _SetNewLanguageProviderElement
    extends AutoDisposeFutureProviderElement<LocaleApp> with SetNewLanguageRef {
  _SetNewLanguageProviderElement(super.provider);

  @override
  String get newLanguage => (origin as SetNewLanguageProvider).newLanguage;
}

String _$currentLanguageHash() => r'4fa8314e09b474f5ec2dfb85ebf69ab59caf85d5';

/// See also [currentLanguage].
@ProviderFor(currentLanguage)
final currentLanguageProvider = AutoDisposeFutureProvider<String>.internal(
  currentLanguage,
  name: r'currentLanguageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentLanguageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentLanguageRef = AutoDisposeFutureProviderRef<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
