import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/check_if_person_is_at_least_this_age_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_day_of_birth_from_days_lived_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_days_lived_range_for_a_lifestage_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_persons_days_lived_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_random_day_of_birth_in_a_life_stage_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_random_days_lived_for_a_lifestage_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/interactions/platonic/torment_interaction/torment_interaction.dart';

import '../../../../../_mocks/system_mocks.mocks.dart';

void main() {
  group("Torment Interaction:", () {
    late TormentInteraction tormentInteraction;
    final mockAgeUsecases = MockAgeUsecases();

    late Person testPerson;

    const int currentDay = 100;

    final GetRandomDayOfBirthInALifeStageUsecase
        getRandomDayOfBirthInALifeStageUsecase =
        GetRandomDayOfBirthInALifeStageUsecase(
      const GetRandomDaysLivedInALifestage(
          GetDaysLivedRangeForALifestageUsecase()),
      GetDayOfBirthFromDaysLivedUsecase(),
    );

    setUp(() {
      tormentInteraction = TormentInteraction(
        MockRelationshipUsecases(),
        MockJournalUsecases(),
        mockAgeUsecases,
        MockDialogHandler(),
      );

      //create stubs for our test:
      //if this usecase is requested return the real object instance
      when(mockAgeUsecases.checkIfPersonIsAtLeastThisAgeUsecase).thenReturn(
        const CheckIfPersonIsAtLeastThisAgeUsecase(
          GetPersonsDaysLivedUsecase(),
        ),
      );

      testPerson = const Person(
        id: 0,
        gameId: 0,
        firstName: "firstName",
        lastName: "lastName",
        dayOfBirth: 0,
        gender: "gender",
        subjectPronoun: "subjectPronoun",
        objectPronoun: "objectPronoun",
        possessivePronoun: "possessivePronoun",
        sexuality: "sexuality",
        currentState: "currentState",
        currentCountry: "currentCountry",
        birthState: "birthState",
        birthCountry: "birthCountry",
        money: 0,
        emotionalState: "normal",
        zodiacSign: "zodiacSign",
        hasDriversLicense: true,
        transportMode: "transportMode",
        drivingMode: "drivingMode",
        hasFertilityIssues: false,
        onBirthControl: false,
        isSterile: false,
        sickly: false,
        dead: false,
      );
    });
    test("title is Torment", () {
      expect(
        tormentInteraction.title,
        "Torment",
      );
    });

    test("description is Spread a little chaos", () {
      expect(
        tormentInteraction.description,
        "Spread a little chaos",
      );
    });

    test("duration in minutes is 10", () {
      expect(
        tormentInteraction.durationInMinutes,
        20,
      );
    });

    test(
        "isAvailable is false if player is younger than child and relationship person is older or equal to child whether they live together or not",
        () {
      final int playerDOB = getRandomDayOfBirthInALifeStageUsecase.execute(
        lifeStage: LifeStage.toddler,
        currentDay: currentDay,
      );

      final int relationshipPersonsDOB =
          getRandomDayOfBirthInALifeStageUsecase.execute(
        lifeStage: LifeStage.child,
        currentDay: currentDay,
      );

      final Person currentPlayer = testPerson.copyWith(
        dayOfBirth: playerDOB,
      );
      final Person relationshipPerson = testPerson.copyWith(
        dayOfBirth: relationshipPersonsDOB,
      );

      expect(
        tormentInteraction.isAvailable(
          currentDay: currentDay,
          currentPlayer: currentPlayer,
          relationshipPerson: relationshipPerson,
          livingTogether: true,
        ),
        false,
        reason: "Living together",
      );

      expect(
        tormentInteraction.isAvailable(
          currentDay: currentDay,
          currentPlayer: currentPlayer,
          relationshipPerson: relationshipPerson,
          livingTogether: false,
        ),
        false,
        reason: "Not living together",
      );
    });

    test(
        "isAvailable is false if player is older or equal to child and relationship person is younger than child whether they live together or not",
        () {
      final int playerDOB = getRandomDayOfBirthInALifeStageUsecase.execute(
        lifeStage: LifeStage.youngAdult,
        currentDay: currentDay,
      );

      final int relationshipPersonsDOB =
          getRandomDayOfBirthInALifeStageUsecase.execute(
        lifeStage: LifeStage.baby,
        currentDay: currentDay,
      );

      final Person currentPlayer = testPerson.copyWith(
        dayOfBirth: playerDOB,
      );
      final Person relationshipPerson = testPerson.copyWith(
        dayOfBirth: relationshipPersonsDOB,
      );

      expect(
        tormentInteraction.isAvailable(
          currentDay: currentDay,
          currentPlayer: currentPlayer,
          relationshipPerson: relationshipPerson,
          livingTogether: true,
        ),
        false,
        reason: "Living together",
      );

      expect(
        tormentInteraction.isAvailable(
          currentDay: currentDay,
          currentPlayer: currentPlayer,
          relationshipPerson: relationshipPerson,
          livingTogether: false,
        ),
        false,
        reason: "Not living together",
      );
    });

    test(
        "isAvailable is true if player is older or equal to child and relationship person is older or equal to child whether they live together or not",
        () {
      final int playerDOB = getRandomDayOfBirthInALifeStageUsecase.execute(
        lifeStage: LifeStage.elder,
        currentDay: currentDay,
      );

      final int relationshipPersonsDOB =
          getRandomDayOfBirthInALifeStageUsecase.execute(
        lifeStage: LifeStage.child,
        currentDay: currentDay,
      );

      final Person currentPlayer = testPerson.copyWith(
        dayOfBirth: playerDOB,
      );
      final Person relationshipPerson = testPerson.copyWith(
        dayOfBirth: relationshipPersonsDOB,
      );

      expect(
        tormentInteraction.isAvailable(
          currentDay: currentDay,
          currentPlayer: currentPlayer,
          relationshipPerson: relationshipPerson,
          livingTogether: true,
        ),
        true,
        reason: "Living together",
      );

      expect(
        tormentInteraction.isAvailable(
          currentDay: currentDay,
          currentPlayer: currentPlayer,
          relationshipPerson: relationshipPerson,
          livingTogether: false,
        ),
        true,
        reason: "Not living together",
      );
    });
  });
}
