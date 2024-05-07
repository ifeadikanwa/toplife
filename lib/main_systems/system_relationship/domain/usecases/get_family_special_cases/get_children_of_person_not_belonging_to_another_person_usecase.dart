import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/constants/vital_status.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/parent_child_link_repository.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_children_through_deduction_usecase.dart';

class GetChildrenOfPersonNotBelongingToAnotherPersonUsecase {
  final ParentChildLinkRepository _parentChildLinkRepository;
  final PersonUsecases _personUsecases;
  final GetChildrenThroughDeductionUsecase _getChildrenThroughDeductionUsecase;

  const GetChildrenOfPersonNotBelongingToAnotherPersonUsecase(
    this._parentChildLinkRepository,
    this._personUsecases,
    this._getChildrenThroughDeductionUsecase,
  );

  Future<List<Person>> execute({
    required int belongingToParentID,
    required int notBelongingToParentID,
    required bool onlyLivingPeople,
  }) async {
    //The player can have a child with anyone and then end up having a temp familial relationship with them the next day
    //we have to be prepared. In this situations the person children will become something to the player-> step child, step grandchild, step cousin etc
    //we want to make sure we take out the players children from that list of children we want to assign a new relationship to.

    //get ALL children of belongingParent
    final List<Person> allChildrenOfBelongingParent =
        (await _getChildrenThroughDeductionUsecase.execute(
      personID: belongingToParentID,
      includeOnly: VitalStatus.livingAndDead,
    ))
            .map((e) => e.person)
            .toList();

    //get only birth and adopted children of excludedParent
    final List<ParentChildLink> parentChildLinksOfExcludedParent =
        await _parentChildLinkRepository
            .getAllChildrenOfParent(notBelongingToParentID);

    //get children person
    final List<Person> birthAndAdoptedChildrenOfExcludedParent = [];
    for (var link in parentChildLinksOfExcludedParent) {
      //get child person
      final Person? childPerson =
          await _personUsecases.getPersonUsecase.execute(
        personID: link.childId,
      );

      if (childPerson != null) {
        birthAndAdoptedChildrenOfExcludedParent.add(childPerson);
      }
    }

    //Now compare both lists of children
    final List<Person> childrenOfBelongingParentNotBelongingToExcludedParent =
        [];

    //for every child of belongingParent, if they are not in the excludedParent children list -> add them to the final list
    for (var childOfBelongingParent in allChildrenOfBelongingParent) {
      if (!(birthAndAdoptedChildrenOfExcludedParent
          .contains(childOfBelongingParent))) {
        //add
        childrenOfBelongingParentNotBelongingToExcludedParent
            .add(childOfBelongingParent);
      }
    }

    //return based on request
    return (onlyLivingPeople)
        ? childrenOfBelongingParentNotBelongingToExcludedParent
            .where((person) => person.dead == false)
            .toList()
        : childrenOfBelongingParentNotBelongingToExcludedParent;
  }
}
