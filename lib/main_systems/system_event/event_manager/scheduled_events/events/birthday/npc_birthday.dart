import 'package:intl/intl.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/date_and_time/get_clock_time.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/event_schedulers.dart';
import 'package:toplife/main_systems/system_journal/constants/journal_characters.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/util/get_fullname_string.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_relationship/util/check/check_if_platonic_relationship_type_contains.dart';
import 'package:toplife/main_systems/system_relationship/util/label/get_platonic_and_romantic_relationship_label_from_string.dart.dart';

class NpcBirthday {
  final RelationshipUsecases _relationshipUsecases;
  final EventSchedulers _eventScheduler;

  const NpcBirthday(
    this._relationshipUsecases,
    this._eventScheduler,
  );

  Future<String> run(
    int mainPlayerID,
    Event event,
    Person birthdayPerson,
    Age age,
  ) async {
    //// schedule birthday party for non-acquaintances
    //only tell the player if it is a non-acquaintance

    final Relationship? relationship =
        await _relationshipUsecases.getRelationshipUsecase.execute(
      firstPersonID: mainPlayerID,
      secondPersonID: birthdayPerson.id,
    );

    if (relationship != null) {
      final String relationshipLabel =
          getPlatonicAndRomanticRelationshipLabelFromString(
        genderString: birthdayPerson.gender,
        platonicRelationshipTypeString: relationship.platonicRelationshipType,
        romanticRelationshipTypeString: relationship.romanticRelationshipType,
        previousFamilialRelationshipString:
            relationship.previousFamilialRelationship,
        isCoParent: relationship.isCoParent,
        activeRomance: relationship.activeRomance,
      );

      if (relationshipLabel.isNotEmpty) {
        //schedule a birthday & tell player
        //as long as it is not an acquaintance
        String birthdayPartyInvite = "";

        if (!checkIfPlatonicRelationshipTypeStringContains(
          relationship.platonicRelationshipType,
          PlatonicRelationshipType.acquaintance,
        )) {
          //check if party will be organized
          bool haveBirthdayParty = Chance.getTrueOrFalseBasedOnPercentageChance(
            trueChancePercentage: 70,
          );

          if (haveBirthdayParty) {
            //check if the player is invited
            //player is not invited if the person is not interested in a relationship
            final bool playerIsInvited = relationship.interestedInRelationship;

            if (playerIsInvited) {
              //schedule the party so the player can see it in their events
              final Event party =
                  await _eventScheduler.scheduleBirthdayParty.execute(
                gameID: event.gameId,
                mainPersonID: event.mainPersonId,
                eventDay: event.eventDay,
              );

              if (party.startTime != null) {
                birthdayPartyInvite =
                    "${JournalCharacters.space}${toBeginningOfSentenceCase(birthdayPerson.subjectPronoun)} is throwing a birthday party at ${getClockTime(timeInMinutes: party.startTime!)} and I'm invited.";
              }
            }
            //player is not invited
            else {
              birthdayPartyInvite =
                  "${JournalCharacters.space}${toBeginningOfSentenceCase(birthdayPerson.subjectPronoun)} is throwing a birthday party but I didn't get an invitation.";
            }
          }

          //return journal entry
          final String journalEntry =
              "It is my $relationshipLabel, ${getFullNameString(firstName: birthdayPerson.firstName, lastName: birthdayPerson.lastName)}'s birthday, ${birthdayPerson.subjectPronoun} is now ${SentenceUtil.getArticle(age.lifeStage.stageName).toLowerCase()} ${age.lifeStage.stageName.toLowerCase()}.$birthdayPartyInvite";
          return journalEntry;
        }
      }
    }

    return JournalCharacters.emptyString;
  }
}
