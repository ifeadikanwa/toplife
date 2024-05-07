//price of the lowest insurance type
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_insurance_type_description.dart';

const int minInsuranceBasePrice = 200;

enum CarInsuranceType {
  starter(
    presentationName: "Starter Coverage",
    description: CarInsuranceTypeDescription.starter,
    basePrice: minInsuranceBasePrice,
  ),
  intermediate(
    presentationName: "Intermediate Coverage",
    description: CarInsuranceTypeDescription.intermediate,
    basePrice: minInsuranceBasePrice * 2,
  ),
  advanced(
    presentationName: "Advanced Coverage",
    description: CarInsuranceTypeDescription.advanced,
    basePrice: minInsuranceBasePrice * 3,
  ),
  elite(
    presentationName: "Elite Coverage",
    description: CarInsuranceTypeDescription.elite,
    basePrice: minInsuranceBasePrice * 4,
  );

  const CarInsuranceType({
    required this.presentationName,
    required this.description,
    required this.basePrice,
  });

  final String presentationName;
  final String description;
  final int basePrice;
}
