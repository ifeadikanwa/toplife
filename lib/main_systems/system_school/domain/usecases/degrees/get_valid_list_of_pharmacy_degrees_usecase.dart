import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/degree_info/degree_discipline.dart';
import 'package:toplife/main_systems/system_school/degree_info/game_degrees.dart';

class GetValidListOfPharmacyDegreesUsecase {

  Future<List<Degree>> execute() async {
    //show all possible pharmacy degrees.

    List<Degree> pharmacyDegrees = GameDegrees.specialDegrees()
        .where((degree) => degree.discipline == DegreeDiscipline.pharmacy.name)
        .toList();


    return pharmacyDegrees;
  }
}
