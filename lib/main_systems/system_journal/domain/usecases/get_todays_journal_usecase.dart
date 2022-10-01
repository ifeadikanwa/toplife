import 'package:toplife/main_systems/system_journal/constants/journal_characters.dart';
import 'package:toplife/main_systems/system_journal/domain/model/journal.dart';
import 'package:toplife/main_systems/system_journal/domain/repository/journal_repository.dart';

class GetTodaysJournalUsecase {
  final JournalRepository _journalRepository;

  const GetTodaysJournalUsecase({
    required JournalRepository journalRepository,
  }) : _journalRepository = journalRepository;

  Future<Journal> execute({
    required int gameID,
    required int day,
    required int mainPlayerID,
  }) async {
    //get the days journal
    //if it is null, create a new empty journal and return that.

    Journal? todaysJournal = await _journalRepository.getJournal(
      gameID: gameID,
      day: day,
    );

    if (todaysJournal == null) {
      todaysJournal = await _journalRepository.createJournal(
        Journal(
          gameID: gameID,
          day: day,
          mainPlayerID: mainPlayerID,
          entry: JournalCharacters.emptyString,
        ),
      );

      return todaysJournal;
    } else {
      return todaysJournal;
    }
  }
}
