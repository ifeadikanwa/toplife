enum LifeStage {
  baby(
    stageName: "Baby",
    stageDuration: 3,
    schoolForStage: "",
  ),
  toddler(
    stageName: "Toddler",
    stageDuration: 4,
    schoolForStage: "Preschool",
  ),
  child(
    stageName: "Child",
    stageDuration: 6,
    schoolForStage: "Middle School",
  ),
  teen(
    stageName: "Teen",
    stageDuration: 6,
    schoolForStage: "High School",
  ),
  youngAdult(
    stageName: "Young Adult",
    stageDuration: 30,
    schoolForStage: "",
  ),
  adult(
    stageName: "Adult",
    stageDuration: 30,
    schoolForStage: "",
  ),
  elder(
    stageName: "Elder",
    stageDuration: 10,
    schoolForStage: "",
  );

  const LifeStage({
    required this.stageName,
    required this.stageDuration,
    required this.schoolForStage,
  });

  final String stageName;
  final int stageDuration;
  final String schoolForStage;
}
