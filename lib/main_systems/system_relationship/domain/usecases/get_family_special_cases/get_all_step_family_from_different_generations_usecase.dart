import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/platonic_relationship_type_person_list_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/platonic_relationship_type_with_parent_type_indicator.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/find_relationship/find_persons_familial_relationship_to_player_through_parent_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_special_cases/get_children_of_person_not_belonging_to_another_person_usecase.dart';
import 'package:toplife/main_systems/system_relationship/util/get_step_generation_line_using_person_relationship_to_parent.dart';

class GetAllStepFamilyFromDifferentGenerationsUsecase {
  final FindPersonsFamilialRelationshipToPlayerThroughParentUsecase
      _findPersonsFamilialRelationshipToPlayerThroughParentUsecase;
  final GetChildrenOfPersonNotBelongingToAnotherPersonUsecase
      _getChildrenOfPersonNotBelongingToAnotherPersonUsecase;

  const GetAllStepFamilyFromDifferentGenerationsUsecase(
    this._findPersonsFamilialRelationshipToPlayerThroughParentUsecase,
    this._getChildrenOfPersonNotBelongingToAnotherPersonUsecase,
  );

  //This usecase is for getting children's chidren's children and assigning them the correct label
  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int playerPersonID,
    required PlatonicRelationshipType parentRelationshipToPlayer,
    required List<Person> chosenChildrenOfTheParent,
  }) async {
    //we have to find the step generation line relevant to the parent relationship we've been given
    //this is what we will use to determine wthe labels of children as we go down generations
    final List<PlatonicRelationshipType> stepGenerationLine =
        getStepGenerationLineUsingPersonRelationshipToParents(
      personRelationshipToParent: parentRelationshipToPlayer,
    );

    //
    //find the given children's relationship to the player
    //Always send as step parent because we only want step variant of the rel type

    if (chosenChildrenOfTheParent.isNotEmpty && stepGenerationLine.isNotEmpty) {
      //Since the relationship to one child on the list is the relationship to all of them,
      //we can use the first child to find the relatonship to everyone
      final PlatonicRelationshipType? givenChildrensRelationshipToPlayer =
          await _findPersonsFamilialRelationshipToPlayerThroughParentUsecase
              .execute(
        parentRelationshipType: PlatonicRelationshipTypeWithParentTypeIndicator(
          platonicRelationshipType: parentRelationshipToPlayer,
          isStepParent: true,
        ),
        childPersonID: chosenChildrenOfTheParent.first.id,
        playerPersonID: playerPersonID,
      );

      //if we get a valid type
      if (givenChildrensRelationshipToPlayer != null) {
        //find the index of the rel type we get in the line list
        int currentIndex =
            stepGenerationLine.indexOf(givenChildrensRelationshipToPlayer);

        //if we have a valid index
        if (currentIndex != -1) {
          //create a list of Platonic rel type - person list pair FROM the step generation line list
          final List<PlatonicRelationshipTypePersonListPair> stepFamily =
              stepGenerationLine
                  .map(
                    (platonicRelationshipType) =>
                        PlatonicRelationshipTypePersonListPair(
                      platonicRelationshipType: platonicRelationshipType,
                      personList: const [],
                    ),
                  )
                  .toList();

          //add the given children at the found index
          //-get the content of the current index
          PlatonicRelationshipType relationshipTypeAtCurrentIndex =
              stepFamily[currentIndex].platonicRelationshipType;
          //-set
          stepFamily[currentIndex] = PlatonicRelationshipTypePersonListPair(
            platonicRelationshipType: relationshipTypeAtCurrentIndex,
            personList: chosenChildrenOfTheParent,
          );

          //Now we start the loop to go down the generation line:

          //we want to keep going as long as the current index is not the last index
          while (currentIndex != (stepFamily.length - 1)) {
            //increase current index
            currentIndex++;

            //get rel type at current index
            relationshipTypeAtCurrentIndex =
                stepFamily[currentIndex].platonicRelationshipType;

            //get list of people in prev generation
            final List<Person> prevGenerationPeople =
                stepFamily[currentIndex - 1].personList;

            //create list to store all found children
            final List<Person> foundChildren = [];

            //get the living AND dead children(not belonging to the player) of everyone in the prev generation
            //we get all living AND dead children so we can catch all descendants even if their parents are dead
            for (var prevGenPerson in prevGenerationPeople) {
              //get
              final List<Person> children =
                  await _getChildrenOfPersonNotBelongingToAnotherPersonUsecase
                      .execute(
                belongingToParentID: prevGenPerson.id,
                notBelongingToParentID: playerPersonID,
                onlyLivingPeople: false,
              );

              //add to found children
              foundChildren.addAll(children);
            }

            //Add all found children to the step family @ current index
            stepFamily[currentIndex] = PlatonicRelationshipTypePersonListPair(
              platonicRelationshipType: relationshipTypeAtCurrentIndex,
              personList: foundChildren,
            );

            //end of iteration
          }

          //We have gotten all available step family at this point

          //create a person-platonic rel type list we will return
          final List<PersonPlatonicRelationshipTypePair>
              familyPersonPlatonicRelTypeList = [];

          //add everyone in stepFamily to this list
          for (var stepFamilyPair in stepFamily) {
            //get type in pair
            final PlatonicRelationshipType platonicRelTypeFromPair =
                stepFamilyPair.platonicRelationshipType;

            //map every person in personList to PersonPlatonicRelTypePair
            familyPersonPlatonicRelTypeList.addAll(
              stepFamilyPair.personList.map(
                (person) => PersonPlatonicRelationshipTypePair(
                  person: person,
                  platonicRelationshipType: platonicRelTypeFromPair,
                ),
              ),
            );
          }

          //return
          return familyPersonPlatonicRelTypeList;
        }
      }
    }

    //if we get here, there was no valid step family
    return [];
  }
}
