import 'package:toplife/core/utils/get_random_value_from_collections.dart';
import 'package:toplife/main_systems/system_person/constants/zodiac_sign.dart';

ZodiacSign getRandomZodiacSign() {
  return getRandomValueFromList(list: ZodiacSign.values);
}
