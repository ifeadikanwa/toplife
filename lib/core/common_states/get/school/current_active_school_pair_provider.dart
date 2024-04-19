import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/school_pair.dart';

part 'current_active_school_pair_provider.g.dart';

@riverpod
Future<SchoolPair?> currentActiveSchoolPair(
    CurrentActiveSchoolPairRef ref) async {
  // final School? activeSchool =
  // await ref.watch(currentActiveSchoolProvider.future);

  return null;

  // return (activeSchool != null)
  //     ? ref
  //         .watch(schoolUsecasesProvider)
  //         .getASchoolPairFromSchoolUsecase
  //         .execute(school: activeSchool)
  //     : null;
}
