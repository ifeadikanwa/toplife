// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formatted_money_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formattedMoneyHash() => r'7377d4cf5a503f7dca421f5d1662dc6ab500a3ef';

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

/// See also [formattedMoney].
@ProviderFor(formattedMoney)
const formattedMoneyProvider = FormattedMoneyFamily();

/// See also [formattedMoney].
class FormattedMoneyFamily extends Family<AsyncValue<String>> {
  /// See also [formattedMoney].
  const FormattedMoneyFamily();

  /// See also [formattedMoney].
  FormattedMoneyProvider call({
    required int amount,
    required bool adjustToEconomy,
  }) {
    return FormattedMoneyProvider(
      amount: amount,
      adjustToEconomy: adjustToEconomy,
    );
  }

  @override
  FormattedMoneyProvider getProviderOverride(
    covariant FormattedMoneyProvider provider,
  ) {
    return call(
      amount: provider.amount,
      adjustToEconomy: provider.adjustToEconomy,
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
  String? get name => r'formattedMoneyProvider';
}

/// See also [formattedMoney].
class FormattedMoneyProvider extends AutoDisposeFutureProvider<String> {
  /// See also [formattedMoney].
  FormattedMoneyProvider({
    required int amount,
    required bool adjustToEconomy,
  }) : this._internal(
          (ref) => formattedMoney(
            ref as FormattedMoneyRef,
            amount: amount,
            adjustToEconomy: adjustToEconomy,
          ),
          from: formattedMoneyProvider,
          name: r'formattedMoneyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formattedMoneyHash,
          dependencies: FormattedMoneyFamily._dependencies,
          allTransitiveDependencies:
              FormattedMoneyFamily._allTransitiveDependencies,
          amount: amount,
          adjustToEconomy: adjustToEconomy,
        );

  FormattedMoneyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.amount,
    required this.adjustToEconomy,
  }) : super.internal();

  final int amount;
  final bool adjustToEconomy;

  @override
  Override overrideWith(
    FutureOr<String> Function(FormattedMoneyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormattedMoneyProvider._internal(
        (ref) => create(ref as FormattedMoneyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        amount: amount,
        adjustToEconomy: adjustToEconomy,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _FormattedMoneyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FormattedMoneyProvider &&
        other.amount == amount &&
        other.adjustToEconomy == adjustToEconomy;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, amount.hashCode);
    hash = _SystemHash.combine(hash, adjustToEconomy.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormattedMoneyRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `amount` of this provider.
  int get amount;

  /// The parameter `adjustToEconomy` of this provider.
  bool get adjustToEconomy;
}

class _FormattedMoneyProviderElement
    extends AutoDisposeFutureProviderElement<String> with FormattedMoneyRef {
  _FormattedMoneyProviderElement(super.provider);

  @override
  int get amount => (origin as FormattedMoneyProvider).amount;
  @override
  bool get adjustToEconomy =>
      (origin as FormattedMoneyProvider).adjustToEconomy;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
