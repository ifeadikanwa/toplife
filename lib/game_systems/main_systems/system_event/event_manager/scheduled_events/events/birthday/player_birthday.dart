import 'dart:math';

import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/game_systems/main_systems/system_age/age.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/scheduled_events/events/birthday/birthday_comments.dart';
import 'package:toplife/game_systems/main_systems/system_journal/constants/journal_characters.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/vital_status.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_fullname_string.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/label/get_platonic_and_romantic_relationship_label_from_string.dart.dart';

class PlayerBirthday {
  final RelationshipUsecases _relationshipUsecases;

  const PlayerBirthday(
    this._relationshipUsecases,
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
    final List<PersonRelationshipPair> livingFriends =
        await _relationshipUsecases.getAllFriendsUsecase.execute(
      personID: event.mainPersonId,
      includeOnly: VitalStatus.living,
    );

    if (livingFriends.isNotEmpty) {
      //choose a random friend
      final randomIndex = Random().nextInt(livingFriends.length);

      final PersonRelationshipPair chosenFriendRelationshipPair =
          livingFriends[randomIndex];

      final Relationship chosenFriendRelationship =
          chosenFriendRelationshipPair.relationship;

      final Person friendPerson = chosenFriendRelationshipPair.person;

      final String randomFriendComment = BirthdayComments.friendComments[
          Random().nextInt(BirthdayComments.friendComments.length)];

      //get label
      final String friendLabel =
          getPlatonicAndRomanticRelationshipLabelFromString(
        genderString: friendPerson.gender,
        platonicRelationshipTypeString:
            chosenFriendRelationship.platonicRelationshipType,
        romanticRelationshipTypeString:
            chosenFriendRelationship.romanticRelationshipType,
        previousFamilialRelationshipString:
            chosenFriendRelationship.previousFamilialRelationship,
        isCoParent: chosenFriendRelationship.isCoParent,
        activeRomance: chosenFriendRelationship.activeRomance,
      );

      //
      final friendEntry =
          "${JournalCharacters.space}My $friendLabel, ${getFullNameString(firstName: friendPerson.firstName, lastName: friendPerson.lastName)} $randomFriendComment.";

      return friendEntry;
    }

    return JournalCharacters.emptyString;
  }

  Future<String> getPartnerEntry(Event event) async {
    final List<PersonRelationshipPair> activePartnersPairs =
        await _relationshipUsecases.getAllActivePartnersUsecase.execute(
      personID: event.mainPersonId,
      includeOnly: VitalStatus.living,
    );

    if (activePartnersPairs.isNotEmpty) {
      final PersonRelationshipPair chosenActivePartnerRelationshipPair =
          activePartnersPairs[Random().nextInt(activePartnersPairs.length)];

      final Relationship chosenActivePartnerRelationship =
          chosenActivePartnerRelationshipPair.relationship;

      final Person partnerPerson = chosenActivePartnerRelationshipPair.person;

      final partnerLabel = getPlatonicAndRomanticRelationshipLabelFromString(
        genderString: partnerPerson.gender,
        platonicRelationshipTypeString:
            chosenActivePartnerRelationship.platonicRelationshipType,
        romanticRelationshipTypeString:
            chosenActivePartnerRelationship.romanticRelationshipType,
        previousFamilialRelationshipString:
            chosenActivePartnerRelationship.previousFamilialRelationship,
        isCoParent: chosenActivePartnerRelationship.isCoParent,
        activeRomance: chosenActivePartnerRelationship.activeRomance,
      );

      final String randomPartnerComment = BirthdayComments.partnerComments[
          Random().nextInt(BirthdayComments.partnerComments.length)];

      final partnerEntry =
          "${JournalCharacters.space}My $partnerLabel, ${getFullNameString(firstName: partnerPerson.firstName, lastName: partnerPerson.lastName)} says ${partnerPerson.subjectPronoun} $randomPartnerComment.";

      return partnerEntry;
    }

    return JournalCharacters.emptyString;
  }
}
