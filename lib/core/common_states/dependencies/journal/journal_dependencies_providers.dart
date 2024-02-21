import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/main_systems/system_journal/data/dao/journal_dao_impl.dart';
import 'package:toplife/main_systems/system_journal/data/repository/journal_repository_impl.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';

final journalRepositoryProvider = Provider<JournalRepositoryImpl>((ref) {
  final database = ref.watch(databaseProvider);
  return JournalRepositoryImpl(
    journalDao: JournalDaoImpl(database),
  );
});

final journalUsecasesProvider = Provider<JournalUsecases>((ref) {
  return JournalUsecases(
    ref: ref,
  );
});
