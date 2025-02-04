import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_house_style_label.dart';

void main() {
  group("Get house style label:", () {
    test(
      "when given a string style return Style: givenStyle",
      () {
        expect(getHouseStyleLabel("Rustic"), "Style: Rustic");
      },
    );
  });
}
