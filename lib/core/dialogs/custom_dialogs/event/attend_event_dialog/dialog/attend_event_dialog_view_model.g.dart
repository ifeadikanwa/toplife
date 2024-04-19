// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attend_event_dialog_view_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AttendEventDialogDataCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// AttendEventDialogData(...).copyWith(id: 12, name: "My name")
  /// ````
  AttendEventDialogData call({
    String? formattedMoneyGift,
    int? maxPlayerMoney,
    List<bool>? attendWithOptions,
    List<StoreroomItemPair>? giftOptionsInStorage,
    AttendEventDetail? attendEventDetail,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAttendEventDialogData.copyWith(...)`.
class _$AttendEventDialogDataCWProxyImpl
    implements _$AttendEventDialogDataCWProxy {
  const _$AttendEventDialogDataCWProxyImpl(this._value);

  final AttendEventDialogData _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// AttendEventDialogData(...).copyWith(id: 12, name: "My name")
  /// ````
  AttendEventDialogData call({
    Object? formattedMoneyGift = const $CopyWithPlaceholder(),
    Object? maxPlayerMoney = const $CopyWithPlaceholder(),
    Object? attendWithOptions = const $CopyWithPlaceholder(),
    Object? giftOptionsInStorage = const $CopyWithPlaceholder(),
    Object? attendEventDetail = const $CopyWithPlaceholder(),
  }) {
    return AttendEventDialogData(
      formattedMoneyGift: formattedMoneyGift == const $CopyWithPlaceholder() ||
              formattedMoneyGift == null
          ? _value.formattedMoneyGift
          // ignore: cast_nullable_to_non_nullable
          : formattedMoneyGift as String,
      maxPlayerMoney: maxPlayerMoney == const $CopyWithPlaceholder() ||
              maxPlayerMoney == null
          ? _value.maxPlayerMoney
          // ignore: cast_nullable_to_non_nullable
          : maxPlayerMoney as int,
      attendWithOptions: attendWithOptions == const $CopyWithPlaceholder() ||
              attendWithOptions == null
          ? _value.attendWithOptions
          // ignore: cast_nullable_to_non_nullable
          : attendWithOptions as List<bool>,
      giftOptionsInStorage:
          giftOptionsInStorage == const $CopyWithPlaceholder() ||
                  giftOptionsInStorage == null
              ? _value.giftOptionsInStorage
              // ignore: cast_nullable_to_non_nullable
              : giftOptionsInStorage as List<StoreroomItemPair>,
      attendEventDetail: attendEventDetail == const $CopyWithPlaceholder() ||
              attendEventDetail == null
          ? _value.attendEventDetail
          // ignore: cast_nullable_to_non_nullable
          : attendEventDetail as AttendEventDetail,
    );
  }
}

extension $AttendEventDialogDataCopyWith on AttendEventDialogData {
  /// Returns a callable class that can be used as follows: `instanceOfAttendEventDialogData.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$AttendEventDialogDataCWProxy get copyWith =>
      _$AttendEventDialogDataCWProxyImpl(this);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$attendEventDialogViewModelHash() =>
    r'f9eaef5bd86e41005b8a1ff41e14a13a61dedfc3';

/// See also [AttendEventDialogViewModel].
@ProviderFor(AttendEventDialogViewModel)
final attendEventDialogViewModelProvider = AutoDisposeAsyncNotifierProvider<
    AttendEventDialogViewModel, AttendEventDialogData?>.internal(
  AttendEventDialogViewModel.new,
  name: r'attendEventDialogViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$attendEventDialogViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AttendEventDialogViewModel
    = AutoDisposeAsyncNotifier<AttendEventDialogData?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
