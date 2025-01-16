import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class AppearanceDao {
  Future<Appearance> createOrUpdateAppearance(
      Appearance appearance);
  Future<Appearance?> getAppearance(int personID);
  Future<void> deleteAppearance(int personID);
}
