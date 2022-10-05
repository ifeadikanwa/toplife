import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/partner_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/partner.dart';

void main() {
  late Partner sut;

  setUp(() {
    sut = Partner(
      mainPersonID: 1,
      partnerID: 5,
      partnerRelationshipType: PartnerRelationshipType.dating.maleEquivalent,
      isActive: true,
      jointMoney: 3500,
      startDay: 34,
      isCoParent: true,
      metAt: "Online",
      relationship: 90,
    );
  });

  group(
    "Partner:",
    () {
      test(
        "new partner has a default value of 0 for jointMoney",
        () {
          const newPartner = Partner(
            mainPersonID: 1,
            partnerID: 1,
            partnerRelationshipType: "partnerRelationshipType",
            isActive: true,
            startDay: 2,
            isCoParent: false,
            metAt: "metAt",
            relationship: 60,
          );

          expect(newPartner.jointMoney, 0);
        },
      );
      test("toMap returns map equivalent of object", () {
        final Map<String, Object?> correctMap = {
          "mainPersonID": 1,
          "partnerID": 5,
          "partnerRelationshipType":
              PartnerRelationshipType.dating.maleEquivalent,
          "isActive": 1,
          "jointMoney": 3500,
          "startDay": 34,
          "endDay": null,
          "isCoParent": 1,
          "metAt": "Online",
          "relationship": 90,
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns partner object equivalent of map ", () {
        final Map<String, Object?> map = {
          "mainPersonID": 1,
          "partnerID": 5,
          "partnerRelationshipType":
              PartnerRelationshipType.dating.maleEquivalent,
          "isActive": 1,
          "jointMoney": 3500,
          "startDay": 34,
          "endDay": null,
          "isCoParent": 1,
          "metAt": "Online",
          "relationship": 90,
        };

        final result = Partner.fromMap(partnerMap: map);

        expect(result, sut);
      });

      test("copyWith creates new object with correct values", () {
        final correctPartner = Partner(
          mainPersonID: 1,
          partnerID: 5,
          partnerRelationshipType:
              PartnerRelationshipType.coparent.maleEquivalent,
          isActive: true,
          jointMoney: 1200,
          endDay: 90,
          startDay: 34,
          isCoParent: true,
          metAt: "Online",
          relationship: 90,
        );

        final result = sut.copyWith(
          endDay: 90,
          partnerRelationshipType:
              PartnerRelationshipType.coparent.maleEquivalent,
          jointMoney: 1200,
        );
        expect(result, correctPartner);
      });
    },
  );
}
