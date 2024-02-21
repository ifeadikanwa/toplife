import 'dart:math';

import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/birthday/birthday_comments.dart';
import 'package:toplife/main_systems/system_journal/constants/journal_characters.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_id_pair.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_person/util/get_fullname_string.dart';
import 'package:toplife/main_systems/system_person/util/get_unknown_id_from_person_id_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_and_romantic_relationship_label_from_string.dart.dart';

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
    final List<Relationship> friends = await _relationshipUsecases
        .getAllFriendsUsecase
        .execute(personID: event.mainPersonId);

    if (friends.isNotEmpty) {
      final randomIndex = Random().nextInt(friends.length);

      final Relationship chosenFriendRelationship = friends[randomIndex];

      final int friendID = getUnkownIdFromPersonIdPair(
        personIdPair: PersonIdPair(
          firstId: chosenFriendRelationship.firstPersonId,
          secondId: chosenFriendRelationship.secondPersonId,
        ),
        knownId: event.mainPersonId,
      );

      final Person? friendPerson =
          await _personUsecases.getPersonUsecase.execute(
        personID: friendID,
      );

      final String randomFriendComment = BirthdayComments.friendComments[
          Random().nextInt(BirthdayComments.friendComments.length)];

      if (friendPerson != null) {
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
    }

    return JournalCharacters.emptyString;
  }

  Future<String> getPartnerEntry(Event event) async {
    final List<Relationship> activePartners = await _relationshipUsecases
        .getAllActivePartnersUsecase
        .execute(personID: event.mainPersonId);

    if (activePartners.isNotEmpty) {
      final Relationship randomActivePartnerRelationship =
          activePartners[Random().nextInt(activePartners.length)];

      final int partnerID = getUnkownIdFromPersonIdPair(
        personIdPair: PersonIdPair(
          firstId: randomActivePartnerRelationship.firstPersonId,
          secondId: randomActivePartnerRelationship.secondPersonId,
        ),
        knownId: event.mainPersonId,
      );
      final Person? partnerPerson =
          await _personUsecases.getPersonUsecase.execute(
        personID: partnerID,
      );

      if (partnerPerson != null) {
        final partnerLabel = getPlatonicAndRomanticRelationshipLabelFromString(
          genderString: partnerPerson.gender,
          platonicRelationshipTypeString:
              randomActivePartnerRelationship.platonicRelationshipType,
          romanticRelationshipTypeString:
              randomActivePartnerRelationship.romanticRelationshipType,
          previousFamilialRelationshipString:
              randomActivePartnerRelationship.previousFamilialRelationship,
          isCoParent: randomActivePartnerRelationship.isCoParent,
          activeRomance: randomActivePartnerRelationship.activeRomance,
        );

        final String randomPartnerComment = BirthdayComments.partnerComments[
            Random().nextInt(BirthdayComments.partnerComments.length)];

        final partnerEntry =
            "${JournalCharacters.space}My $partnerLabel, ${getFullNameString(firstName: partnerPerson.firstName, lastName: partnerPerson.lastName)} says ${partnerPerson.subjectPronoun} $randomPartnerComment.";

        return partnerEntry;
      }
    }

    return JournalCharacters.emptyString;
  }
}
