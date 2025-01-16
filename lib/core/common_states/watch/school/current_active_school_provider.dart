import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

part 'current_active_school_provider.g.dart';

@riverpod
Stream<School?> currentActiveSchool(CurrentActiveSchoolRef ref) async* {
  //only watch for player ID change
  // final int? currentPlayerID =
  //     await ref.watch(currentPlayerProvider.selectAsync(
  //   (currentPlayer) => currentPlayer?.id,
  // ));

  // //yield
  // if (currentPlayerID != null) {
  //   final currentActiveSchoolStream = ref
  //       .watch(schoolUsecasesProvider)
  //       .watchActiveSchoolUsecase
  //       .execute(mainPersonID: currentPlayerID);
  //
  //   await for (final school in currentActiveSchoolStream) {
  //     yield school;
  //   }
  // } else {
  yield null;
  // }
}
