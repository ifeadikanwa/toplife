import 'package:toplife/main_systems/system_school/domain/dao/degree_dao.dart';
import 'package:toplife/main_systems/system_school/domain/model/degree.dart';
import 'package:toplife/main_systems/system_school/domain/repository/degree_repository.dart';

class DegreeRepositoryImpl implements DegreeRepository {
  final DegreeDao _degreeDao;

  const DegreeRepositoryImpl({required DegreeDao degreeDao})
      : _degreeDao = degreeDao;

  @override
  Future<Degree> createDegree(Degree degree) async {
    return _degreeDao.createDegree(degree);
  }

  @override
  Future<void> deleteDegreeTable() async {
    return _degreeDao.deleteDegreeTable();
  }

  @override
  Future<List<Degree>> getAllDegrees() async {
    return _degreeDao.getAllDegrees();
  }

  @override
  Future<Degree?> getDegree(int degreeID) async {
    return _degreeDao.getDegree(degreeID);
  }

  @override
  Future<void> updateDegree(Degree degree) async {
    return _degreeDao.updateDegree(degree);
  }
}
