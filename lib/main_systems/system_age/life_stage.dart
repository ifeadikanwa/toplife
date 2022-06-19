enum LifeStage {
  baby(stageName: "Baby", stageDuration: 3),
  toddler(stageName: "Toddler", stageDuration: 4),
  child(stageName: "Child", stageDuration: 6),
  teen(stageName: "Teen", stageDuration: 6),
  youngAdult(stageName: "Young Adult", stageDuration: 30),
  adult(stageName: "Adult", stageDuration: 30),
  elder(stageName: "Elder", stageDuration: 10);

  const LifeStage({required this.stageName, required this.stageDuration});

  final String stageName;
  final int stageDuration;
}
