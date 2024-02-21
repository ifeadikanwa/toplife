import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class PersonalityDao {
  Future<Personality> createOrUpdatePersonality(
      Personality personality);
  Future<Personality?> getPersonality(int personID);
  Future<void> deletePersonality(int personID);
}
