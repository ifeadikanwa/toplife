import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/existing_relationship_override_instruction.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/create/create_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

class CreateMultipleRelationshipsFromPersonPlatonicRelationshipTypePairUsecase {
  final CreateRelationshipUsecase _createRelationshipUsecase;

  const CreateMultipleRelationshipsFromPersonPlatonicRelationshipTypePairUsecase(
      this._createRelationshipUsecase);

  Future<void> execute({
    required int playerPersonID,
    required List<PersonPlatonicRelationshipTypePair>
        personPlatonicRelationshipTypePairList,
    required ExistingRelationshipOverrideInstruction
        existingRelationshipOverrideInstruction,
  }) async {
    //template for relationship
    //secondPersonId and platonicRelationshipType need to be overriden
    final Relationship relationshipTemplate = Relationship(
      firstPersonId: playerPersonID,
      secondPersonId: DatabaseConstants.dummyId,
      platonicRelationshipType: "",
      romanticRelationshipType: RomanticRelationshipType.none.name,
      previousFamilialRelationship:
          RelationshipConstants.defaultPreviousFamilialRelationship,
      interestedInRelationship: true,
      level: RelationshipConstants.defaultRelationshipLevel,
      activeRomance: false,
    );

    //create all relationships by editing template
    for (var pair in personPlatonicRelationshipTypePairList) {
      await _createRelationshipUsecase.execute(
        relationship: relationshipTemplate.copyWith(
          secondPersonId: pair.person.id,
          platonicRelationshipType:
              getDbFormattedPlatonicRelationshipTypeString(
            pair.platonicRelationshipType,
          ),
        ),
        existingRelationshipOverrideInstruction:
            existingRelationshipOverrideInstruction,
      );
    }
  }
}
