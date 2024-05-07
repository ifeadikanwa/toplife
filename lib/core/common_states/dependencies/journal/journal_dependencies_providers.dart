import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/game_systems/main_systems/system_journal/data/dao/journal_dao_impl.dart';
import 'package:toplife/game_systems/main_systems/system_journal/data/repository/journal_repository_impl.dart';
import 'package:toplife/game_systems/main_systems/system_journal/domain/usecases/journal_usecases.dart';

part 'journal_dependencies_providers.g.dart';

@riverpod
JournalRepositoryImpl journalRepository(JournalRepositoryRef ref) {
  final database = ref.watch(databaseProvider);
  return JournalRepositoryImpl(
    journalDao: JournalDaoImpl(database),
  );
}

@riverpod
JournalUsecases journalUsecases(JournalUsecasesRef ref) {
  return JournalUsecases(ref: ref);
}
