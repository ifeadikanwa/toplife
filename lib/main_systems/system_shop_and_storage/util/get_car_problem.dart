import 'package:toplife/main_systems/system_shop_and_storage/constants/car_problem.dart';

CarProblem? getCarProblem(String problem) {
  final carProblemMap = CarProblem.values.asNameMap();

  return carProblemMap[problem];
}
