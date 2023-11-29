import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_constants.dart';

String getDbFormattedPlatonicRelationshipTypeString(
    PlatonicRelationshipType platonicRelationshipType) {
      //added extra space in front because the database search query is returning strings that contains the substring we are looking for
      //example a search for "grandchild, " will return  "greatgrandchild, " because inside it we have the string we are looking for 
      //the extra space in front will prevent the above
  return " ${platonicRelationshipType.name}${RelationshipConstants.dbRelationshipTypeSeparator}";
}
