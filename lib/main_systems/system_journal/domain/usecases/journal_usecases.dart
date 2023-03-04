import 'package:toplife/main_systems/system_journal/domain/repository/journal_repository.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/add_to_journal_usecase.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/get_players_journals_usecase.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/get_todays_journal_usecase.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/prepare_journal_entry_usecase.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/watch_journal_usecase.dart';

class JournalUsecases {
  final JournalRepository _journalRepository;

  const JournalUsecases({
    required JournalRepository journalRepository,
  }) : _journalRepository = journalRepository;

  AddToJournalUsecase get addToJournalUsecase => AddToJournalUsecase(
        journalRepository: _journalRepository,
        prepareJournalEntryUsecase: prepareJournalEntryUsecase,
      );

  PrepareJournalEntryUsecase get prepareJournalEntryUsecase =>
      PrepareJournalEntryUsecase();

  GetPlayersJournalsUsecase get getPlayersJournalsUsecase =>
      GetPlayersJournalsUsecase(journalRepository: _journalRepository);

  GetTodaysJournalUsecase get getTodaysJournalUsecase =>
      GetTodaysJournalUsecase(journalRepository: _journalRepository);

  WatchJournalUsecase get watchJournalUsecase => WatchJournalUsecase(
        journalRepository: _journalRepository,
      );
}
