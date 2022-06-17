import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/generate_a_person_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/generate_list_of_person_usecase.dart';

void main() {
  group("Getting Random Values:", () {
    test("get random state", () {
      // final state = Canada().randomState;
      // print("State: $state");
    });

    test("get random female name", () {
      // final name = Canada().randomFemaleFirstName;
      // print("Name: $name");
    });

    test("generate people", () {
      final people = GenerateListOfPersonUsecase(
              generateAPersonUsecase: GenerateAPersonUsecase())
          .execute(
        numberOfPerson: 1,
        currentGameID: 23,
        currentCountry: "Canada",
        currentState: "Ontario",
      );

      print("People: $people");

    });
  });
}
