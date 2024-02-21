import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/journal/journal_dependencies_providers.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/add_to_journal_usecase.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/get_players_journals_usecase.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/get_todays_journal_usecase.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/prepare_journal_entry_usecase.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/watch_journal_usecase.dart';

class JournalUsecases {
  final Ref _ref;

  const JournalUsecases({required Ref ref}) : _ref = ref;

  AddToJournalUsecase get addToJournalUsecase => AddToJournalUsecase(
        journalRepository: _ref.read(journalRepositoryProvider),
        prepareJournalEntryUsecase: prepareJournalEntryUsecase,
      );

  PrepareJournalEntryUsecase get prepareJournalEntryUsecase =>
      PrepareJournalEntryUsecase();

  GetPlayersJournalsUsecase get getPlayersJournalsUsecase =>
      GetPlayersJournalsUsecase(
          journalRepository: _ref.read(journalRepositoryProvider));

  GetTodaysJournalUsecase get getTodaysJournalUsecase =>
      GetTodaysJournalUsecase(
          journalRepository: _ref.read(journalRepositoryProvider));

  WatchJournalUsecase get watchJournalUsecase => WatchJournalUsecase(
        journalRepository: _ref.read(journalRepositoryProvider),
      );
}
