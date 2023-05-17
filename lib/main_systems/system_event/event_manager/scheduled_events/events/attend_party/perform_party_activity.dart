import 'dart:math';

import 'package:toplife/main_systems/system_event/constants/party_event_activity.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';

class PerformPartyActivity {
  final PersonUsecases _personUsecases;

  const PerformPartyActivity(this._personUsecases);

  Future<String> execute({
    required int mainPlayerID,
    required PartyEventActivity chosenPartyEventActivity,
  }) async {
    late final String firstPersonPartyActivityDesc;

    switch (chosenPartyEventActivity) {
      case PartyEventActivity.standInCorner:
        firstPersonPartyActivityDesc =
            "I stood in the corner and watched others at the party.";
        break;
      case PartyEventActivity.getDrunk:
        firstPersonPartyActivityDesc =
            "I got pretty wasted, I am never drinking again.";
        await _personUsecases.updateSoberStatsUsecase.execute(
          mainPersonID: mainPlayerID,
          change: -(Random().nextInt(30) + 40), //-40 -> -70
          override: false,
        );
        break;
      case PartyEventActivity.danceDanceDance:
        firstPersonPartyActivityDesc =
            "I let the music take control and just danced away.";
        await _personUsecases.updateMoodStatsUsecase.execute(
          mainPersonID: mainPlayerID,
          change: Random().nextInt(10), //1-10
          override: false,
        );
        break;
      case PartyEventActivity.eatAndLeave:
        firstPersonPartyActivityDesc =
            "I came with one mission, EAT, and I think I did a pretty good job.";
        await _personUsecases.updateHungerStatsUsecase.execute(
          mainPersonID: mainPlayerID,
          change: (Random().nextInt(20) + 30), //30-50
          override: false,
        );
        break;
      case PartyEventActivity.socialize:
        firstPersonPartyActivityDesc =
            "I mingled and had fun speaking to a bunch of people.";
        await _personUsecases.updateMoodStatsUsecase.execute(
          mainPersonID: mainPlayerID,
          change: Random().nextInt(10), //1-10
          override: false,
        );
        break;
      default:
        firstPersonPartyActivityDesc = "";
    }

    return firstPersonPartyActivityDesc;
  }
}
