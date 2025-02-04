enum JewelryType {
  ring(basePrice: 0), //1 expensive
  necklace(basePrice: 0), //3 expensive
  chain(basePrice: 0), //2 expensive
  earrings(basePrice: 0); //4 expensive

  const JewelryType({
    required this.basePrice,
  });

  final int basePrice;
}
