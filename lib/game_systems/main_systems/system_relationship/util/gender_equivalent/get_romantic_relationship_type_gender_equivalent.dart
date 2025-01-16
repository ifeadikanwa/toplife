import 'package:toplife/game_systems/main_systems/system_person/constants/gender.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/romantic_relationship_type.dart';

String getRomanticRelationshipTypeGenderEquivalent(
  RomanticRelationshipType romanticRelationshipType,
  String genderString,
) {
  //if female gender
  if (genderString == Gender.Female.name) {
    return romanticRelationshipType.femaleEquivalent;
  } else {
    return romanticRelationshipType.maleEquivalent;
  }
}
