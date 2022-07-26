import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/degree_info/degree_discipline.dart';

void main() {
  group("Degree Disciplines: ", () {
    test("Humanities discipline has 5 branches", () {
      expect(DegreeDiscipline.humanities.branches.length, 5);
    });

    test("Social science discipline has 5 branches", () {
      expect(DegreeDiscipline.socialScience.branches.length, 5);
    });

    test("Natural science discipline has 5 branches", () {
      expect(DegreeDiscipline.naturalScience.branches.length, 5);
    });

    test("engineering discipline has 4 branches", () {
      expect(DegreeDiscipline.engineering.branches.length, 4);
    });

    test("Business discipline has 5 branches", () {
      expect(DegreeDiscipline.business.branches.length, 5);
    });

    test("Medical discipline has 4 branches", () {
      expect(DegreeDiscipline.medical.branches.length, 4);
    });

    test("Nursing discipline has 1 branch", () {
      expect(DegreeDiscipline.nursing.branches.length, 1);
    });

    test("Pharmacy discipline has 1 branch", () {
      expect(DegreeDiscipline.pharmacy.branches.length, 1);
    });

    test("Law discipline has 4 branches", () {
      expect(DegreeDiscipline.law.branches.length, 4);
    });

    test("Education discipline has 9 branches", () {
      expect(DegreeDiscipline.education.branches.length, 9);
    });
  });
}
