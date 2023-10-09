import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relationship_repository.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_children_through_deduction_usecase.dart';

class GetChildrenInLawThroughDeductionUsecase {
  final GetChildrenThroughDeductionUsecase _getChildrenThroughDeductionUsecase;
  final RelationshipRepository _relationshipRepository;
  final PersonUsecases _personUsecases;

  const GetChildrenInLawThroughDeductionUsecase(
    this._getChildrenThroughDeductionUsecase,
    this._relationshipRepository,
    this._personUsecases,
  );

  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int personID,
  }) async {
    //Children in laws are spouses of person's children
    List<PersonPlatonicRelationshipTypePair> childrenInLaw = [];

    //get persons children
    final List<PersonPlatonicRelationshipTypePair> personsChildren =
        await _getChildrenThroughDeductionUsecase.execute(personID: personID);

    //for each child, get their spouse
    for (var child in personsChildren) {
      //get spouse
      final Relationship? childSpouseRelationship =
          await _relationshipRepository
              .getMarriagePartnerRelationship(child.person.id);

      //if there is a spouse
      if (childSpouseRelationship != null) {
        //find the spouse person id
        //whichever id is NOT the child person id is the spouse id
        final int spouseID =
            (child.person.id == childSpouseRelationship.firstPersonId)
                ? childSpouseRelationship.secondPersonId
                : childSpouseRelationship.firstPersonId;

        //get spouse person
        final Person? spousePerson =
            await _personUsecases.getPersonUsecase.execute(
          personID: spouseID,
        );

        if (spousePerson != null) {
          //add person to list
          //if the child is a step child -> step child in law, else just child in law
          childrenInLaw.add(
            PersonPlatonicRelationshipTypePair(
              person: spousePerson,
              platonicRelationshipType: (child.platonicRelationshipType ==
                      PlatonicRelationshipType.stepChild)
                  ? PlatonicRelationshipType.stepChildInLaw
                  : PlatonicRelationshipType.childInLaw,
            ),
          );
        }
      }
    }
    return childrenInLaw;
  }
}
