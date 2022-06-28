import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/domain/model/degree.dart';

void main() {
  late Degree sut;

  setUp(() {
    sut = const Degree(
      id: 1,
      discipline: "Social Science",
      branch: "Law",
      isSpecialDegree: false,
    );
  });

  group(
    "Degree:",
    () {
      test("toMap returns map equivalent of object", () {
        final Map<String, Object?> correctMap = {
          "_id": 1,
          "discipline": "Social Science",
          "branch": "Law",
          "isSpecialDegree": 0,
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns game object equivalent of map ", () {
        final Map<String, Object?> map = {
          "_id": 1,
          "discipline": "Social Science",
          "branch": "Law",
          "isSpecialDegree": 0,
        };

        final result = Degree.fromMap(degreeMap: map);

        expect(result, sut);
      });

      group("Constants", () {
        test("id column should be defined as _id", () {
          expect(Degree.idColumn, "_id");
        });
      });
    },
  );
}
