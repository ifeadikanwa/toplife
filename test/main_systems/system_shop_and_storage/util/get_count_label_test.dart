import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_count_label.dart';

void main() {
  group("getCountLabel:", () {
    test(
      "given count of 4 return 4 counts",
      () {
        expect(getCountLabel(counts: 4), "4 Counts");
      },
    );

     test(
      "given count of 1 return 1 count",
      () {
        expect(getCountLabel(counts: 1), "1 Count");
      },
    );

     test(
      "given count of 0 return 0 counts",
      () {
        expect(getCountLabel(counts: 0), "0 Counts");
      },
    );
  });
}
