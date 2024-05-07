// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_house_dialog_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$buyHouseDialogViewModelHash() =>
    r'4d90b9e06cebada4a1cd1d7157998ef1a0d8e643';

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

abstract class _$BuyHouseDialogViewModel
    extends BuildlessAutoDisposeAsyncNotifier<BuyHouseDialogData?> {
  late final int newHouseStorage;

  FutureOr<BuyHouseDialogData?> build({
    required int newHouseStorage,
  });
}

/// See also [BuyHouseDialogViewModel].
@ProviderFor(BuyHouseDialogViewModel)
const buyHouseDialogViewModelProvider = BuyHouseDialogViewModelFamily();

/// See also [BuyHouseDialogViewModel].
class BuyHouseDialogViewModelFamily
    extends Family<AsyncValue<BuyHouseDialogData?>> {
  /// See also [BuyHouseDialogViewModel].
  const BuyHouseDialogViewModelFamily();

  /// See also [BuyHouseDialogViewModel].
  BuyHouseDialogViewModelProvider call({
    required int newHouseStorage,
  }) {
    return BuyHouseDialogViewModelProvider(
      newHouseStorage: newHouseStorage,
    );
  }

  @override
  BuyHouseDialogViewModelProvider getProviderOverride(
    covariant BuyHouseDialogViewModelProvider provider,
  ) {
    return call(
      newHouseStorage: provider.newHouseStorage,
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
  String? get name => r'buyHouseDialogViewModelProvider';
}

/// See also [BuyHouseDialogViewModel].
class BuyHouseDialogViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<BuyHouseDialogViewModel,
        BuyHouseDialogData?> {
  /// See also [BuyHouseDialogViewModel].
  BuyHouseDialogViewModelProvider({
    required int newHouseStorage,
  }) : this._internal(
          () => BuyHouseDialogViewModel()..newHouseStorage = newHouseStorage,
          from: buyHouseDialogViewModelProvider,
          name: r'buyHouseDialogViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$buyHouseDialogViewModelHash,
          dependencies: BuyHouseDialogViewModelFamily._dependencies,
          allTransitiveDependencies:
              BuyHouseDialogViewModelFamily._allTransitiveDependencies,
          newHouseStorage: newHouseStorage,
        );

  BuyHouseDialogViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.newHouseStorage,
  }) : super.internal();

  final int newHouseStorage;

  @override
  FutureOr<BuyHouseDialogData?> runNotifierBuild(
    covariant BuyHouseDialogViewModel notifier,
  ) {
    return notifier.build(
      newHouseStorage: newHouseStorage,
    );
  }

  @override
  Override overrideWith(BuyHouseDialogViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: BuyHouseDialogViewModelProvider._internal(
        () => create()..newHouseStorage = newHouseStorage,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        newHouseStorage: newHouseStorage,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<BuyHouseDialogViewModel,
      BuyHouseDialogData?> createElement() {
    return _BuyHouseDialogViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BuyHouseDialogViewModelProvider &&
        other.newHouseStorage == newHouseStorage;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, newHouseStorage.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BuyHouseDialogViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<BuyHouseDialogData?> {
  /// The parameter `newHouseStorage` of this provider.
  int get newHouseStorage;
}

class _BuyHouseDialogViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<BuyHouseDialogViewModel,
        BuyHouseDialogData?> with BuyHouseDialogViewModelRef {
  _BuyHouseDialogViewModelProviderElement(super.provider);

  @override
  int get newHouseStorage =>
      (origin as BuyHouseDialogViewModelProvider).newHouseStorage;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
