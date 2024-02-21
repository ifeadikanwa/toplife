import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/platonic_relationship_type_with_parent_type_indicator.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/find_relationship/find_persons_familial_relationship_to_player_through_parent_usecase.dart';

import '../../../../_mocks/system_mocks.mocks.dart';

void main() {
  group("FindPersonsFamilialRelationshipToPlayerThroughParentUsecase: ", () {
    //variables
    late FindPersonsFamilialRelationshipToPlayerThroughParentUsecase
        usecaseUnderTest;
    late MockGetSiblingsThroughDeductionUsecase
        mockGetSiblingsThroughDeductionUsecase;
    const int dummyChildId = 55;
    const int dummyPlayerId = 32;

    setUp(() {
      mockGetSiblingsThroughDeductionUsecase =
          MockGetSiblingsThroughDeductionUsecase();
      usecaseUnderTest =
          FindPersonsFamilialRelationshipToPlayerThroughParentUsecase(
        mockGetSiblingsThroughDeductionUsecase,
      );
    });

    group("given platonic relationship type is a parent type:", () {
      //global variables:
      const Person testPerson = Person(
        id: 1,
        gameId: 2,
        hasDriversLicense: false,
        firstName: "FirstName",
        lastName: "LastName",
        dayOfBirth: 34,
        gender: "Female",
        subjectPronoun: "subjectPronoun",
        objectPronoun: "objectPronoun",
        possessivePronoun: "possessivePronoun",
        sexuality: "sexuality",
        birthState: "Ontario",
        birthCountry: "Canada",
        currentState: "Ontario",
        currentCountry: "Canada",
        money: 120,
        emotionalState: "normal",
        zodiacSign: "zodiacSign",
        transportMode: "bus",
        drivingMode: "drivingMode",
        hasFertilityIssues: true,
        onBirthControl: false,
        isSterile: false,
        sickly: true,
        dead: false,
      );

      //make one of them have the child id
      final testSiblings = [
        //
        PersonPlatonicRelationshipTypePair(
          person: testPerson.copyWith(
            id: dummyChildId,
            firstName: "Helen",
            lastName: "Polut",
          ),
          platonicRelationshipType: PlatonicRelationshipType.fullSibling,
        ),
        //
        PersonPlatonicRelationshipTypePair(
          person: testPerson.copyWith(
            firstName: "Frederick",
            lastName: "Lokia",
          ),
          platonicRelationshipType: PlatonicRelationshipType.halfSibling,
        ),
      ];
      test(
          "given a parent platonic relationship(birthparent is used), if the child is deduced as a sibling, we get a sibling relationship type",
          () async {
        //ask sibling deduction to give us preset list of siblings when called
        when(mockGetSiblingsThroughDeductionUsecase.execute(
          personID: anyNamed("personID"),
          onlyLivingPeople: false,
        )).thenAnswer((_) async => Future.value(testSiblings));

        //call the usecase under test
        final PlatonicRelationshipType? result = await usecaseUnderTest.execute(
          parentRelationshipToPlayer:
              const PlatonicRelationshipTypeWithParentTypeIndicator(
            platonicRelationshipType: PlatonicRelationshipType.birthParent,
            isStepParent: false,
          ),
          childPersonID: dummyChildId,
          playerPersonID: dummyPlayerId,
        );

        //
        expect(
          result,
          PlatonicRelationshipType.fullSibling,
        );
      });
    });

    test(
        "given a parent platonic relationship(adoptive parent is used), if the child is NOT deduced as a sibling, we get null",
        () async {
      //ask sibling deduction to give us empty list
      when(mockGetSiblingsThroughDeductionUsecase.execute(
        personID: anyNamed("personID"),
        onlyLivingPeople: false,
      )).thenAnswer((_) async => Future.value([]));

      //call the usecase under test
      final PlatonicRelationshipType? result = await usecaseUnderTest.execute(
        parentRelationshipToPlayer:
            const PlatonicRelationshipTypeWithParentTypeIndicator(
          platonicRelationshipType: PlatonicRelationshipType.adoptiveParent,
          isStepParent: false,
        ),
        childPersonID: dummyChildId,
        playerPersonID: dummyPlayerId,
      );

      //
      expect(
        result,
        null,
      );
    });

    group("given non-parent relationship type:", () {
      test(
          "given a platonic relationship AND step parent is FALSE, we get the correct child relationship type",
          () async {
        for (var type in PlatonicRelationshipType.values) {
          //setup
          PlatonicRelationshipTypeWithParentTypeIndicator parentTypeIndicator =
              PlatonicRelationshipTypeWithParentTypeIndicator(
            platonicRelationshipType: type,
            isStepParent: false,
          );

          //get result
          final PlatonicRelationshipType? result =
              await usecaseUnderTest.execute(
            parentRelationshipToPlayer: parentTypeIndicator,
            childPersonID: dummyChildId,
            playerPersonID: dummyPlayerId,
          );

          //test
          switch (type) {
            //parents
            case PlatonicRelationshipType.birthParent:
              //NEEDS SPECIAL TEST
              break;
            case PlatonicRelationshipType.adoptiveParent:
              //NEEDS SPECIAL TEST

              break;
            case PlatonicRelationshipType.stepParent:
              //NEEDS SPECIAL TEST
              break;

            //siblings
            case PlatonicRelationshipType.fullSibling:
              expect(
                result,
                PlatonicRelationshipType.nibling,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.halfSibling:
              expect(
                result,
                PlatonicRelationshipType.nibling,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.adoptiveSibling:
              expect(
                result,
                PlatonicRelationshipType.nibling,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepSibling:
              expect(
                result,
                PlatonicRelationshipType.stepNibling,
                reason: "Cause: $type",
              );
              break;

            //child
            case PlatonicRelationshipType.birthChild:
              expect(
                result,
                PlatonicRelationshipType.grandChild,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.adoptiveChild:
              expect(
                result,
                PlatonicRelationshipType.grandChild,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepChild:
              expect(
                result,
                PlatonicRelationshipType.stepGrandChild,
                reason: "Cause: $type",
              );
              break;

            //relative
            case PlatonicRelationshipType.grandParent:
              expect(
                result,
                PlatonicRelationshipType.pibling,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepGrandParent:
              expect(
                result,
                PlatonicRelationshipType.stepPibling,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.greatGrandParent:
              expect(
                result,
                PlatonicRelationshipType.distantRelative,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepGreatGrandParent:
              expect(
                result,
                PlatonicRelationshipType.distantRelative,
                reason: "Cause: $type",
              );
              break;

            case PlatonicRelationshipType.grandChild:
              expect(
                result,
                PlatonicRelationshipType.greatGrandChild,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepGrandChild:
              expect(
                result,
                PlatonicRelationshipType.stepGreatGrandChild,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.greatGrandChild:
              expect(
                result,
                PlatonicRelationshipType.distantRelative,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepGreatGrandChild:
              expect(
                result,
                PlatonicRelationshipType.distantRelative,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.pibling:
              expect(
                result,
                PlatonicRelationshipType.cousin,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepPibling:
              expect(
                result,
                PlatonicRelationshipType.stepCousin,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.cousin:
              expect(
                result,
                PlatonicRelationshipType.grandCousin,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepCousin:
              expect(
                result,
                PlatonicRelationshipType.stepGrandCousin,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.grandCousin:
              expect(
                result,
                PlatonicRelationshipType.greatGrandCousin,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepGrandCousin:
              expect(
                result,
                PlatonicRelationshipType.stepGreatGrandCousin,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.greatGrandCousin:
              expect(
                result,
                PlatonicRelationshipType.distantRelative,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepGreatGrandCousin:
              expect(
                result,
                PlatonicRelationshipType.distantRelative,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.nibling:
              expect(
                result,
                PlatonicRelationshipType.grandNibling,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepNibling:
              expect(
                result,
                PlatonicRelationshipType.stepGrandNibling,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.grandNibling:
              expect(
                result,
                PlatonicRelationshipType.greatGrandNibling,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepGrandNibling:
              expect(
                result,
                PlatonicRelationshipType.stepGreatGrandNibling,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.greatGrandNibling:
              expect(
                result,
                PlatonicRelationshipType.distantRelative,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepGreatGrandNibling:
              expect(
                result,
                PlatonicRelationshipType.distantRelative,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.distantRelative:
              expect(
                result,
                PlatonicRelationshipType.distantRelative,
                reason: "Cause: $type",
              );
              break;

            //in laws
            case PlatonicRelationshipType.parentInLaw:
              expect(
                result,
                PlatonicRelationshipType.siblingInLaw,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.siblingInLaw:
              expect(
                result,
                null,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepSiblingInLaw:
              expect(
                result,
                null,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.childInLaw:
              expect(
                result,
                null,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepChildInLaw:
              expect(
                result,
                null,
                reason: "Cause: $type",
              );
              break;

            //friend
            case PlatonicRelationshipType.friend:
              expect(
                result,
                null,
                reason: "Cause: $type",
              );
              break;

            //acquaintance
            case PlatonicRelationshipType.acquaintance:
              expect(
                result,
                null,
                reason: "Cause: $type",
              );
              break;
          }
        }
      });

      test(
          "given a platonic relationship AND step parent is TRUE, we get the correct child relationship type",
          () async {
        for (var type in PlatonicRelationshipType.values) {
          //setup
          PlatonicRelationshipTypeWithParentTypeIndicator parentTypeIndicator =
              PlatonicRelationshipTypeWithParentTypeIndicator(
            platonicRelationshipType: type,
            isStepParent: true,
          );

          //get result
          final PlatonicRelationshipType? result =
              await usecaseUnderTest.execute(
            parentRelationshipToPlayer: parentTypeIndicator,
            childPersonID: dummyChildId,
            playerPersonID: dummyPlayerId,
          );

          //test
          switch (type) {
            //parents
            case PlatonicRelationshipType.birthParent:
              //NEEDS SPECIAL TEST
              break;
            case PlatonicRelationshipType.adoptiveParent:
              //NEEDS SPECIAL TEST

              break;
            case PlatonicRelationshipType.stepParent:
              //NEEDS SPECIAL TEST
              break;

            //siblings
            case PlatonicRelationshipType.fullSibling:
              expect(
                result,
                PlatonicRelationshipType.stepNibling,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.halfSibling:
              expect(
                result,
                PlatonicRelationshipType.stepNibling,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.adoptiveSibling:
              expect(
                result,
                PlatonicRelationshipType.stepNibling,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepSibling:
              expect(
                result,
                PlatonicRelationshipType.stepNibling,
                reason: "Cause: $type",
              );
              break;

            //child
            case PlatonicRelationshipType.birthChild:
              expect(
                result,
                PlatonicRelationshipType.stepGrandChild,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.adoptiveChild:
              expect(
                result,
                PlatonicRelationshipType.stepGrandChild,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepChild:
              expect(
                result,
                PlatonicRelationshipType.stepGrandChild,
                reason: "Cause: $type",
              );
              break;

            //relative
            case PlatonicRelationshipType.grandParent:
              expect(
                result,
                PlatonicRelationshipType.stepPibling,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepGrandParent:
              expect(
                result,
                PlatonicRelationshipType.stepPibling,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.greatGrandParent:
              expect(
                result,
                PlatonicRelationshipType.distantRelative,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepGreatGrandParent:
              expect(
                result,
                PlatonicRelationshipType.distantRelative,
                reason: "Cause: $type",
              );
              break;

            case PlatonicRelationshipType.grandChild:
              expect(
                result,
                PlatonicRelationshipType.stepGreatGrandChild,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepGrandChild:
              expect(
                result,
                PlatonicRelationshipType.stepGreatGrandChild,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.greatGrandChild:
              expect(
                result,
                PlatonicRelationshipType.distantRelative,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepGreatGrandChild:
              expect(
                result,
                PlatonicRelationshipType.distantRelative,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.pibling:
              expect(
                result,
                PlatonicRelationshipType.stepCousin,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepPibling:
              expect(
                result,
                PlatonicRelationshipType.stepCousin,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.cousin:
              expect(
                result,
                PlatonicRelationshipType.stepGrandCousin,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepCousin:
              expect(
                result,
                PlatonicRelationshipType.stepGrandCousin,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.grandCousin:
              expect(
                result,
                PlatonicRelationshipType.stepGreatGrandCousin,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepGrandCousin:
              expect(
                result,
                PlatonicRelationshipType.stepGreatGrandCousin,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.greatGrandCousin:
              expect(
                result,
                PlatonicRelationshipType.distantRelative,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepGreatGrandCousin:
              expect(
                result,
                PlatonicRelationshipType.distantRelative,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.nibling:
              expect(
                result,
                PlatonicRelationshipType.stepGrandNibling,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepNibling:
              expect(
                result,
                PlatonicRelationshipType.stepGrandNibling,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.grandNibling:
              expect(
                result,
                PlatonicRelationshipType.stepGreatGrandNibling,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepGrandNibling:
              expect(
                result,
                PlatonicRelationshipType.stepGreatGrandNibling,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.greatGrandNibling:
              expect(
                result,
                PlatonicRelationshipType.distantRelative,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepGreatGrandNibling:
              expect(
                result,
                PlatonicRelationshipType.distantRelative,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.distantRelative:
              expect(
                result,
                PlatonicRelationshipType.distantRelative,
                reason: "Cause: $type",
              );
              break;

            //in laws
            case PlatonicRelationshipType.parentInLaw:
              expect(
                result,
                PlatonicRelationshipType.siblingInLaw,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.siblingInLaw:
              expect(
                result,
                null,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepSiblingInLaw:
              expect(
                result,
                null,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.childInLaw:
              expect(
                result,
                null,
                reason: "Cause: $type",
              );
              break;
            case PlatonicRelationshipType.stepChildInLaw:
              expect(
                result,
                null,
                reason: "Cause: $type",
              );
              break;

            //friend
            case PlatonicRelationshipType.friend:
              expect(
                result,
                null,
                reason: "Cause: $type",
              );
              break;

            //acquaintance
            case PlatonicRelationshipType.acquaintance:
              expect(
                result,
                null,
                reason: "Cause: $type",
              );
              break;
          }
        }
      });
    });
  });
}
