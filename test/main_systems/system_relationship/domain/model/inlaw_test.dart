import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/inlaw.dart';

void main() {
  late InLaw sut;

  setUp(() {
    sut = const InLaw(
      mainPersonID: 1,
      inLawID: 3,
      likesMainPerson: true,
      inLawRelationshipType: "parent",
      relationship: 88,
    );
  });

  group(
    "InLaw: ",
    () {
      test("toMap returns map equivalent of object", () {
        final Map<String, Object> correctMap = {
          "mainPersonID": 1,
          "inLawID": 3,
          "likesMainPerson": 1,
          "inLawRelationshipType": "parent",
          "haveRomanticRelationship": 0,
          "relationship": 88,
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns inlaw object equivalent of map ", () {
        final Map<String, Object> map = {
          "mainPersonID": 1,
          "inLawID": 3,
          "likesMainPerson": 1,
          "inLawRelationshipType": "parent",
           "haveRomanticRelationship": 0,
          "relationship": 88,
        };

        final result = InLaw.fromMap(inLawMap: map);

        expect(result, sut);
      });

      test("copyWith creates new object with correct values", () {
        const correctInLaw = InLaw(
          mainPersonID: 1,
          inLawID: 3,
          likesMainPerson: false,
          inLawRelationshipType: "parent",
          relationship: 88,
        );

        final result = sut.copyWith(
          likesMainPerson: false,
        );
        expect(result, correctInLaw);
      });

      group("Constants: ", () {
        test("male equivalent of parent in law is father", () {
          expect(InLaw.parentMaleEquivalent, "Father-in-law");
        });

        test("female equivalent of parent in law is mother", () {
          expect(InLaw.parentFemaleEquivalent, "Mother-in-law");
        });

         test("male equivalent of child in law is son", () {
          expect(InLaw.childMaleEquivalent, "Son-in-law");
        });

        test("female equivalent of child in law is daughter", () {
          expect(InLaw.childFemaleEquivalent, "Daughter-in-law");
        });

        test("male equivalent of sibling in law is brother", () {
          expect(InLaw.siblingMaleEquivalent, "Brother-in-law");
        });

        test("female equivalent of sibling in law is sister", () {
          expect(InLaw.siblingFemaleEquivalent, "Sister-in-law");
        });
      });
    },
  );
}
