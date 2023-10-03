import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_constants.dart';

String getDbFormattedPlatonicRelationshipTypeString(PlatonicRelationshipType platonicRelationshipType){
return "${platonicRelationshipType.name}${RelationshipConstants.relationshipTypeSeparator}";
}