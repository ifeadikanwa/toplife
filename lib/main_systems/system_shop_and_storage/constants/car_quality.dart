enum CarQuality {
  //* to find the max depreciation rate for each quality we have to answer the question:
  //* How long should a [insert quality] car last if the quality reduces every [Car.maxConditionDepreciationDaysLength]?
  high(maxDepreciation: 0),
  mid(maxDepreciation: 0),
  low(maxDepreciation: 0);

  const CarQuality({required this.maxDepreciation});
  final int maxDepreciation;
}
