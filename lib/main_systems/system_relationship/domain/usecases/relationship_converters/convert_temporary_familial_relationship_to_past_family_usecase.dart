import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relationship_repository.dart';
import 'package:toplife/main_systems/system_relationship/util/check/check_if_platonic_relationship_type_is_temporary_familial_relationship.dart';
import 'package:toplife/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

//Previous familial relationship should only ever refer to a temporary familial relationship,
//this is a way to make sure we keep that constraint
//only do the conversion if we are given a temp family relationship
class ConvertTemporaryFamilialRelationshipToPastFamilyUsecase {
  final RelationshipRepository _relationshipRepository;

  ConvertTemporaryFamilialRelationshipToPastFamilyUsecase(
    this._relationshipRepository,
  );

  Future<void> execute({
    required int firstPersonID,
    required int secondPersonID,
  }) async {
    //get relationship
    final Relationship? relationship =
        await _relationshipRepository.getRelationship(
      firstPersonID,
      secondPersonID,
    );

    //if relationship is valid
    if (relationship != null) {
      //check if platonic relationship type is a temporary familial relationship type
      final bool tempFamilialRelationship =
          checkIfPlatonicRelationshipTypeIsTemporaryFamilialRelationship(
        platonicRelationshipTypeString: relationship.platonicRelationshipType,
      );

      //if it is a temp familial relationship type
      if (tempFamilialRelationship) {
        //convert:
        //set prev familial relationship to the current platonic relationship type
        //set platonic relationship type to friend
        final String newPrevFamilialRelationship =
            relationship.platonicRelationshipType;

        final String newPlatonicRelationshipType =
            getDbFormattedPlatonicRelationshipTypeString(
                PlatonicRelationshipType.friend);
        //
        await _relationshipRepository.updateRelationship(
          relationship.copyWith(
            previousFamilialRelationship: newPrevFamilialRelationship,
            platonicRelationshipType: newPlatonicRelationshipType,
          ),
        );
      }
    }
  }
}
