import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/job/job_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/job/current_active_employments_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_job/domain/model/info_models/employment_pair.dart';

final currentActiveEmploymentPairsProvider =
    FutureProvider<List<EmploymentPair>>((ref) async {
  final List<Employment> activeEmployments =
      await ref.watch(currentActiveEmploymentsProvider.future);

  return ref
      .watch(jobUsecasesProvider)
      .getEmploymentPairsFromEmploymentsUsecase
      .execute(employments: activeEmployments);
});
