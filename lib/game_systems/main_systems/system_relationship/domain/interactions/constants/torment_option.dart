enum TormentOption {
  insult(presentationText: "Insult"),
  cyberbully(presentationText: "Cyberbully"),
  spreadRumor(presentationText: "Spread Rumor"),
  prank(presentationText: "Prank");

  const TormentOption({required this.presentationText});

  final String presentationText;
}
