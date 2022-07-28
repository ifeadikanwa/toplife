import 'package:toplife/main_systems/system_school/degree_info/degree_discipline.dart';
import 'package:toplife/main_systems/system_school/degree_info/game_degrees.dart';
import 'package:toplife/main_systems/system_school/domain/model/degree.dart';

class GetValidListOfEducationDegreesUsecase {

  Future<List<Degree>> execute() async {
    //show all possible education degrees.

    List<Degree> educationDegrees = GameDegrees.specialDegrees()
        .where((degree) => degree.discipline == DegreeDiscipline.education.name)
        .toList();


    return educationDegrees;
  }
}
