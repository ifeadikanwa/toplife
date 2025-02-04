// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_action_dialog_view_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SleepActionDialogDataCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SleepActionDialogData(...).copyWith(id: 12, name: "My name")
  /// ````
  SleepActionDialogData call({
    int? hours,
    int? minutes,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSleepActionDialogData.copyWith(...)`.
class _$SleepActionDialogDataCWProxyImpl
    implements _$SleepActionDialogDataCWProxy {
  const _$SleepActionDialogDataCWProxyImpl(this._value);

  final SleepActionDialogData _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SleepActionDialogData(...).copyWith(id: 12, name: "My name")
  /// ````
  SleepActionDialogData call({
    Object? hours = const $CopyWithPlaceholder(),
    Object? minutes = const $CopyWithPlaceholder(),
  }) {
    return SleepActionDialogData(
      hours: hours == const $CopyWithPlaceholder() || hours == null
          ? _value.hours
          // ignore: cast_nullable_to_non_nullable
          : hours as int,
      minutes: minutes == const $CopyWithPlaceholder() || minutes == null
          ? _value.minutes
          // ignore: cast_nullable_to_non_nullable
          : minutes as int,
    );
  }
}

extension $SleepActionDialogDataCopyWith on SleepActionDialogData {
  /// Returns a callable class that can be used as follows: `instanceOfSleepActionDialogData.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SleepActionDialogDataCWProxy get copyWith =>
      _$SleepActionDialogDataCWProxyImpl(this);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sleepActionDialogViewModelHash() =>
    r'c41862d7d33c18ced0206821f5767efa11fa1d2c';

/// See also [SleepActionDialogViewModel].
@ProviderFor(SleepActionDialogViewModel)
final sleepActionDialogViewModelProvider = AutoDisposeNotifierProvider<
    SleepActionDialogViewModel, SleepActionDialogData>.internal(
  SleepActionDialogViewModel.new,
  name: r'sleepActionDialogViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sleepActionDialogViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SleepActionDialogViewModel
    = AutoDisposeNotifier<SleepActionDialogData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
