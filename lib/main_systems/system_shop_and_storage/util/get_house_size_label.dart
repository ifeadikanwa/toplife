import 'package:toplife/core/text_constants.dart';

String getHouseSizeLabel({
  required int bedroomCount,
  required int bathroomCount,
}) {
  final String bedroomDescriptor =
      (bedroomCount == 1) ? TextConstants.bedroom : TextConstants.bedrooms;

  final String bathroomDescriptor =
      (bathroomCount == 1) ? TextConstants.bathroom : TextConstants.bathrooms;

  return "$bedroomCount $bedroomDescriptor & $bathroomCount $bathroomDescriptor";
}
