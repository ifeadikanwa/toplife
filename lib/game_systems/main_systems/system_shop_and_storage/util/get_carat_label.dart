import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/jewel.dart';

String getCaratLabel({
  required String jewel,
  required double carat,
}) {
  if (jewel == Jewel.Gold.name) {
    return "${carat.toInt()}K";
  } else {
    return "$carat ${TextConstants.carat}";
  }
}
