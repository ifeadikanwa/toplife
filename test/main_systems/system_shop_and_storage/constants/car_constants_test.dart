import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_constants.dart';

void main() {
  group("Car constants:", () {
    test('maxConditionDepreciationDaysLength is 10 days', () {
      expect(CarConstants.maxConditionDepreciationDaysLength, 10);
    });
  });
}
