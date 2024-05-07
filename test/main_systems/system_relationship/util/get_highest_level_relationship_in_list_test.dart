import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/get_highest_level_relationship_in_list.dart';

void main() {
  group('Get highest level relationship in list:', () {
    //create a list of all types that we will run our tests on
    List<PlatonicRelationshipType> testPlatonicRelationshipTypes = [
      ...PlatonicRelationshipType.values
    ];

    test('given an empty list we get null', () {
      expect(
        getHighestLevelRelationshipInList(
          platonicRelationshipTypeList: [],
        ),
        null,
      );
    });

    test('given a list with one element, we get the given element', () {
      expect(
        getHighestLevelRelationshipInList(
          platonicRelationshipTypeList: [PlatonicRelationshipType.cousin],
        ),
        PlatonicRelationshipType.cousin,
      );
    });
    

    //Levels:
    //
    //NOTE: I am doing it this way because I want to make sure that all relationship types are accounted for.
    //We are removing all the types we have considered so that at the end we can check if the test list is empty and catch any unaccounted relationship.
    //This means if I add a new type to platonic relationships, this test should fail so that I know to account for it in one of the levels

    //1st level -> birth, adoptive and step parent
    test(
        'given a list with birth, adoptive or step parent, we get them as the highest level relationship',
        () {
      //
      final highestLevelRelationships = [
        PlatonicRelationshipType.birthParent,
        PlatonicRelationshipType.stepParent,
        PlatonicRelationshipType.adoptiveParent,
      ];

      //remove them from the test list
      for (var type in highestLevelRelationships) {
        testPlatonicRelationshipTypes.remove(type);
      }

      //check that if any of them are present we get them back
      for (var chosenRelationship in highestLevelRelationships) {
        //get result when the chosen relationship is appended to the list
        final PlatonicRelationshipType? result =
            getHighestLevelRelationshipInList(
          platonicRelationshipTypeList: [
            ...testPlatonicRelationshipTypes,
            chosenRelationship,
          ],
        );

        expect(
          result,
          chosenRelationship,
          reason: "Cause: $chosenRelationship",
        );
      }
    });

    //2nd level -> birth, adoptive and step child
    test(
        'given a list without the previous levels and with birth, adoptive or step child, we get them as the highest level relationship',
        () {
      //
      final highestLevelRelationships = [
        PlatonicRelationshipType.birthChild,
        PlatonicRelationshipType.stepChild,
        PlatonicRelationshipType.adoptiveChild,
      ];

      //remove them from the test list
      for (var type in highestLevelRelationships) {
        testPlatonicRelationshipTypes.remove(type);
      }

      //check that if any of them are present we get them back
      for (var chosenRelationship in highestLevelRelationships) {
        //get result when the chosen relationship is appended to the list
        final PlatonicRelationshipType? result =
            getHighestLevelRelationshipInList(
          platonicRelationshipTypeList: [
            ...testPlatonicRelationshipTypes,
            chosenRelationship,
          ],
        );

        expect(
          result,
          chosenRelationship,
          reason: "Cause: $chosenRelationship",
        );
      }
    });

    //3rd level -> full, adoptive, half and step sibling
    test(
        'given a list without the previous levels and with full, adoptive, half or step sibling, we get them as the highest level relationship',
        () {
      //
      final highestLevelRelationships = [
        PlatonicRelationshipType.fullSibling,
        PlatonicRelationshipType.adoptiveSibling,
        PlatonicRelationshipType.stepSibling,
        PlatonicRelationshipType.halfSibling,
      ];

      //remove them from the test list
      for (var type in highestLevelRelationships) {
        testPlatonicRelationshipTypes.remove(type);
      }

      //check that if any of them are present we get them back
      for (var chosenRelationship in highestLevelRelationships) {
        //get result when the chosen relationship is appended to the list
        final PlatonicRelationshipType? result =
            getHighestLevelRelationshipInList(
          platonicRelationshipTypeList: [
            ...testPlatonicRelationshipTypes,
            chosenRelationship,
          ],
        );

        expect(
          result,
          chosenRelationship,
          reason: "Cause: $chosenRelationship",
        );
      }
    });

    //4th level -> grandparent, step grandparent, greatgrandparent, step greatgrandparent, grandchild, step grandchild, greatgrandchild, step greatgrandchild,
    test(
        'given a list without the previous levels and with grandparent, step grandparent, greatgrandparent, step greatgrandparent, grandchild, step grandchild, greatgrandchild, step greatgrandchild, we get them as the highest level relationship',
        () {
      //
      final highestLevelRelationships = [
        PlatonicRelationshipType.grandParent,
        PlatonicRelationshipType.stepGrandParent,
        PlatonicRelationshipType.grandChild,
        PlatonicRelationshipType.stepGrandChild,
        PlatonicRelationshipType.greatGrandParent,
        PlatonicRelationshipType.stepGreatGrandParent,
        PlatonicRelationshipType.greatGrandChild,
        PlatonicRelationshipType.stepGreatGrandChild,
      ];

      //remove them from the test list
      for (var type in highestLevelRelationships) {
        testPlatonicRelationshipTypes.remove(type);
      }

      //check that if any of them are present we get them back
      for (var chosenRelationship in highestLevelRelationships) {
        //get result when the chosen relationship is appended to the list
        final PlatonicRelationshipType? result =
            getHighestLevelRelationshipInList(
          platonicRelationshipTypeList: [
            ...testPlatonicRelationshipTypes,
            chosenRelationship,
          ],
        );

        expect(
          result,
          chosenRelationship,
          reason: "Cause: $chosenRelationship",
        );
      }
    });

    //5th level -> nibling, step nibling, grandnibling, step grandnibling, greatgrandnibling, step greatgrandnibling,
    test(
        'given a list without the previous levels and with nibling, step nibling, grandnibling, step grandnibling, greatgrandnibling, step greatgrandnibling, we get them as the highest level relationship',
        () {
      //
      final highestLevelRelationships = [
        PlatonicRelationshipType.nibling,
        PlatonicRelationshipType.stepNibling,
        PlatonicRelationshipType.grandNibling,
        PlatonicRelationshipType.stepGrandNibling,
        PlatonicRelationshipType.greatGrandNibling,
        PlatonicRelationshipType.stepGreatGrandNibling,
      ];

      //remove them from the test list
      for (var type in highestLevelRelationships) {
        testPlatonicRelationshipTypes.remove(type);
      }

      //check that if any of them are present we get them back
      for (var chosenRelationship in highestLevelRelationships) {
        //get result when the chosen relationship is appended to the list
        final PlatonicRelationshipType? result =
            getHighestLevelRelationshipInList(
          platonicRelationshipTypeList: [
            ...testPlatonicRelationshipTypes,
            chosenRelationship,
          ],
        );

        expect(
          result,
          chosenRelationship,
          reason: "Cause: $chosenRelationship",
        );
      }
    });

    //6th level -> pibling, step pibling, cousin, step cousin, grandcousin, step grandcousin, greatgrandcousin, step greatgrandcousin,
    test(
        'given a list without the previous levels and with pibling, step pibling, cousin, step cousin, grandcousin, step grandcousin, greatgrandcousin, step greatgrandcousin, we get them as the highest level relationship',
        () {
      //
      final highestLevelRelationships = [
        PlatonicRelationshipType.pibling,
        PlatonicRelationshipType.stepPibling,
        PlatonicRelationshipType.cousin,
        PlatonicRelationshipType.stepCousin,
        PlatonicRelationshipType.grandCousin,
        PlatonicRelationshipType.stepGrandCousin,
        PlatonicRelationshipType.greatGrandCousin,
        PlatonicRelationshipType.stepGreatGrandCousin,
      ];

      //remove them from the test list
      for (var type in highestLevelRelationships) {
        testPlatonicRelationshipTypes.remove(type);
      }

      //check that if any of them are present we get them back
      for (var chosenRelationship in highestLevelRelationships) {
        //get result when the chosen relationship is appended to the list
        final PlatonicRelationshipType? result =
            getHighestLevelRelationshipInList(
          platonicRelationshipTypeList: [
            ...testPlatonicRelationshipTypes,
            chosenRelationship,
          ],
        );

        expect(
          result,
          chosenRelationship,
          reason: "Cause: $chosenRelationship",
        );
      }
    });

    //7th level -> distant relative
    test(
        'given a list without the previous levels and with distant relative, we get it as the highest level relationship',
        () {
      //
      final highestLevelRelationships = [
        PlatonicRelationshipType.distantRelative,
      ];
      //remove them from the test list
      for (var type in highestLevelRelationships) {
        testPlatonicRelationshipTypes.remove(type);
      }

      //check that if any of them are present we get them back
      for (var chosenRelationship in highestLevelRelationships) {
        //get result when the chosen relationship is appended to the list
        final PlatonicRelationshipType? result =
            getHighestLevelRelationshipInList(
          platonicRelationshipTypeList: [
            ...testPlatonicRelationshipTypes,
            chosenRelationship,
          ],
        );

        expect(
          result,
          chosenRelationship,
          reason: "Cause: $chosenRelationship",
        );
      }
    });

    //8th level -> parent in law, child in law, step child in law, sibling in law, step sibling in law,
    test(
        'given a list without the previous levels and with parent in law, child in law, step child in law, sibling in law, step sibling in law, we get it as the highest level relationship',
        () {
      //
      final highestLevelRelationships = [
        PlatonicRelationshipType.parentInLaw,
        PlatonicRelationshipType.siblingInLaw,
        PlatonicRelationshipType.stepSiblingInLaw,
        PlatonicRelationshipType.stepChildInLaw,
        PlatonicRelationshipType.childInLaw,
      ];
      //remove them from the test list
      for (var type in highestLevelRelationships) {
        testPlatonicRelationshipTypes.remove(type);
      }

      //check that if any of them are present we get them back
      for (var chosenRelationship in highestLevelRelationships) {
        //get result when the chosen relationship is appended to the list
        final PlatonicRelationshipType? result =
            getHighestLevelRelationshipInList(
          platonicRelationshipTypeList: [
            ...testPlatonicRelationshipTypes,
            chosenRelationship,
          ],
        );

        expect(
          result,
          chosenRelationship,
          reason: "Cause: $chosenRelationship",
        );
      }
    });

    //9th level -> friend
    test(
        'given a list without the previous levels and with friend, we get it as the highest level relationship',
        () {
      //
      final highestLevelRelationships = [
        PlatonicRelationshipType.friend,
      ];
      //remove them from the test list
      for (var type in highestLevelRelationships) {
        testPlatonicRelationshipTypes.remove(type);
      }

      //check that if any of them are present we get them back
      for (var chosenRelationship in highestLevelRelationships) {
        //get result when the chosen relationship is appended to the list
        final PlatonicRelationshipType? result =
            getHighestLevelRelationshipInList(
          platonicRelationshipTypeList: [
            ...testPlatonicRelationshipTypes,
            chosenRelationship,
          ],
        );

        expect(
          result,
          chosenRelationship,
          reason: "Cause: $chosenRelationship",
        );
      }
    });

    //9th level -> acquaintance
    test(
        'given a list without the previous levels and with acquaintance, we get it as the highest level relationship',
        () {
      //
      final highestLevelRelationships = [
        PlatonicRelationshipType.acquaintance,
      ];
      //remove them from the test list
      for (var type in highestLevelRelationships) {
        testPlatonicRelationshipTypes.remove(type);
      }

      //check that if any of them are present we get them back
      for (var chosenRelationship in highestLevelRelationships) {
        //get result when the chosen relationship is appended to the list
        final PlatonicRelationshipType? result =
            getHighestLevelRelationshipInList(
          platonicRelationshipTypeList: [
            ...testPlatonicRelationshipTypes,
            chosenRelationship,
          ],
        );

        expect(
          result,
          chosenRelationship,
          reason: "Cause: $chosenRelationship",
        );
      }
    });

    test('all platonic relationship types are accounted for', () {
      expect(
        testPlatonicRelationshipTypes.isEmpty,
        true,
        reason: "Cause: $testPlatonicRelationshipTypes",
      );
    });
  });
}
