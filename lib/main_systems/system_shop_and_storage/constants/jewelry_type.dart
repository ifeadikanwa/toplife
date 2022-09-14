enum JewelryType {
  ring(basePrice: 0),
  necklace(basePrice: 0),
  chain(basePrice: 0),
  earring(basePrice: 0);

  const JewelryType({
    required this.basePrice,
  });

  final int basePrice;
}
