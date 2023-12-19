import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/chat_interaction/chat_interaction.dart';

import '../../../../../_mocks/system_mocks.mocks.dart';


void main() {
  group("Chat Interaction:", () {
    late ChatInteraction chatInteraction;
    setUp(() {
      chatInteraction = ChatInteraction(
        MockRelationshipUsecases(),
        MockJournalUsecases(),
      );
    });
    test("title is Chat", () {
      expect(
        chatInteraction.title,
        "Chat",
      );
    });

    test("description is Have a conversation about any and everything", () {
      expect(
        chatInteraction.description,
        "Have a conversation about any and everything",
      );
    });

    test("duration in minutes is 10", () {
      expect(
        chatInteraction.durationInMinutes,
        10,
      );
    });

    test("isAvailable is always true", () {
      expect(
        chatInteraction.isAvailable(
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
