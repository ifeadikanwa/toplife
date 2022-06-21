import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';

class Person extends Equatable {
  final int? id;
  final int? gameID;
  final String firstName;
  final String lastName;
  final int birthday;
  final String gender;
  final String subjectPronoun;
  final String objectPronoun;
  final String sexuality;
  final String state;
  final String country;
  final String zodiacSign;
  final String? importantStatus;
  final int? motherID;
  final int? fatherID;
  final int? custodianID;
  final bool sickly;
  final bool rebellious;
  final bool dead;

  const Person({
    this.id,
    this.gameID,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    required this.gender,
    required this.subjectPronoun,
    required this.objectPronoun,
    required this.sexuality,
    required this.state,
    required this.country,
    required this.zodiacSign,
    this.importantStatus,
    this.motherID,
    this.fatherID,
    this.custodianID,
    required this.sickly,
    required this.rebellious,
    required this.dead,
  });

  @override
  List<Object?> get props => [
        id,
        gameID,
        firstName,
        lastName,
        birthday,
        gender,
        subjectPronoun,
        objectPronoun,
        sexuality,
        state,
        country,
        zodiacSign,
        importantStatus,
        motherID,
        fatherID,
        custodianID,
        sickly,
        rebellious,
        dead
      ];

  @override
  bool? get stringify => true;

  //Helper constants
  static const idColumn = "_id";
  static const gameIDColumn = "gameID";
  static const firstNameColumn = "firstName";
  static const lastNameColumn = "lastName";
  static const birthdayColumn = "birthday";
  static const genderColumn = "gender";
  static const subjectPronounColumn = "subjectPronoun";
  static const objectPronounColumn = "objectPronoun";
  static const sexualityColumn = "sexuality";
  static const stateColumn = "state";
  static const countryColumn = "country";
  static const zodiacSignColumn = "zodiacSign";
  static const importantStatusColumn = "importantStatus";
  static const motherIDColumn = "motherID";
  static const fatherIDColumn = "fatherID";
  static const custodianIDColumn = "custodianID";
  static const sicklyColumn = "sickly";
  static const rebelliousColumn = "rebellious";
  static const deadColumn = "dead";

  static const allColumns = [
    idColumn,
    gameIDColumn,
    firstNameColumn,
    lastNameColumn,
    birthdayColumn,
    genderColumn,
    subjectPronounColumn,
    objectPronounColumn,
    sexualityColumn,
    stateColumn,
    countryColumn,
    zodiacSignColumn,
    importantStatusColumn,
    motherIDColumn,
    fatherIDColumn,
    custodianIDColumn,
    sicklyColumn,
    rebelliousColumn,
    deadColumn,
  ];

  static Person fromMap({required Map<String, Object?> personMap}) {
    return Person(
      id: personMap[idColumn] as int?,
      gameID: personMap[gameIDColumn] as int?,
      firstName: personMap[firstNameColumn] as String,
      lastName: personMap[lastNameColumn] as String,
      birthday: personMap[birthdayColumn] as int,
      gender: personMap[genderColumn] as String,
      subjectPronoun: personMap[subjectPronounColumn] as String,
      objectPronoun: personMap[objectPronounColumn] as String,
      sexuality: personMap[sexualityColumn] as String,
      state: personMap[stateColumn] as String,
      country: personMap[countryColumn] as String,
      zodiacSign: personMap[zodiacSignColumn] as String,
      importantStatus: personMap[importantStatusColumn] as String?,
      motherID: personMap[motherIDColumn] as int?,
      fatherID: personMap[fatherIDColumn] as int?,
      custodianID: personMap[custodianIDColumn] as int?,
      sickly: personMap[sicklyColumn] == databaseTrueValue,
      rebellious: personMap[rebelliousColumn] == databaseTrueValue,
      dead: personMap[deadColumn] == databaseTrueValue,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      gameIDColumn: gameID,
      firstNameColumn: firstName,
      lastNameColumn: lastName,
      birthdayColumn: birthday,
      genderColumn: gender,
      subjectPronounColumn: subjectPronoun,
      objectPronounColumn: objectPronoun,
      sexualityColumn: sexuality,
      stateColumn: state,
      countryColumn: country,
      zodiacSignColumn: zodiacSign,
      importantStatusColumn: importantStatus,
      motherIDColumn: motherID,
      fatherIDColumn: fatherID,
      custodianIDColumn: custodianID,
      sicklyColumn: sickly ? databaseTrueValue : databaseFalseValue,
      rebelliousColumn: rebellious ? databaseTrueValue : databaseFalseValue,
      deadColumn: dead ? databaseTrueValue : databaseFalseValue,
    };
  }

  Person copyWith({
    int? id,
    int? gameID,
    String? firstName,
    String? lastName,
    int? birthday,
    String? gender,
    String? subjectPronoun,
    String? objectPronoun,
    String? sexuality,
    String? state,
    String? country,
    String? zodiacSign,
    String? importantStatus,
    int? motherID,
    int? fatherID,
    int? custodianID,
    bool? sickly,
    bool? rebellious,
    bool? dead,
  }) {
    return Person(
      id: id ?? this.id,
      gameID: gameID ?? this.gameID,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthday: birthday ?? this.birthday,
      gender: gender ?? this.gender,
      subjectPronoun: subjectPronoun ?? this.subjectPronoun,
      objectPronoun: objectPronoun ?? this.objectPronoun,
      sexuality: sexuality ?? this.sexuality,
      state: state ?? this.state,
      country: country ?? this.country,
      importantStatus: importantStatus ?? this.importantStatus,
      motherID: motherID ?? this.motherID,
      fatherID: fatherID ?? this.fatherID,
      custodianID: custodianID ?? this.custodianID,
      zodiacSign: zodiacSign ?? this.zodiacSign,
      sickly: sickly ?? this.sickly,
      rebellious: rebellious ?? this.rebellious,
      dead: dead ?? this.dead,
    );
  }
}
