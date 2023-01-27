import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_car_quality_label.dart';

void main() {
  group("Get car quality label: ", () {
    test(
      "when given a valid car quality string, the correct description is returned",
      () {
        expect(
          getCarQualityLabel(CarQuality.high.name),
          CarQuality.high.description,
        );
      },
    );

    test(
      "when given an invalid car quality string, an empty string is returned",
      () {
        expect(
          getCarQualityLabel("invalid"),
          "",
        );
      },
    );
  });
}
