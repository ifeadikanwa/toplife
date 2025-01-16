// ignore_for_file: constant_identifier_names

enum FuneralType {
  Burial(basePrice: 100),
  Cremation(basePrice: 50),
  Donation(basePrice: 0);

  const FuneralType({required this.basePrice});

  final int basePrice;
}
