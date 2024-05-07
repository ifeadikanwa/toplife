import 'package:toplife/game_systems/main_systems/system_relationship/constants/relationship_constants.dart';

//temp familial relationship is step or inlaw relationship
bool checkIfPlatonicRelationshipTypeIsTemporaryFamilialRelationship({
  required String platonicRelationshipTypeString,
}) {
  final allLowerCasePlatonicRelationshipType =
      platonicRelationshipTypeString.toLowerCase();

  //if the string contains keyword for step or inLaw relationship -> true

  return (allLowerCasePlatonicRelationshipType.contains(RelationshipConstants
              .stepTemporaryFamilialRelationshipKeyword
              .toLowerCase()) |
          allLowerCasePlatonicRelationshipType.contains(RelationshipConstants
              .inLawTemporaryFamilialRelationshipKeyword
              .toLowerCase()))
      ? true
      : false;
}
