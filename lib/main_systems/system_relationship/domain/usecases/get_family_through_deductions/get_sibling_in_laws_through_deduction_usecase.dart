import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relationship_repository.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_siblings_through_deduction_usecase.dart';

class GetSiblingInLawsThroughDeductionUsecase {
  final GetSiblingsThroughDeductionUsecase _getSiblingsThroughDeductionUsecase;
  final RelationshipRepository _relationshipRepository;
  final PersonUsecases _personUsecases;

  const GetSiblingInLawsThroughDeductionUsecase(
    this._getSiblingsThroughDeductionUsecase,
    this._relationshipRepository,
    this._personUsecases,
  );

  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int personID,
  }) async {
    //Sibling in laws are spouse of person's siblings AND siblings of person's spouse
    List<PersonPlatonicRelationshipTypePair> siblingInLaws = [];

    //helper inner function
    void addToSiblingInLawsList({
      required Person person,
      required bool addAsStepSiblingInLaw,
    }) {
      siblingInLaws.add(
        PersonPlatonicRelationshipTypePair(
          person: person,
          platonicRelationshipType: (addAsStepSiblingInLaw)
              ? PlatonicRelationshipType.stepSiblingInLaw
              : PlatonicRelationshipType.siblingInLaw,
        ),
      );
    }

    //-Spouse's siblings:
    //get persons spouse
    final Relationship? personsSpouseRelationship =
        await _relationshipRepository.getMarriagePartnerRelationship(personID);

    if (personsSpouseRelationship != null) {
      //find the spouse person id
      //whichever id is NOT the child person id is the spouse id
      final int spouseID = (personID == personsSpouseRelationship.firstPersonId)
          ? personsSpouseRelationship.secondPersonId
          : personsSpouseRelationship.firstPersonId;

      //get spouse siblings
      final List<PersonPlatonicRelationshipTypePair> spouseSiblings =
          await _getSiblingsThroughDeductionUsecase.execute(personID: spouseID);

      //add all as sibling in law
      for (var spouseSibling in spouseSiblings) {
        addToSiblingInLawsList(
          person: spouseSibling.person,
          addAsStepSiblingInLaw: false,
        );
      }
    }

    //-Siblings spouses:
    //get persons siblings
    final List<PersonPlatonicRelationshipTypePair> personsSiblings =
        await _getSiblingsThroughDeductionUsecase.execute(personID: personID);

    //for each sibling
    for (var personSibling in personsSiblings) {
      //get their spouse
      final Relationship? siblingSpouseRelationship =
          await _relationshipRepository
              .getMarriagePartnerRelationship(personSibling.person.id);

      //if there is a spouse
      if (siblingSpouseRelationship != null) {
        //find the spouse person id
        //whichever id is NOT the sibling person id is the spouse id
        final int spouseID =
            (personSibling.person.id == siblingSpouseRelationship.firstPersonId)
                ? siblingSpouseRelationship.secondPersonId
                : siblingSpouseRelationship.firstPersonId;

        //get spouse person
        final Person? spousePerson =
            await _personUsecases.getPersonUsecase.execute(
          personID: spouseID,
        );

        if (spousePerson != null) {
          //add person to list
          //if the sibling is a step sibling -> step sibling in law, else just sibling in law
          addToSiblingInLawsList(
            person: spousePerson,
            addAsStepSiblingInLaw: (personSibling.platonicRelationshipType ==
                    PlatonicRelationshipType.stepSibling)
                ? true
                : false,
          );
        }
      }
    }

    return siblingInLaws;
  }
}
