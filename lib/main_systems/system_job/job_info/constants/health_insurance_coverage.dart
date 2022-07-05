enum HealthInsuranceCoverage {
  none(percentage: 0),
  low(percentage: 30),
  mid(percentage: 50),
  high(percentage: 80);

  const HealthInsuranceCoverage({required this.percentage});

  final int percentage;
}
