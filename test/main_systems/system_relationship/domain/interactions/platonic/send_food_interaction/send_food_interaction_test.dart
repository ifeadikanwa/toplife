import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/get_day_of_birth_from_days_lived_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/get_days_lived_range_for_a_lifestage_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/get_random_day_of_birth_in_a_life_stage_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/get_random_days_lived_for_a_lifestage_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/send_food_interaction/send_food_interaction.dart';

import '../../../../../_mocks/system_mocks.mocks.dart';

void main() {
  group("Send Food Interaction:", () {
    late SendFoodInteraction sendFoodInteraction;
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
      sendFoodInteraction = SendFoodInteraction(
        MockRelationshipUsecases(),
        MockJournalUsecases(),
        MockShopAndStorageUsecases(),
        MockAgeUsecases(),
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
    test("title is Send Food", () {
      expect(
        sendFoodInteraction.title,
        "Send Food",
      );
    });

    test("description is If it's edible, it's food", () {
      expect(
        sendFoodInteraction.description,
        "If it's edible, it's food",
      );
    });

    test("duration in minutes is 10", () {
      expect(
        sendFoodInteraction.durationInMinutes,
        20,
      );
    });

    test(
        "isAvailable is false if player is younger than child and relationship person is older or equal to child and they live are not living together",
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
        sendFoodInteraction.isAvailable(
          currentDay: currentDay,
          currentPlayer: currentPlayer,
          relationshipPerson: relationshipPerson,
          livingTogether: false,
        ),
        false,
      );
    });

    test(
        "isAvailable is false if player is older or equal to child and relationship person is younger than child and they live are not living together",
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
        sendFoodInteraction.isAvailable(
          currentDay: currentDay,
          currentPlayer: currentPlayer,
          relationshipPerson: relationshipPerson,
          livingTogether: false,
        ),
        false,
      );
    });

    test(
        "isAvailable is false if player is older or equal to child and relationship person is older or equal to child and they live are living together",
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
        sendFoodInteraction.isAvailable(
          currentDay: currentDay,
          currentPlayer: currentPlayer,
          relationshipPerson: relationshipPerson,
          livingTogether: true,
        ),
        false,
      );
    });

    test(
        "isAvailable is true if player is older or equal to child and relationship person is older or equal to child and they live are not living together",
        () {
      final int playerDOB = getRandomDayOfBirthInALifeStageUsecase.execute(
        lifeStage: LifeStage.youngAdult,
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
        sendFoodInteraction.isAvailable(
          currentDay: currentDay,
          currentPlayer: currentPlayer,
          relationshipPerson: relationshipPerson,
          livingTogether: false,
        ),
        true,
      );
    });
  });
}
