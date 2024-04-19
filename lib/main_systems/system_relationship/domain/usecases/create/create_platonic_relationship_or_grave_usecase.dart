import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/numbers/get_random_int_in_positive_range.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range_constants.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_types_list_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/existing_relationship_override_instruction.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/grave_repository.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relationship_repository.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/create/create_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';
import 'package:toplife/main_systems/system_relationship/util/label/get_platonic_relationship_label_from_enum.dart';

class CreatePlatonicRelationshipOrGraveUsecase {
  final RelationshipRepository _relationshipRepository;
  final CreateRelationshipUsecase _createRelationshipUsecase;
  final GraveRepository _graveRepository;

  const CreatePlatonicRelationshipOrGraveUsecase(
    this._relationshipRepository,
    this._createRelationshipUsecase,
    this._graveRepository,
  );

  Future<void> execute({
    required PersonPlatonicRelationshipTypesListPair
        personPlatonicRelationshipTypesListPair,
    required int playerPersonID,
  }) async {
    //set variables
    final Person person = personPlatonicRelationshipTypesListPair.person;
    final List<PlatonicRelationshipType> platonicRelationshipTypes =
        personPlatonicRelationshipTypesListPair.platonicRelationshipTypesList;
    final PlatonicRelationshipType? prevRelationship =
        personPlatonicRelationshipTypesListPair.previousFamilialRelationship;

    //get relationship
    final Relationship? relationship =
        await _relationshipRepository.getRelationship(
      playerPersonID,
      person.id,
    );

    //if person is dead
    if (person.dead) {
      //check if there is an existing relationship
      if (relationship != null) {
        //delete relationship
        await _relationshipRepository.deleteRelationship(
          playerPersonID,
          person.id,
        );
      }

      //create a grave
      //we don't use relationship type from the existing record because we are not sure whose point of view it is from.(might be the previous player)
      //we use relationship level from existing record because it is immune to a point of view
      //if there was no existing relationship set the level to a random number in the possible range
      final Grave grave = Grave(
        mainPersonId: playerPersonID,
        deadPersonId: person.id,
        relationshipLabel: getPlatonicRelationshipLabelFromEnum(
          platonicRelationshipTypeList: platonicRelationshipTypes,
          genderString: person.gender,
          previousFamilialRelationship: prevRelationship,
        ),
        relationshipLevel: relationship?.level ??
            getRandomIntInPositiveRange(
              min: StatsRangeConstants.relationshipRange.min,
              max: StatsRangeConstants.relationshipRange.max,
            ),
      );

      await _graveRepository.createGrave(grave);
    }

    //if person is alive
    else {
      //create db formatted platonic relationship type
      final StringBuffer dbFormattedPlatonicRelationshipTypeBuffer =
          StringBuffer();
      for (var type in platonicRelationshipTypes) {
        dbFormattedPlatonicRelationshipTypeBuffer.write(
          getDbFormattedPlatonicRelationshipTypeString(
            type,
          ),
        );
      }

      //if there is no existing relationship, create it
      if (relationship == null) {
        //create relationship
        final Relationship newRelationship =
            RelationshipConstants.relationshipTemplate.copyWith(
          firstPersonId: playerPersonID,
          secondPersonId: person.id,
          platonicRelationshipType:
              dbFormattedPlatonicRelationshipTypeBuffer.toString(),
          romanticRelationshipType: RomanticRelationshipType.none.name,
        );

        //change only the platonic & romantic relationship types if the relationship exists
        await _createRelationshipUsecase.execute(
          relationship: newRelationship,
          existingRelationshipOverrideInstruction:
              ExistingRelationshipOverrideInstruction
                  .platonicAndRomanticRelationshipType,
        );
      }

      //if there is existing relationship, update the platonic relationship type
      else {
        //update
        await _relationshipRepository.updateRelationship(
          relationship.copyWith(
            platonicRelationshipType:
                dbFormattedPlatonicRelationshipTypeBuffer.toString(),
          ),
        );
      }
    }
  }
}
