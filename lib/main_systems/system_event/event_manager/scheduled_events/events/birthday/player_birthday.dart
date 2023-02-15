import 'dart:math';

import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/birthday/birthday_comments.dart';
import 'package:toplife/main_systems/system_journal/constants/journal_characters.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/friend.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/partner.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_relationship/util/get_active_partner_label.dart';

class PlayerBirthday {
  final RelationshipUsecases _relationshipUsecases;
  final PersonUsecases _personUsecases;

  const PlayerBirthday(
    this._relationshipUsecases,
    this._personUsecases,
  );

  Future<String> run(
    Event event,
    Person birthdayPerson,
    Age age,
  ) async {
    String journalEntry =
        "Today is my birthday. I am now ${SentenceUtil.getArticle(age.lifeStage.stageName).toLowerCase()} ${age.lifeStage.stageName.toLowerCase()}!";

    final String friendEntry = await getFriendsEntry(event);
    final String partnerEntry = await getPartnerEntry(event);

    journalEntry = "$journalEntry$partnerEntry$friendEntry";

    return journalEntry;
  }

  Future<String> getFriendsEntry(Event event) async {
    final List<Friend> friends = await _relationshipUsecases.getFriendsUsecase
        .execute(event.mainPersonID);

    if (friends.isNotEmpty) {
      final randomIndex = Random().nextInt(friends.length);

      final Person? friendPerson =
          await _personUsecases.getPersonUsecase.execute(
        personID: friends[randomIndex].friendID,
      );

      final String randomFriendComment = BirthdayComments.friendComments[
          Random().nextInt(BirthdayComments.friendComments.length)];

      if (friendPerson != null) {
        final friendEntry =
            "${JournalCharacters.space}My friend, ${friendPerson.firstName} $randomFriendComment.";

        return friendEntry;
      }
    }

    return JournalCharacters.emptyString;
  }

  Future<String> getPartnerEntry(Event event) async {
    final Partner? currentPartner = await _relationshipUsecases
        .getCurrentPartnerUsecase
        .execute(event.mainPersonID);

    if (currentPartner != null) {
      final Person? partnerPerson =
          await _personUsecases.getPersonUsecase.execute(
        personID: currentPartner.partnerID,
      );

      if (partnerPerson != null) {
        final partnerLabel = getActivePartnerLabel(
          partnerPerson.gender,
          currentPartner.partnerRelationshipType,
        );

        final String randomPartnerComment = BirthdayComments.partnerComments[
            Random().nextInt(BirthdayComments.partnerComments.length)];

        final partnerEntry =
            "${JournalCharacters.space}My $partnerLabel, ${partnerPerson.firstName} says ${partnerPerson.subjectPronoun} $randomPartnerComment.";

        return partnerEntry;
      }
    }

    return JournalCharacters.emptyString;
  }
}
