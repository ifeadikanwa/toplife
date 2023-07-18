import 'package:toplife/main_systems/system_person/constants/piercing/piercing_constants.dart';

//Lowest multiplier: *1
//Highest multiplier: *5
enum PiercingBodyLocation {
  ears(
    presentationName: "Ears",
    basePrice: PiercingConstants.lowestPiercingBasePrice * 1,
  ),
  rightEyebrow(
    presentationName: "Right Eyebrow",
    basePrice: PiercingConstants.lowestPiercingBasePrice * 4,
  ),
  leftEyebrow(
    presentationName: "Left Eyebrow",
    basePrice: PiercingConstants.lowestPiercingBasePrice * 4,
  ),
  navel(
    presentationName: "Navel",
    basePrice: PiercingConstants.lowestPiercingBasePrice * 3,
  ),
  tongue(
    presentationName: "Tongue",
    basePrice: PiercingConstants.lowestPiercingBasePrice * 5,
  ),
  lips(
    presentationName: "Lips",
    basePrice: PiercingConstants.lowestPiercingBasePrice * 2,
  ),
  rightNostril(
    presentationName: "Right Nostril",
    basePrice: PiercingConstants.lowestPiercingBasePrice * 2,
  ),
  leftNostril(
    presentationName: "Left Nostril",
    basePrice: PiercingConstants.lowestPiercingBasePrice * 2,
  ),
  nasalSeptum(
    presentationName: "Nasal Septum",
    basePrice: PiercingConstants.lowestPiercingBasePrice * 2,
  ),
  rightCheek(
    presentationName: "Right Cheek",
    basePrice: PiercingConstants.lowestPiercingBasePrice * 3,
  ),
  leftCheek(
    presentationName: "Left Cheek",
    basePrice: PiercingConstants.lowestPiercingBasePrice * 3,
  ),
  gum(
    presentationName: "Gum",
    basePrice: PiercingConstants.lowestPiercingBasePrice * 5,
  );

  const PiercingBodyLocation({
    required this.presentationName,
    required this.basePrice,
  });

  final String presentationName;
  final int basePrice;
}
