enum PrecollegeNamingSuffix {
  american(
    toddler: "Elementary School",
    child: "Middle School",
    teen: "High School",
  ),
  european(
    toddler: "Nursery School",
    child: "Primary School",
    teen: "Secondary School",
  );

  const PrecollegeNamingSuffix({
    required this.toddler,
    required this.child,
    required this.teen,
  });

  final String toddler;
  final String child;
  final String teen;
}
