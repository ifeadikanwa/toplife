import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_house_size_label.dart';

void main() {
  group("getHouseSizeLabel:", () {
    test(
      "given bedroom count of 2 and bathroom count of 1 return 2 bedrooms & 1 bathroom",
      () {
        expect(
          getHouseSizeLabel(bedroomCount: 2, bathroomCount: 1),
          "2 Bedrooms & 1 Bathroom",
        );
      },
    );

    test(
      "given bedroom count of 1 and bathroom count of 0 return 1 bedroom & 0 bathrooms",
      () {
        expect(
          getHouseSizeLabel(bedroomCount: 1, bathroomCount: 0),
          "1 Bedroom & 0 Bathrooms",
        );
      },
    );
  });
}
