import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_problem.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_car_problem_enum.dart';

void main() {
  group("get car problem enum util:", () {
    test(
      "given a valid car problem name return the correct car problem enum",
      () {
        expect(
          getCarProblemEnum(CarProblem.deadBattery.name),
          CarProblem.deadBattery,
        );
      },
    );

    test(
      "given a invalid car problem name return null",
      () {
        expect(
          getCarProblemEnum("wrong"),
          null,
        );
      },
    );
  });
}
