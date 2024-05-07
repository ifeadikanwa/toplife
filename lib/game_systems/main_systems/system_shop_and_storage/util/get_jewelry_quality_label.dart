import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/jewelry_quality.dart';

String getJewelryQualityLabel({required String quality}) {
  return (quality == JewelryQuality.natural.name)
      ? TextConstants.natural.toLowerCase()
      : TextConstants.labGrown.toLowerCase();
}
