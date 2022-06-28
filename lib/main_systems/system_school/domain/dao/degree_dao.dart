import 'package:toplife/main_systems/system_school/domain/model/degree.dart';

abstract class DegreeDao {
  Future<Degree> createDegree(Degree degree);
  Future<void> updateDegree(Degree degree);
  Future<List<Degree>> getAllDegrees();
  Future<Degree?> getDegree(int degreeID);
  Future<void> deleteDegreeTable();
}
