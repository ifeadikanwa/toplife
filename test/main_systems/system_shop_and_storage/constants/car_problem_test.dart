import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_problem.dart';

void main() {
  group("Car problem:", () {
    test("no problem has the correct fullname", () {
      expect(CarProblem.noProblem.fullName, "");
    });

    test("sputtering engine has the correct fullname", () {
      expect(
        CarProblem.sputteringEngine.fullName,
        "Sputtering Engine",
      );
    });

    test("alternator failure has the correct fullname", () {
      expect(
        CarProblem.alternatorFailure.fullName,
        "Alternator Failure",
      );
    });

    test("faulty fuse has the correct fullname", () {
      expect(
        CarProblem.faultyFuse.fullName,
        "Faulty Fuse",
      );
    });

    test("damaged oxygen sensors has the correct fullname", () {
      expect(
        CarProblem.damagedOxygenSensors.fullName,
        "Damaged Oxygen Sensors",
      );
    });

    test("dead battery has the correct fullname", () {
      expect(
        CarProblem.deadBattery.fullName,
        "Dead Battery",
      );
    });

    test("faulty brakes has the correct fullname", () {
      expect(
        CarProblem.faultyBrakes.fullName,
        "Faulty Brakes",
      );
    });

    test("faulty spark plugs has the correct fullname", () {
      expect(
        CarProblem.faultySparkPlugs.fullName,
        "Faulty Spark Plugs",
      );
    });

    test("overheating has the correct fullname", () {
      expect(
        CarProblem.overheating.fullName,
        "Overheating",
      );
    });

    test("faulty oil pump has the correct fullname", () {
      expect(
        CarProblem.faultyOilPump.fullName,
        "Faulty Oil Pump",
      );
    });

    //*this is supposed to ensure that all items in the list have a price.
    //*But at this point the game economy has not been worked out so there are no prices
    //*The moment prices are added this should fail so you need to:
    //! change it to check that all base prices are greater than the least priced item.
    test("All car problems have a base price of 0", () {
      for (var problem in CarProblem.values) {
        expect(
          problem.basePrice,
          0,
          reason: "Cause: $problem",
        );
      }
    });
  });
}
