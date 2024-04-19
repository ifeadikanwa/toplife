// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_planned_funeral_dialog_view_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PlayerPlannedFuneralDialogDataCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// PlayerPlannedFuneralDialogData(...).copyWith(id: 12, name: "My name")
  /// ````
  PlayerPlannedFuneralDialogData call({
    FuneralEventDetail? funeralEventDetail,
    String? funeralCostString,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPlayerPlannedFuneralDialogData.copyWith(...)`.
class _$PlayerPlannedFuneralDialogDataCWProxyImpl
    implements _$PlayerPlannedFuneralDialogDataCWProxy {
  const _$PlayerPlannedFuneralDialogDataCWProxyImpl(this._value);

  final PlayerPlannedFuneralDialogData _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// PlayerPlannedFuneralDialogData(...).copyWith(id: 12, name: "My name")
  /// ````
  PlayerPlannedFuneralDialogData call({
    Object? funeralEventDetail = const $CopyWithPlaceholder(),
    Object? funeralCostString = const $CopyWithPlaceholder(),
  }) {
    return PlayerPlannedFuneralDialogData(
      funeralEventDetail: funeralEventDetail == const $CopyWithPlaceholder() ||
              funeralEventDetail == null
          ? _value.funeralEventDetail
          // ignore: cast_nullable_to_non_nullable
          : funeralEventDetail as FuneralEventDetail,
      funeralCostString: funeralCostString == const $CopyWithPlaceholder() ||
              funeralCostString == null
          ? _value.funeralCostString
          // ignore: cast_nullable_to_non_nullable
          : funeralCostString as String,
    );
  }
}

extension $PlayerPlannedFuneralDialogDataCopyWith
    on PlayerPlannedFuneralDialogData {
  /// Returns a callable class that can be used as follows: `instanceOfPlayerPlannedFuneralDialogData.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$PlayerPlannedFuneralDialogDataCWProxy get copyWith =>
      _$PlayerPlannedFuneralDialogDataCWProxyImpl(this);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playerPlannedFuneralDialogViewModelHash() =>
    r'5668035cb1164e94ad4b48c5cedb2e5a0840d451';

/// See also [PlayerPlannedFuneralDialogViewModel].
@ProviderFor(PlayerPlannedFuneralDialogViewModel)
final playerPlannedFuneralDialogViewModelProvider =
    AutoDisposeAsyncNotifierProvider<PlayerPlannedFuneralDialogViewModel,
        PlayerPlannedFuneralDialogData>.internal(
  PlayerPlannedFuneralDialogViewModel.new,
  name: r'playerPlannedFuneralDialogViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$playerPlannedFuneralDialogViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PlayerPlannedFuneralDialogViewModel
    = AutoDisposeAsyncNotifier<PlayerPlannedFuneralDialogData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
