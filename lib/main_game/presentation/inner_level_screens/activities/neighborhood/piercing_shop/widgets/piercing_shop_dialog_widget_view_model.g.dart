// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'piercing_shop_dialog_widget_view_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PiercingShopWidgetDataCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// PiercingShopWidgetData(...).copyWith(id: 12, name: "My name")
  /// ````
  PiercingShopWidgetData call({
    PiercingBodyLocation? chosenPiercingLocation,
    List<PiercingBodyLocation>? availablePiercingLocations,
    String? chosenPiercingLocationPrice,
    String? piercingDuration,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPiercingShopWidgetData.copyWith(...)`.
class _$PiercingShopWidgetDataCWProxyImpl
    implements _$PiercingShopWidgetDataCWProxy {
  const _$PiercingShopWidgetDataCWProxyImpl(this._value);

  final PiercingShopWidgetData _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// PiercingShopWidgetData(...).copyWith(id: 12, name: "My name")
  /// ````
  PiercingShopWidgetData call({
    Object? chosenPiercingLocation = const $CopyWithPlaceholder(),
    Object? availablePiercingLocations = const $CopyWithPlaceholder(),
    Object? chosenPiercingLocationPrice = const $CopyWithPlaceholder(),
    Object? piercingDuration = const $CopyWithPlaceholder(),
  }) {
    return PiercingShopWidgetData(
      chosenPiercingLocation:
          chosenPiercingLocation == const $CopyWithPlaceholder() ||
                  chosenPiercingLocation == null
              ? _value.chosenPiercingLocation
              // ignore: cast_nullable_to_non_nullable
              : chosenPiercingLocation as PiercingBodyLocation,
      availablePiercingLocations:
          availablePiercingLocations == const $CopyWithPlaceholder() ||
                  availablePiercingLocations == null
              ? _value.availablePiercingLocations
              // ignore: cast_nullable_to_non_nullable
              : availablePiercingLocations as List<PiercingBodyLocation>,
      chosenPiercingLocationPrice:
          chosenPiercingLocationPrice == const $CopyWithPlaceholder() ||
                  chosenPiercingLocationPrice == null
              ? _value.chosenPiercingLocationPrice
              // ignore: cast_nullable_to_non_nullable
              : chosenPiercingLocationPrice as String,
      piercingDuration: piercingDuration == const $CopyWithPlaceholder() ||
              piercingDuration == null
          ? _value.piercingDuration
          // ignore: cast_nullable_to_non_nullable
          : piercingDuration as String,
    );
  }
}

extension $PiercingShopWidgetDataCopyWith on PiercingShopWidgetData {
  /// Returns a callable class that can be used as follows: `instanceOfPiercingShopWidgetData.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$PiercingShopWidgetDataCWProxy get copyWith =>
      _$PiercingShopWidgetDataCWProxyImpl(this);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$piercingShopDialogWidgetViewModelHash() =>
    r'f96ec89505f135002d5a62a7760434355e9ef668';

/// See also [PiercingShopDialogWidgetViewModel].
@ProviderFor(PiercingShopDialogWidgetViewModel)
final piercingShopDialogWidgetViewModelProvider =
    AutoDisposeAsyncNotifierProvider<PiercingShopDialogWidgetViewModel,
        PiercingShopWidgetData?>.internal(
  PiercingShopDialogWidgetViewModel.new,
  name: r'piercingShopDialogWidgetViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$piercingShopDialogWidgetViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PiercingShopDialogWidgetViewModel
    = AutoDisposeAsyncNotifier<PiercingShopWidgetData?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
