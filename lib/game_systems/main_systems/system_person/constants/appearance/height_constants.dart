class HeightConstants {
  //Chances:
  static const outsideAverageHeightChance = 20;

  //
  //Max Height Ranges:
  //5 ft
  static const int shorterThanAverageMinInInches = 60;

  //5'5 ft
  static const int shorterThanAverageMaxInInches = 65;

  //5'5 ft
  static const int averageMinInInches = 65;

  //5'10 ft
  static const int averageMaxInInches = 70;

  //5'10 ft
  static const int tallerThanAverageMinInInches = 70;

  //6'8 ft
  static const int tallerThanAverageMaxInInches = 80;

  //
  //Life Stage Current Height Ranges:
  //--make sure the ranges never overlap with range before or after them
  //--this way we never have to know the person's previous height before deciding what their current lifestage height is.
  //1'6 ft
  static const int babyHeightMinInInches = 18;

  //1'11 ft
  static const int babyHeightMaxInInches = 23;

  //2'10 ft
  static const int toddlerHeightMinInInches = 34;

  //3'5 ft
  static const int toddlerHeightMaxInInches = 41;

  //3'9 ft
  static const int childHeightMinInInches = 45;

  //5 ft
  static const int childHeightMaxInInches = 60;

  //max height is revealed at teen
}
