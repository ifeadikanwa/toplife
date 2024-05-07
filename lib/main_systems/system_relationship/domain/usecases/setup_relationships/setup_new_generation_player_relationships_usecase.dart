import 'package:toplife/main_systems/system_person/constants/vital_status.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/person_platonic_relationship_types_list_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/create/create_platonic_relationship_or_grave_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_children_in_law_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_children_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_cousins_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_grandchildren_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_grandcousins_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_grandniblings_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_grandparents_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_great_grandchildren_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_great_grandcousins_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_great_grandniblings_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_great_grandparents_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_niblings_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_parent_in_laws_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_parents_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_piblings_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_sibling_in_laws_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_siblings_through_deduction_usecase.dart';

class SetupNewGenerationPlayerRelationshipsUsecase {
  final CreatePlatonicRelationshipOrGraveUsecase
      _createPlatonicRelationshipOrGraveUsecase;
  final GetParentsThroughDeductionUsecase _getParentsThroughDeductionUsecase;
  final GetSiblingsThroughDeductionUsecase _getSiblingsThroughDeductionUsecase;
  final GetChildrenThroughDeductionUsecase _getChildrenThroughDeductionUsecase;
  final GetGrandChildrenThroughDeductionUsecase
      _getGrandChildrenThroughDeductionUsecase;
  final GetGreatGrandChildrenThroughDeductionUsecase
      _getGreatGrandChildrenThroughDeductionUsecase;
  final GetGrandParentsThroughDeductionUsecase
      _getGrandParentsThroughDeductionUsecase;
  final GetGreatGrandParentsThroughDeductionUsecase
      _getGreatGrandParentsThroughDeductionUsecase;
  final GetPiblingsThroughDeductionUsecase _getPiblingsThroughDeductionUsecase;
  final GetCousinsThroughDeductionUsecase _getCousinsThroughDeductionUsecase;
  final GetGrandCousinsThroughDeductionUsecase
      _getGrandCousinsThroughDeductionUsecase;
  final GetGreatGrandCousinsThroughDeductionUsecase
      _getGreatGrandCousinsThroughDeductionUsecase;
  final GetNiblingsThroughDeductionUsecase _getNiblingsThroughDeductionUsecase;
  final GetGrandNiblingsThroughDeductionUsecase
      _getGrandNiblingsThroughDeductionUsecase;
  final GetGreatGrandNiblingsThroughDeductionUsecase
      _getGreatGrandNiblingsThroughDeductionUsecase;
  final GetParentInLawsThroughDeductionUsecase
      _getParentInLawsThroughDeductionUsecase;
  final GetChildrenInLawThroughDeductionUsecase
      _getChildrenInLawThroughDeductionUsecase;
  final GetSiblingInLawsThroughDeductionUsecase
      _getSiblingInLawsThroughDeductionUsecase;

  SetupNewGenerationPlayerRelationshipsUsecase(
    this._createPlatonicRelationshipOrGraveUsecase,
    this._getParentsThroughDeductionUsecase,
    this._getSiblingsThroughDeductionUsecase,
    this._getChildrenThroughDeductionUsecase,
    this._getGrandChildrenThroughDeductionUsecase,
    this._getGreatGrandChildrenThroughDeductionUsecase,
    this._getGrandParentsThroughDeductionUsecase,
    this._getGreatGrandParentsThroughDeductionUsecase,
    this._getPiblingsThroughDeductionUsecase,
    this._getCousinsThroughDeductionUsecase,
    this._getGrandCousinsThroughDeductionUsecase,
    this._getGreatGrandCousinsThroughDeductionUsecase,
    this._getNiblingsThroughDeductionUsecase,
    this._getGrandNiblingsThroughDeductionUsecase,
    this._getGreatGrandNiblingsThroughDeductionUsecase,
    this._getParentInLawsThroughDeductionUsecase,
    this._getChildrenInLawThroughDeductionUsecase,
    this._getSiblingInLawsThroughDeductionUsecase,
  );

