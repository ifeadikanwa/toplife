//we first checked if its botched, 
//if it isnt we check if it is artistic, 
//if it isnt then we know it's simple
enum TattooShop {
  oneStar(
    presentationtName: "☆",
    discountPercentage: 70,
    botchedChance: 80,
    artisticChance: 10,
  ),
  twoStars(
    presentationtName: "☆☆",
    discountPercentage: 50,
    botchedChance: 60,
    artisticChance: 20,
  ),
  threeStars(
    presentationtName: "☆☆☆",
    discountPercentage: 30,
    botchedChance: 40,
    artisticChance: 30,
  ),
  fourStars(
    presentationtName: "☆☆☆☆",
    discountPercentage: 10,
    botchedChance: 20,
    artisticChance: 40,
  ),
  fiveStars(
    presentationtName: "☆☆☆☆☆",
    discountPercentage: 0,
    botchedChance: 10,
    artisticChance: 50,
  );

  const TattooShop({
    required this.presentationtName,
    required this.discountPercentage,
    required this.botchedChance,
    required this.artisticChance,
  });

  final String presentationtName;
  final int discountPercentage;
  final int botchedChance;
  final int artisticChance;
}
