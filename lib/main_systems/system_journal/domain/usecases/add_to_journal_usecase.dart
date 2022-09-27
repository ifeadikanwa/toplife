import 'package:toplife/main_systems/system_journal/domain/model/journal.dart';
import 'package:toplife/main_systems/system_journal/domain/repository/journal_repository.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/prepare_journal_entry_usecase.dart';

class AddToJournalUsecase {
  final JournalRepository _journalRepository;
  final PrepareJournalEntryUsecase _prepareJournalEntryUsecase;

  const AddToJournalUsecase({
    required JournalRepository journalRepository,
    required PrepareJournalEntryUsecase prepareJournalEntryUsecase,
  })  : _journalRepository = journalRepository,
        _prepareJournalEntryUsecase = prepareJournalEntryUsecase;

  Future<Journal> execute({
    required int gameID,
    required int day,
    required int mainPlayerID,
    required String entry,
  }) async {
    //takes in the day, gameid, mainplayer, entry,
    //prepare the entry
    //check if journal for that day exists
    //if it does update existing journal
    //if it doesnt create new journal

    final String preparedJournalEntry = _prepareJournalEntryUsecase.execute(
      journalEntry: entry,
    );

    //look for the journal
    final Journal? existingJournal = await _journalRepository.getJournal(
      gameID: gameID,
      day: day,
    );

    late final Journal journal;

    //if it doesnt exist create a new journal
    if (existingJournal == null) {
      journal = Journal(
        gameID: gameID,
        day: day,
        mainPlayerID: mainPlayerID,
        entry: preparedJournalEntry,
      );

      _journalRepository.createJournal(journal);
    }
    //if it exists update the existing journal
    else {
      journal = existingJournal.copyWith(
        entry: "${existingJournal.entry}$preparedJournalEntry",
      );
      _journalRepository.updateJournal(journal);
    }

    return journal;
  }
}
