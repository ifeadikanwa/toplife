// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_money_dialog_view_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SendMoneyDialogDataCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SendMoneyDialogData(...).copyWith(id: 12, name: "My name")
  /// ````
  SendMoneyDialogData call({
    String? title,
    String? prompt,
    String? hint,
    int? maxCharactersAllowed,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSendMoneyDialogData.copyWith(...)`.
class _$SendMoneyDialogDataCWProxyImpl implements _$SendMoneyDialogDataCWProxy {
  const _$SendMoneyDialogDataCWProxyImpl(this._value);

  final SendMoneyDialogData _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SendMoneyDialogData(...).copyWith(id: 12, name: "My name")
  /// ````
  SendMoneyDialogData call({
    Object? title = const $CopyWithPlaceholder(),
    Object? prompt = const $CopyWithPlaceholder(),
    Object? hint = const $CopyWithPlaceholder(),
    Object? maxCharactersAllowed = const $CopyWithPlaceholder(),
  }) {
    return SendMoneyDialogData(
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      prompt: prompt == const $CopyWithPlaceholder() || prompt == null
          ? _value.prompt
          // ignore: cast_nullable_to_non_nullable
          : prompt as String,
      hint: hint == const $CopyWithPlaceholder() || hint == null
          ? _value.hint
          // ignore: cast_nullable_to_non_nullable
          : hint as String,
      maxCharactersAllowed:
          maxCharactersAllowed == const $CopyWithPlaceholder() ||
                  maxCharactersAllowed == null
              ? _value.maxCharactersAllowed
              // ignore: cast_nullable_to_non_nullable
              : maxCharactersAllowed as int,
    );
  }
}

extension $SendMoneyDialogDataCopyWith on SendMoneyDialogData {
  /// Returns a callable class that can be used as follows: `instanceOfSendMoneyDialogData.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SendMoneyDialogDataCWProxy get copyWith =>
      _$SendMoneyDialogDataCWProxyImpl(this);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendMoneyDialogViewModelHash() =>
    r'd896f18d99e45bf22bbf8d50e6b644b89d71c486';

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

abstract class _$SendMoneyDialogViewModel
    extends BuildlessAutoDisposeNotifier<SendMoneyDialogData> {
  late final String relationshipLabel;
  late final String receiverFirstName;
  late final String receiverLastName;

  SendMoneyDialogData build({
    required String relationshipLabel,
    required String receiverFirstName,
    required String receiverLastName,
  });
}

/// See also [SendMoneyDialogViewModel].
@ProviderFor(SendMoneyDialogViewModel)
const sendMoneyDialogViewModelProvider = SendMoneyDialogViewModelFamily();

/// See also [SendMoneyDialogViewModel].
class SendMoneyDialogViewModelFamily extends Family<SendMoneyDialogData> {
  /// See also [SendMoneyDialogViewModel].
  const SendMoneyDialogViewModelFamily();

  /// See also [SendMoneyDialogViewModel].
  SendMoneyDialogViewModelProvider call({
    required String relationshipLabel,
    required String receiverFirstName,
    required String receiverLastName,
  }) {
    return SendMoneyDialogViewModelProvider(
      relationshipLabel: relationshipLabel,
      receiverFirstName: receiverFirstName,
      receiverLastName: receiverLastName,
    );
  }

  @override
  SendMoneyDialogViewModelProvider getProviderOverride(
    covariant SendMoneyDialogViewModelProvider provider,
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
  String? get name => r'sendMoneyDialogViewModelProvider';
}

/// See also [SendMoneyDialogViewModel].
class SendMoneyDialogViewModelProvider extends AutoDisposeNotifierProviderImpl<
    SendMoneyDialogViewModel, SendMoneyDialogData> {
  /// See also [SendMoneyDialogViewModel].
  SendMoneyDialogViewModelProvider({
    required String relationshipLabel,
    required String receiverFirstName,
    required String receiverLastName,
  }) : this._internal(
          () => SendMoneyDialogViewModel()
            ..relationshipLabel = relationshipLabel
            ..receiverFirstName = receiverFirstName
            ..receiverLastName = receiverLastName,
          from: sendMoneyDialogViewModelProvider,
          name: r'sendMoneyDialogViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendMoneyDialogViewModelHash,
          dependencies: SendMoneyDialogViewModelFamily._dependencies,
          allTransitiveDependencies:
              SendMoneyDialogViewModelFamily._allTransitiveDependencies,
          relationshipLabel: relationshipLabel,
          receiverFirstName: receiverFirstName,
          receiverLastName: receiverLastName,
        );

  SendMoneyDialogViewModelProvider._internal(
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
  SendMoneyDialogData runNotifierBuild(
    covariant SendMoneyDialogViewModel notifier,
  ) {
    return notifier.build(
      relationshipLabel: relationshipLabel,
      receiverFirstName: receiverFirstName,
      receiverLastName: receiverLastName,
    );
  }

  @override
  Override overrideWith(SendMoneyDialogViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: SendMoneyDialogViewModelProvider._internal(
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
  AutoDisposeNotifierProviderElement<SendMoneyDialogViewModel,
      SendMoneyDialogData> createElement() {
    return _SendMoneyDialogViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendMoneyDialogViewModelProvider &&
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

mixin SendMoneyDialogViewModelRef
    on AutoDisposeNotifierProviderRef<SendMoneyDialogData> {
  /// The parameter `relationshipLabel` of this provider.
  String get relationshipLabel;

  /// The parameter `receiverFirstName` of this provider.
  String get receiverFirstName;

  /// The parameter `receiverLastName` of this provider.
  String get receiverLastName;
}

class _SendMoneyDialogViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<SendMoneyDialogViewModel,
        SendMoneyDialogData> with SendMoneyDialogViewModelRef {
  _SendMoneyDialogViewModelProviderElement(super.provider);

  @override
  String get relationshipLabel =>
      (origin as SendMoneyDialogViewModelProvider).relationshipLabel;
  @override
  String get receiverFirstName =>
      (origin as SendMoneyDialogViewModelProvider).receiverFirstName;
  @override
  String get receiverLastName =>
      (origin as SendMoneyDialogViewModelProvider).receiverLastName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
