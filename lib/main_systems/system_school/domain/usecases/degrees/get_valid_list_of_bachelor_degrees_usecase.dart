// import 'package:toplife/core/data_source/drift_database/database_provider.dart';
// import 'package:toplife/main_systems/system_school/degree_info/game_degrees.dart';
// ignore_for_file: unused_field

import 'package:toplife/main_systems/system_school/domain/usecases/get_completed_degrees_usecase.dart';

class GetValidListOfBachelorDegreesUsecase {
  final GetCompletedDegreesUsecase _getCompletedDegreesUsecase;

  const GetValidListOfBachelorDegreesUsecase(
      {required GetCompletedDegreesUsecase getCompletedDegreesUsecase})
      : _getCompletedDegreesUsecase = getCompletedDegreesUsecase;

// Future<List<Degree>> execute({required int personID}) async {
//   //A new list will be generated everytime the player clicks university.
//   //We don't overwhelm them with the full list of degrees and they can keep clicking until they see the degree they want.
//
//   //we get the users completed degrees
//   //we get game regular degrees
//   //we remove completed degrees from the list
//   //we shuffle it
//   //we take 5 degrees and return it
//
//   List<Degree> completedDegrees =
//       await _getCompletedDegreesUsecase.execute(personID: personID);
//
//   List<Degree> availableDegrees = GameDegrees.regularDegrees().toList();
//
//   for (var completedDegree in completedDegrees) {
//     if (!completedDegree.isSpecialDegree) {
//       availableDegrees.removeWhere((degree) =>
//           degree.discipline == completedDegree.discipline &&
//           degree.branch == completedDegree.branch);
//     }
//   }
//
//   availableDegrees.shuffle();
//
//   return availableDegrees.take(5).toList();
// }
}
