import 'dart:math';

const int minDaysBeforeMarriage = 5;
const int maxDaysBeforeMarriage = 50;

int getValidRandomDaysToDateBeforeMarriageValue() {
  return Random().nextInt(maxDaysBeforeMarriage - minDaysBeforeMarriage) +
      minDaysBeforeMarriage;
}
