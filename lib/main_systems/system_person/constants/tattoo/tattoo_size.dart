
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_constants.dart';

enum TattooSize {
  small(
    presentationName: "Small",
    basePrice: TattooConstants.lowestTattooSizeBasePrice,
  ),
  medium(
    presentationName: "Medium",
    basePrice: TattooConstants.lowestTattooSizeBasePrice * 4,
  ),

  large(
    presentationName: "Large",
    basePrice: TattooConstants.lowestTattooSizeBasePrice * 8,
  ),
  ;

  const TattooSize({
    required this.presentationName,
    required this.basePrice,
  });

  final String presentationName;
  final int basePrice;
}
