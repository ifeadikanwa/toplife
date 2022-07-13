import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/degree_info/degree_disciplines.dart';

void main() {
  group("Degree Disciplines: ", () {
    test("Humanities discipline has 5 branches", () {
      expect(DegreeDisciplines.humanities.branches.length, 5);
    });

     test("Social science discipline has 5 branches", () {
      expect(DegreeDisciplines.socialScience.branches.length, 5);
    });

     test("Natural science discipline has 5 branches", () {
      expect(DegreeDisciplines.naturalScience.branches.length, 5);
    });

     test("engineering discipline has 4 branches", () {
      expect(DegreeDisciplines.engineering.branches.length, 4);
    });

     test("Business discipline has 5 branches", () {
      expect(DegreeDisciplines.business.branches.length, 5);
    });

     test("Medical discipline has 4 branches", () {
      expect(DegreeDisciplines.medical.branches.length, 4);
    });

     test("Nursing discipline has 1 branch", () {
      expect(DegreeDisciplines.nursing.branches.length, 1);
    });

     test("Pharmacy discipline has 1 branch", () {
      expect(DegreeDisciplines.pharmacy.branches.length, 1);
    });

     test("Law discipline has 4 branches", () {
      expect(DegreeDisciplines.law.branches.length, 4);
    });

     test("Education discipline has 9 branches", () {
      expect(DegreeDisciplines.education.branches.length, 9);
    });
  });
}
