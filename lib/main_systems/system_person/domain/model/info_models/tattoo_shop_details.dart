import 'package:equatable/equatable.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_body_location.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_shop.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_size.dart';

class TattooShopDetails extends Equatable {
  final TattooShop tattooShop;
  final TattooSize tattooSize;
  final TattooBodyLocation tattooBodyLocation;

  const TattooShopDetails({
    required this.tattooShop,
    required this.tattooSize,
    required this.tattooBodyLocation,
  });

  @override
  List<Object?> get props => [
        tattooShop,
        tattooSize,
        tattooBodyLocation,
      ];

  TattooShopDetails copyWith({
    TattooShop? tattooShop,
    TattooSize? tattooSize,
    TattooBodyLocation? tattooBodyLocation,
  }) {
    return TattooShopDetails(
      tattooShop: tattooShop ?? this.tattooShop,
      tattooSize: tattooSize ?? this.tattooSize,
      tattooBodyLocation: tattooBodyLocation ?? this.tattooBodyLocation,
    );
  }
}
