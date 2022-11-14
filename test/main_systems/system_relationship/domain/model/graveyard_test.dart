import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/graveyard.dart';

void main() {
  late Graveyard sut;

  setUp(() {
    sut = const Graveyard(
        mainPersonID: 1,
        deadPersonID: 4,
        relationshipType: "Father",
        dayOfDeath: 65,
        fullName: "John Doe",
        ageAtDeath: "Elder");
  });

  group(
    "Graveyard: ",
    () {
      test("toMap returns map equivalent of object", () {
        final Map<String, Object> correctMap = {
          "mainPersonID": 1,
          'deadPersonID': 4,
          "relationshipType": "Father",
          "dayOfDeath": 65,
          "fullName": "John Doe",
          "ageAtDeath": "Elder"
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns graveyard object equivalent of map ", () {
        final Map<String, Object> map = {
          "mainPersonID": 1,
          'deadPersonID': 4,
          "relationshipType": "Father",
          "dayOfDeath": 65,
          "fullName": "John Doe",
          "ageAtDeath": "Elder"
        };

        final result = Graveyard.fromMap(graveyardMap: map);

        expect(result, sut);
      });

      test("copyWith creates new object with correct values", () {
        const correctGraveyard = Graveyard(
            mainPersonID: 1,
            deadPersonID: 4,
            relationshipType: "Father",
            dayOfDeath: 98,
            fullName: "John Doe",
            ageAtDeath: "Elder");

        final result = sut.copyWith(
          dayOfDeath: 98,
        );
        expect(result, correctGraveyard);
      });
    },
  );
}
