import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/data/dao/recurring_bill_dao_impl.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/data/repository/recurring_bill_repository_impl.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/recurring_bills_usecases.dart';

part 'recurring_bill_dependencies_providers.g.dart';

@riverpod
RecurringBillRepositoryImpl recurringBillRepository(
  RecurringBillRepositoryRef ref,
) {
  final database = ref.watch(databaseProvider);

  return RecurringBillRepositoryImpl(
    recurringBillDao: RecurringBillDaoImpl(database),
  );
}

@riverpod
RecurringBillsUsecases recurringBillsUsecases(RecurringBillsUsecasesRef ref) {
  return RecurringBillsUsecases(ref: ref);
}
