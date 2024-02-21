import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

//temp familial relationship is step or inlaw relationship
bool checkIfPlatonicRelationshipTypeStringContains(
  String platonicRelationshipTypeString,
  PlatonicRelationshipType platonicRelationshipType,
) {
  return platonicRelationshipTypeString.contains(
    getDbFormattedPlatonicRelationshipTypeString(
      platonicRelationshipType,
    ),
  );
}
