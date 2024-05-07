//we first checked if its botched,
//if it isnt we check if it is artistic,
//if it isnt then we know it's simple
enum TattooShop {
  oneStar(
    presentationName: "☆",
    discountPercentage: 70,
    botchedChance: 80,
    artisticChance: 10,
  ),
  twoStars(
    presentationName: "☆☆",
    discountPercentage: 50,
    botchedChance: 60,
    artisticChance: 20,
  ),
  threeStars(
    presentationName: "☆☆☆",
    discountPercentage: 30,
    botchedChance: 40,
    artisticChance: 30,
  ),
  fourStars(
    presentationName: "☆☆☆☆",
    discountPercentage: 10,
    botchedChance: 20,
    artisticChance: 40,
  ),
  fiveStars(
    presentationName: "☆☆☆☆☆",
    discountPercentage: 0,
    botchedChance: 10,
    artisticChance: 50,
  );

  const TattooShop({
    required this.presentationName,
    required this.discountPercentage,
    required this.botchedChance,
    required this.artisticChance,
  });

  final String presentationName;
  final int discountPercentage;
  final int botchedChance;
  final int artisticChance;
}
