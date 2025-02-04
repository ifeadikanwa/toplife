import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/numbers/get_value_in_specific_part_of_range.dart';

void main() {
  group("getValueInSpecificPartOfRange: ", () {
    test("returns value in first half of range if asked to", () {
      final result = getValueInSpecificPartOfRange(
        getFromFirstHalf: true,
        getFromSecondHalf: false,
        lowestValue: 20,
        highestValue: 30,
      );

      const possibleValues = [20, 21, 22, 23, 24];

      assert(possibleValues.contains(result));
    });

    test("returns value in second half of range if asked to", () {
      final result = getValueInSpecificPartOfRange(
        getFromFirstHalf: false,
        getFromSecondHalf: true,
        lowestValue: 20,
        highestValue: 30,
      );

      const possibleValues = [26, 27, 28, 29, 30];

      assert(possibleValues.contains(result));
    });

    test("returns any value in range if no constraints are specified", () {
      final result = getValueInSpecificPartOfRange(
        getFromFirstHalf: false,
        getFromSecondHalf: false,
        lowestValue: 20,
        highestValue: 30,
      );

      const possibleValues = [20, 21, 22, 23, 24, 25, 26, 27, 28, 29];

      assert(possibleValues.contains(result));
    });
  });
}
