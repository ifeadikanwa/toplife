import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/sectioned_list/section_data.dart';
import 'package:toplife/core/utils/sectioned_list/sectioned_list.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/rearrange_relationship_lists/rearrange_inlaws_tab_relationships_usecase.dart';
import 'package:toplife/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

import '../../../../_reusable_test_objects/reusable_test_objects.dart';

void main() {
  group('rearrange inlaws tab relationships usecase: ', () {
    final testRelationshipPairs = [
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.siblingInLaw,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.stepSiblingInLaw,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.parentInLaw,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.childInLaw,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.stepChildInLaw,
        )),
      ),
    ];

    test('given a list of relationships we get the correct result', () {
      final result = RearrangeInLawsTabRelationshipsUsecase().execute(
        inLawsTabRelationships: testRelationshipPairs,
      );

      expect(
          result,
          Sectioned<PersonRelationshipPair>([
            SectionData(
              title: TextConstants.parentsInLaw,
              content: [
                testRelationshipPairs[2],
              ],
            ),
            SectionData(
              title: TextConstants.childrenInLaw,
              content: [
                testRelationshipPairs[3],
                testRelationshipPairs[4],
              ],
            ),
            SectionData(
              title: TextConstants.siblingsInLaw,
              content: [
                testRelationshipPairs[0],
                testRelationshipPairs[1],
              ],
            ),
          ]));
    });
  });
}
