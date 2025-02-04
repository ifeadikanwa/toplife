import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_problem_type.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_car_problem_type_enum.dart';

void main() {
  group("get car problem type enum util:", () {
    test(
      "given a valid car problem name return the correct car problem enum",
      () {
        expect(
          getCarProblemTypeEnum(CarProblemType.deadBattery.name),
          CarProblemType.deadBattery,
        );
      },
    );

    test(
      "given a invalid car problem name return null",
      () {
        expect(
          getCarProblemTypeEnum("wrong"),
          null,
        );
      },
    );
  });
}
