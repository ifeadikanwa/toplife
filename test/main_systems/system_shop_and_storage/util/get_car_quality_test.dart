import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_car_quality.dart';

void main() {
  group("get car quality util:", () {
    test(
      "given a valid car quality name return the correct car quality enum",
      () {
        expect(
          getCarQuality(CarQuality.high.name),
          CarQuality.high,
        );
      },
    );

    test(
      "given a invalid car quality name return null",
      () {
        expect(
          getCarQuality("wrong"),
          null,
        );
      },
    );
  });
}
