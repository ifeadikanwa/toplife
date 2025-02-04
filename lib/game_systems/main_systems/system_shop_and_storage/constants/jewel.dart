// ignore_for_file: constant_identifier_names

enum Jewel {
  Gold(pricePerCarat: 0),
  Diamond(pricePerCarat: 0),
  Emerald(pricePerCarat: 0),
  Ruby(pricePerCarat: 0);

  const Jewel({required this.pricePerCarat});
  final int pricePerCarat;
}
