import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/house_constants.dart';

void main() {
  group("House constants:", () {
     test(
        "homeless storage space is 5",
        () {
          expect(HouseConstants.homelessStorageSpace, 5);
        },
      );

      test(
        "minLeaseAgreementDuration is 14 days",
        () {
          expect(HouseConstants.minLeaseAgreementDuration, 14);
        },
      );


      test(
        "maxLeaseAgreementDuration is 35 days",
        () {
          expect(HouseConstants.maxLeaseAgreementDuration, 35);
        },
      );

      test(
        "leaseAgreementDurationIncrement is 7 days",
        () {
          expect(HouseConstants.leaseAgreementDurationIncrement, 7);
        },
      );
  });
}
