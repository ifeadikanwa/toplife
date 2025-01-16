enum PrecollegeStudyHourRequirement {
  regular(
    toddler: 1,
    child: 3,
    teen: 5,
  ),
  extra(
    toddler: 1,
    child: 5,
    teen: 8,
  );

  const PrecollegeStudyHourRequirement({
    required this.toddler,
    required this.child,
    required this.teen,
  });

  final int toddler;
  final int child;
  final int teen;
}
