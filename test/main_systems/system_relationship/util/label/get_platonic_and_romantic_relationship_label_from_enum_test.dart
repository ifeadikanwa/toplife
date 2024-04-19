import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/label/get_platonic_and_romantic_relationship_label_from_enum.dart';

void main() {
  group('get platonic and romantic relationship label:', () {
    test(
        'given a familial, romantic and previous familial relationship type we get the correct result',
        () {
      final result = getPlatonicAndRomanticRelationshipLabelFromEnum(
        genderString: Gender.Male.name,
        platonicRelationshipTypesEnum: [PlatonicRelationshipType.stepSibling],
        romanticRelationshipTypeEnum: RomanticRelationshipType.dating,
        previousFamilialRelationshipEnum: PlatonicRelationshipType.childInLaw,
        isCoParent: false,
        activeRomance: false,
      );

      expect(
        result,
        "stepbrother/ex-boyfriend, formerly son-in-law",
      );
    });

    test(
        'given a friend, romantic and previous familial relationship type we get the correct result',
        () {
      final result = getPlatonicAndRomanticRelationshipLabelFromEnum(
        genderString: Gender.Male.name,
        platonicRelationshipTypesEnum: [PlatonicRelationshipType.friend],
        romanticRelationshipTypeEnum: RomanticRelationshipType.dating,
        previousFamilialRelationshipEnum: PlatonicRelationshipType.childInLaw,
        isCoParent: false,
        activeRomance: false,
      );

      expect(
        result,
        "ex-boyfriend, formerly son-in-law",
      );
    });

    test(
        'given a friend and previous familial relationship type we get the correct result',
        () {
      final result = getPlatonicAndRomanticRelationshipLabelFromEnum(
        genderString: Gender.Male.name,
        platonicRelationshipTypesEnum: [PlatonicRelationshipType.friend],
        romanticRelationshipTypeEnum: RomanticRelationshipType.none,
        previousFamilialRelationshipEnum: PlatonicRelationshipType.childInLaw,
        isCoParent: false,
        activeRomance: false,
      );

      expect(
        result,
        "friend, formerly son-in-law",
      );
    });

    test(
        'given a familial and previous familial relationship type we get the correct result',
        () {
      final result = getPlatonicAndRomanticRelationshipLabelFromEnum(
        genderString: Gender.Male.name,
        platonicRelationshipTypesEnum: [PlatonicRelationshipType.stepCousin],
        romanticRelationshipTypeEnum: RomanticRelationshipType.none,
        previousFamilialRelationshipEnum: PlatonicRelationshipType.childInLaw,
        isCoParent: false,
        activeRomance: false,
      );

      expect(
        result,
        "step-cousin, formerly son-in-law",
      );
    });

    test('given a familial and romantic type we get the correct result', () {
      final result = getPlatonicAndRomanticRelationshipLabelFromEnum(
        genderString: Gender.Male.name,
        platonicRelationshipTypesEnum: [PlatonicRelationshipType.siblingInLaw],
        romanticRelationshipTypeEnum: RomanticRelationshipType.dating,
        previousFamilialRelationshipEnum: null,
        isCoParent: false,
        activeRomance: true,
      );

      expect(
        result,
        "brother-in-law/boyfriend",
      );
    });

    test('given a friend and romantic type we get the correct result', () {
      final result = getPlatonicAndRomanticRelationshipLabelFromEnum(
        genderString: Gender.Male.name,
        platonicRelationshipTypesEnum: [PlatonicRelationshipType.friend],
        romanticRelationshipTypeEnum: RomanticRelationshipType.married,
        previousFamilialRelationshipEnum: null,
        isCoParent: false,
        activeRomance: true,
      );

      expect(
        result,
        "husband",
      );
    });

    test('given a friend type we get the correct result', () {
      final result = getPlatonicAndRomanticRelationshipLabelFromEnum(
        genderString: Gender.Male.name,
        platonicRelationshipTypesEnum: [PlatonicRelationshipType.friend],
        romanticRelationshipTypeEnum: RomanticRelationshipType.none,
        previousFamilialRelationshipEnum: null,
        isCoParent: false,
        activeRomance: false,
      );

      expect(
        result,
        "friend",
      );
    });

    test('given a familial type we get the correct result', () {
      final result = getPlatonicAndRomanticRelationshipLabelFromEnum(
        genderString: Gender.Male.name,
        platonicRelationshipTypesEnum: [PlatonicRelationshipType.grandChild],
        romanticRelationshipTypeEnum: RomanticRelationshipType.none,
        previousFamilialRelationshipEnum: null,
        isCoParent: false,
        activeRomance: false,
      );

      expect(
        result,
        "grandson",
      );
    });

    test(
        'given a familial, romantic and previous familial relationship type WITH a request for NOT lowercase and spaced relationship label we get the correct result',
        () {
      final result = getPlatonicAndRomanticRelationshipLabelFromEnum(
        genderString: Gender.Male.name,
        platonicRelationshipTypesEnum: [PlatonicRelationshipType.stepSibling],
        romanticRelationshipTypeEnum: RomanticRelationshipType.dating,
        previousFamilialRelationshipEnum: PlatonicRelationshipType.childInLaw,
        isCoParent: false,
        activeRomance: false,
        toLowerCase: false,
        spacedRelationshipLabelSeparator: true,
      );

      expect(
        result,
        "Stepbrother / Ex-boyfriend, formerly Son-in-law",
      );
    });
  });
}
