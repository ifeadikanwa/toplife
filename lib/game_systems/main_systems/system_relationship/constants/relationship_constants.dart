import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/romantic_relationship_type.dart';

class RelationshipConstants {
  static const String dbRelationshipTypeSeparator = ", ";

  static const String relationshipLabelSeparator = "/";

  static const String spacedRelationshipLabelSeparator = " / ";

  static const String defaultPreviousFamilialRelationship = "";

  static const String stepTemporaryFamilialRelationshipKeyword = "step";

  static const String inLawTemporaryFamilialRelationshipKeyword = "inLaw";

  static const int defaultRelationshipLevel = 0;

  static final Relationship relationshipTemplate = Relationship(
    firstPersonId: DatabaseConstants.dummyId,
    secondPersonId: DatabaseConstants.dummyId,
    platonicRelationshipType: "",
    romanticRelationshipType: RomanticRelationshipType.none.name,
    previousFamilialRelationship: defaultPreviousFamilialRelationship,
    interestedInRelationship: true,
    level: defaultRelationshipLevel,
    activeRomance: false,
    isCoParent: false,
    romanceStartDay: 0,
    romanceEndDay: 0,
    romanceCumulativeDuration: 0,
    jointMoney: 0,
  );
}
