import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/domain/model/stance.dart';

void main() {
  late Stance sut;

  setUp(() {
    sut = const Stance(
      id: 1,
      personID: 3,
      openToAdoption: false,
      openToAbortion: true,
      openToSurrogacy: false,
      openToAlternativeFertilityMethods: true,
      openToSigningPrenup: true,
      wantsPartnerToSignPrenup: false,
      openToCrimes: true,
      openToStayAtHomeParenting: false,
    );
  });

  group(
    "Stance:",
    () {
      test("toMap returns map equivalent of object", () {
        final Map<String, Object?> correctMap = {
          "_id": 1,
          "personID": 3,
          "openToAdoption": 0,
          "openToAbortion": 1,
          "openToSurrogacy": 0,
          "openToAlternativeFertilityMethods": 1,
          "openToSigningPrenup": 1,
          "wantsPartnerToSignPrenup": 0,
          "openToCrimes": 1,
          "openToStayAtHomeParenting": 0,
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns stance object equivalent of map ", () {
        final Map<String, Object?> map = {
          "_id": 1,
          "personID": 3,
          "openToAdoption": 0,
          "openToAbortion": 1,
          "openToSurrogacy": 0,
          "openToAlternativeFertilityMethods": 1,
          "openToSigningPrenup": 1,
          "wantsPartnerToSignPrenup": 0,
          "openToCrimes": 1,
          "openToStayAtHomeParenting": 0,
        };

        final result = Stance.fromMap(stanceMap: map);

        expect(result, sut);
      });

      test("copyWith creates new object with correct values", () {
        const correctStats = Stance(
          id: 1,
          personID: 3,
          openToAdoption: true,
          openToAbortion: false,
          openToSurrogacy: false,
          openToAlternativeFertilityMethods: true,
          openToSigningPrenup: true,
          wantsPartnerToSignPrenup: false,
          openToCrimes: true,
          openToStayAtHomeParenting: false,
        );

        final result =
            sut.copyWith(openToAbortion: false, openToAdoption: true);

        expect(result, correctStats);
      });

      test("getValidStanceValue returns true or false only", () {
        final bool result = Stance.getValidStanceValue();
        assert(result == true || result == false);
      });

      group("Constants:", () {
        test("id column should be defined as _id", () {
          expect(Stance.idColumn, "_id");
        });
      });
    },
  );
}
