import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/degree_table_manager/degree_disciplines.dart';
import 'package:toplife/main_systems/system_school/domain/model/degree.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/get_constant_list_of_degrees_usecase.dart';

void main() {
  late GetConstantListOfDegreesUsecase getConstantListOfDegreesUsecase;

  setUp(() {
    getConstantListOfDegreesUsecase = const GetConstantListOfDegreesUsecase();
  });
  group("GetConstantListOfDegreesUsecase:", () {
    test("Every discipline is added to the degree list", () {
      final Set<Degree> degrees = getConstantListOfDegreesUsecase.execute();

      //Check that every discipline is represented in the degree list.
      for (var discipline in DegreeDisciplines.values) {
        final result =
            degrees.where((degree) => degree.discipline == discipline.name);
        expect(result.length, greaterThanOrEqualTo(1), reason:"Cause: ${discipline.name}");
      }
    });
  });
}
