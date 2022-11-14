import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_servings_label.dart';

void main() {
  group("getServingsLabel:", () {
    test(
      "given serving of 4 return 4 servings",
      () {
        expect(getServingsLabel(servings: 4), "4 Servings");
      },
    );

     test(
      "given serving of 1 return 1 serving",
      () {
        expect(getServingsLabel(servings: 1), "1 Serving");
      },
    );

     test(
      "given serving of 0 return 0 servings",
      () {
        expect(getServingsLabel(servings: 0), "0 Servings");
      },
    );
  });
}
