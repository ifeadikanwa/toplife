import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/zodiac_sign.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_random_zodiac_sign.dart';

void main() {
  test("getRandomZodiacSign returns one of the zodiac signs", () {
    ZodiacSign result = getRandomZodiacSign();
    assert(ZodiacSign.values.contains(result));
  });
}