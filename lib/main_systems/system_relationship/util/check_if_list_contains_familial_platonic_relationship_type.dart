import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/check_if_familial_platonic_relationship_type.dart';

bool checkIfListContainsFamilialPlatonicRelationshipType(
  List<PlatonicRelationshipType> platonicRelationshipTypesList,
) {
  //true if any relationship type on the list is familial
  return platonicRelationshipTypesList.any(
    (platonicRelationshipType) =>
        checkIfFamilialPlatonicRelationshipType(platonicRelationshipType),
  );
}
