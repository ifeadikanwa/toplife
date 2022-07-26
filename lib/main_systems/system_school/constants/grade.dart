enum Grade {
  aPlus(
    letterGrade: "A+",
    lowerBound: 97,
    upperBound: 100,
  ),
  a(
    letterGrade: "A",
    lowerBound: 93,
    upperBound: 96,
  ),
  aMinus(
    letterGrade: "A-",
    lowerBound: 90,
    upperBound: 92,
  ),
  bPlus(
    letterGrade: "B+",
    lowerBound: 87,
    upperBound: 89,
  ),
  b(
    letterGrade: "B",
    lowerBound: 83,
    upperBound: 86,
  ),
  bMinus(
    letterGrade: "B-",
    lowerBound: 80,
    upperBound: 82,
  ),
  cPlus(
    letterGrade: "C+",
    lowerBound: 77,
    upperBound: 79,
  ),
  c(
    letterGrade: "C",
    lowerBound: 73,
    upperBound: 76,
  ),
  cMinus(
    letterGrade: "C-",
    lowerBound: 70,
    upperBound: 72,
  ),
  d(
    letterGrade: "D",
    lowerBound: 65,
    upperBound: 69,
  ),
  e(
    letterGrade: "E",
    lowerBound: 60,
    upperBound: 64,
  ),
  f(
    letterGrade: "F",
    lowerBound: 0,
    upperBound: 59,
  ),
  undetermined(
    letterGrade: "-",
    lowerBound: 0,
    upperBound: 0,
  );

  const Grade({
    required this.letterGrade,
    required this.lowerBound,
    required this.upperBound,
  });

  final String letterGrade;
  final int lowerBound;
  final int upperBound;
}
