// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_house_dialog_view_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RentHouseDialogDataCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// RentHouseDialogData(...).copyWith(id: 12, name: "My name")
  /// ````
  RentHouseDialogData call({
    int? chosenLeaseDuration,
    String? homeStorageChangeLabel,
    int? totalRentBasePrice,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRentHouseDialogData.copyWith(...)`.
class _$RentHouseDialogDataCWProxyImpl implements _$RentHouseDialogDataCWProxy {
  const _$RentHouseDialogDataCWProxyImpl(this._value);

  final RentHouseDialogData _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// RentHouseDialogData(...).copyWith(id: 12, name: "My name")
  /// ````
  RentHouseDialogData call({
    Object? chosenLeaseDuration = const $CopyWithPlaceholder(),
    Object? homeStorageChangeLabel = const $CopyWithPlaceholder(),
    Object? totalRentBasePrice = const $CopyWithPlaceholder(),
  }) {
    return RentHouseDialogData(
      chosenLeaseDuration:
          chosenLeaseDuration == const $CopyWithPlaceholder() ||
                  chosenLeaseDuration == null
              ? _value.chosenLeaseDuration
              // ignore: cast_nullable_to_non_nullable
              : chosenLeaseDuration as int,
      homeStorageChangeLabel:
          homeStorageChangeLabel == const $CopyWithPlaceholder() ||
                  homeStorageChangeLabel == null
              ? _value.homeStorageChangeLabel
              // ignore: cast_nullable_to_non_nullable
              : homeStorageChangeLabel as String,
      totalRentBasePrice: totalRentBasePrice == const $CopyWithPlaceholder() ||
              totalRentBasePrice == null
          ? _value.totalRentBasePrice
          // ignore: cast_nullable_to_non_nullable
          : totalRentBasePrice as int,
    );
  }
}

extension $RentHouseDialogDataCopyWith on RentHouseDialogData {
  /// Returns a callable class that can be used as follows: `instanceOfRentHouseDialogData.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$RentHouseDialogDataCWProxy get copyWith =>
      _$RentHouseDialogDataCWProxyImpl(this);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rentHouseDialogViewModelHash() =>
    r'69c2db96031e68676dd7eec64e3379dd4b2f4578';

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

abstract class _$RentHouseDialogViewModel
    extends BuildlessAutoDisposeAsyncNotifier<RentHouseDialogData?> {
  late final int newHouseBasePrice;
  late final int newHouseStorage;

  FutureOr<RentHouseDialogData?> build({
    required int newHouseBasePrice,
    required int newHouseStorage,
  });
}

/// See also [RentHouseDialogViewModel].
@ProviderFor(RentHouseDialogViewModel)
const rentHouseDialogViewModelProvider = RentHouseDialogViewModelFamily();

/// See also [RentHouseDialogViewModel].
class RentHouseDialogViewModelFamily
    extends Family<AsyncValue<RentHouseDialogData?>> {
  /// See also [RentHouseDialogViewModel].
  const RentHouseDialogViewModelFamily();

  /// See also [RentHouseDialogViewModel].
  RentHouseDialogViewModelProvider call({
    required int newHouseBasePrice,
    required int newHouseStorage,
  }) {
    return RentHouseDialogViewModelProvider(
      newHouseBasePrice: newHouseBasePrice,
      newHouseStorage: newHouseStorage,
    );
  }

  @override
  RentHouseDialogViewModelProvider getProviderOverride(
    covariant RentHouseDialogViewModelProvider provider,
  ) {
    return call(
      newHouseBasePrice: provider.newHouseBasePrice,
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
  String? get name => r'rentHouseDialogViewModelProvider';
}

/// See also [RentHouseDialogViewModel].
class RentHouseDialogViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<RentHouseDialogViewModel,
        RentHouseDialogData?> {
  /// See also [RentHouseDialogViewModel].
  RentHouseDialogViewModelProvider({
    required int newHouseBasePrice,
    required int newHouseStorage,
  }) : this._internal(
          () => RentHouseDialogViewModel()
            ..newHouseBasePrice = newHouseBasePrice
            ..newHouseStorage = newHouseStorage,
          from: rentHouseDialogViewModelProvider,
          name: r'rentHouseDialogViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$rentHouseDialogViewModelHash,
          dependencies: RentHouseDialogViewModelFamily._dependencies,
          allTransitiveDependencies:
              RentHouseDialogViewModelFamily._allTransitiveDependencies,
          newHouseBasePrice: newHouseBasePrice,
          newHouseStorage: newHouseStorage,
        );

  RentHouseDialogViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.newHouseBasePrice,
    required this.newHouseStorage,
  }) : super.internal();

  final int newHouseBasePrice;
  final int newHouseStorage;

  @override
  FutureOr<RentHouseDialogData?> runNotifierBuild(
    covariant RentHouseDialogViewModel notifier,
  ) {
    return notifier.build(
      newHouseBasePrice: newHouseBasePrice,
      newHouseStorage: newHouseStorage,
    );
  }

  @override
  Override overrideWith(RentHouseDialogViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: RentHouseDialogViewModelProvider._internal(
        () => create()
          ..newHouseBasePrice = newHouseBasePrice
          ..newHouseStorage = newHouseStorage,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        newHouseBasePrice: newHouseBasePrice,
        newHouseStorage: newHouseStorage,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RentHouseDialogViewModel,
      RentHouseDialogData?> createElement() {
    return _RentHouseDialogViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RentHouseDialogViewModelProvider &&
        other.newHouseBasePrice == newHouseBasePrice &&
        other.newHouseStorage == newHouseStorage;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, newHouseBasePrice.hashCode);
    hash = _SystemHash.combine(hash, newHouseStorage.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RentHouseDialogViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<RentHouseDialogData?> {
  /// The parameter `newHouseBasePrice` of this provider.
  int get newHouseBasePrice;

  /// The parameter `newHouseStorage` of this provider.
  int get newHouseStorage;
}

class _RentHouseDialogViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RentHouseDialogViewModel,
        RentHouseDialogData?> with RentHouseDialogViewModelRef {
  _RentHouseDialogViewModelProviderElement(super.provider);

  @override
  int get newHouseBasePrice =>
      (origin as RentHouseDialogViewModelProvider).newHouseBasePrice;
  @override
  int get newHouseStorage =>
      (origin as RentHouseDialogViewModelProvider).newHouseStorage;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
