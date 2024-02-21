import 'package:equatable/equatable.dart';
import 'package:toplife/main_systems/system_person/constants/piercing/piercing_body_location.dart';

class ChosenAndAvailablePiercingLocationsPair extends Equatable {
  final PiercingBodyLocation chosenPiercingLocation;
  final List<PiercingBodyLocation> availablePiercingLocations;

  const ChosenAndAvailablePiercingLocationsPair({
    required this.chosenPiercingLocation,
    required this.availablePiercingLocations,
  });

  @override
  List<Object?> get props => [
        chosenPiercingLocation,
        availablePiercingLocations,
      ];
}
