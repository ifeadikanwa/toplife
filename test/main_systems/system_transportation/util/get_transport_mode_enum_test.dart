import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_transportation/constants/transport_mode.dart';
import 'package:toplife/main_systems/system_transportation/util/get_transport_mode_enum.dart';

void main() {
 group("get transport mode util:", () {
    test(
      "given a valid transport mode name return the correct transport mode enum",
      () {
        expect(
          getTransportModeEnum(TransportMode.taxi.name),
          TransportMode.taxi,
        );
      },
    );

    test(
      "given a invalid transport mode name return null",
      () {
        expect(
          getTransportModeEnum("wrong"),
          null,
        );
      },
    );
  });
}