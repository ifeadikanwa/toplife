import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/utils/get_address_description.dart';

void main() {
  group("GetAddressDescription:", () {
    test(
      "returns the correct string value",
      () {
        const address = "1234 Gogo Street";

        expect(
          getAddressDescription(address),
          "Address: $address",
        );
      },
    );
  });
}
