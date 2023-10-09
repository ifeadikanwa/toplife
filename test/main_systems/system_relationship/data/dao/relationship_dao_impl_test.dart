import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/data/dao/game_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_category.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/relationship_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

void main() {
  group("Relationship dao test", () {
    late DatabaseProvider databaseProvider;
    late RelationshipDaoImpl relationshipDaoImpl;
    //
    const int testMainPersonID = 1;
    const Relationship testRelationship = Relationship(
      firstPersonId: testMainPersonID,
      secondPersonId: 0,
      platonicRelationshipType: "",
      romanticRelationshipType: "",
      previousFamilialRelationship: "",
      bloodRelation: true,
      interestedInRelationship: true,
      level: 100,
      activeRomance: false,
    );

    setUp(() async {
      //variables
      databaseProvider = DatabaseProvider.forTesting(NativeDatabase.memory());
      relationshipDaoImpl = RelationshipDaoImpl(databaseProvider);

      //populate db
      //create game
      const Game testGame = Game(
        id: 0,
        currentPlayerID: 1,
        isActive: true,
        lastPlayedTime: 0,
        currentDay: 0,
        currentTimeInMinutes: 0,
        generation: 0,
      );

      await GameDaoImpl(databaseProvider).createGame(testGame);
      //add people
      const Person testPerson = Person(
        id: 0,
        gameId: 1,
        firstName: "firstName",
        lastName: "lastName",
        dayOfBirth: 0,
        gender: "gender",
        subjectPronoun: "subjectPronoun",
        objectPronoun: "objectPronoun",
        possessivePronoun: "possessivePronoun",
        sexuality: "sexuality",
        currentState: "currentState",
        currentCountry: "currentCountry",
        birthState: "birthState",
        birthCountry: "birthCountry",
        money: 0,
        emotionalState: "emotionalState",
        zodiacSign: "zodiacSign",
        hasDriversLicense: true,
        transportMode: "transportMode",
        drivingMode: "drivingMode",
        hasFertilityIssues: true,
        onBirthControl: false,
        isSterile: false,
        sickly: true,
        dead: false,
      );

      for (var i = 0; i < 20; i++) {
        await PersonDaoImpl(databaseProvider).createPerson(testPerson);
      }
    });

    tearDown(() async {
      await databaseProvider.close();
    });

    //
    test("get all parents returns all parent relationship types", () async {
      //get all parent relationship types
      final List<PlatonicRelationshipType> parentTypes =
          PlatonicRelationshipType.values
              .where((type) =>
                  type.relationshipCategory == RelationshipCategory.parent)
              .toList();

      //create a counter to keep track of second person ids
      int secondPersonIdCounter = testMainPersonID + 1;

      for (var parentType in parentTypes) {
        //create relationship
        await relationshipDaoImpl.createRelationship(
          testRelationship.copyWith(
            firstPersonId: testMainPersonID,
            secondPersonId: secondPersonIdCounter,
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(parentType),
          ),
        );

        //increase counter
        secondPersonIdCounter++;
      }

      //get succesfully created parent relationships
      final List<Relationship> createdParentRelationships =
          await relationshipDaoImpl.getAllParentsOf(testMainPersonID);

      //test that each parent type was successfully retrieved
      for (var parentType in parentTypes) {
        final int numberOfRecordsWithThisParentType = createdParentRelationships
            .where(
              (relationship) => relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(parentType),
              ),
            )
            .length;

        expect(
          numberOfRecordsWithThisParentType,
          1,
          reason:
              "Cause: $parentType \n\nAll parent relationship types: $parentTypes \n\nRelationships gotten from database:\n ${createdParentRelationships.map((e) => "$e\n\n")}",
        );
      }
    });

    test("watch all parents returns all parent relationship types", () async {
      //get all parent relationship types
      final List<PlatonicRelationshipType> parentTypes =
          PlatonicRelationshipType.values
              .where((type) =>
                  type.relationshipCategory == RelationshipCategory.parent)
              .toList();

      //create a counter to keep track of second person ids
      int secondPersonIdCounter = testMainPersonID + 1;

      for (var parentType in parentTypes) {
        //create relationship
        await relationshipDaoImpl.createRelationship(
          testRelationship.copyWith(
            firstPersonId: testMainPersonID,
            secondPersonId: secondPersonIdCounter,
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(parentType),
          ),
        );

        //increase counter
        secondPersonIdCounter++;
      }

      //get succesfully created parent relationships
      final List<Relationship> createdParentRelationships =
          await relationshipDaoImpl.watchAllParentsOf(testMainPersonID).first;

      //test that each parent type was successfully retrieved
      for (var parentType in parentTypes) {
        final int numberOfRecordsWithThisParentType = createdParentRelationships
            .where(
              (relationship) => relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(parentType),
              ),
            )
            .length;

        expect(
          numberOfRecordsWithThisParentType,
          1,
          reason:
              "Cause: $parentType \n\nAll parent relationship types: $parentTypes \n\nRelationships gotten from database:\n ${createdParentRelationships.map((e) => "$e\n\n")}",
        );
      }
    });

    test("get all children returns all children relationship types", () async {
      //get all children relationship types
      final List<PlatonicRelationshipType> childrenTypes =
          PlatonicRelationshipType.values
              .where((type) =>
                  type.relationshipCategory == RelationshipCategory.child)
              .toList();

      //create a counter to keep track of second person ids
      int secondPersonIdCounter = testMainPersonID + 1;

      for (var childType in childrenTypes) {
        //create relationship
        await relationshipDaoImpl.createRelationship(
          testRelationship.copyWith(
            firstPersonId: testMainPersonID,
            secondPersonId: secondPersonIdCounter,
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(childType),
          ),
        );

        //increase counter
        secondPersonIdCounter++;
      }

      //get succesfully created children relationships
      final List<Relationship> createdChildrenRelationships =
          await relationshipDaoImpl.getAllChildrenOf(testMainPersonID);

      //test that each child type was successfully retrieved
      for (var childType in childrenTypes) {
        final int numberOfRecordsWithThisChildType =
            createdChildrenRelationships
                .where(
                  (relationship) =>
                      relationship.platonicRelationshipType.contains(
                    getDbFormattedPlatonicRelationshipTypeString(childType),
                  ),
                )
                .length;

        expect(
          numberOfRecordsWithThisChildType,
          1,
          reason:
              "Cause: $childType \n\nAll children relationship types: $childrenTypes \n\nRelationships gotten from database:\n ${createdChildrenRelationships.map((e) => "$e\n\n")}",
        );
      }
    });

    test("watch all children returns all children relationship types",
        () async {
      //get all children relationship types
      final List<PlatonicRelationshipType> childrenTypes =
          PlatonicRelationshipType.values
              .where((type) =>
                  type.relationshipCategory == RelationshipCategory.child)
              .toList();

      //create a counter to keep track of second person ids
      int secondPersonIdCounter = testMainPersonID + 1;

      for (var childType in childrenTypes) {
        //create relationship
        await relationshipDaoImpl.createRelationship(
          testRelationship.copyWith(
            firstPersonId: testMainPersonID,
            secondPersonId: secondPersonIdCounter,
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(childType),
          ),
        );

        //increase counter
        secondPersonIdCounter++;
      }

      //get succesfully created children relationships
      final List<Relationship> createdChildrenRelationships =
          await relationshipDaoImpl.watchAllChildrenOf(testMainPersonID).first;

      //test that each child type was successfully retrieved
      for (var childType in childrenTypes) {
        final int numberOfRecordsWithThisChildType =
            createdChildrenRelationships
                .where(
                  (relationship) =>
                      relationship.platonicRelationshipType.contains(
                    getDbFormattedPlatonicRelationshipTypeString(childType),
                  ),
                )
                .length;

        expect(
          numberOfRecordsWithThisChildType,
          1,
          reason:
              "Cause: $childType \n\nAll children relationship types: $childrenTypes \n\nRelationships gotten from database:\n ${createdChildrenRelationships.map((e) => "$e\n\n")}",
        );
      }
    });

    test("get all siblings returns all sibling relationship types", () async {
      //get all sibling relationship types
      final List<PlatonicRelationshipType> siblingTypes =
          PlatonicRelationshipType.values
              .where((type) =>
                  type.relationshipCategory == RelationshipCategory.sibling)
              .toList();

      //create a counter to keep track of second person ids
      int secondPersonIdCounter = testMainPersonID + 1;

      for (var siblingType in siblingTypes) {
        //create relationship
        await relationshipDaoImpl.createRelationship(
          testRelationship.copyWith(
            firstPersonId: testMainPersonID,
            secondPersonId: secondPersonIdCounter,
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(siblingType),
          ),
        );

        //increase counter
        secondPersonIdCounter++;
      }

      //get succesfully created sibling relationships
      final List<Relationship> createdSiblingRelationships =
          await relationshipDaoImpl.getAllSiblingsOf(testMainPersonID);

      //test that each sibling type was successfully retrieved
      for (var siblingType in siblingTypes) {
        final int numberOfRecordsWithThisSiblingType =
            createdSiblingRelationships
                .where(
                  (relationship) =>
                      relationship.platonicRelationshipType.contains(
                    getDbFormattedPlatonicRelationshipTypeString(siblingType),
                  ),
                )
                .length;

        expect(
          numberOfRecordsWithThisSiblingType,
          1,
          reason:
              "Cause: $siblingType \n\nAll sibling relationship types: $siblingTypes \n\nRelationships gotten from database:\n ${createdSiblingRelationships.map((e) => "$e\n\n")}",
        );
      }
    });

    test("watch all siblings returns all sibling relationship types", () async {
      //get all sibling relationship types
      final List<PlatonicRelationshipType> siblingTypes =
          PlatonicRelationshipType.values
              .where((type) =>
                  type.relationshipCategory == RelationshipCategory.sibling)
              .toList();

      //create a counter to keep track of second person ids
      int secondPersonIdCounter = testMainPersonID + 1;

      for (var siblingType in siblingTypes) {
        //create relationship
        await relationshipDaoImpl.createRelationship(
          testRelationship.copyWith(
            firstPersonId: testMainPersonID,
            secondPersonId: secondPersonIdCounter,
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(siblingType),
          ),
        );

        //increase counter
        secondPersonIdCounter++;
      }

      //get succesfully created sibling relationships
      final List<Relationship> createdSiblingRelationships =
          await relationshipDaoImpl.watchAllSiblingsOf(testMainPersonID).first;

      //test that each sibling type was successfully retrieved
      for (var siblingType in siblingTypes) {
        final int numberOfRecordsWithThisSiblingType =
            createdSiblingRelationships
                .where(
                  (relationship) =>
                      relationship.platonicRelationshipType.contains(
                    getDbFormattedPlatonicRelationshipTypeString(siblingType),
                  ),
                )
                .length;

        expect(
          numberOfRecordsWithThisSiblingType,
          1,
          reason:
              "Cause: $siblingType \n\nAll sibling relationship types: $siblingTypes \n\nRelationships gotten from database:\n ${createdSiblingRelationships.map((e) => "$e\n\n")}",
        );
      }
    });

    test("get all relatives returns all relative relationship types", () async {
      //get all relative relationship types
      final List<PlatonicRelationshipType> relativeTypes =
          PlatonicRelationshipType.values
              .where((type) =>
                  type.relationshipCategory == RelationshipCategory.relative)
              .toList();

      //create a counter to keep track of second person ids
      int secondPersonIdCounter = testMainPersonID + 1;

      for (var relativeType in relativeTypes) {
        //create relationship
        await relationshipDaoImpl.createRelationship(
          testRelationship.copyWith(
            firstPersonId: testMainPersonID,
            secondPersonId: secondPersonIdCounter,
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(relativeType),
          ),
        );

        //increase counter
        secondPersonIdCounter++;
      }

      //get succesfully created relative relationships
      final List<Relationship> createdRelativeRelationships =
          await relationshipDaoImpl.getAllRelativesOf(testMainPersonID);

      //test that each relative type was successfully retrieved
      for (var relativeType in relativeTypes) {
        final int numberOfRecordsWithThisRelativeType =
            createdRelativeRelationships
                .where(
                  (relationship) =>
                      relationship.platonicRelationshipType.contains(
                    getDbFormattedPlatonicRelationshipTypeString(relativeType),
                  ),
                )
                .length;

        expect(
          numberOfRecordsWithThisRelativeType,
          1,
          reason:
              "Cause: $relativeType \n\nAll relative relationship types: $relativeTypes \n\nRelationships gotten from database:\n ${createdRelativeRelationships.map((e) => "$e\n\n")}",
        );
      }
    });

    test("watch all relatives returns all relative relationship types",
        () async {
      //get all relative relationship types
      final List<PlatonicRelationshipType> relativeTypes =
          PlatonicRelationshipType.values
              .where((type) =>
                  type.relationshipCategory == RelationshipCategory.relative)
              .toList();

      //create a counter to keep track of second person ids
      int secondPersonIdCounter = testMainPersonID + 1;

      for (var relativeType in relativeTypes) {
        //create relationship
        await relationshipDaoImpl.createRelationship(
          testRelationship.copyWith(
            firstPersonId: testMainPersonID,
            secondPersonId: secondPersonIdCounter,
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(relativeType),
          ),
        );

        //increase counter
        secondPersonIdCounter++;
      }

      //get succesfully created relative relationships
      final List<Relationship> createdRelativeRelationships =
          await relationshipDaoImpl.watchAllRelativesOf(testMainPersonID).first;

      //test that each relative type was successfully retrieved
      for (var relativeType in relativeTypes) {
        final int numberOfRecordsWithThisRelativeType =
            createdRelativeRelationships
                .where(
                  (relationship) =>
                      relationship.platonicRelationshipType.contains(
                    getDbFormattedPlatonicRelationshipTypeString(relativeType),
                  ),
                )
                .length;

        expect(
          numberOfRecordsWithThisRelativeType,
          1,
          reason:
              "Cause: $relativeType \n\nAll relative relationship types: $relativeTypes \n\nRelationships gotten from database:\n ${createdRelativeRelationships.map((e) => "$e\n\n")}",
        );
      }
    });

    test("get all inLaws returns all inLaw relationship types", () async {
      //get all inLaw relationship types
      final List<PlatonicRelationshipType> inLawTypes = PlatonicRelationshipType
          .values
          .where(
              (type) => type.relationshipCategory == RelationshipCategory.inLaw)
          .toList();

      //create a counter to keep track of second person ids
      int secondPersonIdCounter = testMainPersonID + 1;

      for (var inLawType in inLawTypes) {
        //create relationship
        await relationshipDaoImpl.createRelationship(
          testRelationship.copyWith(
            firstPersonId: testMainPersonID,
            secondPersonId: secondPersonIdCounter,
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(inLawType),
          ),
        );

        //increase counter
        secondPersonIdCounter++;
      }

      //get succesfully created inLaw relationships
      final List<Relationship> createdInLawRelationships =
          await relationshipDaoImpl.getAllInLawsOf(testMainPersonID);

      //test that each inLaw type was successfully retrieved
      for (var inLawType in inLawTypes) {
        final int numberOfRecordsWithThisInLawType = createdInLawRelationships
            .where(
              (relationship) => relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(inLawType),
              ),
            )
            .length;

        expect(
          numberOfRecordsWithThisInLawType,
          1,
          reason:
              "Cause: $inLawType \n\nAll inLaw relationship types: $inLawTypes \n\nRelationships gotten from database:\n ${createdInLawRelationships.map((e) => "$e\n\n")}",
        );
      }
    });

    test("watch all inLaws returns all inLaw relationship types", () async {
      //get all inLaw relationship types
      final List<PlatonicRelationshipType> inLawTypes = PlatonicRelationshipType
          .values
          .where(
              (type) => type.relationshipCategory == RelationshipCategory.inLaw)
          .toList();

      //create a counter to keep track of second person ids
      int secondPersonIdCounter = testMainPersonID + 1;

      for (var inLawType in inLawTypes) {
        //create relationship
        await relationshipDaoImpl.createRelationship(
          testRelationship.copyWith(
            firstPersonId: testMainPersonID,
            secondPersonId: secondPersonIdCounter,
            platonicRelationshipType:
                getDbFormattedPlatonicRelationshipTypeString(inLawType),
          ),
        );

        //increase counter
        secondPersonIdCounter++;
      }

      //get succesfully created inLaw relationships
      final List<Relationship> createdInLawRelationships =
          await relationshipDaoImpl.watchAllInLawsOf(testMainPersonID).first;

      //test that each inLaw type was successfully retrieved
      for (var inLawType in inLawTypes) {
        final int numberOfRecordsWithThisInLawType = createdInLawRelationships
            .where(
              (relationship) => relationship.platonicRelationshipType.contains(
                getDbFormattedPlatonicRelationshipTypeString(inLawType),
              ),
            )
            .length;

        expect(
          numberOfRecordsWithThisInLawType,
          1,
          reason:
              "Cause: $inLawType \n\nAll inLaw relationship types: $inLawTypes \n\nRelationships gotten from database:\n ${createdInLawRelationships.map((e) => "$e\n\n")}",
        );
      }
    });
  });
}
