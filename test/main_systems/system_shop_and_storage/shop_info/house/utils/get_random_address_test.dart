import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/house/utils/get_random_address.dart';

void main() {
  group("Get random address:", () {
    test(
      "function returns a non-empty string with more than 3 letters",
      () {
        expect(getRandomAddress().trim().length, greaterThan(3));
      },
    );
    test(
      "the first group of letters are numbers for the address",
      () {
        final String result = getRandomAddress();

        final resultSplit = result.split(" ");

        expect(
          result.length,
          greaterThan(1),
          reason:
              "Cause: Bad or incomplete address returned. \nAddress: $result",
        );
        expect(
          num.tryParse(resultSplit[0]),
          isNotNull,
          reason:
              "Cause: Address does not start with numbers. \nAddress: $result",
        );
      },
    );

    test(
      "everything after the first group of letters is a street name",
      () {
        final String result = getRandomAddress();

        //get the first space index
        final firstSpaceIndex = result.indexOf(" ");
        expect(
          firstSpaceIndex,
          isNot(-1),
          reason:
              "Cause: First space not found because of bad or incomplete address. Address: $result",
        );

        final streetName = result.substring(firstSpaceIndex + 1);

        expect(
          streetNames.contains(streetName),
          true,
          reason:
              "Cause: Street name is not in the list of street names. \nAddress: $result",
        );
      },
    );
  });
}
