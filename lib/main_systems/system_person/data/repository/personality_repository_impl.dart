import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/dao/personality_dao.dart';
import 'package:toplife/main_systems/system_person/domain/repository/personality_repository.dart';

class PersonalityRepositoryImpl implements PersonalityRepository {
  final PersonalityDao _personalityDao;

  const PersonalityRepositoryImpl({
    required PersonalityDao personalityDao,
  }) : _personalityDao = personalityDao;

  @override
  Future<Personality> createOrUpdatePersonality(Personality personality) async {
    return _personalityDao.createOrUpdatePersonality(personality);
  }

  @override
  Future<void> deletePersonality(int personID) async {
    return _personalityDao.deletePersonality(personID);
  }

  @override
  Future<Personality?> getPersonality(int personID) async {
    return _personalityDao.getPersonality(personID);
  }
}