  Future<void> execute({
    required int playerPersonID,
  }) async {
    //deduced relationships
    final List<PersonPlatonicRelationshipTypesListPair> deducedRelationships =
        [];

    //helper inner function
    void addToDeducedRelationshipsList({
      required List<PersonPlatonicRelationshipTypePair> relationshipsToAdd,
    }) {
      //go through the relationships to add
      for (var relationshipToAdd in relationshipsToAdd) {
        //prepare object
        final PersonPlatonicRelationshipTypesListPair
            personPlatonicRelationshipTypesListPair =
            PersonPlatonicRelationshipTypesListPair(
          person: relationshipToAdd.person,
          platonicRelationshipTypesList: [
            relationshipToAdd.platonicRelationshipType,
          ],
          previousFamilialRelationship: null,
        );

        //first we check if the person exist in the list,
        final List<PersonPlatonicRelationshipTypesListPair>
            existingPersonTypeListPairs = deducedRelationships
                .where(
                  (element) => element.person.id == relationshipToAdd.person.id,
                )
                .toList();

        //if the person is already in the list
        if (existingPersonTypeListPairs.isNotEmpty) {
          //remove all the existing records from the final list
          deducedRelationships.removeWhere(
            (element) => element.person.id == relationshipToAdd.person.id,
          );

          //merge all the existing record, into the new one we want to add
          for (var existingPair in existingPersonTypeListPairs) {
            personPlatonicRelationshipTypesListPair
                .platonicRelationshipTypesList
                .addAll(
              existingPair.platonicRelationshipTypesList,
            );
          }
        }

        //add the personPlatonicRelationshipTypesListPair to the list
        deducedRelationships.add(personPlatonicRelationshipTypesListPair);
      }
    }

    //deductions:
    const VitalStatus livingAndDeadPeople = VitalStatus.livingAndDead;

    //-parents
    final List<PersonPlatonicRelationshipTypePair> parents =
        await _getParentsThroughDeductionUsecase.execute(
      personID: playerPersonID,
      includeOnly: livingAndDeadPeople,
    );

    addToDeducedRelationshipsList(relationshipsToAdd: parents);

    //-siblings
    final List<PersonPlatonicRelationshipTypePair> siblings =
        await _getSiblingsThroughDeductionUsecase.execute(
      personID: playerPersonID,
      includeOnly: livingAndDeadPeople,
    );

    addToDeducedRelationshipsList(relationshipsToAdd: siblings);

    //-children
    final List<PersonPlatonicRelationshipTypePair> children =
        await _getChildrenThroughDeductionUsecase.execute(
      personID: playerPersonID,
      includeOnly: livingAndDeadPeople,
    );

    addToDeducedRelationshipsList(relationshipsToAdd: children);

    //-grandparents
    final List<PersonPlatonicRelationshipTypePair> grandParents =
        await _getGrandParentsThroughDeductionUsecase.execute(
      personID: playerPersonID,
      includeOnly: livingAndDeadPeople,
    );

    addToDeducedRelationshipsList(relationshipsToAdd: grandParents);

    //-greatgrandparents
    final List<PersonPlatonicRelationshipTypePair> greatGrandParents =
        await _getGreatGrandParentsThroughDeductionUsecase.execute(
      personID: playerPersonID,
      includeOnly: livingAndDeadPeople,
    );

    addToDeducedRelationshipsList(relationshipsToAdd: greatGrandParents);

    //-grandchildren
    final List<PersonPlatonicRelationshipTypePair> grandChildren =
        await _getGrandChildrenThroughDeductionUsecase.execute(
      personID: playerPersonID,
      includeOnly: livingAndDeadPeople,
    );

    addToDeducedRelationshipsList(relationshipsToAdd: grandChildren);

    //-greatgrandchildren
    final List<PersonPlatonicRelationshipTypePair> greatGrandChildren =
        await _getGreatGrandChildrenThroughDeductionUsecase.execute(
      personID: playerPersonID,
      includeOnly: livingAndDeadPeople,
    );

    addToDeducedRelationshipsList(relationshipsToAdd: greatGrandChildren);

    //-pibling
    final List<PersonPlatonicRelationshipTypePair> piblings =
        await _getPiblingsThroughDeductionUsecase.execute(
      personID: playerPersonID,
      includeOnly: livingAndDeadPeople,
    );

    addToDeducedRelationshipsList(relationshipsToAdd: piblings);

    //-cousin
    final List<PersonPlatonicRelationshipTypePair> cousins =
        await _getCousinsThroughDeductionUsecase.execute(
      personID: playerPersonID,
      includeOnly: livingAndDeadPeople,
    );

    addToDeducedRelationshipsList(relationshipsToAdd: cousins);

    //-grandcousin
    final List<PersonPlatonicRelationshipTypePair> grandCousins =
        await _getGrandCousinsThroughDeductionUsecase.execute(
      personID: playerPersonID,
      includeOnly: livingAndDeadPeople,
    );

    addToDeducedRelationshipsList(relationshipsToAdd: grandCousins);

    //-greatgrandcousin
    final List<PersonPlatonicRelationshipTypePair> greatGrandCousins =
        await _getGreatGrandCousinsThroughDeductionUsecase.execute(
      personID: playerPersonID,
      includeOnly: livingAndDeadPeople,
    );

    addToDeducedRelationshipsList(relationshipsToAdd: greatGrandCousins);

    //-nibling
    final List<PersonPlatonicRelationshipTypePair> niblings =
        await _getNiblingsThroughDeductionUsecase.execute(
      personID: playerPersonID,
      includeOnly: livingAndDeadPeople,
    );

    addToDeducedRelationshipsList(relationshipsToAdd: niblings);

    //-grandnibling
    final List<PersonPlatonicRelationshipTypePair> grandNiblings =
        await _getGrandNiblingsThroughDeductionUsecase.execute(
      personID: playerPersonID,
      includeOnly: livingAndDeadPeople,
    );

    addToDeducedRelationshipsList(relationshipsToAdd: grandNiblings);

    //-greatgrandnibling
    final List<PersonPlatonicRelationshipTypePair> greatGrandNiblings =
        await _getGreatGrandNiblingsThroughDeductionUsecase.execute(
      personID: playerPersonID,
      includeOnly: livingAndDeadPeople,
    );

    addToDeducedRelationshipsList(relationshipsToAdd: greatGrandNiblings);

    //-parent in law
    final List<PersonPlatonicRelationshipTypePair> parentInLaws =
        await _getParentInLawsThroughDeductionUsecase.execute(
      personID: playerPersonID,
      includeOnly: livingAndDeadPeople,
    );

    addToDeducedRelationshipsList(relationshipsToAdd: parentInLaws);

    //-children in law
    final List<PersonPlatonicRelationshipTypePair> childrenInLaw =
        await _getChildrenInLawThroughDeductionUsecase.execute(
      personID: playerPersonID,
      includeOnly: livingAndDeadPeople,
    );

    addToDeducedRelationshipsList(relationshipsToAdd: childrenInLaw);

    //-sibling in law
    final List<PersonPlatonicRelationshipTypePair> siblingInLaws =
        await _getSiblingInLawsThroughDeductionUsecase.execute(
      personID: playerPersonID,
      includeOnly: livingAndDeadPeople,
    );

    addToDeducedRelationshipsList(relationshipsToAdd: siblingInLaws);

    //create relationships:
    for (var deducedRelationship in deducedRelationships) {
      await _createPlatonicRelationshipOrGraveUsecase.execute(
        personPlatonicRelationshipTypesListPair: deducedRelationship,
        playerPersonID: playerPersonID,
      );
    }
  }
}
