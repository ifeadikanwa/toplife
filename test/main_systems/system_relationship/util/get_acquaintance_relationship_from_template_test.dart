import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_acquaintance_relationship_from_template.dart';
import 'package:toplife/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

void main() {
  group("getAcquaintanceRelationshipFromTemplate: ", () {
    test(
        "if interested in relationship, we get an relationship object with the correct values",
        () {
      final Relationship relationship = getAcquaintanceRelationshipFromTemplate(
        firstPersonID: 8,
        secondPersonID: 3,
        interestedInRelationship: true,
      );

      expect(
        relationship.platonicRelationshipType,
        getDbFormattedPlatonicRelationshipTypeString(
            PlatonicRelationshipType.acquaintance),
        reason: "Cause: platonic relationship type",
      );
      expect(
        relationship.level,
        inInclusiveRange(0, 20),
        reason: "Cause: level",
      );
    });

    test(
        "if NOT interested in relationship, we get an relationship object with the correct values",
        () {
      final Relationship relationship = getAcquaintanceRelationshipFromTemplate(
        firstPersonID: 8,
        secondPersonID: 3,
        interestedInRelationship: false,
      );

      expect(
        relationship.platonicRelationshipType,
        getDbFormattedPlatonicRelationshipTypeString(
            PlatonicRelationshipType.acquaintance),
        reason: "Cause: platonic relationship type",
      );
      expect(
        relationship.level,
        inInclusiveRange(-50, -0),
        reason: "Cause: level",
      );
    });
  });
}
