import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/degree_info/degree_discipline.dart';
import 'package:toplife/main_systems/system_school/degree_info/game_degrees.dart';

class GetValidListOfEducationDegreesUsecase {

  Future<List<Degree>> execute() async {
    //show all possible education degrees.

    List<Degree> educationDegrees = GameDegrees.specialDegrees()
        .where((degree) => degree.discipline == DegreeDiscipline.education.name)
        .toList();


    return educationDegrees;
  }
}
