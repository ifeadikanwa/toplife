import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/cars/sportscars.dart';

void main() {
  group("Sports cars:", () {
    test(
      "every car name is at least 5 letters",
      () {
        for (var sportsCar in sportsCars) {
          expect(
            sportsCar.name.trim().length,
            greaterThanOrEqualTo(5),
            reason: "Cause: $sportsCar",
          );
        }
      },
    );

    test(
      "there are at least 7 cars in the list",
      () {
        expect(sportsCars.length, greaterThanOrEqualTo(7));
      },
    );

    test(
      "every car type is a sportsCar",
      () {
        for (var sportsCar in sportsCars) {
          expect(
            sportsCar.type,
            CarType.sportsCar.name,
            reason: "Cause: ${sportsCar.name}",
          );
        }
      },
    );

    test(
      "every car percentage travel time is greater than 0",
      () {
        for (var sportsCar in sportsCars) {
          expect(
            sportsCar.percentageOfTravelTime,
            greaterThan(0),
            reason: "Cause: ${sportsCar.name}",
          );
        }
      },
    );

    test(
      "every car percentage travel time is in the range 20 - 25",
      () {
        for (var sportsCar in sportsCars) {
          expect(
            sportsCar.percentageOfTravelTime,
            inInclusiveRange(20, 25),
            reason: "Cause: ${sportsCar.name}",
          );
        }
      },
    );

    test(
      "every car quality is high",
      () {
        for (var sportsCar in sportsCars) {
          expect(
            sportsCar.quality,
            CarQuality.high.name,
            reason: "Cause: ${sportsCar.name}",
          );
        }
      },
    );

    //*this is supposed to ensure that all items in the list have a price.
    //*But at this point the game economy has not been worked out so there are no prices
    //*The moment prices are added this should fail so you need to:
    //! change it to check that all base prices are greater than the least priced item.
    test(
      "every car base price is 0",
      () {
        for (var sportsCar in sportsCars) {
          expect(
            sportsCar.basePrice,
            0,
            reason: "Cause: ${sportsCar.name}",
          );
        }
      },
    );
  });
}
