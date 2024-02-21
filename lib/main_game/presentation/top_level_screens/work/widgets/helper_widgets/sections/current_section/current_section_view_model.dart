import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/get/school/current_active_school_and_employments_pair_provider.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/school_and_employments_pair.dart';

final currentSectionViewModelProvider = StateNotifierProvider<
    CurrentSectionViewModel, AsyncValue<SchoolAndEmploymentsPair>>((ref) {
  //get recent
  final currentActiveSchoolAndEmploymentsPairFuture =
      ref.watch(currentActiveSchoolAndEmploymentsPairProvider.future);

  return CurrentSectionViewModel(
    currentActiveSchoolAndEmploymentsPairFuture:
        currentActiveSchoolAndEmploymentsPairFuture,
  );
});

class CurrentSectionViewModel
    extends StateNotifier<AsyncValue<SchoolAndEmploymentsPair>> {
  CurrentSectionViewModel({
    required Future<SchoolAndEmploymentsPair>
        currentActiveSchoolAndEmploymentsPairFuture,
  }) : super(const AsyncLoading()) {
    _fetch(
      currentActiveSchoolAndEmploymentsPairFuture:
          currentActiveSchoolAndEmploymentsPairFuture,
    );
  }

  void _fetch({
    required Future<SchoolAndEmploymentsPair>
        currentActiveSchoolAndEmploymentsPairFuture,
  }) async {
    state = await AsyncValue.guard(
        () => currentActiveSchoolAndEmploymentsPairFuture);
  }
}
