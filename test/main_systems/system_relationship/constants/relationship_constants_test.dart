import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_constants.dart';

void main() {
  group("Relationship constants:", () {
    test(
      "relationship type separator is correct",
      () => expect(RelationshipConstants.relationshipTypeSeparator, ", "),
    );

      test(
      "default previous familial relationship is correct",
      () => expect(RelationshipConstants.defaultPreviousFamilialRelationship, ""),
    );
  });


}
