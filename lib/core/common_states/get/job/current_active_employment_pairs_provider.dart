import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/job/job_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/job/current_active_employments_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_job/domain/model/info_models/employment_pair.dart';

part 'current_active_employment_pairs_provider.g.dart';

@riverpod
Future<List<EmploymentPair>> currentActiveEmploymentPairs(
    CurrentActiveEmploymentPairsRef ref) async {
  final List<Employment> activeEmployments =
      await ref.watch(currentActiveEmploymentsProvider.future);

  return ref
      .watch(jobUsecasesProvider)
      .getEmploymentPairsFromEmploymentsUsecase
      .execute(employments: activeEmployments);
}
