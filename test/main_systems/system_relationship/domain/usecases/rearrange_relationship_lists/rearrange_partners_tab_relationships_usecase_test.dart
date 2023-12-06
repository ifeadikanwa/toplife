import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/sectioned_list/section_data.dart';
import 'package:toplife/core/utils/sectioned_list/sectioned_list.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/rearrange_relationship_lists/rearrange_partners_tab_relationships_usecase.dart';

import '../../../../_reusable_test_objects/reusable_test_objects.dart';

void main() {
  group('rearrange partners tab relationships usecase:', () {
    final testRelationshipPairs = [
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
          activeRomance: true,
        ),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
          activeRomance: false,
          isCoParent: true,
        ),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
          activeRomance: false,
          isCoParent: false,
        ),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
          activeRomance: false,
          isCoParent: true,
        ),
      ),
      PersonRelationshipPair(
        person: ReusableTestObjects.testPerson,
        relationship: ReusableTestObjects.testRelationship.copyWith(
          activeRomance: true,
          isCoParent: true,
        ),
      ),
    ];

    test('given a list of relationships we get the correct result', () {
      final result = RearrangePartnersTabRelationshipsUsecase().execute(
        partnersTabRelationships: testRelationshipPairs,
      );

      expect(
          result,
          Sectioned<PersonRelationshipPair>([
            SectionData(
              title: TextConstants.partners,
              content: [
                testRelationshipPairs[0],
                testRelationshipPairs[4],
              ],
            ),
            SectionData(
              title: TextConstants.coparents,
              content: [
                testRelationshipPairs[1],
                testRelationshipPairs[3],
              ],
            ),
          ]));
    });
  });
}
