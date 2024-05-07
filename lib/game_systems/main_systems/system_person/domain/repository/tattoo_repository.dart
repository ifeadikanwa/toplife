import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class TattooRepository {
  Future<Tattoo> createTattoo(Tattoo tattoo);
  Future<Tattoo?> getTattoo(int tattooID);
  Future<void> updateTattoo(Tattoo tattoo);
  Future<void> deleteTattoo(int tattooID);
  Future<List<Tattoo>> getAllTattoos(int personID);
}
