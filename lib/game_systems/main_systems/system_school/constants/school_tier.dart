enum SchoolTier {
  top(presentationName: "Top Tier"),
  mid(presentationName: "Mid Tier"),
  low(presentationName: "Low Tier");

  const SchoolTier({required this.presentationName});

  final String presentationName;
}
