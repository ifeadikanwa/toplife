import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/get/job/current_active_employment_pairs_provider.dart';
import 'package:toplife/core/common_states/get/school/current_active_school_pair_provider.dart';
import 'package:toplife/main_systems/system_job/domain/model/info_models/employment_pair.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/school_and_employments_pair.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/school_pair.dart';

part 'current_section_view_model.g.dart';

@riverpod
Future<SchoolAndEmploymentsPair> currentSectionViewModel(
  CurrentSectionViewModelRef ref,
) async {
  final SchoolPair? activeSchoolPair =
      await ref.watch(currentActiveSchoolPairProvider.future);

  final List<EmploymentPair> activeEmploymentPairs =
      await ref.watch(currentActiveEmploymentPairsProvider.future);

  return SchoolAndEmploymentsPair(
    schoolPair: activeSchoolPair,
    employmentPairs: activeEmploymentPairs,
  );
}
