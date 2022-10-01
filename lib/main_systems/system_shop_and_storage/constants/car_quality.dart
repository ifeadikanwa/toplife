enum CarQuality {
  //* to find the max depreciation rate for each quality we have to answer the question:
  //* How long should a [insert quality] car last if the quality reduces every [Car.maxConditionDepreciationDaysLength]?
  high(
    maxDepreciation: 0,
    description: "Great",
  ),
  mid(
    maxDepreciation: 0,
    description: "Good",
  ),
  low(
    maxDepreciation: 0,
    description: "Okay",
  );

  const CarQuality({
    required this.maxDepreciation,
    required this.description,
  });
  final int maxDepreciation;
  final String description;
}
