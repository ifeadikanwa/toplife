import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_problem.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_car_problem.dart';

void main() {
  group("get car problem util:", () {
    test(
      "given a valid car problem name return the correct car problem enum",
      () {
        expect(
          getCarProblem(CarProblem.deadBattery.name),
          CarProblem.deadBattery,
        );
      },
    );

    test(
      "given a invalid car problem name return null",
      () {
        expect(
          getCarProblem("wrong"),
          null,
        );
      },
    );
  });
}
