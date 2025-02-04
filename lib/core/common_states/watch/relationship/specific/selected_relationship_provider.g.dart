// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_relationship_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedRelationshipHash() =>
    r'4adcadceb5e30b74388cf06481111758d5de0af9';

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

/// See also [selectedRelationship].
@ProviderFor(selectedRelationship)
const selectedRelationshipProvider = SelectedRelationshipFamily();

/// See also [selectedRelationship].
class SelectedRelationshipFamily extends Family<AsyncValue<Relationship?>> {
  /// See also [selectedRelationship].
  const SelectedRelationshipFamily();

  /// See also [selectedRelationship].
  SelectedRelationshipProvider call({
    required PersonIdPair personIdPair,
  }) {
    return SelectedRelationshipProvider(
      personIdPair: personIdPair,
    );
  }

  @override
  SelectedRelationshipProvider getProviderOverride(
    covariant SelectedRelationshipProvider provider,
  ) {
    return call(
      personIdPair: provider.personIdPair,
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
  String? get name => r'selectedRelationshipProvider';
}

/// See also [selectedRelationship].
class SelectedRelationshipProvider
    extends AutoDisposeStreamProvider<Relationship?> {
  /// See also [selectedRelationship].
  SelectedRelationshipProvider({
    required PersonIdPair personIdPair,
  }) : this._internal(
          (ref) => selectedRelationship(
            ref as SelectedRelationshipRef,
            personIdPair: personIdPair,
          ),
          from: selectedRelationshipProvider,
          name: r'selectedRelationshipProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedRelationshipHash,
          dependencies: SelectedRelationshipFamily._dependencies,
          allTransitiveDependencies:
              SelectedRelationshipFamily._allTransitiveDependencies,
          personIdPair: personIdPair,
        );

  SelectedRelationshipProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.personIdPair,
  }) : super.internal();

  final PersonIdPair personIdPair;

  @override
  Override overrideWith(
    Stream<Relationship?> Function(SelectedRelationshipRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SelectedRelationshipProvider._internal(
        (ref) => create(ref as SelectedRelationshipRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        personIdPair: personIdPair,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Relationship?> createElement() {
    return _SelectedRelationshipProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedRelationshipProvider &&
        other.personIdPair == personIdPair;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, personIdPair.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SelectedRelationshipRef on AutoDisposeStreamProviderRef<Relationship?> {
  /// The parameter `personIdPair` of this provider.
  PersonIdPair get personIdPair;
}

class _SelectedRelationshipProviderElement
    extends AutoDisposeStreamProviderElement<Relationship?>
    with SelectedRelationshipRef {
  _SelectedRelationshipProviderElement(super.provider);

  @override
  PersonIdPair get personIdPair =>
      (origin as SelectedRelationshipProvider).personIdPair;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
