import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_car_speed.dart';

void main() {
  group("Get car speed:", () {
    test(
      "returns 100 - the given percentage travel time",
      () {
        expect(getCarSpeed(percentageTravel: 20), 80);
        expect(getCarSpeed(percentageTravel: 300), -200);
        expect(getCarSpeed(percentageTravel: 100 ), 0);
      },
    );
  });
}
