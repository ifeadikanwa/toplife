import 'dart:math';

class BabyTraitsConstants {
  static const possibleFussiness = [10, 20, 30, 40, 50];
  static const possibleAppetite = [2, 3, 4];
  static const emergencyHungerLevel = 15;
  static const emergencyHungerDepletion = 5;

  static int getValidFussinessValue() {
    final randomIndex = Random().nextInt(possibleFussiness.length);
    return possibleFussiness[randomIndex];
  }

  static int getValidAppetiteValue() {
    final randomIndex = Random().nextInt(possibleAppetite.length);
    return possibleAppetite[randomIndex];
  }
}
