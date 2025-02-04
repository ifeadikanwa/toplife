import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/transport_mode.dart';

void main() {
  group("transport mode:", () {
    test(
      "bus presentation name is Bus",
      () {
        expect(TransportMode.bus.presentationName, "Bus");
      },
    );

    test(
      "train presentation name is Train",
      () {
        expect(TransportMode.train.presentationName, "Train");
      },
    );

    test(
      "taxi presentation name is Taxi",
      () {
        expect(TransportMode.taxi.presentationName, "Taxi");
      },
    );

    test(
      "private presentation name is Private",
      () {
        expect(TransportMode.private.presentationName, "Private");
      },
    );
  });
}
