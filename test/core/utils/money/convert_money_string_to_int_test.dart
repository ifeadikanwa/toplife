import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/money/convert_money_string_to_int.dart';

void main() {
  group("Convert money string to int:", () {
    test("when given a string with just letters and symbols we get 0", () {
      expect(
        convertMoneyStringToInt("inv,alid.string"),
        0,
      );
    });

    test(
        "when given a string with numbers and letters(no symbols), we get only th e numbers in the order they appear in the string",
        () {
      expect(
        convertMoneyStringToInt("H54y0e8po39"), //540839
        540839,
      );
    });

    test("when given a string with just symbols we get 0", () {
      expect(
        convertMoneyStringToInt("&\$%.@,"),
        0,
      );
    });

    test("when given a string with just letters and symbols we get 0", () {
      expect(
        convertMoneyStringToInt("inv,alid.string"),
        0,
      );
    });

    test(
        "when given a string with just numbers and one decimal point we get the correct truncated integer",
        () {
      expect(convertMoneyStringToInt("789.5632"), 789);
    });

    test(
        "when given a string with just numbers and commas we get only the numbers in order",
        () {
      expect(
        convertMoneyStringToInt("40,900,34,812"),
        4090034812,
      );
    });

    test(
        "when given a string with numbers and multiple decimal points we get 0",
        () {
      expect(
        convertMoneyStringToInt("678.578.8.90"),
        0,
      );
    });

    test(
        "when given a string with numbers, one decimal point and commas anywhere, we get the truncanted integer",
        () {
      expect(
        convertMoneyStringToInt("189,76,873.98,312"),
        18976873,
      );
    });

   

    test(
        "when given a string with numbers, letter, one decimal point and commas anywhere, we get the truncanted integer",
        () {
      expect(
        convertMoneyStringToInt("1uhy89,7d6,873.9m,k8"),
        18976873,
      );
    });
  });
}
