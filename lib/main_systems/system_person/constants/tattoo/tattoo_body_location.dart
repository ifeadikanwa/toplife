//Lowest multiplier: *1
//Highest multiplier: *10
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_constants.dart';

enum TattooBodyLocation {
  armpit(
    presentationName: "Armpit",
    basePrice: TattooConstants.lowestTattooLocationBasePrice * 5,
  ),
  ribcage(
    presentationName: "Rib Cage",
    basePrice: TattooConstants.lowestTattooLocationBasePrice * 3,
  ),
  ankle(
    presentationName: "Ankle",
    basePrice: TattooConstants.lowestTattooLocationBasePrice * 2,
  ),
  breast(
    presentationName: "Breast",
    basePrice: TattooConstants.lowestTattooLocationBasePrice * 8,
  ),
  chest(
    presentationName: "Chest",
    basePrice: TattooConstants.lowestTattooLocationBasePrice * 4,
  ),
  butt(
    presentationName: "Butt",
    basePrice: TattooConstants.lowestTattooLocationBasePrice * 7,
  ),
  upperArm(
    presentationName: "Upper Arm",
    basePrice: TattooConstants.lowestTattooLocationBasePrice * 5,
  ),
  foreArm(
    presentationName: "Fore Arm",
    basePrice: TattooConstants.lowestTattooLocationBasePrice * 5,
  ),
  back(
    presentationName: "Back",
    basePrice: TattooConstants.lowestTattooLocationBasePrice * 10,
  ),
  leg(
    presentationName: "Leg",
    basePrice: TattooConstants.lowestTattooLocationBasePrice * 10,
  ),
  shoulder(
    presentationName: "Shoulder",
    basePrice: TattooConstants.lowestTattooLocationBasePrice * 3,
  ),
  thigh(
    presentationName: "Thigh",
    basePrice: TattooConstants.lowestTattooLocationBasePrice * 7,
  ),
  elbow(
    presentationName: "Elbow",
    basePrice: TattooConstants.lowestTattooLocationBasePrice * 6,
  ),
  hip(
    presentationName: "Hip",
    basePrice: TattooConstants.lowestTattooLocationBasePrice * 2,
  ),
  neck(
    presentationName: "Neck",
    basePrice: TattooConstants.lowestTattooLocationBasePrice * 3,
  ),
  spine(
    presentationName: "Spine",
    basePrice: TattooConstants.lowestTattooLocationBasePrice * 4,
  ),
  face(
    presentationName: "Face",
    basePrice: TattooConstants.lowestTattooLocationBasePrice * 8,
  ),
  head(
    presentationName: "Head",
    basePrice: TattooConstants.lowestTattooLocationBasePrice * 10,
  ),
  hand(
    presentationName: "Hand",
    basePrice: TattooConstants.lowestTattooLocationBasePrice * 1,
  ),
  stomach(
    presentationName: "Stomach",
    basePrice: TattooConstants.lowestTattooLocationBasePrice * 6,
  );

  const TattooBodyLocation({
    required this.presentationName,
    required this.basePrice,
  });

  final String presentationName;
  final int basePrice;
}
