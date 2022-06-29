import 'package:toplife/main_systems/system_school/degree_constants/degree_disciplines.dart';
import 'package:toplife/main_systems/system_school/domain/model/degree.dart';

class GetConstantListOfDegreesUsecase {
  const GetConstantListOfDegreesUsecase();

  Set<Degree> execute() {
    Set<Degree> degrees = {};

    //regular degrees
    for (var branch in DegreeDisciplines.humanities.branches) {
      degrees.add(Degree(
        discipline: DegreeDisciplines.humanities.name,
        branch: branch,
        isSpecialDegree: false,
      ));
    }

    for (var branch in DegreeDisciplines.naturalScience.branches) {
      degrees.add(Degree(
        discipline: DegreeDisciplines.naturalScience.name,
        branch: branch,
        isSpecialDegree: false,
      ));
    }

    for (var branch in DegreeDisciplines.business.branches) {
      degrees.add(Degree(
        discipline: DegreeDisciplines.business.name,
        branch: branch,
        isSpecialDegree: false,
      ));
    }

    for (var branch in DegreeDisciplines.socialScience.branches) {
      degrees.add(Degree(
        discipline: DegreeDisciplines.socialScience.name,
        branch: branch,
        isSpecialDegree: false,
      ));
    }

    for (var branch in DegreeDisciplines.engineering.branches) {
      degrees.add(Degree(
        discipline: DegreeDisciplines.engineering.name,
        branch: branch,
        isSpecialDegree: false,
      ));
    }

    //Special degrees
    for (var branch in DegreeDisciplines.medical.branches) {
      degrees.add(Degree(
        discipline: DegreeDisciplines.medical.name,
        branch: branch,
        isSpecialDegree: true,
      ));
    }

    for (var branch in DegreeDisciplines.nursing.branches) {
      degrees.add(Degree(
        discipline: DegreeDisciplines.nursing.name,
        branch: branch,
        isSpecialDegree: true,
      ));
    }

    for (var branch in DegreeDisciplines.pharmacy.branches) {
      degrees.add(Degree(
        discipline: DegreeDisciplines.pharmacy.name,
        branch: branch,
        isSpecialDegree: true,
      ));
    }

    for (var branch in DegreeDisciplines.law.branches) {
      degrees.add(Degree(
        discipline: DegreeDisciplines.law.name,
        branch: branch,
        isSpecialDegree: true,
      ));
    }

    for (var branch in DegreeDisciplines.education.branches) {
      degrees.add(Degree(
        discipline: DegreeDisciplines.education.name,
        branch: branch,
        isSpecialDegree: true,
      ));
    }

    return degrees;
  }
}
