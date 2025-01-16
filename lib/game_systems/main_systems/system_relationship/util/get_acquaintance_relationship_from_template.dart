import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/numbers/get_random_int_in_positive_range.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/relationship_constants.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

Relationship getAcquaintanceRelationshipFromTemplate({
  required int firstPersonID,
  required int secondPersonID,
  required bool interestedInRelationship,
}) {
  return RelationshipConstants.relationshipTemplate.copyWith(
    firstPersonId: firstPersonID,
    secondPersonId: secondPersonID,
    interestedInRelationship: interestedInRelationship,
    platonicRelationshipType: getDbFormattedPlatonicRelationshipTypeString(
      PlatonicRelationshipType.acquaintance,
    ),
    level: (interestedInRelationship)
        ?
        //btw 0 - 20
        getRandomIntInPositiveRange(
            min: 0,
            max: 20,
          )
        :
        //btw 0 -50
        -(getRandomIntInPositiveRange(
            min: 0,
            max: 50,
          )),
  );
}
