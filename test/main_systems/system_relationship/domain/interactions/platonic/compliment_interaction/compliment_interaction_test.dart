import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/compliment_interaction/compliment_interaction.dart';

import '../../../../../_mocks/system_mocks.mocks.dart';

void main() {
  group("Compliment Interaction:", () {
    late ComplimentInteraction complimentInteraction;

    setUp(() {
      complimentInteraction = ComplimentInteraction(
        MockRelationshipUsecases(),
        MockJournalUsecases(),
        MockPersonUsecases(),
      );
    });
    test("title is Compliment", () {
      expect(
        complimentInteraction.title,
        "Compliment",
      );
    });

    test("description is Have a conversation about any and everything", () {
      expect(
        complimentInteraction.description,
        "Say something nice",
      );
    });

    test("duration in minutes is 10", () {
      expect(
        complimentInteraction.durationInMinutes,
        10,
      );
    });

    test("isAvailable is always true", () {
      expect(
        complimentInteraction.isAvailable(
          ageUsecases: AgeUsecases(),
          currentDay: 0,
          currentPlayer: MockPerson(),
          relationshipPerson: MockPerson(),
          livingTogether: true,
        ),
        true,
      );
    });
  });
}
