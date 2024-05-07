 import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/gender.dart';

Gender getRandomGender() {
    final isFemale = Chance.getTrueOrFalse();
    return isFemale ? Gender.Female : Gender.Male;
  }