// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_type.dart';

void main() {
  group("Car Type:", () {
    test(
      "sports car presentation name is Sports Car",
      () {
        expect(CarType.sportsCar.presentationName, "Sports Car");
      },
    );

     test(
      "suv presentation name is SUV",
      () {
        expect(CarType.suv.presentationName, "SUV");
      },
    );

    test(
      "sedan presentation name is Sedan",
      () {
        expect(CarType.sedan.presentationName, "Sedan");
      },
    );

    test(
      "minivan presentation name is Minivan",
      () {
        expect(CarType.minivan.presentationName, "Minivan");
      },
    );
    test(
      "convertible presentation name is Convertible",
      () {
        expect(CarType.convertible.presentationName, "Convertible");
      },
    );

    test(
      "truck presentation name is Truck",
      () {
        expect(CarType.truck.presentationName, "Truck");
      },
    );

    test(
      "bus presentation name is Bus",
      () {
        expect(CarType.bus.presentationName, "Bus");
      },
    );

    test(
      "train presentation name is Train",
      () {
        expect(CarType.train.presentationName, "Train");
      },
    );

    test(
      "taxi presentation name is Taxi",
      () {
        expect(CarType.taxi.presentationName, "Taxi");
      },
    );
  });
}
