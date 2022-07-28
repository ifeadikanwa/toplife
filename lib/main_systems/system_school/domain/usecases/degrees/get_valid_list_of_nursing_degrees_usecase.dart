import 'package:toplife/main_systems/system_school/degree_info/degree_discipline.dart';
import 'package:toplife/main_systems/system_school/degree_info/game_degrees.dart';
import 'package:toplife/main_systems/system_school/domain/model/degree.dart';

class GetValidListOfNursingDegreesUsecase {

  Future<List<Degree>> execute() async {
    //show all possible nursing degrees.

    List<Degree> nursingDegrees = GameDegrees.specialDegrees()
        .where((degree) => degree.discipline == DegreeDiscipline.nursing.name)
        .toList();


    return nursingDegrees;
  }
}
