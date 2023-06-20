import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/send_food_interaction/send_food_interaction.dart';

import '../../../../../_mocks/system_mocks.mocks.dart';

void main() {
  group("Send Food Interaction:", () {
    late SendFoodInteraction sendFoodInteraction;
    const int currentDay = 100;
    late Person testPerson;

    setUp(() {
      sendFoodInteraction = SendFoodInteraction(
        MockRelationshipUsecases(),
        MockJournalUsecases(),
        MockPersonUsecases(),
        MockShopAndStorageUsecases(),
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
        zodiacSign: "zodiacSign",
        hasDriversLicense: true,
        transportMode: "transportMode",
        hasFertilityIssues: false,
        onBirthControl: false,
        isSterile: false,
        sickly: false,
        rebellious: false,
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
      final int playerDOB =
          AgeUsecases().getRandomDayOfBirthInALifeStageUsecase.execute(
                lifeStage: LifeStage.toddler,
                currentDay: currentDay,
              );

      final int relationshipPersonsDOB =
          AgeUsecases().getRandomDayOfBirthInALifeStageUsecase.execute(
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
          ageUsecases: AgeUsecases(),
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
      final int playerDOB =
          AgeUsecases().getRandomDayOfBirthInALifeStageUsecase.execute(
                lifeStage: LifeStage.youngAdult,
                currentDay: currentDay,
              );

      final int relationshipPersonsDOB =
          AgeUsecases().getRandomDayOfBirthInALifeStageUsecase.execute(
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
          ageUsecases: AgeUsecases(),
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
      final int playerDOB =
          AgeUsecases().getRandomDayOfBirthInALifeStageUsecase.execute(
                lifeStage: LifeStage.elder,
                currentDay: currentDay,
              );

      final int relationshipPersonsDOB =
          AgeUsecases().getRandomDayOfBirthInALifeStageUsecase.execute(
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
          ageUsecases: AgeUsecases(),
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
      final int playerDOB =
          AgeUsecases().getRandomDayOfBirthInALifeStageUsecase.execute(
                lifeStage: LifeStage.youngAdult,
                currentDay: currentDay,
              );

      final int relationshipPersonsDOB =
          AgeUsecases().getRandomDayOfBirthInALifeStageUsecase.execute(
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
          ageUsecases: AgeUsecases(),
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
