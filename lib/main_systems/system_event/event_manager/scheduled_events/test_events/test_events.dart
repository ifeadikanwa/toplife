// ignore_for_file: unused_field, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/choice_dialog.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_choice.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';

class TestEvents {
  final JournalUsecases _journalUsecases;
  final EventRepository _eventRepository;
  final PersonUsecases _personUsecases;

  const TestEvents(
    this._journalUsecases,
    this._eventRepository,
    this._personUsecases,
  );

  Future<void> playingEvent(Event event, int mainPlayerID) async {

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
      gameID: event.gameId,
      day: event.eventDay,
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

  Future<void> dancingEvent(Event event, int mainPlayerID) async {
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
      gameID: event.gameId,
      day: event.eventDay,
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

  Future<void> singingEvent(Event event, int mainPlayerID) async {
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
      gameID: event.gameId,
      day: event.eventDay,
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

  Future<void> eatingEvent(Event event, int mainPlayerID) async {
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
      gameID: event.gameId,
      day: event.eventDay,
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
    Event event,
    int mainPlayerID,
    BuildContext context,
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
      gameID: event.gameId,
      day: event.eventDay,
      mainPlayerID: mainPlayerID,
      entry: "In this event I said HELLO.",
    );

    // _eventRepository.updateEvent(
    //   event.copyWith(
    //     performed: true,
    //   ),
    // );

    if (context.mounted) {
      ResultDialog.show(
        context: context,
        title: "I'm Saying",
        result: "HELLO",
      );
    } else {
      print("CONTEXT NOT MOUNTED");
    }
    // });
  }

  Future<void> sayByeEvent(
    Event event,
    int mainPlayerID,
    BuildContext context,
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
      gameID: event.gameId,
      day: event.eventDay,
      mainPlayerID: mainPlayerID,
      entry: "In this event I said BYE.",
    );

    // _eventRepository.updateEvent(
    //   event.copyWith(
    //     performed: true,
    //   ),
    // );

    if (context.mounted) {
      ResultDialog.show(
        context: context,
        title: "I'm Saying",
        result: "BYE",
      );
    } else {
      print("CONTEXT NOT MOUNTED");
    }
    // });
  }

  Future<void> sayGoodluckEvent(
    Event event,
    int mainPlayerID,
    BuildContext context,
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
      gameID: event.gameId,
      day: event.eventDay,
      mainPlayerID: mainPlayerID,
      entry: "In this event I said GOODLUCK.",
    );

    // _eventRepository.updateEvent(
    //   event.copyWith(
    //     performed: true,
    //   ),
    // );

    if (context.mounted) {
      ResultDialog.show(
        context: context,
        title: "I'm Saying",
        result: "GOODLUCK",
      );
    } else {
      print("CONTEXT NOT MOUNTED");
    }
    // });
  }

  Future<void> sayGoodMorningEvent(
    Event event,
    int mainPlayerID,
    BuildContext context,
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
      gameID: event.gameId,
      day: event.eventDay,
      mainPlayerID: mainPlayerID,
      entry: "In this event I said GOOD MORNING.",
    );

    // _eventRepository.updateEvent(
    //   event.copyWith(
    //     performed: true,
    //   ),
    // );

    if (context.mounted) {
      ResultDialog.show(
        context: context,
        title: "I'm Saying",
        result: "GOOD MORNING",
      );
    } else {
      print("CONTEXT NOT MOUNTED");
    }
    // });
  }

  Future<void> sayGoodDayEvent(
    Event event,
    int mainPlayerID,
    BuildContext context,
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
      gameID: event.gameId,
      day: event.eventDay,
      mainPlayerID: mainPlayerID,
      entry: "In this event I said GOOD DAY.",
    );

    // _eventRepository.updateEvent(
    //   event.copyWith(
    //     performed: true,
    //   ),
    // );

    if (context.mounted) {
      // ResultDialog.show(
      //   context: context,
      //   title: "I'm Saying",
      //   result: "GOOD DAY",
      // );

      ChoiceDialog.show(
          context: context,
          categoryTitle: "Choose",
          eventDescription: "Good Day?",
          choices: [
            EventChoice(
                choiceDescription: "Yes",
                choiceAction: (context) {
                  ResultDialog.show(
                      context: context, title: "You said:", result: "Yes");
                }),
            EventChoice(
                choiceDescription: "No",
                choiceAction: (context) {
                  ResultDialog.show(
                      context: context, title: "You said:", result: "No");
                }),
          ]);
    } else {
      print("CONTEXT NOT MOUNTED");
    }
    // });
  }

  Future<void> sayGoodNightEvent(
    Event event,
    int mainPlayerID,
    BuildContext context,
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
      gameID: event.gameId,
      day: event.eventDay,
      mainPlayerID: mainPlayerID,
      entry: "In this event I said GOOD NIGHT.",
    );

    // _eventRepository.updateEvent(
    //   event.copyWith(
    //     performed: true,
    //   ),
    // );

    if (context.mounted) {
      ResultDialog.show(
        context: context,
        title: "I'm Saying",
        result: "GOOD NIGHT",
      );
    } else {
      print("CONTEXT NOT MOUNTED");
    }
    // });
  }
}
