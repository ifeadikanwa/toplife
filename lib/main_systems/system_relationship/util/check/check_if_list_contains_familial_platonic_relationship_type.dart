import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/check/check_if_familial_platonic_relationship_type.dart';

bool checkIfListContainsFamilialPlatonicRelationshipType({
  required List<PlatonicRelationshipType> platonicRelationshipTypesList,
  bool excludeAllStepParentTypes = false,
  bool excludeDistantRelatives = false,
}) {
  //true if any relationship type on the list is familial
  return platonicRelationshipTypesList.any(
    (platonicRelationshipType) => checkIfFamilialPlatonicRelationshipType(
      platonicRelationshipType: platonicRelationshipType,
      excludeAllStepParentTypes: excludeAllStepParentTypes,
      excludeDistantRelatives: excludeDistantRelatives,
    ),
  );
}
