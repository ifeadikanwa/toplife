import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/domain/dao/relationship_traits_dao.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/model/relationship_traits.dart';

class RelationshipTraitsDaoImpl implements RelationshipTraitsDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const relationshipTraitsTable = "relationship_traits";

  static const createTableQuery = '''
    CREATE TABLE $relationshipTraitsTable(
      ${RelationshipTraits.idColumn} $idType,
      ${RelationshipTraits.personIDColumn} $integerType $unique,
      ${RelationshipTraits.helpfulnessColumn} $integerType,
      ${RelationshipTraits.economicalColumn} $integerType,
      ${RelationshipTraits.materialisticColumn} $integerType,
      ${RelationshipTraits.jealousColumn} $integerType,
      ${RelationshipTraits.cheaterColumn} $integerType,
      FOREIGN KEY (${RelationshipTraits.personIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE
    )
  ''';

  @override
  Future<RelationshipTraits> createRelationshipTraits(
      RelationshipTraits relationshipTraits) async {
    final db = await _databaseProvider.database;
    final id = await db.insert(
      relationshipTraitsTable,
      relationshipTraits.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return relationshipTraits.copyWith(id: id);
  }

  @override
  Future<void> deleteRelationshipTraits(int relationshipTraitsID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      relationshipTraitsTable,
      where: "${RelationshipTraits.idColumn} = ?",
      whereArgs: [relationshipTraitsID],
    );
  }

  @override
  Future<RelationshipTraits?> getRelationshipTraits(
      int personID) async {
    final db = await _databaseProvider.database;
    final relationshipTraitsMaps = await db.query(
      relationshipTraitsTable,
      columns: RelationshipTraits.allColumns,
      where: "${RelationshipTraits.personIDColumn} = ?",
      whereArgs: [personID],
    );

    if (relationshipTraitsMaps.isNotEmpty) {
      return RelationshipTraits.fromMap(
          relationshipTraitsMap: relationshipTraitsMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateRelationshipTraits(
      RelationshipTraits relationshipTraits) async {
    final db = await _databaseProvider.database;
    await db.update(
      relationshipTraitsTable,
      relationshipTraits.toMap(),
      where: "${RelationshipTraits.idColumn} = ?",
      whereArgs: [relationshipTraits.id],
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }
}
