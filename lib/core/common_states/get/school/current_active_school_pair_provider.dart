import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/school_pair.dart';

final currentActiveSchoolPairProvider =
    FutureProvider<SchoolPair?>((ref) async {
  // final School? activeSchool =
      // await ref.watch(currentActiveSchoolProvider.future);

  return null;

  // return (activeSchool != null)
  //     ? ref
  //         .watch(schoolUsecasesProvider)
  //         .getASchoolPairFromSchoolUsecase
  //         .execute(school: activeSchool)
  //     : null;
});
