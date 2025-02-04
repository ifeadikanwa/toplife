import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/money/format_money_to_string.dart';

void main() {
  group("Format money to string:", () {
    test(
      "given an integer 1000 return 1,000",
      () {
        expect(formatMoneyToString(1000), "1,000");
      },
    );

     test(
      "given an integer 10000 return 10,000",
      () {
        expect(formatMoneyToString(10000), "10,000");
      },
    );

     test(
      "given an integer 100000 return 100,000",
      () {
        expect(formatMoneyToString(100000), "100,000");
      },
    );

     test(
      "given an integer 1000000 return 1,000,000",
      () {
        expect(formatMoneyToString(1000000), "1,000,000");
      },
    );

     test(
      "given an integer 10000000 return 10,000,000",
      () {
        expect(formatMoneyToString(10000000), "10,000,000");
      },
    );
  });
}
