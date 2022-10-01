// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_insurance_type.dart';

void main() {
  group("Car insurance type:", () {
    test(
      "basic is a car insurance type",
      () {
        assert(CarInsuranceType.Basic is CarInsuranceType);
      },
    );

     test(
      "premium is a car insurance type",
      () {
        assert(CarInsuranceType.Premium is CarInsuranceType);
      },
    );
  });
}
