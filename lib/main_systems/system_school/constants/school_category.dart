enum SchoolCategory {
  precollege(presentationName: "Pre-college"),
  college(presentationName: "College");

  const SchoolCategory({
    required this.presentationName,
  });

  final String presentationName;
}
