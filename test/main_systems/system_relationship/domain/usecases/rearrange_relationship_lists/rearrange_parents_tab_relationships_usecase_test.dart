import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/sectioned_list/section_data.dart';
import 'package:toplife/core/utils/sectioned_list/sectioned_list.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/rearrange_relationship_lists/rearrange_parents_tab_relationships_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

import '../../../../_reusable_test_objects/reusable_test_objects.dart';

void main() {
  group('Rearrange parents tab relationships usecase:', () {
    final testRelationshipPairs = [
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.stepGreatGrandParent,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.grandParent,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.greatGrandParent,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.stepGrandParent,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.birthParent,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.stepParent,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.adoptiveParent,
        )),
      ),
    ];

    test('given a list of relationships we get the correct result', () {
      final result = RearrangeParentsTabRelationshipsUsecase().execute(
        parentsTabRelationships: testRelationshipPairs,
      );

      expect(
          result,
          Sectioned<PersonRelationshipPair>([
            SectionData(
              title: TextConstants.parents,
              content: [
                testRelationshipPairs[4],
                testRelationshipPairs[5],
                testRelationshipPairs[6],
              ],
            ),
            SectionData(
              title: TextConstants.grandparents,
              content: [
                testRelationshipPairs[1],
                testRelationshipPairs[3],
              ],
            ),
            SectionData(
              title: TextConstants.greatGrandparents,
              content: [
                testRelationshipPairs[0],
                testRelationshipPairs[2],
              ],
            ),
          ]));
    });
  });
}
