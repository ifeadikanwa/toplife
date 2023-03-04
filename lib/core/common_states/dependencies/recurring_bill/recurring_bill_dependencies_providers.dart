import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/game/game_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/data/dao/recurring_bill_dao_impl.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/data/repository/recurring_bill_repository_impl.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/recurring_bills_usecases.dart';

final recurringBillRepositoryProvider =
    Provider<RecurringBillRepositoryImpl>((ref) {
  final database = ref.watch(databaseProvider);

  return RecurringBillRepositoryImpl(
    recurringBillDao: RecurringBillDaoImpl(database),
  );
});
final recurringBillUsecasesProvider = Provider<RecurringBillsUsecases>(
  (ref) => RecurringBillsUsecases(
    recurringBillRepository: ref.watch(recurringBillRepositoryProvider),
    gameUsecases: ref.watch(gameUsecasesProvider),
    personUsecases: ref.watch(personUsecasesProvider),
  ),
);
