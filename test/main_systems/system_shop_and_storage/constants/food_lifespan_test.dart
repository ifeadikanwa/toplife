import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/food_lifespan.dart';

void main() {
  group("Food Lifespan:", () {
    test("short food lifespan is 2 days", () {
      expect(FoodLifespan.short.days, 2);
    });

    test("mid food lifespan is 4 days", () {
      expect(FoodLifespan.mid.days, 4);
    });

    test("long food lifespan is 6 days", () {
      expect(FoodLifespan.long.days, 6);
    });

    test("indefinite food lifespan is 5000 days", () {
      expect(FoodLifespan.indefinite.days, 5000);
    });
  });
}
