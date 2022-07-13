import 'dart:collection';

import 'package:toplife/main_systems/system_school/degree_info/degree_disciplines.dart';
import 'package:toplife/main_systems/system_school/domain/model/degree.dart';

class GameDegrees {
  static HashSet<Degree> allDegrees = HashSet.of({
    ...regularDegrees(),
    ...specialDegrees(),
  });

  static HashSet<Degree> regularDegrees() {
    HashSet<Degree> regularDegrees = HashSet.of({});

    //regular degrees
    for (var branch in DegreeDisciplines.humanities.branches) {
      regularDegrees.add(Degree(
        discipline: DegreeDisciplines.humanities.name,
        branch: branch,
        isSpecialDegree: false,
      ));
    }

    for (var branch in DegreeDisciplines.naturalScience.branches) {
      regularDegrees.add(Degree(
        discipline: DegreeDisciplines.naturalScience.name,
        branch: branch,
        isSpecialDegree: false,
      ));
    }

    for (var branch in DegreeDisciplines.business.branches) {
      regularDegrees.add(Degree(
        discipline: DegreeDisciplines.business.name,
        branch: branch,
        isSpecialDegree: false,
      ));
    }

    for (var branch in DegreeDisciplines.socialScience.branches) {
      regularDegrees.add(Degree(
        discipline: DegreeDisciplines.socialScience.name,
        branch: branch,
        isSpecialDegree: false,
      ));
    }

    for (var branch in DegreeDisciplines.engineering.branches) {
      regularDegrees.add(Degree(
        discipline: DegreeDisciplines.engineering.name,
        branch: branch,
        isSpecialDegree: false,
      ));
    }

    return regularDegrees;
  }

  static HashSet<Degree> specialDegrees() {
    HashSet<Degree> specialDegrees = HashSet.of({});

    //Special degrees
    for (var branch in DegreeDisciplines.medical.branches) {
      specialDegrees.add(Degree(
        discipline: DegreeDisciplines.medical.name,
        branch: branch,
        isSpecialDegree: true,
      ));
    }

    for (var branch in DegreeDisciplines.nursing.branches) {
      specialDegrees.add(Degree(
        discipline: DegreeDisciplines.nursing.name,
        branch: branch,
        isSpecialDegree: true,
      ));
    }

    for (var branch in DegreeDisciplines.pharmacy.branches) {
      specialDegrees.add(Degree(
        discipline: DegreeDisciplines.pharmacy.name,
        branch: branch,
        isSpecialDegree: true,
      ));
    }

    for (var branch in DegreeDisciplines.law.branches) {
      specialDegrees.add(Degree(
        discipline: DegreeDisciplines.law.name,
        branch: branch,
        isSpecialDegree: true,
      ));
    }

    for (var branch in DegreeDisciplines.education.branches) {
      specialDegrees.add(Degree(
        discipline: DegreeDisciplines.education.name,
        branch: branch,
        isSpecialDegree: true,
      ));
    }

    return specialDegrees;
  }
}
