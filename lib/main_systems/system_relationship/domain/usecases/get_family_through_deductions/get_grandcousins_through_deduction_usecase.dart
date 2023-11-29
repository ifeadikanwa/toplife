import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_children_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_cousins_through_deduction_usecase.dart';

class GetGrandCousinsThroughDeductionUsecase {
  final GetChildrenThroughDeductionUsecase _getChildrenThroughDeductionUsecase;
  final GetCousinsThroughDeductionUsecase _getCousinsThroughDeductionUsecase;

  const GetGrandCousinsThroughDeductionUsecase(
    this._getChildrenThroughDeductionUsecase,
    this._getCousinsThroughDeductionUsecase,
  );

  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int personID,
    required bool onlyLivingPeople,
  }) async {
    //GrandCousins are the children of a person's grandCousins
    final List<PersonPlatonicRelationshipTypePair> grandCousins = [];

    //helper inner function
    void addToGrandCousinsList({
      required Person person,
      required bool addAsStepGrandCousin,
    }) {
      grandCousins.add(
        PersonPlatonicRelationshipTypePair(
          person: person,
          platonicRelationshipType: (addAsStepGrandCousin)
              ? PlatonicRelationshipType.stepGrandCousin
              : PlatonicRelationshipType.grandCousin,
        ),
      );
    }

    //get person's cousins
    final List<PersonPlatonicRelationshipTypePair> allCousins =
        await _getCousinsThroughDeductionUsecase.execute(
      personID: personID,
      onlyLivingPeople: false,
    );

    //get children of each cousin
    for (var cousin in allCousins) {
      //
      final List<PersonPlatonicRelationshipTypePair> cousinsChildren =
          await _getChildrenThroughDeductionUsecase.execute(
        personID: cousin.person.id,
        onlyLivingPeople: false,
      );

      //add each child to grandCousins
      for (var cousinsChild in cousinsChildren) {
        //if current cousin is a step cousin:
        //add all their children as step cousin
        if (cousin.platonicRelationshipType ==
            PlatonicRelationshipType.stepCousin) {
          addToGrandCousinsList(
            person: cousinsChild.person,
            addAsStepGrandCousin: true,
          );
        }
        //Not a step cousin:
        //if the child is a step Child of the cousin, then they are your step GrandCousin
        else if (cousinsChild.platonicRelationshipType ==
            PlatonicRelationshipType.stepChild) {
          addToGrandCousinsList(
            person: cousinsChild.person,
            addAsStepGrandCousin: true,
          );
        }
        //Not a step cousin:
        //also not cousin's step child, we add as just GrandCousin
        else {
          addToGrandCousinsList(
            person: cousinsChild.person,
            addAsStepGrandCousin: false,
          );
        }
      }
    }

    //return based on request
    return (onlyLivingPeople)
        ? grandCousins.where((pair) => pair.person.dead == false).toList()
        : grandCousins;
  }
}
