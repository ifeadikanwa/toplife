import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_insurance_type.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_insurance_type_description.dart';

void main() {
  group("Car insurance type:", () {
    test('minInsuranceBasePrice is 200', () {
      expect(
        minInsuranceBasePrice,
        200,
      );
    });

    test(
        'starter coverage presentation name, description, and base price are correct',
        () {
      expect(
        CarInsuranceType.starter.presentationName,
        "Starter Coverage",
        reason: "Cause: presentation name",
      );

      expect(
        CarInsuranceType.starter.description,
        CarInsuranceTypeDescription.starter,
        reason: "Cause: description",
      );

      expect(
        CarInsuranceType.starter.basePrice,
        minInsuranceBasePrice,
        reason: "Cause: base price",
      );
    });

    test(
        'intermediate coverage presentation name, description, and base price are correct',
        () {
      expect(
        CarInsuranceType.intermediate.presentationName,
        "Intermediate Coverage",
        reason: "Cause: presentation name",
      );

      expect(
        CarInsuranceType.intermediate.description,
        CarInsuranceTypeDescription.intermediate,
        reason: "Cause: description",
      );

      expect(
        CarInsuranceType.intermediate.basePrice,
        minInsuranceBasePrice * 2,
        reason: "Cause: base price",
      );
    });

    test(
        'advanced coverage presentation name, description, and base price are correct',
        () {
      expect(
        CarInsuranceType.advanced.presentationName,
        "Advanced Coverage",
        reason: "Cause: presentation name",
      );

      expect(
        CarInsuranceType.advanced.description,
        CarInsuranceTypeDescription.advanced,
        reason: "Cause: description",
      );

      expect(
        CarInsuranceType.advanced.basePrice,
        minInsuranceBasePrice * 3,
        reason: "Cause: base price",
      );
    });

    test(
        'elite coverage presentation name, description, and base price are correct',
        () {
      expect(
        CarInsuranceType.elite.presentationName,
        "Elite Coverage",
        reason: "Cause: presentation name",
      );

      expect(
        CarInsuranceType.elite.description,
        CarInsuranceTypeDescription.elite,
        reason: "Cause: description",
      );

      expect(
        CarInsuranceType.elite.basePrice,
        minInsuranceBasePrice * 4,
        reason: "Cause: base price",
      );
    });
  });
}
