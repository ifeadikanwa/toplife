import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/relationship_constants.dart';

//converts db string to enum
//db string has special formatting so we have to account for that
List<PlatonicRelationshipType>? getPlatonicRelationshipTypeEnumFromString({
  required String platonicRelationshipTypeString,
}) {
  //split the string using the db type separator
  final List<String> rawPlatonicTypesStringList =
      platonicRelationshipTypeString.split(
    RelationshipConstants.dbRelationshipTypeSeparator,
  );

  //split the string using the db type separator
  final List<String> finalPlatonicTypesStringList = [];

  //remove extra whitespace from every string 
  //and add to the final list
  for (var rawTypeString in rawPlatonicTypesStringList) {
    finalPlatonicTypesStringList.add(rawTypeString.trim());
  }

  //create a set to store converted values
  final Set<PlatonicRelationshipType> platonicTypesEnumsSet = {};

  //map to use for conversion
  final Map<String, PlatonicRelationshipType> platonicRelationshipTypeMap =
      PlatonicRelationshipType.values.asNameMap();

  //for each type string, convert to enum
  for (var platonicTypeString in finalPlatonicTypesStringList) {
    //convert
    final PlatonicRelationshipType? platonicRelationshipTypeEnum =
        platonicRelationshipTypeMap[platonicTypeString];

    //if it is a valid type, add to the set
    if (platonicRelationshipTypeEnum != null) {
      platonicTypesEnumsSet.add(platonicRelationshipTypeEnum);
    }
  }

  //return null if no valid enum was found, if valid enums were found return the list
  return (platonicTypesEnumsSet.isEmpty)
      ? null
      : platonicTypesEnumsSet.toList();
}
