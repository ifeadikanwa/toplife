// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_food_dialog_view_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SendFoodDialogDataCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SendFoodDialogData(...).copyWith(id: 12, name: "My name")
  /// ````
  SendFoodDialogData call({
    String? title,
    String? prompt,
    FridgeFoodPair? chosenFoodOption,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSendFoodDialogData.copyWith(...)`.
class _$SendFoodDialogDataCWProxyImpl implements _$SendFoodDialogDataCWProxy {
  const _$SendFoodDialogDataCWProxyImpl(this._value);

  final SendFoodDialogData _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SendFoodDialogData(...).copyWith(id: 12, name: "My name")
  /// ````
  SendFoodDialogData call({
    Object? title = const $CopyWithPlaceholder(),
    Object? prompt = const $CopyWithPlaceholder(),
    Object? chosenFoodOption = const $CopyWithPlaceholder(),
  }) {
    return SendFoodDialogData(
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      prompt: prompt == const $CopyWithPlaceholder() || prompt == null
          ? _value.prompt
          // ignore: cast_nullable_to_non_nullable
          : prompt as String,
      chosenFoodOption: chosenFoodOption == const $CopyWithPlaceholder()
          ? _value.chosenFoodOption
          // ignore: cast_nullable_to_non_nullable
          : chosenFoodOption as FridgeFoodPair?,
    );
  }
}

extension $SendFoodDialogDataCopyWith on SendFoodDialogData {
  /// Returns a callable class that can be used as follows: `instanceOfSendFoodDialogData.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SendFoodDialogDataCWProxy get copyWith =>
      _$SendFoodDialogDataCWProxyImpl(this);

  /// Copies the object with the specific fields set to `null`. If you pass `false` as a parameter, nothing will be done and it will be ignored. Don't do it. Prefer `copyWith(field: null)`.
  ///
  /// Usage
  /// ```dart
  /// SendFoodDialogData(...).copyWithNull(firstField: true, secondField: true)
  /// ````
  SendFoodDialogData copyWithNull({
    bool chosenFoodOption = false,
  }) {
    return SendFoodDialogData(
      title: title,
      prompt: prompt,
      chosenFoodOption: chosenFoodOption == true ? null : this.chosenFoodOption,
    );
  }
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendFoodDialogViewModelHash() =>
    r'7562cf3cb0180c888fbb50bd39a8eb32957e662b';

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

abstract class _$SendFoodDialogViewModel
    extends BuildlessAutoDisposeNotifier<SendFoodDialogData> {
  late final String relationshipLabel;
  late final String receiverFirstName;
  late final String receiverLastName;

  SendFoodDialogData build({
    required String relationshipLabel,
    required String receiverFirstName,
    required String receiverLastName,
  });
}

/// See also [SendFoodDialogViewModel].
@ProviderFor(SendFoodDialogViewModel)
const sendFoodDialogViewModelProvider = SendFoodDialogViewModelFamily();

/// See also [SendFoodDialogViewModel].
class SendFoodDialogViewModelFamily extends Family<SendFoodDialogData> {
  /// See also [SendFoodDialogViewModel].
  const SendFoodDialogViewModelFamily();

  /// See also [SendFoodDialogViewModel].
  SendFoodDialogViewModelProvider call({
    required String relationshipLabel,
    required String receiverFirstName,
    required String receiverLastName,
  }) {
    return SendFoodDialogViewModelProvider(
      relationshipLabel: relationshipLabel,
      receiverFirstName: receiverFirstName,
      receiverLastName: receiverLastName,
    );
  }

  @override
  SendFoodDialogViewModelProvider getProviderOverride(
    covariant SendFoodDialogViewModelProvider provider,
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
  String? get name => r'sendFoodDialogViewModelProvider';
}

/// See also [SendFoodDialogViewModel].
class SendFoodDialogViewModelProvider extends AutoDisposeNotifierProviderImpl<
    SendFoodDialogViewModel, SendFoodDialogData> {
  /// See also [SendFoodDialogViewModel].
  SendFoodDialogViewModelProvider({
    required String relationshipLabel,
    required String receiverFirstName,
    required String receiverLastName,
  }) : this._internal(
          () => SendFoodDialogViewModel()
            ..relationshipLabel = relationshipLabel
            ..receiverFirstName = receiverFirstName
            ..receiverLastName = receiverLastName,
          from: sendFoodDialogViewModelProvider,
          name: r'sendFoodDialogViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendFoodDialogViewModelHash,
          dependencies: SendFoodDialogViewModelFamily._dependencies,
          allTransitiveDependencies:
              SendFoodDialogViewModelFamily._allTransitiveDependencies,
          relationshipLabel: relationshipLabel,
          receiverFirstName: receiverFirstName,
          receiverLastName: receiverLastName,
        );

  SendFoodDialogViewModelProvider._internal(
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
  SendFoodDialogData runNotifierBuild(
    covariant SendFoodDialogViewModel notifier,
  ) {
    return notifier.build(
      relationshipLabel: relationshipLabel,
      receiverFirstName: receiverFirstName,
      receiverLastName: receiverLastName,
    );
  }

  @override
  Override overrideWith(SendFoodDialogViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: SendFoodDialogViewModelProvider._internal(
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
  AutoDisposeNotifierProviderElement<SendFoodDialogViewModel,
      SendFoodDialogData> createElement() {
    return _SendFoodDialogViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendFoodDialogViewModelProvider &&
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

mixin SendFoodDialogViewModelRef
    on AutoDisposeNotifierProviderRef<SendFoodDialogData> {
  /// The parameter `relationshipLabel` of this provider.
  String get relationshipLabel;

  /// The parameter `receiverFirstName` of this provider.
  String get receiverFirstName;

  /// The parameter `receiverLastName` of this provider.
  String get receiverLastName;
}

class _SendFoodDialogViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<SendFoodDialogViewModel,
        SendFoodDialogData> with SendFoodDialogViewModelRef {
  _SendFoodDialogViewModelProviderElement(super.provider);

  @override
  String get relationshipLabel =>
      (origin as SendFoodDialogViewModelProvider).relationshipLabel;
  @override
  String get receiverFirstName =>
      (origin as SendFoodDialogViewModelProvider).receiverFirstName;
  @override
  String get receiverLastName =>
      (origin as SendFoodDialogViewModelProvider).receiverLastName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
