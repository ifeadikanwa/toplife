import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/existing_relationship_override_instruction.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/platonic_relationship_type_with_parent_type_indicator.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/create/create_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/find_relationship/find_persons_familial_relationship_to_player_through_parent_usecase.dart';
import 'package:toplife/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

class ProcessRelationshipChangesFromTheAdditionOfPersonsChildToTheGameUsecase {
  final FindPersonsFamilialRelationshipToPlayerThroughParentUsecase
      _findPersonsFamilialRelationshipToPlayerThroughParentUsecase;
  final CreateRelationshipUsecase _createRelationshipUsecase;

  const ProcessRelationshipChangesFromTheAdditionOfPersonsChildToTheGameUsecase(
    this._findPersonsFamilialRelationshipToPlayerThroughParentUsecase,
    this._createRelationshipUsecase,
  );

  Future<void> execute({
    required List<PlatonicRelationshipTypeWithParentTypeIndicator>
        parentRelationshipTypeWithIndicatorsList,
    required int playerPersonID,
    required int childPersonID,
  }) async {
    //If the parent relationship type is stated we can safely assume the player has a visible relationship with that parent.
    //If the relationship was hidden or non-existent then we will NOT get it

    //set to store all the gotten familial relationships
    Set<PlatonicRelationshipType> childRelationshipsToPlayerSet = {};

    //for each parent relationship type
    for (var parentRelationshipTypeWithIndicator
        in parentRelationshipTypeWithIndicatorsList) {
      //find the familial relationship
      final PlatonicRelationshipType? familialRelationship =
          await _findPersonsFamilialRelationshipToPlayerThroughParentUsecase
              .execute(
        parentRelationshipType: parentRelationshipTypeWithIndicator,
        childPersonID: childPersonID,
        playerPersonID: playerPersonID,
      );

      //if we find a valid one, add it to the set
      if (familialRelationship != null) {
        childRelationshipsToPlayerSet.add(familialRelationship);
      }
    }

    //if the set is not empty, then we have found at least one familial relationship
    if (childRelationshipsToPlayerSet.isNotEmpty) {
      //Here we will create a relationship between player and the child

      //
      //a little cleanup
      //if the list contains MULTIPLE types AND one of them is Distant relative,
      //remove the distant relative in favor of the more specific types
      if (childRelationshipsToPlayerSet.length > 1 &&
          childRelationshipsToPlayerSet
              .contains(PlatonicRelationshipType.distantRelative)) {
        //remove
        childRelationshipsToPlayerSet.remove(
          PlatonicRelationshipType.distantRelative,
        );
      }

      //After the clean up
      //Don't create relationship if the relationship is distant relative
      //To avoid clutter in relationships, dont automatically create distant relative relationships
      if (!childRelationshipsToPlayerSet
          .contains(PlatonicRelationshipType.distantRelative)) {
        //
        //convert the relationship types to a string for the database

        final StringBuffer platonicRelationshipTypeBuffer = StringBuffer();

        //for each relationship in the set,
        for (var childRelationshipToPlayer in childRelationshipsToPlayerSet) {
          // add the db formatted relationship string to the buffer
          platonicRelationshipTypeBuffer.write(
            getDbFormattedPlatonicRelationshipTypeString(
              childRelationshipToPlayer,
            ),
          );
        }

        //create a relationship
        final Relationship relationship = Relationship(
          firstPersonId: playerPersonID,
          secondPersonId: childPersonID,
          platonicRelationshipType: platonicRelationshipTypeBuffer.toString(),
          romanticRelationshipType: RomanticRelationshipType.none.name,
          previousFamilialRelationship:
              RelationshipConstants.defaultPreviousFamilialRelationship,
          interestedInRelationship: true,
          level: RelationshipConstants.defaultRelationshipLevel,
          activeRomance: false,
        );

        //we're only adding familial relationships here so override both platonic & romantic relationship if for some reason the relationship already exists
        await _createRelationshipUsecase.execute(
          relationship: relationship,
          existingRelationshipOverrideInstruction:
              ExistingRelationshipOverrideInstruction
                  .platonicAndRomanticRelationshipType,
        );
      }
    }
  }
}
