enum RomanticRelationshipType {
  none(
    maleEquivalent: "",
    femaleEquivalent: "",
  ),
  coparent(
    maleEquivalent: "Baby daddy",
    femaleEquivalent: "Baby mama",
  ),
  casual(
    maleEquivalent: "Fling",
    femaleEquivalent: "Fling",
  ),
  dating(
    maleEquivalent: "Boyfriend",
    femaleEquivalent: "Girlfriend",
  ),
  engaged(
    maleEquivalent: "Fiancé",
    femaleEquivalent: "Fiancée",
  ),
  married(
    maleEquivalent: "Husband",
    femaleEquivalent: "Wife",
  );

  const RomanticRelationshipType({
    required this.maleEquivalent,
    required this.femaleEquivalent,
  });

  final String maleEquivalent;
  final String femaleEquivalent;
}
