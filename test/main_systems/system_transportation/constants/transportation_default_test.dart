import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/main_systems/system_transportation/constants/transport_mode.dart';
import 'package:toplife/main_systems/system_transportation/constants/transportation_default.dart';
import 'package:toplife/main_systems/system_transportation/public_transportation/public_transportation.dart';

void main() {
  group("Transportation default:", () {
    test(
      "bus is the car transportation default",
      () {
        expect(
          TransportationDefault.car,
          PublicTransportation.bus,
        );
      },
    );

    test(
      "bus is the default transport mode" ,
      () {
        expect(
          TransportationDefault.transportMode,
          TransportMode.bus,
        );
      },
    );

    test(
      "village is the default settlement",
      () {
        expect(
          TransportationDefault.settlement,
          Settlement.Village,
        );
      },
    );
  });
}
