import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_storage_change_label.dart';

void main() {
  group("Get house storage change label:", () {
    test(
      "when new house storage is greater than old house storage return (↑ positive difference in storage)",
      () {
        expect(
            getHouseStorageChangeLabel(
              newHouseStorage: 10,
              currentHouseStorage: 6,
            ),
            "(↑4)");
      },
    );
       test(
      "when new house storage is equal to old house storage return (↑0)",
      () {
        expect(
            getHouseStorageChangeLabel(
              newHouseStorage: 12,
              currentHouseStorage: 12,
            ),
            "(↑0)");
      },
    );

       test(
      "when new house storage is less than old house storage return (↓ positive difference in storage)",
      () {
        expect(
            getHouseStorageChangeLabel(
              newHouseStorage: 4,
              currentHouseStorage: 16,
            ),
            "(↓12)");
      },
    );
  });
}
