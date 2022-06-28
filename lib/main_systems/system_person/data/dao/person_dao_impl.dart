import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/database_provider.dart';
import 'package:toplife/game_manager/data/dao/game_dao_impl.dart';
import 'package:toplife/game_manager/domain/model/game.dart';
import 'package:toplife/main_systems/system_person/domain/dao/person_dao.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

class PersonDaoImpl implements PersonDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;

  static const personTable = "person";

  static const createTableQuery = '''
    CREATE TABLE $personTable(
      ${Person.idColumn} $idType,
      ${Person.gameIDColumn} $nullableIntegerType,
      ${Person.firstNameColumn} $textType,
      ${Person.lastNameColumn} $textType,
      ${Person.dayOfBirthColumn} $integerType,
      ${Person.genderColumn} $textType,
      ${Person.subjectPronounColumn} $textType,
      ${Person.objectPronounColumn} $textType,
      ${Person.sexualityColumn} $textType,
      ${Person.stateColumn} $textType,
      ${Person.countryColumn} $textType,
      ${Person.zodiacSignColumn} $textType,
      ${Person.importantStatusColumn} $nullableTextType,
      ${Person.custodianIDColumn} $nullableIntegerType,
      ${Person.hasFertilityIssuesColumn} $boolType,
      ${Person.onBirthControlColumn} $boolType,
      ${Person.isSterileColumn} $boolType,
      ${Person.sicklyColumn} $boolType,
      ${Person.rebelliousColumn} $boolType,
      ${Person.deadColumn} $boolType,
      FOREIGN KEY (${Person.gameIDColumn})
       REFERENCES ${GameDaoImpl.gameTable} (${Game.idColumn}) 
       ON UPDATE CASCADE
       ON DELETE CASCADE
    )
  ''';

  @override
  Future<Person> createPerson(Person person) async {
    final db = await _databaseProvider.database;
    final id = await db.insert(personTable, person.toMap());

    return person.copyWith(id: id);
  }

  @override
  Future<void> deletePerson(int personID) async {
    final db = await _databaseProvider.database;
    await db.delete(
      personTable,
      where: "${Person.idColumn} = ?",
      whereArgs: [personID],
    );
  }

  @override
  Future<Person?> getPerson(int personID) async {
    final db = await _databaseProvider.database;
    final personMaps = await db.query(
      personTable,
      columns: Person.allColumns,
      where: "${Person.idColumn} = ?",
      whereArgs: [personID],
    );

    if (personMaps.isNotEmpty) {
      return Person.fromMap(personMap: personMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updatePerson(Person person) async {
    final db = await _databaseProvider.database;
    await db.update(
      personTable,
      person.toMap(),
      where: "${Person.idColumn} = ?",
      whereArgs: [person.id],
    );
  }
}
