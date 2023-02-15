import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/relationship_traits_constants.dart';

void main() {
  group("Relationship traits constants:", () {
    test("willProvideHelp returns true if helpfulness is 1", () {
      expect(RelationshipTraitsConstants.willProvideHelp(helpfulness: 1), true);
    });

    test("willProvideHelp returns true or false if helpfulness is 2", () {
      expect(
          // ignore: unnecessary_type_check
          RelationshipTraitsConstants.willProvideHelp(helpfulness: 2) is bool,
          true);
    });

    test("willProvideHelp returns false if helpfulness is 3", () {
      expect(
          RelationshipTraitsConstants.willProvideHelp(helpfulness: 3), false);
    });

    test("willProvideHelp returns false if helpfulness is not within 1-3 range",
        () {
      expect(
          RelationshipTraitsConstants.willProvideHelp(helpfulness: 4), false);
    });

    group("Constants", () {
      test("possibleHelpfulness values should be defined as this range", () {
        expect(RelationshipTraitsConstants.possibleHelpfulness, [1, 2, 3]);
      });

      test(
          "setHelpfulness values should return value in possibleHelpfulness range",
          () {
        assert(RelationshipTraitsConstants.possibleHelpfulness
            .contains(RelationshipTraitsConstants.getValidHelpfulnessValue()));
      });
    });
  });
}
