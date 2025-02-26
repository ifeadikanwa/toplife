import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/check/check_if_list_contains_familial_platonic_relationship_type.dart';

void main() {
  group("checkIfListContainsFamilialPlatonicRelationshipType:", () {
    test(
        "if the list contains at least one we get true",
        () => expect(
              checkIfListContainsFamilialPlatonicRelationshipType(
                platonicRelationshipTypesList: [
                  PlatonicRelationshipType.acquaintance,
                  PlatonicRelationshipType.adoptiveChild,
                  PlatonicRelationshipType.stepChildInLaw,
                ],
              ),
              true,
            ));

    test(
        "if the list contains none we get false",
        () => expect(
              checkIfListContainsFamilialPlatonicRelationshipType(
                platonicRelationshipTypesList: [
                  PlatonicRelationshipType.acquaintance,
                  PlatonicRelationshipType.parentInLaw,
                  PlatonicRelationshipType.stepParent,
                ],
                excludeAllStepParentTypes: true,
              ),
              false,
            ));

    test(
        "if the list is empty we get false",
        () => expect(
              checkIfListContainsFamilialPlatonicRelationshipType(
                platonicRelationshipTypesList: [],
              ),
              false,
            ));
  });
}
