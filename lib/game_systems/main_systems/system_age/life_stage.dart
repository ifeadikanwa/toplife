//MUST BE A MULTIPLE OF 7
enum LifeStage {
  baby(
    stageName: "Baby",
    stageDuration: 7,
  ),
  toddler(
    stageName: "Toddler",
    stageDuration: 7,
  ),
  child(
    stageName: "Child",
    stageDuration: 14,
  ),
  teen(
    stageName: "Teen",
    stageDuration: 21,
  ),
  youngAdult(
    stageName: "Young Adult",
    stageDuration: 42,
  ),
  adult(
    stageName: "Adult",
    stageDuration: 63,
  ),
  elder(
    stageName: "Elder",
    stageDuration: 42,
  );

  const LifeStage({
    required this.stageName,
    required this.stageDuration,
  });

  final String stageName;
  final int stageDuration;
}
