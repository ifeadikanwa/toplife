import 'package:toplife/main_systems/system_school/degree_info/degree_discipline.dart';
import 'package:toplife/main_systems/system_school/degree_info/game_degrees.dart';
import 'package:toplife/main_systems/system_school/domain/model/degree.dart';

class GetValidListOfLawDegreesUsecase {

  Future<List<Degree>> execute() async {
    //show all possible law degrees.

    List<Degree> lawDegrees = GameDegrees.specialDegrees()
        .where((degree) => degree.discipline == DegreeDiscipline.law.name)
        .toList();


    return lawDegrees;
  }
}
