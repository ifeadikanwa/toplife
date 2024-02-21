import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_constants.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_relationship_label_from_enum.dart';

void main() {
  group("Get platonic relationship label from enum:", () {
    const String defaultSeparator =
        RelationshipConstants.relationshipLabelSeparator;
    test(
        "given one type and no previous relationship, we get the correct string",
        () {
      const Gender chosenGender = Gender.Male;

      const PlatonicRelationshipType? prevRelationship = null;

      final List<PlatonicRelationshipType> chosenType = [
        PlatonicRelationshipType.adoptiveSibling,
      ];

      final String correctLabel = chosenType[0].maleEquivalent.toLowerCase();

      expect(
        getPlatonicRelationshipLabelFromEnum(
          platonicRelationshipTypeList: chosenType,
          genderString: chosenGender.name,
          previousFamilialRelationship: prevRelationship,
        ),
        correctLabel,
      );
    });

    test(
        "given multiple types and no previous relationship, we get the correct string",
        () {
      const Gender chosenGender = Gender.Female;

      const PlatonicRelationshipType? prevRelationship = null;

      final List<PlatonicRelationshipType> chosenType = [
        PlatonicRelationshipType.birthChild,
        PlatonicRelationshipType.cousin,
        PlatonicRelationshipType.pibling,
      ];

      final String correctLabel =
          "${chosenType[0].femaleEquivalent.toLowerCase()}$defaultSeparator${chosenType[1].femaleEquivalent.toLowerCase()}$defaultSeparator${chosenType[2].femaleEquivalent.toLowerCase()}";

      expect(
        getPlatonicRelationshipLabelFromEnum(
          platonicRelationshipTypeList: chosenType,
          genderString: chosenGender.name,
          previousFamilialRelationship: prevRelationship,
        ),
        correctLabel,
      );
    });

    test(
        "given no types and no previous relationship, we get the correct string",
        () {
      const Gender chosenGender = Gender.Female;

      const PlatonicRelationshipType? prevRelationship = null;

      final List<PlatonicRelationshipType> chosenType = [];

      const String correctLabel = "";

      expect(
        getPlatonicRelationshipLabelFromEnum(
          platonicRelationshipTypeList: chosenType,
          genderString: chosenGender.name,
          previousFamilialRelationship: prevRelationship,
        ),
        correctLabel,
      );
    });

    test(
        "given one type and a previous relationship, we get the correct string",
        () {
      const Gender chosenGender = Gender.Female;

      const PlatonicRelationshipType prevRelationship =
          PlatonicRelationshipType.grandChild;

      final List<PlatonicRelationshipType> chosenType = [
        PlatonicRelationshipType.adoptiveSibling,
      ];

      final String correctLabel =
          "${chosenType[0].femaleEquivalent.toLowerCase()}, formerly ${prevRelationship.femaleEquivalent.toLowerCase()}";

      expect(
        getPlatonicRelationshipLabelFromEnum(
          platonicRelationshipTypeList: chosenType,
          genderString: chosenGender.name,
          previousFamilialRelationship: prevRelationship,
        ),
        correctLabel,
      );
    });

    test(
        "given multiple types and a previous relationship, we get the correct string",
        () {
      const Gender chosenGender = Gender.Male;

      const PlatonicRelationshipType prevRelationship =
          PlatonicRelationshipType.friend;

      final List<PlatonicRelationshipType> chosenType = [
        PlatonicRelationshipType.birthChild,
        PlatonicRelationshipType.cousin,
        PlatonicRelationshipType.pibling,
      ];

      final String correctLabel =
          "${chosenType[0].maleEquivalent.toLowerCase()}$defaultSeparator${chosenType[1].maleEquivalent.toLowerCase()}$defaultSeparator${chosenType[2].maleEquivalent.toLowerCase()}, formerly ${prevRelationship.maleEquivalent.toLowerCase()}";

      expect(
        getPlatonicRelationshipLabelFromEnum(
          platonicRelationshipTypeList: chosenType,
          genderString: chosenGender.name,
          previousFamilialRelationship: prevRelationship,
        ),
        correctLabel,
      );
    });

    test(
        "given no types and a previous relationship, we get the correct string",
        () {
      const Gender chosenGender = Gender.Female;

      const PlatonicRelationshipType prevRelationship =
          PlatonicRelationshipType.distantRelative;

      final List<PlatonicRelationshipType> chosenType = [];

      final String correctLabel =
          ", formerly ${prevRelationship.femaleEquivalent.toLowerCase()}";

      expect(
        getPlatonicRelationshipLabelFromEnum(
          platonicRelationshipTypeList: chosenType,
          genderString: chosenGender.name,
          previousFamilialRelationship: prevRelationship,
        ),
        correctLabel,
      );
    });

    test(
        "given multiple types and a previous relationship WITH request for Not lowercase and spaced relationship separator, we get the correct string",
        () {
      const Gender chosenGender = Gender.Male;

      const PlatonicRelationshipType prevRelationship =
          PlatonicRelationshipType.friend;

      final List<PlatonicRelationshipType> chosenType = [
        PlatonicRelationshipType.birthChild,
        PlatonicRelationshipType.cousin,
        PlatonicRelationshipType.pibling,
      ];

      final String correctLabel =
          "${chosenType[0].maleEquivalent} / ${chosenType[1].maleEquivalent} / ${chosenType[2].maleEquivalent}, formerly ${prevRelationship.maleEquivalent}";

      expect(
        getPlatonicRelationshipLabelFromEnum(
          platonicRelationshipTypeList: chosenType,
          genderString: chosenGender.name,
          previousFamilialRelationship: prevRelationship,
          toLowerCase: false,
          spacedRelationshipLabelSeparator: true,
        ),
        correctLabel,
      );
    });
  });
}
