import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/school/school_dependencies_providers.dart';
import 'package:toplife/core/common_states/watch/school/current_active_school_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/school_pair.dart';

final currentActiveSchoolPairProvider =
    FutureProvider<SchoolPair?>((ref) async {
  final School? activeSchool =
      await ref.watch(currentActiveSchoolProvider.future);

  return (activeSchool != null)
      ? ref
          .watch(schoolUsecasesProvider)
          .getASchoolPairFromSchoolUsecase
          .execute(school: activeSchool)
      : null;
});
