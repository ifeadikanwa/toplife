import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_children_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_grandcousins_through_deduction_usecase.dart';

class GetGreatGrandCousinsThroughDeductionUsecase {
  final GetChildrenThroughDeductionUsecase _getChildrenThroughDeductionUsecase;
  final GetGrandCousinsThroughDeductionUsecase
      _getGrandCousinsThroughDeductionUsecase;

  const GetGreatGrandCousinsThroughDeductionUsecase(
    this._getChildrenThroughDeductionUsecase,
    this._getGrandCousinsThroughDeductionUsecase,
  );

  Future<List<PersonPlatonicRelationshipTypePair>> execute({
    required int personID,
  }) async {
    //GreatGrandCousins are the children of a person's grandCousins
    final List<PersonPlatonicRelationshipTypePair> greatGrandCousins = [];

    //helper inner function
    void addToGreatGrandCousinsList({
      required Person person,
      required bool addAsStepGreatGrandCousin,
    }) {
      greatGrandCousins.add(
        PersonPlatonicRelationshipTypePair(
          person: person,
          platonicRelationshipType: (addAsStepGreatGrandCousin)
              ? PlatonicRelationshipType.stepGreatGrandCousin
              : PlatonicRelationshipType.greatGrandCousin,
        ),
      );
    }

    //get person's grandcousins
    final List<PersonPlatonicRelationshipTypePair> allGrandCousins =
        await _getGrandCousinsThroughDeductionUsecase.execute(
      personID: personID,
    );

    //get children of each grandcousin
    for (var grandCousin in allGrandCousins) {
      //
      final List<PersonPlatonicRelationshipTypePair> grandCousinsChildren =
          await _getChildrenThroughDeductionUsecase.execute(
        personID: grandCousin.person.id,
      );

      //add each child to greatGrandCousins
      for (var grandCousinsChild in grandCousinsChildren) {
        //if current grandcousin is a step grandcousin:
        //add all their children as step greatgrandcousin
        if (grandCousin.platonicRelationshipType ==
            PlatonicRelationshipType.stepGrandCousin) {
          addToGreatGrandCousinsList(
            person: grandCousinsChild.person,
            addAsStepGreatGrandCousin: true,
          );
        }
        //Not a step grandcousin:
        //if the child is a step Child of the grandcousin, then they are your step GreatGrandCousin
        else if (grandCousinsChild.platonicRelationshipType ==
            PlatonicRelationshipType.stepChild) {
          addToGreatGrandCousinsList(
            person: grandCousinsChild.person,
            addAsStepGreatGrandCousin: true,
          );
        }
        //Not a step grand cousin:
        //also not grandcousin's step child, we add as just GreatGrandCousin
        else {
          addToGreatGrandCousinsList(
            person: grandCousinsChild.person,
            addAsStepGreatGrandCousin: false,
          );
        }
      }
    }

    return greatGrandCousins;
  }
}
