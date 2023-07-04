import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class AppearanceRepository {
  Future<Appearance> createOrUpdateAppearance(Appearance personality);
  Future<Appearance?> getAppearance(int personID);
  Future<void> deleteAppearance(int personID);
}
