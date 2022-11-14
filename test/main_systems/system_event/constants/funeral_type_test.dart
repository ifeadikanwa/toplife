import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_event/constants/funeral_type.dart';

void main() {
  group("Funeral type:", () {
    test(
      "burial base price is greater than 0",
      () {
        expect(
          FuneralType.Burial.basePrice,
          greaterThan(0),
        );
      },
    );

    test(
      "cremation base price is greater than 0",
      () {
        expect(
          FuneralType.Cremation.basePrice,
          greaterThan(0),
        );
      },
    );

    test(
      "donation base price is 0",
      () {
        expect(
          FuneralType.Donation.basePrice,
          0,
        );
      },
    );
  });
}
