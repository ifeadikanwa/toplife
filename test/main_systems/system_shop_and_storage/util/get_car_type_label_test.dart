import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_car_type_label.dart';

void main() {
  group("Get car type label: ", () {
    test(
      "when given a valid car type string, the correct label is returned",
      () {
        expect(getCarTypeLabel(CarType.bus.name), "Bus");
      },
    );

    test(
      "when given an invalid car type string, an \"Type: \" is returned",
      () {
        expect(
          getCarTypeLabel("invalid"),
          "",
        );
      },
    );
  });
}
