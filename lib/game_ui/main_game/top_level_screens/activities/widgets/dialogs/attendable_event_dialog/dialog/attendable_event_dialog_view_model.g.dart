// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendable_event_dialog_view_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AttendableEventDialogDataCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// AttendableEventDialogData(...).copyWith(id: 12, name: "My name")
  /// ````
  AttendableEventDialogData call({
    AttendableEventInfo? attendableEventInfo,
    String? formattedMoneyGift,
    AttendEventDetail? attendEventDetail,
    int? travelTime,
    int? currentTimeInMinutes,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAttendableEventDialogData.copyWith(...)`.
class _$AttendableEventDialogDataCWProxyImpl
    implements _$AttendableEventDialogDataCWProxy {
  const _$AttendableEventDialogDataCWProxyImpl(this._value);

  final AttendableEventDialogData _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// AttendableEventDialogData(...).copyWith(id: 12, name: "My name")
  /// ````
  AttendableEventDialogData call({
    Object? attendableEventInfo = const $CopyWithPlaceholder(),
    Object? formattedMoneyGift = const $CopyWithPlaceholder(),
    Object? attendEventDetail = const $CopyWithPlaceholder(),
    Object? travelTime = const $CopyWithPlaceholder(),
    Object? currentTimeInMinutes = const $CopyWithPlaceholder(),
  }) {
    return AttendableEventDialogData(
      attendableEventInfo:
          attendableEventInfo == const $CopyWithPlaceholder() ||
                  attendableEventInfo == null
              ? _value.attendableEventInfo
              // ignore: cast_nullable_to_non_nullable
              : attendableEventInfo as AttendableEventInfo,
      formattedMoneyGift: formattedMoneyGift == const $CopyWithPlaceholder() ||
              formattedMoneyGift == null
          ? _value.formattedMoneyGift
          // ignore: cast_nullable_to_non_nullable
          : formattedMoneyGift as String,
      attendEventDetail: attendEventDetail == const $CopyWithPlaceholder() ||
              attendEventDetail == null
          ? _value.attendEventDetail
          // ignore: cast_nullable_to_non_nullable
          : attendEventDetail as AttendEventDetail,
      travelTime:
          travelTime == const $CopyWithPlaceholder() || travelTime == null
              ? _value.travelTime
              // ignore: cast_nullable_to_non_nullable
              : travelTime as int,
      currentTimeInMinutes:
          currentTimeInMinutes == const $CopyWithPlaceholder() ||
                  currentTimeInMinutes == null
              ? _value.currentTimeInMinutes
              // ignore: cast_nullable_to_non_nullable
              : currentTimeInMinutes as int,
    );
  }
}

extension $AttendableEventDialogDataCopyWith on AttendableEventDialogData {
  /// Returns a callable class that can be used as follows: `instanceOfAttendableEventDialogData.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$AttendableEventDialogDataCWProxy get copyWith =>
      _$AttendableEventDialogDataCWProxyImpl(this);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$attendableEventDialogViewModelHash() =>
    r'3f738edc497d42ca8d55a8edce4a7551d7885b62';

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

abstract class _$AttendableEventDialogViewModel
    extends BuildlessAutoDisposeAsyncNotifier<AttendableEventDialogData?> {
  late final EventPersonPair eventPersonPair;

  FutureOr<AttendableEventDialogData?> build({
    required EventPersonPair eventPersonPair,
  });
}

/// See also [AttendableEventDialogViewModel].
@ProviderFor(AttendableEventDialogViewModel)
const attendableEventDialogViewModelProvider =
    AttendableEventDialogViewModelFamily();

/// See also [AttendableEventDialogViewModel].
class AttendableEventDialogViewModelFamily
    extends Family<AsyncValue<AttendableEventDialogData?>> {
  /// See also [AttendableEventDialogViewModel].
  const AttendableEventDialogViewModelFamily();

  /// See also [AttendableEventDialogViewModel].
  AttendableEventDialogViewModelProvider call({
    required EventPersonPair eventPersonPair,
  }) {
    return AttendableEventDialogViewModelProvider(
      eventPersonPair: eventPersonPair,
    );
  }

  @override
  AttendableEventDialogViewModelProvider getProviderOverride(
    covariant AttendableEventDialogViewModelProvider provider,
  ) {
    return call(
      eventPersonPair: provider.eventPersonPair,
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
  String? get name => r'attendableEventDialogViewModelProvider';
}

/// See also [AttendableEventDialogViewModel].
class AttendableEventDialogViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AttendableEventDialogViewModel,
        AttendableEventDialogData?> {
  /// See also [AttendableEventDialogViewModel].
  AttendableEventDialogViewModelProvider({
    required EventPersonPair eventPersonPair,
  }) : this._internal(
          () => AttendableEventDialogViewModel()
            ..eventPersonPair = eventPersonPair,
          from: attendableEventDialogViewModelProvider,
          name: r'attendableEventDialogViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$attendableEventDialogViewModelHash,
          dependencies: AttendableEventDialogViewModelFamily._dependencies,
          allTransitiveDependencies:
              AttendableEventDialogViewModelFamily._allTransitiveDependencies,
          eventPersonPair: eventPersonPair,
        );

  AttendableEventDialogViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eventPersonPair,
  }) : super.internal();

  final EventPersonPair eventPersonPair;

  @override
  FutureOr<AttendableEventDialogData?> runNotifierBuild(
    covariant AttendableEventDialogViewModel notifier,
  ) {
    return notifier.build(
      eventPersonPair: eventPersonPair,
    );
  }

  @override
  Override overrideWith(AttendableEventDialogViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: AttendableEventDialogViewModelProvider._internal(
        () => create()..eventPersonPair = eventPersonPair,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        eventPersonPair: eventPersonPair,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AttendableEventDialogViewModel,
      AttendableEventDialogData?> createElement() {
    return _AttendableEventDialogViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AttendableEventDialogViewModelProvider &&
        other.eventPersonPair == eventPersonPair;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eventPersonPair.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AttendableEventDialogViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<AttendableEventDialogData?> {
  /// The parameter `eventPersonPair` of this provider.
  EventPersonPair get eventPersonPair;
}

class _AttendableEventDialogViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        AttendableEventDialogViewModel,
        AttendableEventDialogData?> with AttendableEventDialogViewModelRef {
  _AttendableEventDialogViewModelProviderElement(super.provider);

  @override
  EventPersonPair get eventPersonPair =>
      (origin as AttendableEventDialogViewModelProvider).eventPersonPair;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
