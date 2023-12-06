import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/sectioned_list/section_data.dart';
import 'package:toplife/core/utils/sectioned_list/sectioned_list.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/rearrange_relationship_lists/rearrange_childrens_tab_relationships_usecase.dart';
import 'package:toplife/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

import '../../../../_reusable_test_objects/reusable_test_objects.dart';

void main() {
  group('Rearrange childrens tab relationships usecase: ', () {
    final testRelationshipPairs = [
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.grandChild,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.stepGrandChild,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.birthChild,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.greatGrandChild,
        )),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.stepGreatGrandChild,
        )),
      ),
      PersonRelationshipPair(
          person: ReusableTestObjects.testPerson,
          relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
              PlatonicRelationshipType.adoptiveChild,
            ),
          )),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(
          PlatonicRelationshipType.stepChild,
        )),
      ),
    ];

    test('given a list of relationships we get the correct result', () {
      final result = RearrangeChildrensTabRelationshipsUsecase().execute(
        childrensTabRelationships: testRelationshipPairs,
      );

      expect(
          result,
          Sectioned<PersonRelationshipPair>([
            SectionData(
              title: TextConstants.children,
              content: [
                testRelationshipPairs[2],
                testRelationshipPairs[5],
                testRelationshipPairs[6],
              ],
            ),
            SectionData(
              title: TextConstants.grandchildren,
              content: [
                testRelationshipPairs[0],
                testRelationshipPairs[1],
              ],
            ),
            SectionData(
              title: TextConstants.greatGrandchildren,
              content: [
                testRelationshipPairs[3],
                testRelationshipPairs[4],
              ],
            ),
          ]));
    });
  });
}
