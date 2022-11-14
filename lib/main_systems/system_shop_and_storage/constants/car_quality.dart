enum CarQuality {
  //* to find the max depreciation rate for each quality we have to answer the question:
  //* How long should a [insert quality] car last if the quality reduces every [Car.maxConditionDepreciationDaysLength]?

  //*formula: maxDep = 100 / (carLifetimeInDays/maxConditionDepreciationDaysLength)

  //*lasts 90 days
  high(
    maxDepreciation: 11,
    description: "Great",
  ),

  //*lasts 70 days
  mid(
    maxDepreciation: 14,
    description: "Good",
  ),

  //*lasts 50 days
  low(
    maxDepreciation: 20,
    description: "Okay",
  );

  const CarQuality({
    required this.maxDepreciation,
    required this.description,
  });
  final int maxDepreciation;
  final String description;
}
