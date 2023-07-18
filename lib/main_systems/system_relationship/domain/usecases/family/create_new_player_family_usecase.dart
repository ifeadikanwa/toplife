import 'dart:math';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/parent_appearance_pair.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_appearance_pair.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/sibling_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/family/create_child_parent_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/family/create_sibling_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/romantic/get_married_usecase.dart';

class CreateNewPlayerFamilyUsecase {
  final GetMarriedUsecase _getMarriedUsecase;
  final CreateChildParentRelationshipUsecase
      _createChildParentRelationshipUsecase;
  final CreateSiblingRelationshipUsecase _createSiblingRelationshipUsecase;

  const CreateNewPlayerFamilyUsecase({
    required GetMarriedUsecase getMarriedUsecase,
    required CreateChildParentRelationshipUsecase
        createChildParentRelationshipUsecase,
    required CreateSiblingRelationshipUsecase createSiblingRelationshipUsecase,
  })  : _getMarriedUsecase = getMarriedUsecase,
        _createChildParentRelationshipUsecase =
            createChildParentRelationshipUsecase,
        _createSiblingRelationshipUsecase = createSiblingRelationshipUsecase;

//returns created current player
  Future<Person> execute({
    required PersonUsecases personUsecases,
    required Person uncreatedCurrentPlayerPerson,
    required int gameID,
    required int currentDay,
  }) async {
    //create two parent
    final Person maleParent = personUsecases.generateAPersonUsecase.execute(
      currentGameID: gameID,
      currentDay: currentDay,
      currentCountryString: uncreatedCurrentPlayerPerson.currentCountry,
      currentStateString: uncreatedCurrentPlayerPerson.currentState,
      lastName: uncreatedCurrentPlayerPerson.lastName,
      parentBirthCountryString: null, //can have random birth country
      gender: Gender.Male,
      sexuallity: Sexuality.Straight,
      canBeAdult: true,
      lateStageInAge: true,
    );

    final Person femaleParent = personUsecases.generateAPersonUsecase.execute(
      currentGameID: gameID,
      currentDay: currentDay,
      currentCountryString: uncreatedCurrentPlayerPerson.currentCountry,
      currentStateString: uncreatedCurrentPlayerPerson.currentState,
      lastName: uncreatedCurrentPlayerPerson.lastName,
      parentBirthCountryString: null, //can have random birth country
      gender: Gender.Female,
      sexuallity: Sexuality.Straight,
      canBeAdult: true,
      earlyStageInAge: true,
    );

    //create person with all attributes from scratch
    final PersonAppearancePair createdMaleParentPair =
        await personUsecases.createPersonWithAttributesUsecase.execute(
      person: maleParent,
      currentDay: currentDay,
      parentAppearancePair: null,
      canGenerateTattoos: true,
      canGeneratePiercings: true,
    );

    //create person with all attributes from scratch
    final PersonAppearancePair createdFemaleParentPair =
        await personUsecases.createPersonWithAttributesUsecase.execute(
      person: femaleParent,
      currentDay: currentDay,
      parentAppearancePair: null,
      canGenerateTattoos: true,
      canGeneratePiercings: true,
    );

    //create a marriage partner relationship between the two parents
    await _getMarriedUsecase.execute(
      mainPersonID: createdMaleParentPair.person.id,
      partnerID: createdFemaleParentPair.person.id,
      currentDay: currentDay,
    );

    //Parent appearance pair to be used for all children.
    final ParentAppearancePair parentAppearancePair = ParentAppearancePair(
      motherAppearance: createdFemaleParentPair.appearance,
      fatherAppearance: createdMaleParentPair.appearance,
    );

    //create current player
    final PersonAppearancePair createdCurrentPlayerPair =
        await personUsecases.createPersonWithAttributesUsecase.execute(
      person: uncreatedCurrentPlayerPerson,
      currentDay: currentDay,
      parentAppearancePair: parentAppearancePair,
      canGenerateTattoos: false,
      canGeneratePiercings: false,
    );

    //create 1-5 children
    const int maxNumberOfChildren = 5;

    final int numberOfChildren = Random().nextInt(maxNumberOfChildren) + 1;

    final List<Person> children =
        personUsecases.generateListOfPersonUsecase.execute(
      numberOfPerson: numberOfChildren,
      currentGameID: gameID,
      currentDay: currentDay,
      currentCountry: uncreatedCurrentPlayerPerson.currentCountry,
      currentState: uncreatedCurrentPlayerPerson.currentState,
      lastName: uncreatedCurrentPlayerPerson.lastName,
      parentBirthCountryString:
          uncreatedCurrentPlayerPerson.birthCountry, //have player birth country
      canBeChild: true,
      canBeTeen: true,
      canBeYoungAdult: true,
      earlyStageInAge: true,
    );

    List<Person> createdChildrenPerson = [];

    for (var child in children) {
      PersonAppearancePair createdChildPair =
          await personUsecases.createPersonWithAttributesUsecase.execute(
        person: child,
        currentDay: currentDay,
        parentAppearancePair: parentAppearancePair,
        canGenerateTattoos: true,
        canGeneratePiercings: true,
      );

      createdChildrenPerson.add(createdChildPair.person);
    }

    //create a child-parent relationship between all the children(including the player) and the parents
    //player
    _createChildParentRelationshipUsecase.execute(
      mainParentID: createdFemaleParentPair.person.id,
      otherParentID: createdMaleParentPair.person.id,
      childID: createdCurrentPlayerPair.person.id,
    );

    //other children
    for (var createdChildPerson in createdChildrenPerson) {
      //connect all the children to their parents
      _createChildParentRelationshipUsecase.execute(
        mainParentID: createdFemaleParentPair.person.id,
        otherParentID: createdMaleParentPair.person.id,
        childID: createdChildPerson.id,
      );

      //connect all the children to player as sibling
      _createSiblingRelationshipUsecase.execute(
        mainPersonID: createdCurrentPlayerPair.person.id,
        siblingID: createdChildPerson.id,
        siblingRelationshipType: SiblingRelationshipType.full,
      );
    }

    //RETURN current player
    return createdCurrentPlayerPair.person;

    //if the parents are divorced, you may create another relationship between parents and a new partner

    //create a step parent relationship between player and new partner

    //create 0-2 children younger than the youngest original children(including player)

    //create child-parent relationship between children and parent

    //create step-parent - child relationship between new partner and player

    //create step sibling relationship between new Children and partner
  }
}
