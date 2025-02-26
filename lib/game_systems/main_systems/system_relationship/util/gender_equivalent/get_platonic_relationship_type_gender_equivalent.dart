import 'package:toplife/game_systems/main_systems/system_person/constants/gender.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';

String getPlatonicRelationshipTypeGenderEquivalent(
  PlatonicRelationshipType platonicRelationshipType,
  String genderString,
) {
  //if female gender
  if (genderString == Gender.Female.name) {
    return platonicRelationshipType.femaleEquivalent;
  } else {
    return platonicRelationshipType.maleEquivalent;
  }
}
