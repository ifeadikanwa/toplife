import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/sectioned_list/section_data.dart';
import 'package:toplife/core/utils/sectioned_list/sectioned_list.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/rearrange_relationship_lists/rearrange_siblings_tab_relationships_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

import '../../../../_reusable_test_objects/reusable_test_objects.dart';

void main() {
  group('rearrange siblings tab relationships usecase: ', () {
    final testRelationshipPairs = [
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.nibling,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.fullSibling,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.stepNibling,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.halfSibling,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.greatGrandNibling,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.stepGrandNibling,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.adoptiveSibling,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.stepGreatGrandNibling,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.grandNibling,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.stepSibling,
        )),
      ),
    ];

    test('given a list of relationships we get the correct result', () {
      final result = RearrangeSiblingsTabRelationshipsUsecase().execute(
        siblingsTabRelationships: testRelationshipPairs,
      );

      expect(
          result,
          Sectioned<PersonRelationshipPair>([
            SectionData(
              title: TextConstants.siblings,
              content: [
                testRelationshipPairs[1],
                testRelationshipPairs[3],
                testRelationshipPairs[6],
                testRelationshipPairs[9],
              ],
            ),
            SectionData(
              title: TextConstants.niecesAndNephews,
              content: [
                testRelationshipPairs[0],
                testRelationshipPairs[2],
              ],
            ),
            SectionData(
              title: TextConstants.grandNiecesAndNephews,
              content: [
                testRelationshipPairs[5],
                testRelationshipPairs[8],
              ],
            ),
            SectionData(
              title: TextConstants.greatGrandNiecesAndNephews,
              content: [
                testRelationshipPairs[4],
                testRelationshipPairs[7],
              ],
            ),
          ]));
    });
  });
}
