import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/constants/grade.dart';

void main() {
  group("Grade:", () {
    test("undetermined lower bound is 0 and upperbound is 0", () {
      expect(Grade.undetermined.lowerBound, 0);
      expect(Grade.undetermined.upperBound, 0);
    });
    test("A+ lower bound is 97 and upperbound is 100", () {
      expect(Grade.aPlus.lowerBound, 97);
      expect(Grade.aPlus.upperBound, 100);
    });

    test("A lower bound is 93 and upperbound is 96", () {
      expect(Grade.a.lowerBound, 93);
      expect(Grade.a.upperBound, 96);
    });

    test("A- lower bound is 90 and upperbound is 92", () {
      expect(Grade.aMinus.lowerBound, 90);
      expect(Grade.aMinus.upperBound, 92);
    });

    test("B+ lower bound is 87 and upperbound is 89", () {
      expect(Grade.bPlus.lowerBound, 87);
      expect(Grade.bPlus.upperBound, 89);
    });

    test("B lower bound is 83 and upperbound is 86", () {
      expect(Grade.b.lowerBound, 83);
      expect(Grade.b.upperBound, 86);
    });

    test("B- lower bound is 80 and upperbound is 82", () {
      expect(Grade.bMinus.lowerBound, 80);
      expect(Grade.bMinus.upperBound, 82);
    });

    test("C+ lower bound is 77 and upperbound is 79", () {
      expect(Grade.cPlus.lowerBound, 77);
      expect(Grade.cPlus.upperBound, 79);
    });

    test("C lower bound is 73 and upperbound is 76", () {
      expect(Grade.c.lowerBound, 73);
      expect(Grade.c.upperBound, 76);
    });

    test("C- lower bound is 70 and upperbound is 72", () {
      expect(Grade.cMinus.lowerBound, 70);
      expect(Grade.cMinus.upperBound, 72);
    });

    test("D lower bound is 65 and upperbound is 69", () {
      expect(Grade.d.lowerBound, 65);
      expect(Grade.d.upperBound, 69);
    });

    test("E lower bound is 60 and upperbound is 64", () {
      expect(Grade.e.lowerBound, 60);
      expect(Grade.e.upperBound, 64);
    });

    test("F lower bound is 0 and upperbound is 59", () {
      expect(Grade.f.lowerBound, 0);
      expect(Grade.f.upperBound, 59);
    });
  });
}
