import 'package:toplife/main_systems/system_shop_and_storage/constants/car_problem.dart';

CarProblem? getCarProblemEnum(String problem) {
  final carProblemMap = CarProblem.values.asNameMap();

  return carProblemMap[problem];
}
