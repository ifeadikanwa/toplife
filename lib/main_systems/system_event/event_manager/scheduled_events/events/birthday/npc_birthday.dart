import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/date_and_time/get_clock_time.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler.dart';
import 'package:toplife/main_systems/system_journal/constants/journal_characters.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_relationship/util/get_relationship_label.dart';

class NpcBirthday {
  final RelationshipUsecases _relationshipUsecases;
  final PersonUsecases _personUsecases;
  final AgeUsecases _ageUsecases;
  final EventScheduler _eventScheduler;

  const NpcBirthday(
    this._relationshipUsecases,
    this._personUsecases,
    this._ageUsecases,
    this._eventScheduler,
  );

  Future<String> run(
    int mainPlayerID,
    Event event,
    Person birthdayPerson,
    Age age,
  ) async {
    //birthday for only active partner, child, sibling, relative, parent, friend, inlaw

    final RelationshipPair? relationshipPair = await _relationshipUsecases
        .getRelationshipPairBasedOnTypeUsecase
        .execute(
      personUsecases: _personUsecases,
      mainPersonID: mainPlayerID,
      relationshipPersonID: event.mainPersonId,
      informalRelationshipType: event.relationshipToMainPlayer,
    );

    if (relationshipPair != null) {
      final Person person = relationshipPair.person;

      String relationshipLabel = getRelationshipLabel(
        relationshipPair: relationshipPair,
        onlyActivePartnerWanted: true,
      );

      String schoolText = "";
      //get school text for toddler - teen
      if (age.lifeStage.schoolForStage != "") {
        schoolText =
            "${JournalCharacters.space}${person.subjectPronoun} will start attending ${age.lifeStage.schoolForStage.toLowerCase()}";
      }

      if (relationshipLabel.isNotEmpty) {
        //schedule a birthday
        //if it is friend, parent, child or sibling & they are at least a young adult
        String birthdayPartyInvite = "";

        if (relationshipPair.relationship is Friend ||
            relationshipPair.relationship is Parent ||
            relationshipPair.relationship is Sibling ||
            relationshipPair.relationship is Child) {
          final daysLived = _ageUsecases.getDaysLivedUsecase.execute(
              dayOfBirth: person.dayOfBirth, currentDay: event.eventDay);

          if (daysLived >= Age.newYoungAdultDaysLived) {
            bool haveBirthdayParty =
                Chance.getTrueOrFalseBasedOnPercentageChance(
              trueChancePercentage: 70,
            );

            if (haveBirthdayParty) {
              final Event party = await _eventScheduler.scheduleBirthdayParty(
                gameID: event.gameId,
                mainPersonID: event.mainPersonId,
                relationshipToMainPlayer: event.relationshipToMainPlayer,
                eventDay: event.eventDay,
              );

              if (party.startTime != null) {
                birthdayPartyInvite =
                    "${JournalCharacters.space}${person.subjectPronoun} is throwing a birthday party at ${getClockTime(timeInMinutes: party.startTime!)} and I'm invited.";
              }
            }
          }
        }

        //return journal entry
        final String journalEntry =
            "It's my ${relationshipLabel.toLowerCase()}, ${person.firstName}'s birthday. ${person.subjectPronoun} is now ${SentenceUtil.getArticle(age.lifeStage.stageName).toLowerCase()} ${age.lifeStage.stageName.toLowerCase()}.$schoolText$birthdayPartyInvite";
        return journalEntry;
      }
    }

    return JournalCharacters.emptyString;
  }
}
