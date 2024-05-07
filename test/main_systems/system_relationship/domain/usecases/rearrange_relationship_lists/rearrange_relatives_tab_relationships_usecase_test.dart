import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/sectioned_list/section_data.dart';
import 'package:toplife/core/utils/sectioned_list/sectioned_list.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/rearrange_relationship_lists/rearrange_relatives_tab_relationships_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

import '../../../../_reusable_test_objects/reusable_test_objects.dart';

void main() {
  group('rearrange relatives tab relationships usecase:', () {
    final testRelationshipPairs = [
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.cousin,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.stepPibling,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.stepCousin,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.greatGrandCousin,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.stepGrandCousin,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.pibling,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.grandCousin,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.stepGreatGrandCousin,
        )),
      ),
    ];

    test('given a list of relationships we get the correct result', () {
      final result = RearrangeRelativesTabRelationshipsUsecase().execute(
        relativesTabRelationships: testRelationshipPairs,
      );

      expect(
          result,
          Sectioned<PersonRelationshipPair>([
            SectionData(
              title: TextConstants.unclesAndAunts,
              content: [
                testRelationshipPairs[1],
                testRelationshipPairs[5],
              ],
            ),
            SectionData(
              title: TextConstants.cousins,
              content: [
                testRelationshipPairs[0],
                testRelationshipPairs[2],
              ],
            ),
            SectionData(
              title: TextConstants.grandCousins,
              content: [
                testRelationshipPairs[4],
                testRelationshipPairs[6],
              ],
            ),
            SectionData(
              title: TextConstants.greatGrandCousins,
              content: [
                testRelationshipPairs[3],
                testRelationshipPairs[7],
              ],
            ),
          ]));
    });
  });
}
