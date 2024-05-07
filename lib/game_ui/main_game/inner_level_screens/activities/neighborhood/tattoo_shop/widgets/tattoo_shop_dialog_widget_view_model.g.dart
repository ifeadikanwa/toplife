// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tattoo_shop_dialog_widget_view_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TattooShopWidgetDataCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// TattooShopWidgetData(...).copyWith(id: 12, name: "My name")
  /// ````
  TattooShopWidgetData call({
    TattooShop? tattooShop,
    TattooSize? tattooSize,
    TattooBodyLocation? tattooBodyLocation,
    String? chosenTattooPrice,
    String? tattooDuration,
    int? tattooDescriptionLength,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTattooShopWidgetData.copyWith(...)`.
class _$TattooShopWidgetDataCWProxyImpl
    implements _$TattooShopWidgetDataCWProxy {
  const _$TattooShopWidgetDataCWProxyImpl(this._value);

  final TattooShopWidgetData _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// TattooShopWidgetData(...).copyWith(id: 12, name: "My name")
  /// ````
  TattooShopWidgetData call({
    Object? tattooShop = const $CopyWithPlaceholder(),
    Object? tattooSize = const $CopyWithPlaceholder(),
    Object? tattooBodyLocation = const $CopyWithPlaceholder(),
    Object? chosenTattooPrice = const $CopyWithPlaceholder(),
    Object? tattooDuration = const $CopyWithPlaceholder(),
    Object? tattooDescriptionLength = const $CopyWithPlaceholder(),
  }) {
    return TattooShopWidgetData(
      tattooShop:
          tattooShop == const $CopyWithPlaceholder() || tattooShop == null
              ? _value.tattooShop
              // ignore: cast_nullable_to_non_nullable
              : tattooShop as TattooShop,
      tattooSize:
          tattooSize == const $CopyWithPlaceholder() || tattooSize == null
              ? _value.tattooSize
              // ignore: cast_nullable_to_non_nullable
              : tattooSize as TattooSize,
      tattooBodyLocation: tattooBodyLocation == const $CopyWithPlaceholder() ||
              tattooBodyLocation == null
          ? _value.tattooBodyLocation
          // ignore: cast_nullable_to_non_nullable
          : tattooBodyLocation as TattooBodyLocation,
      chosenTattooPrice: chosenTattooPrice == const $CopyWithPlaceholder() ||
              chosenTattooPrice == null
          ? _value.chosenTattooPrice
          // ignore: cast_nullable_to_non_nullable
          : chosenTattooPrice as String,
      tattooDuration: tattooDuration == const $CopyWithPlaceholder() ||
              tattooDuration == null
          ? _value.tattooDuration
          // ignore: cast_nullable_to_non_nullable
          : tattooDuration as String,
      tattooDescriptionLength:
          tattooDescriptionLength == const $CopyWithPlaceholder() ||
                  tattooDescriptionLength == null
              ? _value.tattooDescriptionLength
              // ignore: cast_nullable_to_non_nullable
              : tattooDescriptionLength as int,
    );
  }
}

extension $TattooShopWidgetDataCopyWith on TattooShopWidgetData {
  /// Returns a callable class that can be used as follows: `instanceOfTattooShopWidgetData.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$TattooShopWidgetDataCWProxy get copyWith =>
      _$TattooShopWidgetDataCWProxyImpl(this);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tattooShopDialogWidgetViewModelHash() =>
    r'49952881feb1285d446d4b99fb54da2aa6c297f3';

/// See also [TattooShopDialogWidgetViewModel].
@ProviderFor(TattooShopDialogWidgetViewModel)
final tattooShopDialogWidgetViewModelProvider =
    AutoDisposeAsyncNotifierProvider<TattooShopDialogWidgetViewModel,
        TattooShopWidgetData>.internal(
  TattooShopDialogWidgetViewModel.new,
  name: r'tattooShopDialogWidgetViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tattooShopDialogWidgetViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TattooShopDialogWidgetViewModel
    = AutoDisposeAsyncNotifier<TattooShopWidgetData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
