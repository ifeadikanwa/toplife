// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relationship_actions_screen_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$relationshipActionsScreenViewModelHash() =>
    r'a0c70ddad4eeccf674de965f1eb420a98dbcd734';

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

abstract class _$RelationshipActionsScreenViewModel
    extends BuildlessAutoDisposeAsyncNotifier<RelationshipActionsScreenData?> {
  late final int relationshipPersonId;
  late final PersonIdPair playerAndPersonIdPair;

  FutureOr<RelationshipActionsScreenData?> build({
    required int relationshipPersonId,
    required PersonIdPair playerAndPersonIdPair,
  });
}

/// See also [RelationshipActionsScreenViewModel].
@ProviderFor(RelationshipActionsScreenViewModel)
const relationshipActionsScreenViewModelProvider =
    RelationshipActionsScreenViewModelFamily();

/// See also [RelationshipActionsScreenViewModel].
class RelationshipActionsScreenViewModelFamily
    extends Family<AsyncValue<RelationshipActionsScreenData?>> {
  /// See also [RelationshipActionsScreenViewModel].
  const RelationshipActionsScreenViewModelFamily();

  /// See also [RelationshipActionsScreenViewModel].
  RelationshipActionsScreenViewModelProvider call({
    required int relationshipPersonId,
    required PersonIdPair playerAndPersonIdPair,
  }) {
    return RelationshipActionsScreenViewModelProvider(
      relationshipPersonId: relationshipPersonId,
      playerAndPersonIdPair: playerAndPersonIdPair,
    );
  }

  @override
  RelationshipActionsScreenViewModelProvider getProviderOverride(
    covariant RelationshipActionsScreenViewModelProvider provider,
  ) {
    return call(
      relationshipPersonId: provider.relationshipPersonId,
      playerAndPersonIdPair: provider.playerAndPersonIdPair,
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
  String? get name => r'relationshipActionsScreenViewModelProvider';
}

/// See also [RelationshipActionsScreenViewModel].
class RelationshipActionsScreenViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        RelationshipActionsScreenViewModel, RelationshipActionsScreenData?> {
  /// See also [RelationshipActionsScreenViewModel].
  RelationshipActionsScreenViewModelProvider({
    required int relationshipPersonId,
    required PersonIdPair playerAndPersonIdPair,
  }) : this._internal(
          () => RelationshipActionsScreenViewModel()
            ..relationshipPersonId = relationshipPersonId
            ..playerAndPersonIdPair = playerAndPersonIdPair,
          from: relationshipActionsScreenViewModelProvider,
          name: r'relationshipActionsScreenViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$relationshipActionsScreenViewModelHash,
          dependencies: RelationshipActionsScreenViewModelFamily._dependencies,
          allTransitiveDependencies: RelationshipActionsScreenViewModelFamily
              ._allTransitiveDependencies,
          relationshipPersonId: relationshipPersonId,
          playerAndPersonIdPair: playerAndPersonIdPair,
        );

  RelationshipActionsScreenViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.relationshipPersonId,
    required this.playerAndPersonIdPair,
  }) : super.internal();

  final int relationshipPersonId;
  final PersonIdPair playerAndPersonIdPair;

  @override
  FutureOr<RelationshipActionsScreenData?> runNotifierBuild(
    covariant RelationshipActionsScreenViewModel notifier,
  ) {
    return notifier.build(
      relationshipPersonId: relationshipPersonId,
      playerAndPersonIdPair: playerAndPersonIdPair,
    );
  }

  @override
  Override overrideWith(RelationshipActionsScreenViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: RelationshipActionsScreenViewModelProvider._internal(
        () => create()
          ..relationshipPersonId = relationshipPersonId
          ..playerAndPersonIdPair = playerAndPersonIdPair,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        relationshipPersonId: relationshipPersonId,
        playerAndPersonIdPair: playerAndPersonIdPair,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RelationshipActionsScreenViewModel,
      RelationshipActionsScreenData?> createElement() {
    return _RelationshipActionsScreenViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RelationshipActionsScreenViewModelProvider &&
        other.relationshipPersonId == relationshipPersonId &&
        other.playerAndPersonIdPair == playerAndPersonIdPair;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, relationshipPersonId.hashCode);
    hash = _SystemHash.combine(hash, playerAndPersonIdPair.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RelationshipActionsScreenViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<RelationshipActionsScreenData?> {
  /// The parameter `relationshipPersonId` of this provider.
  int get relationshipPersonId;

  /// The parameter `playerAndPersonIdPair` of this provider.
  PersonIdPair get playerAndPersonIdPair;
}

class _RelationshipActionsScreenViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        RelationshipActionsScreenViewModel, RelationshipActionsScreenData?>
    with RelationshipActionsScreenViewModelRef {
  _RelationshipActionsScreenViewModelProviderElement(super.provider);

  @override
  int get relationshipPersonId =>
      (origin as RelationshipActionsScreenViewModelProvider)
          .relationshipPersonId;
  @override
  PersonIdPair get playerAndPersonIdPair =>
      (origin as RelationshipActionsScreenViewModelProvider)
          .playerAndPersonIdPair;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
