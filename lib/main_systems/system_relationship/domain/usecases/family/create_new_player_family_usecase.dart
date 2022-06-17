import 'dart:math';

import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/sibling_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/family/create_child_parent_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/family/create_sibling_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/romantic/get_married_usecase.dart';

class CreateNewPlayerFamilyUsecase {
  final PersonUsecases _personUsecases;
  final GetMarriedUsecase _getMarriedUsecase;
  final CreateChildParentRelationshipUsecase
      _createChildParentRelationshipUsecase;
  final CreateSiblingRelationshipUsecase _createSiblingRelationshipUsecase;

  const CreateNewPlayerFamilyUsecase({
    required PersonUsecases personUsecases,
    required GetMarriedUsecase getMarriedUsecase,
    required CreateChildParentRelationshipUsecase
        createChildParentRelationshipUsecase,
    required CreateSiblingRelationshipUsecase createSiblingRelationshipUsecase,
  })  : _personUsecases = personUsecases,
        _getMarriedUsecase = getMarriedUsecase,
        _createChildParentRelationshipUsecase =
            createChildParentRelationshipUsecase,
        _createSiblingRelationshipUsecase = createSiblingRelationshipUsecase;

  Future<void> execute(Person currentPlayer, int currentDay) async {
    //create two parent
    final Person maleParent = _personUsecases.generateAPersonUsecase.execute(
      currentGameID: currentPlayer.gameID!,
      currentCountry: currentPlayer.country,
      currentState: currentPlayer.state,
      lastName: currentPlayer.lastName,
      gender: Gender.Male,
      sexuallity: Sexuality.Straight,
      canBeAdult: true,
      canBeElder: true,
    );

    final Person femaleParent = _personUsecases.generateAPersonUsecase.execute(
      currentGameID: currentPlayer.gameID!,
      currentCountry: currentPlayer.country,
      currentState: currentPlayer.state,
      lastName: currentPlayer.lastName,
      gender: Gender.Female,
      sexuallity: Sexuality.Straight,
      canBeAdult: true,
      canBeElder: true,
    );

    final Person createdMaleParent = await _personUsecases
        .createAdultPersonUsecase
        .execute(person: maleParent);

    final Person createdFemaleParent = await _personUsecases
        .createAdultPersonUsecase
        .execute(person: femaleParent);

    //create a marriage partner relationship between the two parents
    await _getMarriedUsecase.execute(
      mainPersonID: createdMaleParent.id!,
      partnerID: createdFemaleParent.id!,
      currentDay: currentDay,
    );

    //create 1-4 children
    const int maxNumberOfChildren = 4;

    final int numberOfChildren = Random().nextInt(maxNumberOfChildren + 1) + 1;

    print("NUMBER OF CHILDREN: $numberOfChildren");

    final List<Person> children =
        _personUsecases.generateListOfPersonUsecase.execute(
      numberOfPerson: numberOfChildren,
      currentGameID: currentPlayer.gameID!,
      currentCountry: currentPlayer.country,
      currentState: currentPlayer.state,
      lastName: currentPlayer.lastName,
      canBeBaby: true,
      canBeToddler: true,
      canBeChild: true,
      canBeTeen: true,
      canBeYoungAdult: true,
    );

    print("GENERATED CHILDREN: $children");

    List<Person> createdChildrenPerson = [];

    for (var child in children) {
      Person createdChild =
          await _personUsecases.createChildPersonUsecase.execute(person: child);

      createdChildrenPerson.add(createdChild);
    }

    print("GENERATED CHILDREN PERSON: $createdChildrenPerson");

    //create a child-parent relationship between all the children(including the player) and the parents
    _createChildParentRelationshipUsecase.execute(
      mainParentID: createdFemaleParent.id!,
      otherParentID: createdMaleParent.id!,
      childID: currentPlayer.id!,
    );

    for (var createdChildPerson in createdChildrenPerson) {
      //connect all the children to their parents
      _createChildParentRelationshipUsecase.execute(
        mainParentID: createdFemaleParent.id!,
        otherParentID: createdMaleParent.id!,
        childID: createdChildPerson.id!,
      );

      //connect all the children to player as sibling
      _createSiblingRelationshipUsecase.execute(
        mainPersonID: currentPlayer.id!,
        siblingID: createdChildPerson.id!,
        siblingRelationshipType: SiblingRelationshipType.full,
      );
    }

    //if the parents are divorced, you may create another relationship between parents and a new partner

    //create a step parent relationship between player and new partner

    //create 0-2 children younger than the youngest original children(including player)

    //create child-parent relationship between children and parent

    //create step-parent - child relationship between new partner and player

    //create step sibling relationship between new Children and partner
  }
}
