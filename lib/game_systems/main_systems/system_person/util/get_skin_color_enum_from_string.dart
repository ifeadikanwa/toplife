import 'package:toplife/game_systems/main_systems/system_person/constants/appearance/skin_color.dart';

SkinColor? getSkinColorEnumFromString(String skinColorString) {
  final Map<String, SkinColor> skincolorMap = SkinColor.values.asNameMap();

  final SkinColor? skinColorEnum = skincolorMap[skinColorString];

  return skinColorEnum;
}
