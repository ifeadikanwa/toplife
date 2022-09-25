// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_type.dart';

void main() {
  group("Car Type:", () {
    test("sports car is a car type", () {
      assert(CarType.sportsCar is CarType);
    });

    test("suv is a car type", () {
      assert(CarType.suv is CarType);
    });

    test("sedan is a car type", () {
      assert(CarType.sedan is CarType);
    });

    test("minivan is a car type", () {
      assert(CarType.minivan is CarType);
    });

    test("convertible is a car type", () {
      assert(CarType.convertible is CarType);
    });

    test("truck is a car type", () {
      assert(CarType.truck is CarType);
    });
  });
}
