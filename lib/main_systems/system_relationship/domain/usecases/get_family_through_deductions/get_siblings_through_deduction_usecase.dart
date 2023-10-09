import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/parent_child_link_repository.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relationship_repository.dart';

class GetSiblingsThroughDeductionUsecase {
  final ParentChildLinkRepository _parentChildLinkRepository;
  final RelationshipRepository _relationshipRepository;
  final PersonUsecases _personUsecases;

  const GetSiblingsThroughDeductionUsecase(
    this._parentChildLinkRepository,
    this._relationshipRepository,
    this._personUsecases,
  );

  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int personID,
  }) async {
    final List<PersonPlatonicRelationshipTypePair> siblings = [];

    //helper inner function
    Future<void> addToSiblingsList({
      required ParentChildLink parentChildLink,
      required PlatonicRelationshipType platonicRelationshipType,
    }) async {
      //before we add:
      //make sure the person is not already in the list AND is not the main person(the person whose siblings we are looking for)
      if (siblings.every(
            (element) => element.person.id != parentChildLink.childId,
          ) &&
          parentChildLink.childId != personID) {
        //get sibling person
        final Person? siblingPerson =
            await _personUsecases.getPersonUsecase.execute(
          personID: parentChildLink.childId,
        );

        if (siblingPerson != null) {
          // print("############## ${siblingPerson.id}: ${siblings.every(
          //   (element) => element.person.id != parentChildLink.childId,
          // )}");

          //add person to siblings list
          siblings.add(
            PersonPlatonicRelationshipTypePair(
              person: siblingPerson,
              platonicRelationshipType: platonicRelationshipType,
            ),
          );
        }
      }
    }

    //this is an intricate one so I will break it into sections of sibling types for clarity
    //ORDER IS IMPORTANT!
    //WE GO: full -> half -> adoptive -> step

    //a map to hold all the give persons parents link and all their children links so we only have to fetch them once.
    final Map<ParentChildLink, List<ParentChildLink>>
        personsParentsAndAllTheirChildrenMap = {};

    //get all parents
    final List<ParentChildLink> allPersonsParentLinks =
        await _parentChildLinkRepository.getAllParentsOfChild(
      personID,
    );

    //get all the parents children
    for (var parentLink in allPersonsParentLinks) {
      final List<ParentChildLink> allChildrenLinks =
          await _parentChildLinkRepository.getAllChildrenOfParent(
        parentLink.parentId,
      );

      //add them to the map
      personsParentsAndAllTheirChildrenMap[parentLink] = allChildrenLinks;
    }

    //
    //
    //Full sibling:
    //Other children of person's 2 birth parents. ONLY birth parents

    //filter for birth parents only
    final List<ParentChildLink> birthParentLinks = allPersonsParentLinks
        .where(
          (link) => link.isBirthRelationshipType == true,
        )
        .toList();

    //handle paternity fraud case
    //if there is paternity fraud, we want to remove the birth father and keep the defrauded father
    //there has to be at least 3 parents involved
    if (birthParentLinks.length > 2 &&
        birthParentLinks.any(
          (link) => link.isPaternityFraud == true,
        )) {
      //locate the assumed parents
      final ParentChildLink defraudedFather =
          birthParentLinks.where((link) => link.isPaternityFraud == true).first;

      final ParentChildLink birthMother = birthParentLinks
          .where(
            (link) => link.isPaternityFraud == false && link.isHidden == false,
          )
          .first;

      //clear the existing list
      birthParentLinks.clear();

      //add the above as the birth parents
      birthParentLinks.addAll([
        defraudedFather,
        birthMother,
      ]);
    }

    //now we should have 2 birth parents, if we only have one it means we don't know the other parent and so there are no siblings from them
    if (birthParentLinks.length == 2) {
      final ParentChildLink birthParent1Link = birthParentLinks[0];
      final ParentChildLink birthParent2Link = birthParentLinks[1];

      //first we get all the BIRTH children of both parents
      //all
      final List<ParentChildLink> allBirthParent1ChildrenLinks =
          personsParentsAndAllTheirChildrenMap[birthParent1Link] ?? [];

      final List<ParentChildLink> allBirthParent2ChildrenLinks =
          personsParentsAndAllTheirChildrenMap[birthParent2Link] ?? [];

      //birth (filter all list)
      final List<ParentChildLink> birthParent1BirthChildrenLinks =
          allBirthParent1ChildrenLinks
              .where(
                (link) => link.isBirthRelationshipType == true,
              )
              .toList();

      final List<ParentChildLink> birthParent2BirthChildrenLinks =
          allBirthParent2ChildrenLinks
              .where(
                (link) => link.isBirthRelationshipType == true,
              )
              .toList();

      //then we get the children they both have in common (children they had together)
      //start with parent 1's children as base list (starting point)
      final List<ParentChildLink> sharedChildrenLinks =
          birthParent1BirthChildrenLinks;
      //remove all the children that are not also in parent 2's children list
      sharedChildrenLinks.removeWhere(
        (parent1Link) => birthParent2BirthChildrenLinks
            .every((parent2Link) => parent1Link.childId != parent2Link.childId),
      );

      //There are 2 different situations to handle

      //- Both birth parents are hidden: this means the person does not know they are their birth parents(they were abandoned)
      //what do we do in this case? : we search for siblings that also don't know the birth parents.
      //if they don't know they were also abandoned. if they know then we assume they are with the birth parents
      if (birthParent1Link.isHidden && birthParent2Link.isHidden) {
        //only add the siblings with hidden links
        for (var link in sharedChildrenLinks) {
          if (link.isHidden) {
            await addToSiblingsList(
              parentChildLink: link,
              platonicRelationshipType: PlatonicRelationshipType.fullSibling,
            );
          }
        }
      }
      //- 0 or 1 parent is hidden, as long as you know one parent, you know all your full siblings
      else {
        //add every sibling
        for (var link in sharedChildrenLinks) {
          await addToSiblingsList(
            parentChildLink: link,
            platonicRelationshipType: PlatonicRelationshipType.fullSibling,
          );
        }
      }
    }

    //(I did not put the remaining sections inside the 2 birth parent if-block because I still want them to work if that condition fails)

    //
    //Half Siblings
    //birth children that birth parents had with other people
    //you cannot see siblings from hidden birth parents because if you don't know the parent you don't know the children they had with others

    for (var birthParentLink in birthParentLinks) {
      //get their children list
      final List<ParentChildLink>? allChildrenOfBirthParentLinks =
          personsParentsAndAllTheirChildrenMap[birthParentLink];

      //if the birth parent is not hidden and they have children
      if (!birthParentLink.isHidden && allChildrenOfBirthParentLinks != null) {
        final List<ParentChildLink> allBirthChildrenOfBirthParentsLinks =
            allChildrenOfBirthParentLinks
                .where(
                  (link) => link.isBirthRelationshipType == true,
                )
                .toList();

        //add the children to siblings
        //(No Worries - function does checks and will not add a sibling that is already in the list)
        for (var birthChildLink in allBirthChildrenOfBirthParentsLinks) {
          await addToSiblingsList(
            parentChildLink: birthChildLink,
            platonicRelationshipType: PlatonicRelationshipType.halfSibling,
          );
        }
      }
    }

    //
    //Adoptive Siblings
    //These are -adoptive children of your birth parents -all children of your adoptive parents

    //(dont use Map's inbuilt foreach function, it caused trouble with the code sequence and we ended up with duplicates in the siblings list because 2 similar things got added at the exact same time)

    //go through all parents
    for (var personParentLink in personsParentsAndAllTheirChildrenMap.keys) {
      //ONLY DO IF PARENT IS NOT HIDDEN
      if (!personParentLink.isHidden) {
        //get all their children
        final List<ParentChildLink> allPersonParentsChildrenLink =
            personsParentsAndAllTheirChildrenMap[personParentLink] ?? [];

        //if they are birth parents:
        if (personParentLink.isBirthRelationshipType) {
          //get all their adoptive children
          final List<ParentChildLink> adoptiveChildrenLink =
              allPersonParentsChildrenLink
                  .where((element) => element.isBirthRelationshipType == false)
                  .toList();

          //add all the adoptive children as adoptive siblings
          //(No Worries - function does checks and will not add a sibling that is already in the list)
          for (var adoptiveChildLink in adoptiveChildrenLink) {
            await addToSiblingsList(
              parentChildLink: adoptiveChildLink,
              platonicRelationshipType:
                  PlatonicRelationshipType.adoptiveSibling,
            );
          }
        }
        //else they are adoptive parents:
        else {
          //add all their children as adoptive siblings
          //(No Worries - function does checks and will not add a sibling that is already in the list)
          for (var childLink in allPersonParentsChildrenLink) {
            await addToSiblingsList(
              parentChildLink: childLink,
              platonicRelationshipType:
                  PlatonicRelationshipType.adoptiveSibling,
            );
          }
        }
      }
    }

    //
    //Step Siblings
    //children of parents spouse
    for (var parentLink in allPersonsParentLinks) {
      //if they are not hidden
      if (!parentLink.isHidden) {
        //get their spouse
        final Relationship? spouseRelationship =
            await _relationshipRepository.getMarriagePartnerRelationship(
          parentLink.parentId,
        );

        //if there is a spouse
        if (spouseRelationship != null) {
          //find the spouse id
          final int spouseID =
              (parentLink.parentId == spouseRelationship.firstPersonId)
                  ? spouseRelationship.secondPersonId
                  : spouseRelationship.firstPersonId;

          //if the spouse is not a parent(birth/adoptive)
          if (allPersonsParentLinks.every(
            (element) => element.parentId != spouseID,
          )) {
            //get all their children
            final List<ParentChildLink> spouseChildrenLinks =
                await _parentChildLinkRepository
                    .getAllChildrenOfParent(spouseID);

            //add all their children
            //(No Worries - function does checks and will not add a sibling that is already in the list)
            for (var spouseChildLink in spouseChildrenLinks) {
              await addToSiblingsList(
                parentChildLink: spouseChildLink,
                platonicRelationshipType: PlatonicRelationshipType.stepSibling,
              );
            }
          }
        }
      }
    }

    return siblings;
  }
}
