import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/grave_repository.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relationship_repository.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_and_romantic_relationship_label_from_string.dart.dart';

class ConvertRelationshipToGraveUsecase {
  final RelationshipRepository _relationshipRepository;
  final GraveRepository _graveRepository;

  const ConvertRelationshipToGraveUsecase(
    this._relationshipRepository,
    this._graveRepository,
  );

  Future<void> execute({
    required int playerPersonID,
    required int otherPersonID,
    required String otherPersonGenderString,
  }) async {
    //get relationship
    final Relationship? relationship =
        await _relationshipRepository.getRelationship(
      playerPersonID,
      otherPersonID,
    );

    if (relationship != null) {
      //create grave
      final Grave grave = Grave(
        mainPersonId: playerPersonID,
        deadPersonId: otherPersonID,
        relationshipLevel: relationship.level,
        relationshipLabel: getPlatonicAndRomanticRelationshipLabelFromString(
          genderString: otherPersonGenderString,
          platonicRelationshipTypeString: relationship.platonicRelationshipType,
          romanticRelationshipTypeString: relationship.romanticRelationshipType,
          previousFamilialRelationshipString:
              relationship.previousFamilialRelationship,
          isCoParent: relationship.isCoParent,
          activeRomance: relationship.activeRomance,
        ),
      );

      await _graveRepository.createGrave(grave);

      //delete relationship
      await _relationshipRepository.deleteRelationship(
        playerPersonID,
        otherPersonID,
      );
    }
  }
}
