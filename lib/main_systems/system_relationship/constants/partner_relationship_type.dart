enum PartnerRelationshipType {
  casual(
    maleEquivalent: "Fling",
    femaleEquivalent: "Fling",
  ),
  coparent(
    maleEquivalent: "Baby Daddy",
    femaleEquivalent: "Baby Mama",
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

  const PartnerRelationshipType({
    required this.maleEquivalent,
    required this.femaleEquivalent,
  });

  final String maleEquivalent;
  final String femaleEquivalent;
}
