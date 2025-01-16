enum LevelTitle {
  partTime(titleName: "Part-Time"),
  intern(titleName: "Intern"),
  associate(titleName: "Associate"),
  partner(titleName: "Partner"),
  chiefResident(titleName: "Chief Resident"),
  medicalDirector(titleName: "Medical Director"),
  trainee(titleName: "Trainee"),
  apprentice(titleName: "Apprentice"),
  junior(titleName: "Junior"),
  senior(titleName: "Senior"),
  master(titleName: "Master"),
  head(titleName: "Head"),
  backup(titleName: "Backup"),
  lead(titleName: "Lead"),
  supporting(titleName: "Supporting"),
  assistantChief(titleName: "Assistant Chief"),
  fireChief(titleName: "Fire Chief"),
  entryLevel(titleName: "Entry Level"),
  administrative(titleName: "Administrative"),
  executive(titleName: "Executive"),
  substitute(titleName: "Substitute"),
  assistant(titleName: "Assistant");

  const LevelTitle({required this.titleName});

  final String titleName;
}
