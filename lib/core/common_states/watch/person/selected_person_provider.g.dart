// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_person_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedPersonHash() => r'd5c76ccfb996c922e294cd6522a5f4879c7c736e';

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

/// See also [selectedPerson].
@ProviderFor(selectedPerson)
const selectedPersonProvider = SelectedPersonFamily();

/// See also [selectedPerson].
class SelectedPersonFamily extends Family<AsyncValue<Person?>> {
  /// See also [selectedPerson].
  const SelectedPersonFamily();

  /// See also [selectedPerson].
  SelectedPersonProvider call({
    required int personID,
  }) {
    return SelectedPersonProvider(
      personID: personID,
    );
  }

  @override
  SelectedPersonProvider getProviderOverride(
    covariant SelectedPersonProvider provider,
  ) {
    return call(
      personID: provider.personID,
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
  String? get name => r'selectedPersonProvider';
}

/// See also [selectedPerson].
class SelectedPersonProvider extends AutoDisposeStreamProvider<Person?> {
  /// See also [selectedPerson].
  SelectedPersonProvider({
    required int personID,
  }) : this._internal(
          (ref) => selectedPerson(
            ref as SelectedPersonRef,
            personID: personID,
          ),
          from: selectedPersonProvider,
          name: r'selectedPersonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedPersonHash,
          dependencies: SelectedPersonFamily._dependencies,
          allTransitiveDependencies:
              SelectedPersonFamily._allTransitiveDependencies,
          personID: personID,
        );

  SelectedPersonProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.personID,
  }) : super.internal();

  final int personID;

  @override
  Override overrideWith(
    Stream<Person?> Function(SelectedPersonRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SelectedPersonProvider._internal(
        (ref) => create(ref as SelectedPersonRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        personID: personID,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Person?> createElement() {
    return _SelectedPersonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedPersonProvider && other.personID == personID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, personID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SelectedPersonRef on AutoDisposeStreamProviderRef<Person?> {
  /// The parameter `personID` of this provider.
  int get personID;
}

class _SelectedPersonProviderElement
    extends AutoDisposeStreamProviderElement<Person?> with SelectedPersonRef {
  _SelectedPersonProviderElement(super.provider);

  @override
  int get personID => (origin as SelectedPersonProvider).personID;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
