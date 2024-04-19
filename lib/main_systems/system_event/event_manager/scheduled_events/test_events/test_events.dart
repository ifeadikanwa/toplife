import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_choice.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';

class TestEvents {
  final JournalUsecases _journalUsecases;
  final PersonUsecases _personUsecases;
  final DialogHandler _dialogHandler;

  const TestEvents(
    this._journalUsecases,
    this._personUsecases,
    this._dialogHandler,
  );

  Future<void> playingEvent(
    int gameId,
    int eventDay,
    int mainPlayerID,
  ) async {
    await _personUsecases.updateEnergyStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: 5,
      override: false,
    );

    await _personUsecases.updateHungerStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: 5,
      override: false,
    );

    await _journalUsecases.addToJournalUsecase.execute(
      gameID: gameId,
      day: eventDay,
      mainPlayerID: mainPlayerID,
      entry: "In this event I played.",
    );

    // _eventRepository.updateEvent(
    //   event.copyWith(
    //     performed: true,
    //   ),
    // );
    // });
  }

  Future<void> dancingEvent(
    int gameId,
    int eventDay,
    int mainPlayerID,
  ) async {
    // Future.delayed(const Duration(seconds: 5), () async {

    await _personUsecases.updateEnergyStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: 5,
      override: false,
    );

    await _personUsecases.updateHungerStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: 5,
      override: false,
    );
    await _journalUsecases.addToJournalUsecase.execute(
      gameID: gameId,
      day: eventDay,
      mainPlayerID: mainPlayerID,
      entry: "In this event I dancing.",
    );

    // _eventRepository.updateEvent(
    //   event.copyWith(
    //     performed: true,
    //   ),
    // );
    // });
  }

  Future<void> singingEvent(
    int gameId,
    int eventDay,
    int mainPlayerID,
  ) async {
    // Future.delayed(const Duration(seconds: 5), () async {

    await _personUsecases.updateEnergyStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: 5,
      override: false,
    );

    await _personUsecases.updateHungerStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: 5,
      override: false,
    );

    await _journalUsecases.addToJournalUsecase.execute(
      gameID: gameId,
      day: eventDay,
      mainPlayerID: mainPlayerID,
      entry: "In this event I sang.",
    );

    // _eventRepository.updateEvent(
    //   event.copyWith(
    //     performed: true,
    //   ),
    // );
    // });
  }

  Future<void> eatingEvent(
    int gameId,
    int eventDay,
    int mainPlayerID,
  ) async {
    // Future.delayed(const Duration(seconds: 5), () async {

    await _personUsecases.updateEnergyStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: 5,
      override: false,
    );

    await _personUsecases.updateHungerStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: 5,
      override: false,
    );

    await _journalUsecases.addToJournalUsecase.execute(
      gameID: gameId,
      day: eventDay,
      mainPlayerID: mainPlayerID,
      entry: "In this event I ate.",
    );

    // _eventRepository.updateEvent(
    //   event.copyWith(
    //     performed: true,
    //   ),
    // );
    // });
  }

  Future<void> sayHelloEvent(
    int gameId,
    int eventDay,
    int mainPlayerID,
  ) async {
    // Future.delayed(const Duration(seconds: 5), () async {

    await _personUsecases.updateEnergyStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: 5,
      override: false,
    );

    await _personUsecases.updateHungerStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: 5,
      override: false,
    );

    await _journalUsecases.addToJournalUsecase.execute(
      gameID: gameId,
      day: eventDay,
      mainPlayerID: mainPlayerID,
      entry: "In this event I said HELLO.",
    );

    // _eventRepository.updateEvent(
    //   event.copyWith(
    //     performed: true,
    //   ),
    // );

    return _dialogHandler.showResultDialog(
      title: "I'm Saying",
      result: "HELLO",
    );

    // });
  }

  Future<void> sayByeEvent(
    int gameId,
    int eventDay,
    int mainPlayerID,
  ) async {
    // Future.delayed(const Duration(seconds: 5), () async {

    await _personUsecases.updateEnergyStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: 5,
      override: false,
    );

    await _personUsecases.updateHungerStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: 5,
      override: false,
    );
    await _journalUsecases.addToJournalUsecase.execute(
      gameID: gameId,
      day: eventDay,
      mainPlayerID: mainPlayerID,
      entry: "In this event I said BYE.",
    );

    // _eventRepository.updateEvent(
    //   event.copyWith(
    //     performed: true,
    //   ),
    // );

    return _dialogHandler.showResultDialog(
      title: "I'm Saying",
      result: "BYE",
    );

    // });
  }

  Future<void> sayGoodluckEvent(
    int gameId,
    int eventDay,
    int mainPlayerID,
  ) async {
    // Future.delayed(const Duration(seconds: 5), () async {

    await _personUsecases.updateEnergyStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: 5,
      override: false,
    );

    await _personUsecases.updateHungerStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: 5,
      override: false,
    );

    await _journalUsecases.addToJournalUsecase.execute(
      gameID: gameId,
      day: eventDay,
      mainPlayerID: mainPlayerID,
      entry: "In this event I said GOODLUCK.",
    );

    // _eventRepository.updateEvent(
    //   event.copyWith(
    //     performed: true,
    //   ),
    // );

    return _dialogHandler.showResultDialog(
      title: "I'm Saying",
      result: "GOODLUCK",
    );

    // });
  }

  Future<void> sayGoodMorningEvent(
    int gameId,
    int eventDay,
    int mainPlayerID,
  ) async {
    // Future.delayed(const Duration(seconds: 5), () async {

    await _personUsecases.updateEnergyStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: 5,
      override: false,
    );

    await _personUsecases.updateHungerStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: 5,
      override: false,
    );

    await _journalUsecases.addToJournalUsecase.execute(
      gameID: gameId,
      day: eventDay,
      mainPlayerID: mainPlayerID,
      entry: "In this event I said GOOD MORNING.",
    );

    // _eventRepository.updateEvent(
    //   event.copyWith(
    //     performed: true,
    //   ),
    // );

    return _dialogHandler.showResultDialog(
      title: "I'm Saying",
      result: "GOOD MORNING",
    );

    // });
  }

  Future<void> sayGoodDayEvent(
    int gameId,
    int eventDay,
    int mainPlayerID,
  ) async {
    // Future.delayed(const Duration(seconds: 5), () async {

    await _personUsecases.updateEnergyStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: 5,
      override: false,
    );

    await _personUsecases.updateHungerStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: 5,
      override: false,
    );

    await _journalUsecases.addToJournalUsecase.execute(
      gameID: gameId,
      day: eventDay,
      mainPlayerID: mainPlayerID,
      entry: "In this event I said GOOD DAY.",
    );

    // _eventRepository.updateEvent(
    //   event.copyWith(
    //     performed: true,
    //   ),
    // );

    // _dialogHandler.showResultDialog(
    //   title: "I'm Saying",
    //   result: "GOOD DAY",
    // );

    return _dialogHandler.showChoiceDialog(
        categoryTitle: "Choose",
        eventDescription: "Good Day?",
        choices: [
          EventChoice(
              choiceDescription: "Yes",
              choiceAction: () async {
                await _dialogHandler.showResultDialog(
                    title: "You said:", result: "Yes");
              }),
          EventChoice(
              choiceDescription: "No",
              choiceAction: () async {
                await _dialogHandler.showResultDialog(
                    title: "You said:", result: "No");
              }),
        ]);

    // });
  }

  Future<void> sayGoodNightEvent(
    int gameId,
    int eventDay,
    int mainPlayerID,
  ) async {
    // Future.delayed(const Duration(seconds: 5), () async {

    await _personUsecases.updateEnergyStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: 5,
      override: false,
    );

    await _personUsecases.updateHungerStatsUsecase.execute(
      mainPersonID: mainPlayerID,
      change: 5,
      override: false,
    );

    await _journalUsecases.addToJournalUsecase.execute(
      gameID: gameId,
      day: eventDay,
      mainPlayerID: mainPlayerID,
      entry: "In this event I said GOOD NIGHT.",
    );

    // _eventRepository.updateEvent(
    //   event.copyWith(
    //     performed: true,
    //   ),
    // );

    return _dialogHandler.showResultDialog(
      title: "I'm Saying",
      result: "GOOD NIGHT",
    );

    // });
  }
}
