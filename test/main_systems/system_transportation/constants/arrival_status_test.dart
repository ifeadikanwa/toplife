// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/arrival_status.dart';

void main() {
  group("Arrival Status:", () {
    test('none is an ArrivalStatus', () {
      assert(ArrivalStatus.none is ArrivalStatus);
    });

    test('onTime is an ArrivalStatus', () {
      assert(ArrivalStatus.onTime is ArrivalStatus);
    });

    test('late is an ArrivalStatus', () {
      assert(ArrivalStatus.late is ArrivalStatus);
    });
  });
}
