import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_constants.dart';

void main() {
  group("Relationship constants:", () {
    test(
      "db relationship type separator is correct",
      () => expect(RelationshipConstants.dbRelationshipTypeSeparator, ", "),
    );

    test(
      "relationship label separator is correct",
      () => expect(RelationshipConstants.relationshipLabelSeparator, "/"),
    );

    test(
      "default previous familial relationship is correct",
      () =>
          expect(RelationshipConstants.defaultPreviousFamilialRelationship, ""),
    );

    test(
      "step temporary familial relationship keyword is correct",
      () => expect(
          RelationshipConstants.stepTemporaryFamilialRelationshipKeyword,
          "step"),
    );

    test(
      "inLaw temporary familial relationship keyword is correct",
      () => expect(
          RelationshipConstants.inLawTemporaryFamilialRelationshipKeyword,
          "inLaw"),
    );

    test(
      "default relationship level is correct",
      () => expect(RelationshipConstants.defaultRelationshipLevel, 0),
    );
  });
}
