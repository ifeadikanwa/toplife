import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_car_speed_label.dart';

void main() {
  group("getCarSpeedLabel:", () {
    test(
      "given percentage travel time of 30, it returns Speed: 70%",
      () {
        expect(
          getCarSpeedLabel(percentageTravel: 30),
          "Speed: 70%",
        );
      },
    );

     test(
      "given percentage travel time of 85, it returns Speed: 15%",
      () {
        expect(
          getCarSpeedLabel(percentageTravel: 85),
          "Speed: 15%",
        );
      },
    );

    test(
      "given percentage travel time of 100, it returns Speed: 0%",
      () {
        expect(
          getCarSpeedLabel(percentageTravel: 100),
          "Speed: 0%",
        );
      },
    );

    test(
      "given percentage travel time of 0, it returns Speed: 100%",
      () {
        expect(
          getCarSpeedLabel(percentageTravel: 0),
          "Speed: 100%",
        );
      },
    );
  });
}
