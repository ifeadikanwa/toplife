import 'package:sqflite/sqflite.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/partner_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/partner.dart';

class PartnerDaoImpl implements PartnerDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const partnerTable = "partner";

  static const createTableQuery =
      '''
    CREATE TABLE $partnerTable(
      ${Partner.mainPersonIDColumn} $integerType,
      ${Partner.partnerIDColumn} $integerType,
      ${Partner.partnerRelationshipTypeColumn} $textType,
      ${Partner.isActiveColumn} $boolType,
      ${Partner.startDayColumn} $integerType,
      ${Partner.endDayColumn} $nullableIntegerType,
      ${Partner.isCoParentColumn} $boolType,
      ${Partner.metAtColumn} $textType,
      ${Partner.relationshipColumn} $integerType,
      PRIMARY KEY (${Partner.mainPersonIDColumn}, ${Partner.partnerIDColumn}),
      FOREIGN KEY (${Partner.mainPersonIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE,
      FOREIGN KEY (${Partner.partnerIDColumn})
       REFERENCES ${PersonDaoImpl.personTable} (${Person.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE
    )
''';

  @override
  Future<Partner> createPartner(Partner partner) async {
    final db = await _databaseProvider.database;
    await db.insert(
      partnerTable,
      partner.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return partner;
  }

  @override
  Future<void> deletePartner(int mainPersonID, int partnerID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      partnerTable,
      where:
          "${Partner.mainPersonIDColumn} = ? and ${Partner.partnerIDColumn} = ?",
      whereArgs: [
        mainPersonID,
        partnerID,
      ],
    );
  }

  @override
  Future<Partner?> getAPartner(int mainPersonID, int partnerID) async {
    final db = await _databaseProvider.database;
    final partnersMap = await db.query(
      partnerTable,
      columns: Partner.allColumns,
      where:
          "${Partner.mainPersonIDColumn} = ? and ${Partner.partnerIDColumn} = ?",
      whereArgs: [
        mainPersonID,
        partnerID,
      ],
    );

    if (partnersMap.isNotEmpty) {
      return Partner.fromMap(partnerMap: partnersMap.first);
    } else {
      return null;
    }
  }

  @override
  Future<Partner?> getCurrentPartner(int mainPersonID) async {
    final db = await _databaseProvider.database;
    final partnersMap = await db.query(
      partnerTable,
      columns: Partner.allColumns,
      where:
          "${Partner.mainPersonIDColumn} = ? and ${Partner.isActiveColumn} = ?",
      whereArgs: [
        mainPersonID,
        databaseTrueValue,
      ],
    );

    if (partnersMap.isNotEmpty) {
      return Partner.fromMap(partnerMap: partnersMap.first);
    } else {
      return null;
    }
  }

  @override
  Future<List<Partner>> getAllCoparents(int mainPersonID) async {
    final db = await _databaseProvider.database;
    final partnersMap = await db.query(
      partnerTable,
      columns: Partner.allColumns,
      where:
          "${Partner.mainPersonIDColumn} = ? and ${Partner.isCoParentColumn} = ? and ${Partner.isActiveColumn} = ?",
      whereArgs: [
        mainPersonID,
        databaseTrueValue,
        databaseFalseValue,
      ],
    );

    return partnersMap
        .map((partnerMap) => Partner.fromMap(partnerMap: partnerMap))
        .toList();
  }

  @override
  Future<List<Partner>> getAllExes(int mainPersonID) async {
    final db = await _databaseProvider.database;
    final partnersMap = await db.query(
      partnerTable,
      columns: Partner.allColumns,
      where:
          "${Partner.mainPersonIDColumn} = ? and ${Partner.isActiveColumn} = ?",
      whereArgs: [
        mainPersonID,
        databaseFalseValue,
      ],
    );

    return partnersMap
        .map((partnerMap) => Partner.fromMap(partnerMap: partnerMap))
        .toList();
  }

  @override
  Future<List<Partner>> getAllPartners(int mainPersonID) async {
    final db = await _databaseProvider.database;
    final partnersMap = await db.query(
      partnerTable,
      columns: Partner.allColumns,
      where: "${Partner.mainPersonIDColumn} = ?",
      whereArgs: [mainPersonID],
    );

    return partnersMap
        .map((partnerMap) => Partner.fromMap(partnerMap: partnerMap))
        .toList();
  }

  @override
  Future<void> updatePartner(Partner partner) async {
    final db = await _databaseProvider.database;
    await db.update(
      partnerTable,
      partner.toMap(),
      where:
          "${Partner.mainPersonIDColumn} = ? and ${Partner.partnerIDColumn} = ?",
      whereArgs: [
        partner.mainPersonID,
        partner.partnerID,
      ],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
