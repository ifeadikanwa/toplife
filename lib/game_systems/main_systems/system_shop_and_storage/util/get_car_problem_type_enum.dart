import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_problem_type.dart';

CarProblemType? getCarProblemTypeEnum(String problem) {
  final carProblemTypeMap = CarProblemType.values.asNameMap();

  return carProblemTypeMap[problem];
}
