// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/travel_type.dart';

void main() {
  group("TravelType:", () {
    test('none is a TravelType', () {
      assert(TravelType.none is TravelType);
    });

     test('oneWay is a TravelType', () {
      assert(TravelType.oneWay is TravelType);
    });

     test('twoWay is a TravelType', () {
      assert(TravelType.twoWay is TravelType);
    });
  });
}
