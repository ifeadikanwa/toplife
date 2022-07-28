import 'package:toplife/main_systems/system_school/degree_info/degree_discipline.dart';
import 'package:toplife/main_systems/system_school/degree_info/game_degrees.dart';
import 'package:toplife/main_systems/system_school/domain/model/degree.dart';

class GetValidListOfMedicalDegreesUsecase {

  Future<List<Degree>> execute() async {
    //show all possible medical degrees.

    List<Degree> medicalDegrees = GameDegrees.specialDegrees()
        .where((degree) => degree.discipline == DegreeDiscipline.medical.name)
        .toList();


    return medicalDegrees;
  }
}
