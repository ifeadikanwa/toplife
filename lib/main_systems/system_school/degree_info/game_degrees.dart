import 'dart:collection';

import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/degree_info/degree_discipline.dart';

class GameDegrees {
  static HashSet<Degree> allDegrees = HashSet.of({
    ...regularDegrees(),
    ...specialDegrees(),
  });

  static HashSet<Degree> regularDegrees() {
    HashSet<Degree> regularDegrees = HashSet.of({});

    //regular degrees
    for (var branch in DegreeDiscipline.humanities.branches) {
      regularDegrees.add(Degree(
        id: DatabaseConstants.dummyId,
        discipline: DegreeDiscipline.humanities.name,
        branch: branch,
        isSpecialDegree: false,
      ));
    }

    for (var branch in DegreeDiscipline.naturalScience.branches) {
      regularDegrees.add(Degree(
        id: DatabaseConstants.dummyId,
        discipline: DegreeDiscipline.naturalScience.name,
        branch: branch,
        isSpecialDegree: false,
      ));
    }

    for (var branch in DegreeDiscipline.business.branches) {
      regularDegrees.add(Degree(
        id: DatabaseConstants.dummyId,
        discipline: DegreeDiscipline.business.name,
        branch: branch,
        isSpecialDegree: false,
      ));
    }

    for (var branch in DegreeDiscipline.socialScience.branches) {
      regularDegrees.add(Degree(
        id: DatabaseConstants.dummyId,
        discipline: DegreeDiscipline.socialScience.name,
        branch: branch,
        isSpecialDegree: false,
      ));
    }

    for (var branch in DegreeDiscipline.engineering.branches) {
      regularDegrees.add(Degree(
        id: DatabaseConstants.dummyId,
        discipline: DegreeDiscipline.engineering.name,
        branch: branch,
        isSpecialDegree: false,
      ));
    }

    return regularDegrees;
  }

  static HashSet<Degree> specialDegrees() {
    HashSet<Degree> specialDegrees = HashSet.of({});

    //Special degrees
    for (var branch in DegreeDiscipline.medical.branches) {
      specialDegrees.add(Degree(
        id: DatabaseConstants.dummyId,
        discipline: DegreeDiscipline.medical.name,
        branch: branch,
        isSpecialDegree: true,
      ));
    }

    for (var branch in DegreeDiscipline.nursing.branches) {
      specialDegrees.add(Degree(
        id: DatabaseConstants.dummyId,
        discipline: DegreeDiscipline.nursing.name,
        branch: branch,
        isSpecialDegree: true,
      ));
    }

    for (var branch in DegreeDiscipline.pharmacy.branches) {
      specialDegrees.add(Degree(
        id: DatabaseConstants.dummyId,
        discipline: DegreeDiscipline.pharmacy.name,
        branch: branch,
        isSpecialDegree: true,
      ));
    }

    for (var branch in DegreeDiscipline.law.branches) {
      specialDegrees.add(Degree(
        id: DatabaseConstants.dummyId,
        discipline: DegreeDiscipline.law.name,
        branch: branch,
        isSpecialDegree: true,
      ));
    }

    for (var branch in DegreeDiscipline.education.branches) {
      specialDegrees.add(Degree(
        id: DatabaseConstants.dummyId,
        discipline: DegreeDiscipline.education.name,
        branch: branch,
        isSpecialDegree: true,
      ));
    }

    return specialDegrees;
  }
}
