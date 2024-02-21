import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_settlement_enum.dart';

void main() {
  group("get settlement util:", () {
    test(
      "given a valid settlement name return the correct settlement enum",
      () {
        expect(
          getSettlementEnum(Settlement.City.name),
          Settlement.City,
        );
      },
    );

    test(
      "given a invalid settlement name return null",
      () {
        expect(
          getSettlementEnum("wrong"),
          null,
        );
      },
    );
  });
}
