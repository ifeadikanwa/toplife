import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_constants.dart';

enum TattooSize {
  small(
      presentationName: "Small",
      basePrice: TattooConstants.lowestTattooSizeBasePrice,
      durationInMinutes: DurationTimeInMinutes.twoHours),
  medium(
      presentationName: "Medium",
      basePrice: TattooConstants.lowestTattooSizeBasePrice * 4,
      durationInMinutes: DurationTimeInMinutes.threeHours),

  large(
      presentationName: "Large",
      basePrice: TattooConstants.lowestTattooSizeBasePrice * 8,
      durationInMinutes: DurationTimeInMinutes.fourHours),
  ;

  const TattooSize({
    required this.presentationName,
    required this.basePrice,
    required this.durationInMinutes,
  });

  final String presentationName;
  final int basePrice;
  final int durationInMinutes;
}
