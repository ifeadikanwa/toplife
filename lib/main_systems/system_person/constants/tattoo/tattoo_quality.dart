//description looks something like: A botched tattoo of a dancing banana.
//
enum TattooQuality {
  botched(
    presentationName: "A botched",
  ),
  simple(
    presentationName: "A simple",
  ),
  artistic(
    presentationName: "An artistic",
  );

  const TattooQuality({
    required this.presentationName,
  });

  final String presentationName;
}
