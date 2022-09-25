import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';

void main() {
  group("Car quality:", () {
    test("high car quality description is correct", () {
      expect(
        CarQuality.high.description,
        "Great",
      );
    });
    test("mid car quality description is correct", () {
      expect(
        CarQuality.mid.description,
        "Good",
      );
    });

    test("low car quality description is correct", () {
      expect(
        CarQuality.low.description,
        "Okay",
      );
    });

    test("high car quality max depreciation is 0", () {
      expect(CarQuality.high.maxDepreciation, 0);
    });

    test("mid car quality max depreciation is 0", () {
      expect(CarQuality.mid.maxDepreciation, 0);
    });

    test("low car quality max depreciation is 0", () {
      expect(CarQuality.low.maxDepreciation, 0);
    });
  });
}
