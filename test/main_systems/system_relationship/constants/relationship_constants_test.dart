import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/romantic_relationship_type.dart';

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
      "spaced relationship label separator is correct",
      () => expect(RelationshipConstants.spacedRelationshipLabelSeparator, " / "),
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

    test(
      "relationship template is correct",
      () => expect(
        RelationshipConstants.relationshipTemplate,
        Relationship(
          firstPersonId: DatabaseConstants.dummyId,
          secondPersonId: DatabaseConstants.dummyId,
          platonicRelationshipType: "",
          romanticRelationshipType: RomanticRelationshipType.none.name,
          previousFamilialRelationship:
              RelationshipConstants.defaultPreviousFamilialRelationship,
          interestedInRelationship: true,
          level: RelationshipConstants.defaultRelationshipLevel,
          activeRomance: false,
          isCoParent: false,
          romanceStartDay: 0,
          romanceEndDay: 0,
          romanceCumulativeDuration: 0,
          jointMoney: 0,
        ),
      ),
    );
  });
}
