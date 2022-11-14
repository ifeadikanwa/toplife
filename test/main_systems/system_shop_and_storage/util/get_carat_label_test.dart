import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_carat_label.dart';

void main() {
  group("getCaratLabel:", () {
    test(
      "given gold with 24 carats return 24K",
      () {
        expect(getCaratLabel(jewel: "Gold", carat: 24), "24K");
      },
    );

     test(
      "given any other jewel except gold with 0.5 carats return 0.5 Carat",
      () {
        expect(getCaratLabel(jewel: "Diamond", carat: 0.5), "0.5 Carat");
      },
    );
  });
}
