import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_problem.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_type.dart';
import 'package:toplife/main_systems/system_transportation/constants/transport_mode.dart';
import 'package:toplife/main_systems/system_transportation/public_transportation/public_transportation.dart';

void main() {
  group("Public transportation:", () {
    test(
      "bus has the correct properties",
      () {
        expect(
          PublicTransportation.bus.name,
          TransportMode.bus.presentationName,
          reason: "Cause: name",
        );

        expect(
          PublicTransportation.bus.type,
          CarType.bus.name,
          reason: "Cause: type",
        );

        expect(
          PublicTransportation.bus.percentageOfTravelTime,
          100,
          reason: "Cause: percentageOfTravelTime",
        );

        expect(
          PublicTransportation.bus.quality,
          CarQuality.high.name,
          reason: "Cause: quality",
        );

        expect(
          PublicTransportation.bus.basePrice,
          15,
          reason: "Cause: base price",
        );

        expect(
          PublicTransportation.bus.problem,
          CarProblem.noProblem.name,
          reason: "Cause: problem",
        );

        expect(
          PublicTransportation.bus.useCondition,
          100,
          reason: "Cause: use condition",
        );

        expect(
          PublicTransportation.bus.maxConditionAtPurchase,
          100,
          reason: "Cause: max condition",
        );
      },
    );


     test(
      "taxi has the correct properties",
      () {
        expect(
          PublicTransportation.taxi.name,
          TransportMode.taxi.presentationName,
          reason: "Cause: name",
        );

        expect(
          PublicTransportation.taxi.type,
          CarType.taxi.name,
          reason: "Cause: type",
        );

        expect(
          PublicTransportation.taxi.percentageOfTravelTime,
          50,
          reason: "Cause: percentageOfTravelTime",
        );

        expect(
          PublicTransportation.taxi.quality,
          CarQuality.high.name,
          reason: "Cause: quality",
        );

        expect(
          PublicTransportation.taxi.basePrice,
          40,
          reason: "Cause: base price",
        );

        expect(
          PublicTransportation.taxi.problem,
          CarProblem.noProblem.name,
          reason: "Cause: problem",
        );

        expect(
          PublicTransportation.taxi.useCondition,
          100,
          reason: "Cause: use condition",
        );

        expect(
          PublicTransportation.taxi.maxConditionAtPurchase,
          100,
          reason: "Cause: max condition",
        );
      },
    );

     test(
      "train has the correct properties",
      () {
        expect(
          PublicTransportation.train.name,
          TransportMode.train.presentationName,
          reason: "Cause: name",
        );

        expect(
          PublicTransportation.train.type,
          CarType.train.name,
          reason: "Cause: type",
        );

        expect(
          PublicTransportation.train.percentageOfTravelTime,
          70,
          reason: "Cause: percentageOfTravelTime",
        );

        expect(
          PublicTransportation.train.quality,
          CarQuality.high.name,
          reason: "Cause: quality",
        );

        expect(
          PublicTransportation.train.basePrice,
          10,
          reason: "Cause: base price",
        );

        expect(
          PublicTransportation.train.problem,
          CarProblem.noProblem.name,
          reason: "Cause: problem",
        );

        expect(
          PublicTransportation.train.useCondition,
          100,
          reason: "Cause: use condition",
        );

        expect(
          PublicTransportation.train.maxConditionAtPurchase,
          100,
          reason: "Cause: max condition",
        );
      },
    );
  });
}
