// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_loan_dialog_view_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SimpleLoanDialogDataCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SimpleLoanDialogData(...).copyWith(id: 12, name: "My name")
  /// ````
  SimpleLoanDialogData call({
    double? chosenDownPaymentPercentage,
    EconomyAdjustedLoanInformation? economyAdjustedLoanInformation,
    double? sliderMin,
    double? sliderMax,
    String? downPaymentString,
    String? installmentString,
    String? loanString,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSimpleLoanDialogData.copyWith(...)`.
class _$SimpleLoanDialogDataCWProxyImpl
    implements _$SimpleLoanDialogDataCWProxy {
  const _$SimpleLoanDialogDataCWProxyImpl(this._value);

  final SimpleLoanDialogData _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SimpleLoanDialogData(...).copyWith(id: 12, name: "My name")
  /// ````
  SimpleLoanDialogData call({
    Object? chosenDownPaymentPercentage = const $CopyWithPlaceholder(),
    Object? economyAdjustedLoanInformation = const $CopyWithPlaceholder(),
    Object? sliderMin = const $CopyWithPlaceholder(),
    Object? sliderMax = const $CopyWithPlaceholder(),
    Object? downPaymentString = const $CopyWithPlaceholder(),
    Object? installmentString = const $CopyWithPlaceholder(),
    Object? loanString = const $CopyWithPlaceholder(),
  }) {
    return SimpleLoanDialogData(
      chosenDownPaymentPercentage:
          chosenDownPaymentPercentage == const $CopyWithPlaceholder() ||
                  chosenDownPaymentPercentage == null
              ? _value.chosenDownPaymentPercentage
              // ignore: cast_nullable_to_non_nullable
              : chosenDownPaymentPercentage as double,
      economyAdjustedLoanInformation: economyAdjustedLoanInformation ==
                  const $CopyWithPlaceholder() ||
              economyAdjustedLoanInformation == null
          ? _value.economyAdjustedLoanInformation
          // ignore: cast_nullable_to_non_nullable
          : economyAdjustedLoanInformation as EconomyAdjustedLoanInformation,
      sliderMin: sliderMin == const $CopyWithPlaceholder() || sliderMin == null
          ? _value.sliderMin
          // ignore: cast_nullable_to_non_nullable
          : sliderMin as double,
      sliderMax: sliderMax == const $CopyWithPlaceholder() || sliderMax == null
          ? _value.sliderMax
          // ignore: cast_nullable_to_non_nullable
          : sliderMax as double,
      downPaymentString: downPaymentString == const $CopyWithPlaceholder() ||
              downPaymentString == null
          ? _value.downPaymentString
          // ignore: cast_nullable_to_non_nullable
          : downPaymentString as String,
      installmentString: installmentString == const $CopyWithPlaceholder() ||
              installmentString == null
          ? _value.installmentString
          // ignore: cast_nullable_to_non_nullable
          : installmentString as String,
      loanString:
          loanString == const $CopyWithPlaceholder() || loanString == null
              ? _value.loanString
              // ignore: cast_nullable_to_non_nullable
              : loanString as String,
    );
  }
}

extension $SimpleLoanDialogDataCopyWith on SimpleLoanDialogData {
  /// Returns a callable class that can be used as follows: `instanceOfSimpleLoanDialogData.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SimpleLoanDialogDataCWProxy get copyWith =>
      _$SimpleLoanDialogDataCWProxyImpl(this);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$simpleLoanDialogViewModelHash() =>
    r'6c38cc74bdf23283096a3f54483d9f1c57251056';

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

abstract class _$SimpleLoanDialogViewModel
    extends BuildlessAutoDisposeAsyncNotifier<SimpleLoanDialogData?> {
  late final int basePrice;
  late final BillType billType;
  late final bool useMultipleLoanDownPaymentRange;

  FutureOr<SimpleLoanDialogData?> build({
    required int basePrice,
    required BillType billType,
    required bool useMultipleLoanDownPaymentRange,
  });
}

/// See also [SimpleLoanDialogViewModel].
@ProviderFor(SimpleLoanDialogViewModel)
const simpleLoanDialogViewModelProvider = SimpleLoanDialogViewModelFamily();

/// See also [SimpleLoanDialogViewModel].
class SimpleLoanDialogViewModelFamily
    extends Family<AsyncValue<SimpleLoanDialogData?>> {
  /// See also [SimpleLoanDialogViewModel].
  const SimpleLoanDialogViewModelFamily();

  /// See also [SimpleLoanDialogViewModel].
  SimpleLoanDialogViewModelProvider call({
    required int basePrice,
    required BillType billType,
    required bool useMultipleLoanDownPaymentRange,
  }) {
    return SimpleLoanDialogViewModelProvider(
      basePrice: basePrice,
      billType: billType,
      useMultipleLoanDownPaymentRange: useMultipleLoanDownPaymentRange,
    );
  }

  @override
  SimpleLoanDialogViewModelProvider getProviderOverride(
    covariant SimpleLoanDialogViewModelProvider provider,
  ) {
    return call(
      basePrice: provider.basePrice,
      billType: provider.billType,
      useMultipleLoanDownPaymentRange: provider.useMultipleLoanDownPaymentRange,
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
  String? get name => r'simpleLoanDialogViewModelProvider';
}

/// See also [SimpleLoanDialogViewModel].
class SimpleLoanDialogViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SimpleLoanDialogViewModel,
        SimpleLoanDialogData?> {
  /// See also [SimpleLoanDialogViewModel].
  SimpleLoanDialogViewModelProvider({
    required int basePrice,
    required BillType billType,
    required bool useMultipleLoanDownPaymentRange,
  }) : this._internal(
          () => SimpleLoanDialogViewModel()
            ..basePrice = basePrice
            ..billType = billType
            ..useMultipleLoanDownPaymentRange = useMultipleLoanDownPaymentRange,
          from: simpleLoanDialogViewModelProvider,
          name: r'simpleLoanDialogViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$simpleLoanDialogViewModelHash,
          dependencies: SimpleLoanDialogViewModelFamily._dependencies,
          allTransitiveDependencies:
              SimpleLoanDialogViewModelFamily._allTransitiveDependencies,
          basePrice: basePrice,
          billType: billType,
          useMultipleLoanDownPaymentRange: useMultipleLoanDownPaymentRange,
        );

  SimpleLoanDialogViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.basePrice,
    required this.billType,
    required this.useMultipleLoanDownPaymentRange,
  }) : super.internal();

  final int basePrice;
  final BillType billType;
  final bool useMultipleLoanDownPaymentRange;

  @override
  FutureOr<SimpleLoanDialogData?> runNotifierBuild(
    covariant SimpleLoanDialogViewModel notifier,
  ) {
    return notifier.build(
      basePrice: basePrice,
      billType: billType,
      useMultipleLoanDownPaymentRange: useMultipleLoanDownPaymentRange,
    );
  }

  @override
  Override overrideWith(SimpleLoanDialogViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: SimpleLoanDialogViewModelProvider._internal(
        () => create()
          ..basePrice = basePrice
          ..billType = billType
          ..useMultipleLoanDownPaymentRange = useMultipleLoanDownPaymentRange,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        basePrice: basePrice,
        billType: billType,
        useMultipleLoanDownPaymentRange: useMultipleLoanDownPaymentRange,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SimpleLoanDialogViewModel,
      SimpleLoanDialogData?> createElement() {
    return _SimpleLoanDialogViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SimpleLoanDialogViewModelProvider &&
        other.basePrice == basePrice &&
        other.billType == billType &&
        other.useMultipleLoanDownPaymentRange ==
            useMultipleLoanDownPaymentRange;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, basePrice.hashCode);
    hash = _SystemHash.combine(hash, billType.hashCode);
    hash = _SystemHash.combine(hash, useMultipleLoanDownPaymentRange.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SimpleLoanDialogViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<SimpleLoanDialogData?> {
  /// The parameter `basePrice` of this provider.
  int get basePrice;

  /// The parameter `billType` of this provider.
  BillType get billType;

  /// The parameter `useMultipleLoanDownPaymentRange` of this provider.
  bool get useMultipleLoanDownPaymentRange;
}

class _SimpleLoanDialogViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SimpleLoanDialogViewModel,
        SimpleLoanDialogData?> with SimpleLoanDialogViewModelRef {
  _SimpleLoanDialogViewModelProviderElement(super.provider);

  @override
  int get basePrice => (origin as SimpleLoanDialogViewModelProvider).basePrice;
  @override
  BillType get billType =>
      (origin as SimpleLoanDialogViewModelProvider).billType;
  @override
  bool get useMultipleLoanDownPaymentRange =>
      (origin as SimpleLoanDialogViewModelProvider)
          .useMultipleLoanDownPaymentRange;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
