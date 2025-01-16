import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/existing_relationship_override_instruction.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/relationship_constants.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/repository/relationship_repository.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/create/create_relationship_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

class StartRomanticRelationshipAndReturnUpdatedObjectUsecase {
  final RelationshipRepository _relationshipRepository;
  final CreateRelationshipUsecase _createRelationshipUsecase;

  const StartRomanticRelationshipAndReturnUpdatedObjectUsecase(
    this._relationshipRepository,
    this._createRelationshipUsecase,
  );

  Future<Relationship?> execute({
    required int firstPersonId,
    required int secondPersonId,
    required int currentDay,
    required RomanticRelationshipType romanticRelationshipType,
    int? startDay,
  }) async {
    //get the relationship
    final Relationship? relationship =
        await _relationshipRepository.getRelationship(
      firstPersonId,
      secondPersonId,
    );

    //set romance start day
    final int romanceStartDay = startDay ?? currentDay;

    //if existing relationship
    if (relationship != null) {
      //update
      //if the relationship already exists in whatever form, and we are converting it to an active romantic relationship
      //even flings will be set to active romance = true,
      //we don't want flings with people the player already knows to go into the exes tab, they should be visible by default.
      await _relationshipRepository.updateRelationship(
        relationship.copyWith(
          activeRomance: true,
          romanticRelationshipType: romanticRelationshipType.name,
          romanceStartDay: romanceStartDay,
        ),
      );
    }
    //if not existing
    else {
      //create
      await _createRelationshipUsecase.execute(
        relationship: RelationshipConstants.relationshipTemplate.copyWith(
          firstPersonId: firstPersonId,
          secondPersonId: secondPersonId,
          platonicRelationshipType:
              getDbFormattedPlatonicRelationshipTypeString(
            PlatonicRelationshipType.friend,
          ),
          //if it a fling romance is not active
          activeRomance:
              (romanticRelationshipType == RomanticRelationshipType.casual)
                  ? false
                  : true,
          romanticRelationshipType: romanticRelationshipType.name,
          romanceStartDay: romanceStartDay,
        ),
        existingRelationshipOverrideInstruction:
            ExistingRelationshipOverrideInstruction.everything,
      );
    }

    //return the updated relationship
    return _relationshipRepository.getRelationship(
      firstPersonId,
      secondPersonId,
    );
  }
}
