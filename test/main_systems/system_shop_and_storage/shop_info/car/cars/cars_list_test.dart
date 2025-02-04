import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_type.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/car/cars/cars_list.dart';

void main() {
  group("CarsList:", () {
    test(
      "get shuffled sports cars list returns only sports cars",
      () {
        final List<Car> result = CarsList.getShuffledSportsCarsList();

        expect(
          result.where(
            (car) => car.type != CarType.sportsCar.name,
          ),
          hasLength(0),
        );
      },
    );

    test(
      "get shuffled convertibles list returns only convertibles",
      () {
        final List<Car> result = CarsList.getShuffledConvertiblesList();

        expect(
          result.where(
            (car) => car.type != CarType.convertible.name,
          ),
          hasLength(0),
        );
      },
    );

    test(
      "get shuffled suvs list returns only suvs",
      () {
        final List<Car> result = CarsList.getShuffledSUVList();

        expect(
          result.where(
            (car) => car.type != CarType.suv.name,
          ),
          hasLength(0),
        );
      },
    );


     test(
      "get shuffled sedans list returns only sedans",
      () {
        final List<Car> result = CarsList.getShuffledSedansList();

        expect(
          result.where(
            (car) => car.type != CarType.sedan.name,
          ),
          hasLength(0),
        );
      },
    );

     test(
      "get shuffled trucks list returns only trucks",
      () {
        final List<Car> result = CarsList.getShuffledTrucksList();

        expect(
          result.where(
            (car) => car.type != CarType.truck.name,
          ),
          hasLength(0),
        );
      },
    );
  });
}
