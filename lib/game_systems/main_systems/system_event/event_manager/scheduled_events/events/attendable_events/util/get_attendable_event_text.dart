import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/game_systems/main_systems/system_age/age.dart';
import 'package:toplife/game_systems/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/game_systems/main_systems/system_event/domain/model/info_models/event_text.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/scheduled_events/events/attendable_events/util/funeral_descriptions.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_fullname_string.dart';

class GetAttendableEventText {
  GetAttendableEventText();

  static EventText execute({
    required EventType eventType,
    required Person eventMainPerson,
    required String relationshipLabel,
    required Age age,
  }) {
    //prep full name
    final String personFullName = getFullNameString(
      firstName: eventMainPerson.firstName,
      lastName: eventMainPerson.lastName,
    );

    //We return the first part for journal entry and result text.
    //The second part will be the same for every one
    //Journal entry and Result description second part: partner attendance desc, party activity desc, after event desc, gift reaction.
    switch (eventType) {
      //attendable events
      //
      //
      case EventType.birthdayParty:
        return EventText(
          eventTitle: "Birthday Party",
          eventDescription:
              "Your $relationshipLabel, $personFullName's birthday party is happening right now.",
          journalEntry:
              "I went to my $relationshipLabel, $personFullName's ${age.lifeStage.stageName.toLowerCase()} birthday party.",
          resultTitle: "Party time!",
          resultDescription: "",
        );

      //
      //
      case EventType.funeral:
        //get funeral desc
        final String firstPersonFuneralDesc =
            FuneralDescriptions.getRandomFirstPersonFuneralDescription(
          eventMainPerson.gender,
        );

        final String firstPersonResultIntro =
            "I attended my $relationshipLabel, $personFullName's funeral.";

        return EventText(
          eventTitle: "Funeral",
          eventDescription:
              "Your $relationshipLabel, $personFullName's funeral is happening right now.",
          journalEntry: "$firstPersonResultIntro\n$firstPersonFuneralDesc",
          resultTitle: "R.I.P",
          resultDescription:
              "${SentenceUtil.convertFromFirstPersonToSecondPerson(
            firstPersonSentence: firstPersonResultIntro,
          )}\n${SentenceUtil.convertFromFirstPersonToSecondPerson(
            firstPersonSentence: firstPersonFuneralDesc,
          )}",
        );

      //
      //
      case EventType.wedding:
        break;
      //
      //
      case EventType.graduation:
        break;

      //NON-attendable events
      case EventType.schoolAdmission:
      case EventType.engagement:
      case EventType.birthday:
      case EventType.death:
      case EventType.askForSchoolTuition:
      case EventType.employment:
        return EventText.blankEventText;
    }

    return EventText.blankEventText;
  }
}
