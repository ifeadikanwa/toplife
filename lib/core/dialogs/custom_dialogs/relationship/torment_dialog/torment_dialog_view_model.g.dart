// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torment_dialog_view_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TormentDialogDataCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// TormentDialogData(...).copyWith(id: 12, name: "My name")
  /// ````
  TormentDialogData call({
    String? title,
    String? prompt,
    TormentOption? chosenTormentOption,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTormentDialogData.copyWith(...)`.
class _$TormentDialogDataCWProxyImpl implements _$TormentDialogDataCWProxy {
  const _$TormentDialogDataCWProxyImpl(this._value);

  final TormentDialogData _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// TormentDialogData(...).copyWith(id: 12, name: "My name")
  /// ````
  TormentDialogData call({
    Object? title = const $CopyWithPlaceholder(),
    Object? prompt = const $CopyWithPlaceholder(),
    Object? chosenTormentOption = const $CopyWithPlaceholder(),
  }) {
    return TormentDialogData(
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      prompt: prompt == const $CopyWithPlaceholder() || prompt == null
          ? _value.prompt
          // ignore: cast_nullable_to_non_nullable
          : prompt as String,
      chosenTormentOption:
          chosenTormentOption == const $CopyWithPlaceholder() ||
                  chosenTormentOption == null
              ? _value.chosenTormentOption
              // ignore: cast_nullable_to_non_nullable
              : chosenTormentOption as TormentOption,
    );
  }
}

extension $TormentDialogDataCopyWith on TormentDialogData {
  /// Returns a callable class that can be used as follows: `instanceOfTormentDialogData.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$TormentDialogDataCWProxy get copyWith =>
      _$TormentDialogDataCWProxyImpl(this);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tormentDialogViewModelHash() =>
    r'97afe2b46c494dba5b6710d285d65ef0d617ff65';

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

abstract class _$TormentDialogViewModel
    extends BuildlessAutoDisposeNotifier<TormentDialogData> {
  late final String relationshipLabel;
  late final String receiverFirstName;
  late final String receiverLastName;

  TormentDialogData build({
    required String relationshipLabel,
    required String receiverFirstName,
    required String receiverLastName,
  });
}

/// See also [TormentDialogViewModel].
@ProviderFor(TormentDialogViewModel)
const tormentDialogViewModelProvider = TormentDialogViewModelFamily();

/// See also [TormentDialogViewModel].
class TormentDialogViewModelFamily extends Family<TormentDialogData> {
  /// See also [TormentDialogViewModel].
  const TormentDialogViewModelFamily();

  /// See also [TormentDialogViewModel].
  TormentDialogViewModelProvider call({
    required String relationshipLabel,
    required String receiverFirstName,
    required String receiverLastName,
  }) {
    return TormentDialogViewModelProvider(
      relationshipLabel: relationshipLabel,
      receiverFirstName: receiverFirstName,
      receiverLastName: receiverLastName,
    );
  }

  @override
  TormentDialogViewModelProvider getProviderOverride(
    covariant TormentDialogViewModelProvider provider,
  ) {
    return call(
      relationshipLabel: provider.relationshipLabel,
      receiverFirstName: provider.receiverFirstName,
      receiverLastName: provider.receiverLastName,
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
  String? get name => r'tormentDialogViewModelProvider';
}

/// See also [TormentDialogViewModel].
class TormentDialogViewModelProvider extends AutoDisposeNotifierProviderImpl<
    TormentDialogViewModel, TormentDialogData> {
  /// See also [TormentDialogViewModel].
  TormentDialogViewModelProvider({
    required String relationshipLabel,
    required String receiverFirstName,
    required String receiverLastName,
  }) : this._internal(
          () => TormentDialogViewModel()
            ..relationshipLabel = relationshipLabel
            ..receiverFirstName = receiverFirstName
            ..receiverLastName = receiverLastName,
          from: tormentDialogViewModelProvider,
          name: r'tormentDialogViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tormentDialogViewModelHash,
          dependencies: TormentDialogViewModelFamily._dependencies,
          allTransitiveDependencies:
              TormentDialogViewModelFamily._allTransitiveDependencies,
          relationshipLabel: relationshipLabel,
          receiverFirstName: receiverFirstName,
          receiverLastName: receiverLastName,
        );

  TormentDialogViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.relationshipLabel,
    required this.receiverFirstName,
    required this.receiverLastName,
  }) : super.internal();

  final String relationshipLabel;
  final String receiverFirstName;
  final String receiverLastName;

  @override
  TormentDialogData runNotifierBuild(
    covariant TormentDialogViewModel notifier,
  ) {
    return notifier.build(
      relationshipLabel: relationshipLabel,
      receiverFirstName: receiverFirstName,
      receiverLastName: receiverLastName,
    );
  }

  @override
  Override overrideWith(TormentDialogViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: TormentDialogViewModelProvider._internal(
        () => create()
          ..relationshipLabel = relationshipLabel
          ..receiverFirstName = receiverFirstName
          ..receiverLastName = receiverLastName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        relationshipLabel: relationshipLabel,
        receiverFirstName: receiverFirstName,
        receiverLastName: receiverLastName,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TormentDialogViewModel, TormentDialogData>
      createElement() {
    return _TormentDialogViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TormentDialogViewModelProvider &&
        other.relationshipLabel == relationshipLabel &&
        other.receiverFirstName == receiverFirstName &&
        other.receiverLastName == receiverLastName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, relationshipLabel.hashCode);
    hash = _SystemHash.combine(hash, receiverFirstName.hashCode);
    hash = _SystemHash.combine(hash, receiverLastName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TormentDialogViewModelRef
    on AutoDisposeNotifierProviderRef<TormentDialogData> {
  /// The parameter `relationshipLabel` of this provider.
  String get relationshipLabel;

  /// The parameter `receiverFirstName` of this provider.
  String get receiverFirstName;

  /// The parameter `receiverLastName` of this provider.
  String get receiverLastName;
}

class _TormentDialogViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<TormentDialogViewModel,
        TormentDialogData> with TormentDialogViewModelRef {
  _TormentDialogViewModelProviderElement(super.provider);

  @override
  String get relationshipLabel =>
      (origin as TormentDialogViewModelProvider).relationshipLabel;
  @override
  String get receiverFirstName =>
      (origin as TormentDialogViewModelProvider).receiverFirstName;
  @override
  String get receiverLastName =>
      (origin as TormentDialogViewModelProvider).receiverLastName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
