// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_provider.dart';

// ignore_for_file: type=lint
class $GameTableTable extends GameTable with TableInfo<$GameTableTable, Game> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _currentPlayerIDMeta =
      const VerificationMeta('currentPlayerID');
  @override
  late final GeneratedColumn<int> currentPlayerID = GeneratedColumn<int>(
      'current_player_i_d', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive =
      GeneratedColumn<bool>('is_active', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_active" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _lastPlayedTimeMeta =
      const VerificationMeta('lastPlayedTime');
  @override
  late final GeneratedColumn<int> lastPlayedTime = GeneratedColumn<int>(
      'last_played_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentDayMeta =
      const VerificationMeta('currentDay');
  @override
  late final GeneratedColumn<int> currentDay = GeneratedColumn<int>(
      'current_day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentTimeInMinutesMeta =
      const VerificationMeta('currentTimeInMinutes');
  @override
  late final GeneratedColumn<int> currentTimeInMinutes = GeneratedColumn<int>(
      'current_time_in_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _generationMeta =
      const VerificationMeta('generation');
  @override
  late final GeneratedColumn<int> generation = GeneratedColumn<int>(
      'generation', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        currentPlayerID,
        isActive,
        lastPlayedTime,
        currentDay,
        currentTimeInMinutes,
        generation
      ];
  @override
  String get aliasedName => _alias ?? 'game';
  @override
  String get actualTableName => 'game';
  @override
  VerificationContext validateIntegrity(Insertable<Game> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('current_player_i_d')) {
      context.handle(
          _currentPlayerIDMeta,
          currentPlayerID.isAcceptableOrUnknown(
              data['current_player_i_d']!, _currentPlayerIDMeta));
    } else if (isInserting) {
      context.missing(_currentPlayerIDMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    if (data.containsKey('last_played_time')) {
      context.handle(
          _lastPlayedTimeMeta,
          lastPlayedTime.isAcceptableOrUnknown(
              data['last_played_time']!, _lastPlayedTimeMeta));
    } else if (isInserting) {
      context.missing(_lastPlayedTimeMeta);
    }
    if (data.containsKey('current_day')) {
      context.handle(
          _currentDayMeta,
          currentDay.isAcceptableOrUnknown(
              data['current_day']!, _currentDayMeta));
    } else if (isInserting) {
      context.missing(_currentDayMeta);
    }
    if (data.containsKey('current_time_in_minutes')) {
      context.handle(
          _currentTimeInMinutesMeta,
          currentTimeInMinutes.isAcceptableOrUnknown(
              data['current_time_in_minutes']!, _currentTimeInMinutesMeta));
    } else if (isInserting) {
      context.missing(_currentTimeInMinutesMeta);
    }
    if (data.containsKey('generation')) {
      context.handle(
          _generationMeta,
          generation.isAcceptableOrUnknown(
              data['generation']!, _generationMeta));
    } else if (isInserting) {
      context.missing(_generationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Game map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Game(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      currentPlayerID: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}current_player_i_d'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      lastPlayedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_played_time'])!,
      currentDay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_day'])!,
      currentTimeInMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}current_time_in_minutes'])!,
      generation: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}generation'])!,
    );
  }

  @override
  $GameTableTable createAlias(String alias) {
    return $GameTableTable(attachedDatabase, alias);
  }
}

class Game extends DataClass implements Insertable<Game> {
  final int id;
  final int currentPlayerID;
  final bool isActive;
  final int lastPlayedTime;
  final int currentDay;
  final int currentTimeInMinutes;
  final int generation;
  const Game(
      {required this.id,
      required this.currentPlayerID,
      required this.isActive,
      required this.lastPlayedTime,
      required this.currentDay,
      required this.currentTimeInMinutes,
      required this.generation});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['current_player_i_d'] = Variable<int>(currentPlayerID);
    map['is_active'] = Variable<bool>(isActive);
    map['last_played_time'] = Variable<int>(lastPlayedTime);
    map['current_day'] = Variable<int>(currentDay);
    map['current_time_in_minutes'] = Variable<int>(currentTimeInMinutes);
    map['generation'] = Variable<int>(generation);
    return map;
  }

  GameTableCompanion toCompanion(bool nullToAbsent) {
    return GameTableCompanion(
      id: Value(id),
      currentPlayerID: Value(currentPlayerID),
      isActive: Value(isActive),
      lastPlayedTime: Value(lastPlayedTime),
      currentDay: Value(currentDay),
      currentTimeInMinutes: Value(currentTimeInMinutes),
      generation: Value(generation),
    );
  }

  factory Game.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Game(
      id: serializer.fromJson<int>(json['id']),
      currentPlayerID: serializer.fromJson<int>(json['currentPlayerID']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      lastPlayedTime: serializer.fromJson<int>(json['lastPlayedTime']),
      currentDay: serializer.fromJson<int>(json['currentDay']),
      currentTimeInMinutes:
          serializer.fromJson<int>(json['currentTimeInMinutes']),
      generation: serializer.fromJson<int>(json['generation']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'currentPlayerID': serializer.toJson<int>(currentPlayerID),
      'isActive': serializer.toJson<bool>(isActive),
      'lastPlayedTime': serializer.toJson<int>(lastPlayedTime),
      'currentDay': serializer.toJson<int>(currentDay),
      'currentTimeInMinutes': serializer.toJson<int>(currentTimeInMinutes),
      'generation': serializer.toJson<int>(generation),
    };
  }

  Game copyWith(
          {int? id,
          int? currentPlayerID,
          bool? isActive,
          int? lastPlayedTime,
          int? currentDay,
          int? currentTimeInMinutes,
          int? generation}) =>
      Game(
        id: id ?? this.id,
        currentPlayerID: currentPlayerID ?? this.currentPlayerID,
        isActive: isActive ?? this.isActive,
        lastPlayedTime: lastPlayedTime ?? this.lastPlayedTime,
        currentDay: currentDay ?? this.currentDay,
        currentTimeInMinutes: currentTimeInMinutes ?? this.currentTimeInMinutes,
        generation: generation ?? this.generation,
      );
  @override
  String toString() {
    return (StringBuffer('Game(')
          ..write('id: $id, ')
          ..write('currentPlayerID: $currentPlayerID, ')
          ..write('isActive: $isActive, ')
          ..write('lastPlayedTime: $lastPlayedTime, ')
          ..write('currentDay: $currentDay, ')
          ..write('currentTimeInMinutes: $currentTimeInMinutes, ')
          ..write('generation: $generation')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, currentPlayerID, isActive, lastPlayedTime,
      currentDay, currentTimeInMinutes, generation);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Game &&
          other.id == this.id &&
          other.currentPlayerID == this.currentPlayerID &&
          other.isActive == this.isActive &&
          other.lastPlayedTime == this.lastPlayedTime &&
          other.currentDay == this.currentDay &&
          other.currentTimeInMinutes == this.currentTimeInMinutes &&
          other.generation == this.generation);
}

class GameTableCompanion extends UpdateCompanion<Game> {
  final Value<int> id;
  final Value<int> currentPlayerID;
  final Value<bool> isActive;
  final Value<int> lastPlayedTime;
  final Value<int> currentDay;
  final Value<int> currentTimeInMinutes;
  final Value<int> generation;
  const GameTableCompanion({
    this.id = const Value.absent(),
    this.currentPlayerID = const Value.absent(),
    this.isActive = const Value.absent(),
    this.lastPlayedTime = const Value.absent(),
    this.currentDay = const Value.absent(),
    this.currentTimeInMinutes = const Value.absent(),
    this.generation = const Value.absent(),
  });
  GameTableCompanion.insert({
    this.id = const Value.absent(),
    required int currentPlayerID,
    required bool isActive,
    required int lastPlayedTime,
    required int currentDay,
    required int currentTimeInMinutes,
    required int generation,
  })  : currentPlayerID = Value(currentPlayerID),
        isActive = Value(isActive),
        lastPlayedTime = Value(lastPlayedTime),
        currentDay = Value(currentDay),
        currentTimeInMinutes = Value(currentTimeInMinutes),
        generation = Value(generation);
  static Insertable<Game> custom({
    Expression<int>? id,
    Expression<int>? currentPlayerID,
    Expression<bool>? isActive,
    Expression<int>? lastPlayedTime,
    Expression<int>? currentDay,
    Expression<int>? currentTimeInMinutes,
    Expression<int>? generation,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (currentPlayerID != null) 'current_player_i_d': currentPlayerID,
      if (isActive != null) 'is_active': isActive,
      if (lastPlayedTime != null) 'last_played_time': lastPlayedTime,
      if (currentDay != null) 'current_day': currentDay,
      if (currentTimeInMinutes != null)
        'current_time_in_minutes': currentTimeInMinutes,
      if (generation != null) 'generation': generation,
    });
  }

  GameTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? currentPlayerID,
      Value<bool>? isActive,
      Value<int>? lastPlayedTime,
      Value<int>? currentDay,
      Value<int>? currentTimeInMinutes,
      Value<int>? generation}) {
    return GameTableCompanion(
      id: id ?? this.id,
      currentPlayerID: currentPlayerID ?? this.currentPlayerID,
      isActive: isActive ?? this.isActive,
      lastPlayedTime: lastPlayedTime ?? this.lastPlayedTime,
      currentDay: currentDay ?? this.currentDay,
      currentTimeInMinutes: currentTimeInMinutes ?? this.currentTimeInMinutes,
      generation: generation ?? this.generation,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (currentPlayerID.present) {
      map['current_player_i_d'] = Variable<int>(currentPlayerID.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (lastPlayedTime.present) {
      map['last_played_time'] = Variable<int>(lastPlayedTime.value);
    }
    if (currentDay.present) {
      map['current_day'] = Variable<int>(currentDay.value);
    }
    if (currentTimeInMinutes.present) {
      map['current_time_in_minutes'] =
          Variable<int>(currentTimeInMinutes.value);
    }
    if (generation.present) {
      map['generation'] = Variable<int>(generation.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameTableCompanion(')
          ..write('id: $id, ')
          ..write('currentPlayerID: $currentPlayerID, ')
          ..write('isActive: $isActive, ')
          ..write('lastPlayedTime: $lastPlayedTime, ')
          ..write('currentDay: $currentDay, ')
          ..write('currentTimeInMinutes: $currentTimeInMinutes, ')
          ..write('generation: $generation')
          ..write(')'))
        .toString();
  }
}

class $PersonTableTable extends PersonTable
    with TableInfo<$PersonTableTable, Person> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _gameIdMeta = const VerificationMeta('gameId');
  @override
  late final GeneratedColumn<int> gameId = GeneratedColumn<int>(
      'game_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES game (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dayOfBirthMeta =
      const VerificationMeta('dayOfBirth');
  @override
  late final GeneratedColumn<int> dayOfBirth = GeneratedColumn<int>(
      'day_of_birth', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subjectPronounMeta =
      const VerificationMeta('subjectPronoun');
  @override
  late final GeneratedColumn<String> subjectPronoun = GeneratedColumn<String>(
      'subject_pronoun', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _objectPronounMeta =
      const VerificationMeta('objectPronoun');
  @override
  late final GeneratedColumn<String> objectPronoun = GeneratedColumn<String>(
      'object_pronoun', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _possessivePronounMeta =
      const VerificationMeta('possessivePronoun');
  @override
  late final GeneratedColumn<String> possessivePronoun =
      GeneratedColumn<String>('possessive_pronoun', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sexualityMeta =
      const VerificationMeta('sexuality');
  @override
  late final GeneratedColumn<String> sexuality = GeneratedColumn<String>(
      'sexuality', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currentStateMeta =
      const VerificationMeta('currentState');
  @override
  late final GeneratedColumn<String> currentState = GeneratedColumn<String>(
      'current_state', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currentCountryMeta =
      const VerificationMeta('currentCountry');
  @override
  late final GeneratedColumn<String> currentCountry = GeneratedColumn<String>(
      'current_country', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _birthStateMeta =
      const VerificationMeta('birthState');
  @override
  late final GeneratedColumn<String> birthState = GeneratedColumn<String>(
      'birth_state', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _birthCountryMeta =
      const VerificationMeta('birthCountry');
  @override
  late final GeneratedColumn<String> birthCountry = GeneratedColumn<String>(
      'birth_country', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _moneyMeta = const VerificationMeta('money');
  @override
  late final GeneratedColumn<int> money = GeneratedColumn<int>(
      'money', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _zodiacSignMeta =
      const VerificationMeta('zodiacSign');
  @override
  late final GeneratedColumn<String> zodiacSign = GeneratedColumn<String>(
      'zodiac_sign', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hasDriversLicenseMeta =
      const VerificationMeta('hasDriversLicense');
  @override
  late final GeneratedColumn<bool> hasDriversLicense =
      GeneratedColumn<bool>('has_drivers_license', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("has_drivers_license" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _transportModeMeta =
      const VerificationMeta('transportMode');
  @override
  late final GeneratedColumn<String> transportMode = GeneratedColumn<String>(
      'transport_mode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hasFertilityIssuesMeta =
      const VerificationMeta('hasFertilityIssues');
  @override
  late final GeneratedColumn<bool> hasFertilityIssues =
      GeneratedColumn<bool>('has_fertility_issues', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("has_fertility_issues" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _onBirthControlMeta =
      const VerificationMeta('onBirthControl');
  @override
  late final GeneratedColumn<bool> onBirthControl =
      GeneratedColumn<bool>('on_birth_control', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("on_birth_control" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _isSterileMeta =
      const VerificationMeta('isSterile');
  @override
  late final GeneratedColumn<bool> isSterile =
      GeneratedColumn<bool>('is_sterile', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_sterile" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _sicklyMeta = const VerificationMeta('sickly');
  @override
  late final GeneratedColumn<bool> sickly =
      GeneratedColumn<bool>('sickly', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("sickly" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _rebelliousMeta =
      const VerificationMeta('rebellious');
  @override
  late final GeneratedColumn<bool> rebellious =
      GeneratedColumn<bool>('rebellious', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("rebellious" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _deadMeta = const VerificationMeta('dead');
  @override
  late final GeneratedColumn<bool> dead =
      GeneratedColumn<bool>('dead', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("dead" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        gameId,
        firstName,
        lastName,
        dayOfBirth,
        gender,
        subjectPronoun,
        objectPronoun,
        possessivePronoun,
        sexuality,
        currentState,
        currentCountry,
        birthState,
        birthCountry,
        money,
        zodiacSign,
        hasDriversLicense,
        transportMode,
        hasFertilityIssues,
        onBirthControl,
        isSterile,
        sickly,
        rebellious,
        dead
      ];
  @override
  String get aliasedName => _alias ?? 'person';
  @override
  String get actualTableName => 'person';
  @override
  VerificationContext validateIntegrity(Insertable<Person> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('game_id')) {
      context.handle(_gameIdMeta,
          gameId.isAcceptableOrUnknown(data['game_id']!, _gameIdMeta));
    } else if (isInserting) {
      context.missing(_gameIdMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('day_of_birth')) {
      context.handle(
          _dayOfBirthMeta,
          dayOfBirth.isAcceptableOrUnknown(
              data['day_of_birth']!, _dayOfBirthMeta));
    } else if (isInserting) {
      context.missing(_dayOfBirthMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('subject_pronoun')) {
      context.handle(
          _subjectPronounMeta,
          subjectPronoun.isAcceptableOrUnknown(
              data['subject_pronoun']!, _subjectPronounMeta));
    } else if (isInserting) {
      context.missing(_subjectPronounMeta);
    }
    if (data.containsKey('object_pronoun')) {
      context.handle(
          _objectPronounMeta,
          objectPronoun.isAcceptableOrUnknown(
              data['object_pronoun']!, _objectPronounMeta));
    } else if (isInserting) {
      context.missing(_objectPronounMeta);
    }
    if (data.containsKey('possessive_pronoun')) {
      context.handle(
          _possessivePronounMeta,
          possessivePronoun.isAcceptableOrUnknown(
              data['possessive_pronoun']!, _possessivePronounMeta));
    } else if (isInserting) {
      context.missing(_possessivePronounMeta);
    }
    if (data.containsKey('sexuality')) {
      context.handle(_sexualityMeta,
          sexuality.isAcceptableOrUnknown(data['sexuality']!, _sexualityMeta));
    } else if (isInserting) {
      context.missing(_sexualityMeta);
    }
    if (data.containsKey('current_state')) {
      context.handle(
          _currentStateMeta,
          currentState.isAcceptableOrUnknown(
              data['current_state']!, _currentStateMeta));
    } else if (isInserting) {
      context.missing(_currentStateMeta);
    }
    if (data.containsKey('current_country')) {
      context.handle(
          _currentCountryMeta,
          currentCountry.isAcceptableOrUnknown(
              data['current_country']!, _currentCountryMeta));
    } else if (isInserting) {
      context.missing(_currentCountryMeta);
    }
    if (data.containsKey('birth_state')) {
      context.handle(
          _birthStateMeta,
          birthState.isAcceptableOrUnknown(
              data['birth_state']!, _birthStateMeta));
    } else if (isInserting) {
      context.missing(_birthStateMeta);
    }
    if (data.containsKey('birth_country')) {
      context.handle(
          _birthCountryMeta,
          birthCountry.isAcceptableOrUnknown(
              data['birth_country']!, _birthCountryMeta));
    } else if (isInserting) {
      context.missing(_birthCountryMeta);
    }
    if (data.containsKey('money')) {
      context.handle(
          _moneyMeta, money.isAcceptableOrUnknown(data['money']!, _moneyMeta));
    } else if (isInserting) {
      context.missing(_moneyMeta);
    }
    if (data.containsKey('zodiac_sign')) {
      context.handle(
          _zodiacSignMeta,
          zodiacSign.isAcceptableOrUnknown(
              data['zodiac_sign']!, _zodiacSignMeta));
    } else if (isInserting) {
      context.missing(_zodiacSignMeta);
    }
    if (data.containsKey('has_drivers_license')) {
      context.handle(
          _hasDriversLicenseMeta,
          hasDriversLicense.isAcceptableOrUnknown(
              data['has_drivers_license']!, _hasDriversLicenseMeta));
    } else if (isInserting) {
      context.missing(_hasDriversLicenseMeta);
    }
    if (data.containsKey('transport_mode')) {
      context.handle(
          _transportModeMeta,
          transportMode.isAcceptableOrUnknown(
              data['transport_mode']!, _transportModeMeta));
    } else if (isInserting) {
      context.missing(_transportModeMeta);
    }
    if (data.containsKey('has_fertility_issues')) {
      context.handle(
          _hasFertilityIssuesMeta,
          hasFertilityIssues.isAcceptableOrUnknown(
              data['has_fertility_issues']!, _hasFertilityIssuesMeta));
    } else if (isInserting) {
      context.missing(_hasFertilityIssuesMeta);
    }
    if (data.containsKey('on_birth_control')) {
      context.handle(
          _onBirthControlMeta,
          onBirthControl.isAcceptableOrUnknown(
              data['on_birth_control']!, _onBirthControlMeta));
    } else if (isInserting) {
      context.missing(_onBirthControlMeta);
    }
    if (data.containsKey('is_sterile')) {
      context.handle(_isSterileMeta,
          isSterile.isAcceptableOrUnknown(data['is_sterile']!, _isSterileMeta));
    } else if (isInserting) {
      context.missing(_isSterileMeta);
    }
    if (data.containsKey('sickly')) {
      context.handle(_sicklyMeta,
          sickly.isAcceptableOrUnknown(data['sickly']!, _sicklyMeta));
    } else if (isInserting) {
      context.missing(_sicklyMeta);
    }
    if (data.containsKey('rebellious')) {
      context.handle(
          _rebelliousMeta,
          rebellious.isAcceptableOrUnknown(
              data['rebellious']!, _rebelliousMeta));
    } else if (isInserting) {
      context.missing(_rebelliousMeta);
    }
    if (data.containsKey('dead')) {
      context.handle(
          _deadMeta, dead.isAcceptableOrUnknown(data['dead']!, _deadMeta));
    } else if (isInserting) {
      context.missing(_deadMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Person map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Person(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      gameId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}game_id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      dayOfBirth: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_of_birth'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
      subjectPronoun: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}subject_pronoun'])!,
      objectPronoun: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}object_pronoun'])!,
      possessivePronoun: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}possessive_pronoun'])!,
      sexuality: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sexuality'])!,
      currentState: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}current_state'])!,
      currentCountry: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}current_country'])!,
      birthState: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}birth_state'])!,
      birthCountry: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}birth_country'])!,
      money: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}money'])!,
      zodiacSign: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}zodiac_sign'])!,
      hasDriversLicense: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}has_drivers_license'])!,
      transportMode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}transport_mode'])!,
      hasFertilityIssues: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}has_fertility_issues'])!,
      onBirthControl: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}on_birth_control'])!,
      isSterile: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_sterile'])!,
      sickly: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sickly'])!,
      rebellious: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}rebellious'])!,
      dead: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}dead'])!,
    );
  }

  @override
  $PersonTableTable createAlias(String alias) {
    return $PersonTableTable(attachedDatabase, alias);
  }
}

class Person extends DataClass implements Insertable<Person> {
  final int id;
  final int gameId;
  final String firstName;
  final String lastName;
  final int dayOfBirth;
  final String gender;
  final String subjectPronoun;
  final String objectPronoun;
  final String possessivePronoun;
  final String sexuality;
  final String currentState;
  final String currentCountry;
  final String birthState;
  final String birthCountry;
  final int money;
  final String zodiacSign;
  final bool hasDriversLicense;
  final String transportMode;
  final bool hasFertilityIssues;
  final bool onBirthControl;
  final bool isSterile;
  final bool sickly;
  final bool rebellious;
  final bool dead;
  const Person(
      {required this.id,
      required this.gameId,
      required this.firstName,
      required this.lastName,
      required this.dayOfBirth,
      required this.gender,
      required this.subjectPronoun,
      required this.objectPronoun,
      required this.possessivePronoun,
      required this.sexuality,
      required this.currentState,
      required this.currentCountry,
      required this.birthState,
      required this.birthCountry,
      required this.money,
      required this.zodiacSign,
      required this.hasDriversLicense,
      required this.transportMode,
      required this.hasFertilityIssues,
      required this.onBirthControl,
      required this.isSterile,
      required this.sickly,
      required this.rebellious,
      required this.dead});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['game_id'] = Variable<int>(gameId);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['day_of_birth'] = Variable<int>(dayOfBirth);
    map['gender'] = Variable<String>(gender);
    map['subject_pronoun'] = Variable<String>(subjectPronoun);
    map['object_pronoun'] = Variable<String>(objectPronoun);
    map['possessive_pronoun'] = Variable<String>(possessivePronoun);
    map['sexuality'] = Variable<String>(sexuality);
    map['current_state'] = Variable<String>(currentState);
    map['current_country'] = Variable<String>(currentCountry);
    map['birth_state'] = Variable<String>(birthState);
    map['birth_country'] = Variable<String>(birthCountry);
    map['money'] = Variable<int>(money);
    map['zodiac_sign'] = Variable<String>(zodiacSign);
    map['has_drivers_license'] = Variable<bool>(hasDriversLicense);
    map['transport_mode'] = Variable<String>(transportMode);
    map['has_fertility_issues'] = Variable<bool>(hasFertilityIssues);
    map['on_birth_control'] = Variable<bool>(onBirthControl);
    map['is_sterile'] = Variable<bool>(isSterile);
    map['sickly'] = Variable<bool>(sickly);
    map['rebellious'] = Variable<bool>(rebellious);
    map['dead'] = Variable<bool>(dead);
    return map;
  }

  PersonTableCompanion toCompanion(bool nullToAbsent) {
    return PersonTableCompanion(
      id: Value(id),
      gameId: Value(gameId),
      firstName: Value(firstName),
      lastName: Value(lastName),
      dayOfBirth: Value(dayOfBirth),
      gender: Value(gender),
      subjectPronoun: Value(subjectPronoun),
      objectPronoun: Value(objectPronoun),
      possessivePronoun: Value(possessivePronoun),
      sexuality: Value(sexuality),
      currentState: Value(currentState),
      currentCountry: Value(currentCountry),
      birthState: Value(birthState),
      birthCountry: Value(birthCountry),
      money: Value(money),
      zodiacSign: Value(zodiacSign),
      hasDriversLicense: Value(hasDriversLicense),
      transportMode: Value(transportMode),
      hasFertilityIssues: Value(hasFertilityIssues),
      onBirthControl: Value(onBirthControl),
      isSterile: Value(isSterile),
      sickly: Value(sickly),
      rebellious: Value(rebellious),
      dead: Value(dead),
    );
  }

  factory Person.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Person(
      id: serializer.fromJson<int>(json['id']),
      gameId: serializer.fromJson<int>(json['gameId']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      dayOfBirth: serializer.fromJson<int>(json['dayOfBirth']),
      gender: serializer.fromJson<String>(json['gender']),
      subjectPronoun: serializer.fromJson<String>(json['subjectPronoun']),
      objectPronoun: serializer.fromJson<String>(json['objectPronoun']),
      possessivePronoun: serializer.fromJson<String>(json['possessivePronoun']),
      sexuality: serializer.fromJson<String>(json['sexuality']),
      currentState: serializer.fromJson<String>(json['currentState']),
      currentCountry: serializer.fromJson<String>(json['currentCountry']),
      birthState: serializer.fromJson<String>(json['birthState']),
      birthCountry: serializer.fromJson<String>(json['birthCountry']),
      money: serializer.fromJson<int>(json['money']),
      zodiacSign: serializer.fromJson<String>(json['zodiacSign']),
      hasDriversLicense: serializer.fromJson<bool>(json['hasDriversLicense']),
      transportMode: serializer.fromJson<String>(json['transportMode']),
      hasFertilityIssues: serializer.fromJson<bool>(json['hasFertilityIssues']),
      onBirthControl: serializer.fromJson<bool>(json['onBirthControl']),
      isSterile: serializer.fromJson<bool>(json['isSterile']),
      sickly: serializer.fromJson<bool>(json['sickly']),
      rebellious: serializer.fromJson<bool>(json['rebellious']),
      dead: serializer.fromJson<bool>(json['dead']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameId': serializer.toJson<int>(gameId),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'dayOfBirth': serializer.toJson<int>(dayOfBirth),
      'gender': serializer.toJson<String>(gender),
      'subjectPronoun': serializer.toJson<String>(subjectPronoun),
      'objectPronoun': serializer.toJson<String>(objectPronoun),
      'possessivePronoun': serializer.toJson<String>(possessivePronoun),
      'sexuality': serializer.toJson<String>(sexuality),
      'currentState': serializer.toJson<String>(currentState),
      'currentCountry': serializer.toJson<String>(currentCountry),
      'birthState': serializer.toJson<String>(birthState),
      'birthCountry': serializer.toJson<String>(birthCountry),
      'money': serializer.toJson<int>(money),
      'zodiacSign': serializer.toJson<String>(zodiacSign),
      'hasDriversLicense': serializer.toJson<bool>(hasDriversLicense),
      'transportMode': serializer.toJson<String>(transportMode),
      'hasFertilityIssues': serializer.toJson<bool>(hasFertilityIssues),
      'onBirthControl': serializer.toJson<bool>(onBirthControl),
      'isSterile': serializer.toJson<bool>(isSterile),
      'sickly': serializer.toJson<bool>(sickly),
      'rebellious': serializer.toJson<bool>(rebellious),
      'dead': serializer.toJson<bool>(dead),
    };
  }

  Person copyWith(
          {int? id,
          int? gameId,
          String? firstName,
          String? lastName,
          int? dayOfBirth,
          String? gender,
          String? subjectPronoun,
          String? objectPronoun,
          String? possessivePronoun,
          String? sexuality,
          String? currentState,
          String? currentCountry,
          String? birthState,
          String? birthCountry,
          int? money,
          String? zodiacSign,
          bool? hasDriversLicense,
          String? transportMode,
          bool? hasFertilityIssues,
          bool? onBirthControl,
          bool? isSterile,
          bool? sickly,
          bool? rebellious,
          bool? dead}) =>
      Person(
        id: id ?? this.id,
        gameId: gameId ?? this.gameId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        dayOfBirth: dayOfBirth ?? this.dayOfBirth,
        gender: gender ?? this.gender,
        subjectPronoun: subjectPronoun ?? this.subjectPronoun,
        objectPronoun: objectPronoun ?? this.objectPronoun,
        possessivePronoun: possessivePronoun ?? this.possessivePronoun,
        sexuality: sexuality ?? this.sexuality,
        currentState: currentState ?? this.currentState,
        currentCountry: currentCountry ?? this.currentCountry,
        birthState: birthState ?? this.birthState,
        birthCountry: birthCountry ?? this.birthCountry,
        money: money ?? this.money,
        zodiacSign: zodiacSign ?? this.zodiacSign,
        hasDriversLicense: hasDriversLicense ?? this.hasDriversLicense,
        transportMode: transportMode ?? this.transportMode,
        hasFertilityIssues: hasFertilityIssues ?? this.hasFertilityIssues,
        onBirthControl: onBirthControl ?? this.onBirthControl,
        isSterile: isSterile ?? this.isSterile,
        sickly: sickly ?? this.sickly,
        rebellious: rebellious ?? this.rebellious,
        dead: dead ?? this.dead,
      );
  @override
  String toString() {
    return (StringBuffer('Person(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('dayOfBirth: $dayOfBirth, ')
          ..write('gender: $gender, ')
          ..write('subjectPronoun: $subjectPronoun, ')
          ..write('objectPronoun: $objectPronoun, ')
          ..write('possessivePronoun: $possessivePronoun, ')
          ..write('sexuality: $sexuality, ')
          ..write('currentState: $currentState, ')
          ..write('currentCountry: $currentCountry, ')
          ..write('birthState: $birthState, ')
          ..write('birthCountry: $birthCountry, ')
          ..write('money: $money, ')
          ..write('zodiacSign: $zodiacSign, ')
          ..write('hasDriversLicense: $hasDriversLicense, ')
          ..write('transportMode: $transportMode, ')
          ..write('hasFertilityIssues: $hasFertilityIssues, ')
          ..write('onBirthControl: $onBirthControl, ')
          ..write('isSterile: $isSterile, ')
          ..write('sickly: $sickly, ')
          ..write('rebellious: $rebellious, ')
          ..write('dead: $dead')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        gameId,
        firstName,
        lastName,
        dayOfBirth,
        gender,
        subjectPronoun,
        objectPronoun,
        possessivePronoun,
        sexuality,
        currentState,
        currentCountry,
        birthState,
        birthCountry,
        money,
        zodiacSign,
        hasDriversLicense,
        transportMode,
        hasFertilityIssues,
        onBirthControl,
        isSterile,
        sickly,
        rebellious,
        dead
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Person &&
          other.id == this.id &&
          other.gameId == this.gameId &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.dayOfBirth == this.dayOfBirth &&
          other.gender == this.gender &&
          other.subjectPronoun == this.subjectPronoun &&
          other.objectPronoun == this.objectPronoun &&
          other.possessivePronoun == this.possessivePronoun &&
          other.sexuality == this.sexuality &&
          other.currentState == this.currentState &&
          other.currentCountry == this.currentCountry &&
          other.birthState == this.birthState &&
          other.birthCountry == this.birthCountry &&
          other.money == this.money &&
          other.zodiacSign == this.zodiacSign &&
          other.hasDriversLicense == this.hasDriversLicense &&
          other.transportMode == this.transportMode &&
          other.hasFertilityIssues == this.hasFertilityIssues &&
          other.onBirthControl == this.onBirthControl &&
          other.isSterile == this.isSterile &&
          other.sickly == this.sickly &&
          other.rebellious == this.rebellious &&
          other.dead == this.dead);
}

class PersonTableCompanion extends UpdateCompanion<Person> {
  final Value<int> id;
  final Value<int> gameId;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<int> dayOfBirth;
  final Value<String> gender;
  final Value<String> subjectPronoun;
  final Value<String> objectPronoun;
  final Value<String> possessivePronoun;
  final Value<String> sexuality;
  final Value<String> currentState;
  final Value<String> currentCountry;
  final Value<String> birthState;
  final Value<String> birthCountry;
  final Value<int> money;
  final Value<String> zodiacSign;
  final Value<bool> hasDriversLicense;
  final Value<String> transportMode;
  final Value<bool> hasFertilityIssues;
  final Value<bool> onBirthControl;
  final Value<bool> isSterile;
  final Value<bool> sickly;
  final Value<bool> rebellious;
  final Value<bool> dead;
  const PersonTableCompanion({
    this.id = const Value.absent(),
    this.gameId = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.dayOfBirth = const Value.absent(),
    this.gender = const Value.absent(),
    this.subjectPronoun = const Value.absent(),
    this.objectPronoun = const Value.absent(),
    this.possessivePronoun = const Value.absent(),
    this.sexuality = const Value.absent(),
    this.currentState = const Value.absent(),
    this.currentCountry = const Value.absent(),
    this.birthState = const Value.absent(),
    this.birthCountry = const Value.absent(),
    this.money = const Value.absent(),
    this.zodiacSign = const Value.absent(),
    this.hasDriversLicense = const Value.absent(),
    this.transportMode = const Value.absent(),
    this.hasFertilityIssues = const Value.absent(),
    this.onBirthControl = const Value.absent(),
    this.isSterile = const Value.absent(),
    this.sickly = const Value.absent(),
    this.rebellious = const Value.absent(),
    this.dead = const Value.absent(),
  });
  PersonTableCompanion.insert({
    this.id = const Value.absent(),
    required int gameId,
    required String firstName,
    required String lastName,
    required int dayOfBirth,
    required String gender,
    required String subjectPronoun,
    required String objectPronoun,
    required String possessivePronoun,
    required String sexuality,
    required String currentState,
    required String currentCountry,
    required String birthState,
    required String birthCountry,
    required int money,
    required String zodiacSign,
    required bool hasDriversLicense,
    required String transportMode,
    required bool hasFertilityIssues,
    required bool onBirthControl,
    required bool isSterile,
    required bool sickly,
    required bool rebellious,
    required bool dead,
  })  : gameId = Value(gameId),
        firstName = Value(firstName),
        lastName = Value(lastName),
        dayOfBirth = Value(dayOfBirth),
        gender = Value(gender),
        subjectPronoun = Value(subjectPronoun),
        objectPronoun = Value(objectPronoun),
        possessivePronoun = Value(possessivePronoun),
        sexuality = Value(sexuality),
        currentState = Value(currentState),
        currentCountry = Value(currentCountry),
        birthState = Value(birthState),
        birthCountry = Value(birthCountry),
        money = Value(money),
        zodiacSign = Value(zodiacSign),
        hasDriversLicense = Value(hasDriversLicense),
        transportMode = Value(transportMode),
        hasFertilityIssues = Value(hasFertilityIssues),
        onBirthControl = Value(onBirthControl),
        isSterile = Value(isSterile),
        sickly = Value(sickly),
        rebellious = Value(rebellious),
        dead = Value(dead);
  static Insertable<Person> custom({
    Expression<int>? id,
    Expression<int>? gameId,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<int>? dayOfBirth,
    Expression<String>? gender,
    Expression<String>? subjectPronoun,
    Expression<String>? objectPronoun,
    Expression<String>? possessivePronoun,
    Expression<String>? sexuality,
    Expression<String>? currentState,
    Expression<String>? currentCountry,
    Expression<String>? birthState,
    Expression<String>? birthCountry,
    Expression<int>? money,
    Expression<String>? zodiacSign,
    Expression<bool>? hasDriversLicense,
    Expression<String>? transportMode,
    Expression<bool>? hasFertilityIssues,
    Expression<bool>? onBirthControl,
    Expression<bool>? isSterile,
    Expression<bool>? sickly,
    Expression<bool>? rebellious,
    Expression<bool>? dead,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameId != null) 'game_id': gameId,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (dayOfBirth != null) 'day_of_birth': dayOfBirth,
      if (gender != null) 'gender': gender,
      if (subjectPronoun != null) 'subject_pronoun': subjectPronoun,
      if (objectPronoun != null) 'object_pronoun': objectPronoun,
      if (possessivePronoun != null) 'possessive_pronoun': possessivePronoun,
      if (sexuality != null) 'sexuality': sexuality,
      if (currentState != null) 'current_state': currentState,
      if (currentCountry != null) 'current_country': currentCountry,
      if (birthState != null) 'birth_state': birthState,
      if (birthCountry != null) 'birth_country': birthCountry,
      if (money != null) 'money': money,
      if (zodiacSign != null) 'zodiac_sign': zodiacSign,
      if (hasDriversLicense != null) 'has_drivers_license': hasDriversLicense,
      if (transportMode != null) 'transport_mode': transportMode,
      if (hasFertilityIssues != null)
        'has_fertility_issues': hasFertilityIssues,
      if (onBirthControl != null) 'on_birth_control': onBirthControl,
      if (isSterile != null) 'is_sterile': isSterile,
      if (sickly != null) 'sickly': sickly,
      if (rebellious != null) 'rebellious': rebellious,
      if (dead != null) 'dead': dead,
    });
  }

  PersonTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? gameId,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<int>? dayOfBirth,
      Value<String>? gender,
      Value<String>? subjectPronoun,
      Value<String>? objectPronoun,
      Value<String>? possessivePronoun,
      Value<String>? sexuality,
      Value<String>? currentState,
      Value<String>? currentCountry,
      Value<String>? birthState,
      Value<String>? birthCountry,
      Value<int>? money,
      Value<String>? zodiacSign,
      Value<bool>? hasDriversLicense,
      Value<String>? transportMode,
      Value<bool>? hasFertilityIssues,
      Value<bool>? onBirthControl,
      Value<bool>? isSterile,
      Value<bool>? sickly,
      Value<bool>? rebellious,
      Value<bool>? dead}) {
    return PersonTableCompanion(
      id: id ?? this.id,
      gameId: gameId ?? this.gameId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dayOfBirth: dayOfBirth ?? this.dayOfBirth,
      gender: gender ?? this.gender,
      subjectPronoun: subjectPronoun ?? this.subjectPronoun,
      objectPronoun: objectPronoun ?? this.objectPronoun,
      possessivePronoun: possessivePronoun ?? this.possessivePronoun,
      sexuality: sexuality ?? this.sexuality,
      currentState: currentState ?? this.currentState,
      currentCountry: currentCountry ?? this.currentCountry,
      birthState: birthState ?? this.birthState,
      birthCountry: birthCountry ?? this.birthCountry,
      money: money ?? this.money,
      zodiacSign: zodiacSign ?? this.zodiacSign,
      hasDriversLicense: hasDriversLicense ?? this.hasDriversLicense,
      transportMode: transportMode ?? this.transportMode,
      hasFertilityIssues: hasFertilityIssues ?? this.hasFertilityIssues,
      onBirthControl: onBirthControl ?? this.onBirthControl,
      isSterile: isSterile ?? this.isSterile,
      sickly: sickly ?? this.sickly,
      rebellious: rebellious ?? this.rebellious,
      dead: dead ?? this.dead,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gameId.present) {
      map['game_id'] = Variable<int>(gameId.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (dayOfBirth.present) {
      map['day_of_birth'] = Variable<int>(dayOfBirth.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (subjectPronoun.present) {
      map['subject_pronoun'] = Variable<String>(subjectPronoun.value);
    }
    if (objectPronoun.present) {
      map['object_pronoun'] = Variable<String>(objectPronoun.value);
    }
    if (possessivePronoun.present) {
      map['possessive_pronoun'] = Variable<String>(possessivePronoun.value);
    }
    if (sexuality.present) {
      map['sexuality'] = Variable<String>(sexuality.value);
    }
    if (currentState.present) {
      map['current_state'] = Variable<String>(currentState.value);
    }
    if (currentCountry.present) {
      map['current_country'] = Variable<String>(currentCountry.value);
    }
    if (birthState.present) {
      map['birth_state'] = Variable<String>(birthState.value);
    }
    if (birthCountry.present) {
      map['birth_country'] = Variable<String>(birthCountry.value);
    }
    if (money.present) {
      map['money'] = Variable<int>(money.value);
    }
    if (zodiacSign.present) {
      map['zodiac_sign'] = Variable<String>(zodiacSign.value);
    }
    if (hasDriversLicense.present) {
      map['has_drivers_license'] = Variable<bool>(hasDriversLicense.value);
    }
    if (transportMode.present) {
      map['transport_mode'] = Variable<String>(transportMode.value);
    }
    if (hasFertilityIssues.present) {
      map['has_fertility_issues'] = Variable<bool>(hasFertilityIssues.value);
    }
    if (onBirthControl.present) {
      map['on_birth_control'] = Variable<bool>(onBirthControl.value);
    }
    if (isSterile.present) {
      map['is_sterile'] = Variable<bool>(isSterile.value);
    }
    if (sickly.present) {
      map['sickly'] = Variable<bool>(sickly.value);
    }
    if (rebellious.present) {
      map['rebellious'] = Variable<bool>(rebellious.value);
    }
    if (dead.present) {
      map['dead'] = Variable<bool>(dead.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonTableCompanion(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('dayOfBirth: $dayOfBirth, ')
          ..write('gender: $gender, ')
          ..write('subjectPronoun: $subjectPronoun, ')
          ..write('objectPronoun: $objectPronoun, ')
          ..write('possessivePronoun: $possessivePronoun, ')
          ..write('sexuality: $sexuality, ')
          ..write('currentState: $currentState, ')
          ..write('currentCountry: $currentCountry, ')
          ..write('birthState: $birthState, ')
          ..write('birthCountry: $birthCountry, ')
          ..write('money: $money, ')
          ..write('zodiacSign: $zodiacSign, ')
          ..write('hasDriversLicense: $hasDriversLicense, ')
          ..write('transportMode: $transportMode, ')
          ..write('hasFertilityIssues: $hasFertilityIssues, ')
          ..write('onBirthControl: $onBirthControl, ')
          ..write('isSterile: $isSterile, ')
          ..write('sickly: $sickly, ')
          ..write('rebellious: $rebellious, ')
          ..write('dead: $dead')
          ..write(')'))
        .toString();
  }
}

class $StatsTableTable extends StatsTable
    with TableInfo<$StatsTableTable, Stats> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StatsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _personIdMeta =
      const VerificationMeta('personId');
  @override
  late final GeneratedColumn<int> personId = GeneratedColumn<int>(
      'person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _energyMeta = const VerificationMeta('energy');
  @override
  late final GeneratedColumn<int> energy = GeneratedColumn<int>(
      'energy', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _hungerMeta = const VerificationMeta('hunger');
  @override
  late final GeneratedColumn<int> hunger = GeneratedColumn<int>(
      'hunger', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _wellbeingMeta =
      const VerificationMeta('wellbeing');
  @override
  late final GeneratedColumn<int> wellbeing = GeneratedColumn<int>(
      'wellbeing', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _soberMeta = const VerificationMeta('sober');
  @override
  late final GeneratedColumn<int> sober = GeneratedColumn<int>(
      'sober', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _looksMeta = const VerificationMeta('looks');
  @override
  late final GeneratedColumn<int> looks = GeneratedColumn<int>(
      'looks', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _athleticismMeta =
      const VerificationMeta('athleticism');
  @override
  late final GeneratedColumn<int> athleticism = GeneratedColumn<int>(
      'athleticism', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _intellectMeta =
      const VerificationMeta('intellect');
  @override
  late final GeneratedColumn<int> intellect = GeneratedColumn<int>(
      'intellect', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        personId,
        energy,
        hunger,
        wellbeing,
        sober,
        looks,
        athleticism,
        intellect
      ];
  @override
  String get aliasedName => _alias ?? 'stats';
  @override
  String get actualTableName => 'stats';
  @override
  VerificationContext validateIntegrity(Insertable<Stats> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('person_id')) {
      context.handle(_personIdMeta,
          personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta));
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('energy')) {
      context.handle(_energyMeta,
          energy.isAcceptableOrUnknown(data['energy']!, _energyMeta));
    } else if (isInserting) {
      context.missing(_energyMeta);
    }
    if (data.containsKey('hunger')) {
      context.handle(_hungerMeta,
          hunger.isAcceptableOrUnknown(data['hunger']!, _hungerMeta));
    } else if (isInserting) {
      context.missing(_hungerMeta);
    }
    if (data.containsKey('wellbeing')) {
      context.handle(_wellbeingMeta,
          wellbeing.isAcceptableOrUnknown(data['wellbeing']!, _wellbeingMeta));
    } else if (isInserting) {
      context.missing(_wellbeingMeta);
    }
    if (data.containsKey('sober')) {
      context.handle(
          _soberMeta, sober.isAcceptableOrUnknown(data['sober']!, _soberMeta));
    } else if (isInserting) {
      context.missing(_soberMeta);
    }
    if (data.containsKey('looks')) {
      context.handle(
          _looksMeta, looks.isAcceptableOrUnknown(data['looks']!, _looksMeta));
    } else if (isInserting) {
      context.missing(_looksMeta);
    }
    if (data.containsKey('athleticism')) {
      context.handle(
          _athleticismMeta,
          athleticism.isAcceptableOrUnknown(
              data['athleticism']!, _athleticismMeta));
    } else if (isInserting) {
      context.missing(_athleticismMeta);
    }
    if (data.containsKey('intellect')) {
      context.handle(_intellectMeta,
          intellect.isAcceptableOrUnknown(data['intellect']!, _intellectMeta));
    } else if (isInserting) {
      context.missing(_intellectMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Stats map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Stats(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id'])!,
      energy: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}energy'])!,
      hunger: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hunger'])!,
      wellbeing: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wellbeing'])!,
      sober: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sober'])!,
      looks: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}looks'])!,
      athleticism: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}athleticism'])!,
      intellect: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}intellect'])!,
    );
  }

  @override
  $StatsTableTable createAlias(String alias) {
    return $StatsTableTable(attachedDatabase, alias);
  }
}

class Stats extends DataClass implements Insertable<Stats> {
  final int id;
  final int personId;
  final int energy;
  final int hunger;
  final int wellbeing;
  final int sober;
  final int looks;
  final int athleticism;
  final int intellect;
  const Stats(
      {required this.id,
      required this.personId,
      required this.energy,
      required this.hunger,
      required this.wellbeing,
      required this.sober,
      required this.looks,
      required this.athleticism,
      required this.intellect});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['person_id'] = Variable<int>(personId);
    map['energy'] = Variable<int>(energy);
    map['hunger'] = Variable<int>(hunger);
    map['wellbeing'] = Variable<int>(wellbeing);
    map['sober'] = Variable<int>(sober);
    map['looks'] = Variable<int>(looks);
    map['athleticism'] = Variable<int>(athleticism);
    map['intellect'] = Variable<int>(intellect);
    return map;
  }

  StatsTableCompanion toCompanion(bool nullToAbsent) {
    return StatsTableCompanion(
      id: Value(id),
      personId: Value(personId),
      energy: Value(energy),
      hunger: Value(hunger),
      wellbeing: Value(wellbeing),
      sober: Value(sober),
      looks: Value(looks),
      athleticism: Value(athleticism),
      intellect: Value(intellect),
    );
  }

  factory Stats.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Stats(
      id: serializer.fromJson<int>(json['id']),
      personId: serializer.fromJson<int>(json['personId']),
      energy: serializer.fromJson<int>(json['energy']),
      hunger: serializer.fromJson<int>(json['hunger']),
      wellbeing: serializer.fromJson<int>(json['wellbeing']),
      sober: serializer.fromJson<int>(json['sober']),
      looks: serializer.fromJson<int>(json['looks']),
      athleticism: serializer.fromJson<int>(json['athleticism']),
      intellect: serializer.fromJson<int>(json['intellect']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'personId': serializer.toJson<int>(personId),
      'energy': serializer.toJson<int>(energy),
      'hunger': serializer.toJson<int>(hunger),
      'wellbeing': serializer.toJson<int>(wellbeing),
      'sober': serializer.toJson<int>(sober),
      'looks': serializer.toJson<int>(looks),
      'athleticism': serializer.toJson<int>(athleticism),
      'intellect': serializer.toJson<int>(intellect),
    };
  }

  Stats copyWith(
          {int? id,
          int? personId,
          int? energy,
          int? hunger,
          int? wellbeing,
          int? sober,
          int? looks,
          int? athleticism,
          int? intellect}) =>
      Stats(
        id: id ?? this.id,
        personId: personId ?? this.personId,
        energy: energy ?? this.energy,
        hunger: hunger ?? this.hunger,
        wellbeing: wellbeing ?? this.wellbeing,
        sober: sober ?? this.sober,
        looks: looks ?? this.looks,
        athleticism: athleticism ?? this.athleticism,
        intellect: intellect ?? this.intellect,
      );
  @override
  String toString() {
    return (StringBuffer('Stats(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('energy: $energy, ')
          ..write('hunger: $hunger, ')
          ..write('wellbeing: $wellbeing, ')
          ..write('sober: $sober, ')
          ..write('looks: $looks, ')
          ..write('athleticism: $athleticism, ')
          ..write('intellect: $intellect')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, personId, energy, hunger, wellbeing,
      sober, looks, athleticism, intellect);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Stats &&
          other.id == this.id &&
          other.personId == this.personId &&
          other.energy == this.energy &&
          other.hunger == this.hunger &&
          other.wellbeing == this.wellbeing &&
          other.sober == this.sober &&
          other.looks == this.looks &&
          other.athleticism == this.athleticism &&
          other.intellect == this.intellect);
}

class StatsTableCompanion extends UpdateCompanion<Stats> {
  final Value<int> id;
  final Value<int> personId;
  final Value<int> energy;
  final Value<int> hunger;
  final Value<int> wellbeing;
  final Value<int> sober;
  final Value<int> looks;
  final Value<int> athleticism;
  final Value<int> intellect;
  const StatsTableCompanion({
    this.id = const Value.absent(),
    this.personId = const Value.absent(),
    this.energy = const Value.absent(),
    this.hunger = const Value.absent(),
    this.wellbeing = const Value.absent(),
    this.sober = const Value.absent(),
    this.looks = const Value.absent(),
    this.athleticism = const Value.absent(),
    this.intellect = const Value.absent(),
  });
  StatsTableCompanion.insert({
    this.id = const Value.absent(),
    required int personId,
    required int energy,
    required int hunger,
    required int wellbeing,
    required int sober,
    required int looks,
    required int athleticism,
    required int intellect,
  })  : personId = Value(personId),
        energy = Value(energy),
        hunger = Value(hunger),
        wellbeing = Value(wellbeing),
        sober = Value(sober),
        looks = Value(looks),
        athleticism = Value(athleticism),
        intellect = Value(intellect);
  static Insertable<Stats> custom({
    Expression<int>? id,
    Expression<int>? personId,
    Expression<int>? energy,
    Expression<int>? hunger,
    Expression<int>? wellbeing,
    Expression<int>? sober,
    Expression<int>? looks,
    Expression<int>? athleticism,
    Expression<int>? intellect,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (personId != null) 'person_id': personId,
      if (energy != null) 'energy': energy,
      if (hunger != null) 'hunger': hunger,
      if (wellbeing != null) 'wellbeing': wellbeing,
      if (sober != null) 'sober': sober,
      if (looks != null) 'looks': looks,
      if (athleticism != null) 'athleticism': athleticism,
      if (intellect != null) 'intellect': intellect,
    });
  }

  StatsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? personId,
      Value<int>? energy,
      Value<int>? hunger,
      Value<int>? wellbeing,
      Value<int>? sober,
      Value<int>? looks,
      Value<int>? athleticism,
      Value<int>? intellect}) {
    return StatsTableCompanion(
      id: id ?? this.id,
      personId: personId ?? this.personId,
      energy: energy ?? this.energy,
      hunger: hunger ?? this.hunger,
      wellbeing: wellbeing ?? this.wellbeing,
      sober: sober ?? this.sober,
      looks: looks ?? this.looks,
      athleticism: athleticism ?? this.athleticism,
      intellect: intellect ?? this.intellect,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<int>(personId.value);
    }
    if (energy.present) {
      map['energy'] = Variable<int>(energy.value);
    }
    if (hunger.present) {
      map['hunger'] = Variable<int>(hunger.value);
    }
    if (wellbeing.present) {
      map['wellbeing'] = Variable<int>(wellbeing.value);
    }
    if (sober.present) {
      map['sober'] = Variable<int>(sober.value);
    }
    if (looks.present) {
      map['looks'] = Variable<int>(looks.value);
    }
    if (athleticism.present) {
      map['athleticism'] = Variable<int>(athleticism.value);
    }
    if (intellect.present) {
      map['intellect'] = Variable<int>(intellect.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatsTableCompanion(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('energy: $energy, ')
          ..write('hunger: $hunger, ')
          ..write('wellbeing: $wellbeing, ')
          ..write('sober: $sober, ')
          ..write('looks: $looks, ')
          ..write('athleticism: $athleticism, ')
          ..write('intellect: $intellect')
          ..write(')'))
        .toString();
  }
}

class $StanceTableTable extends StanceTable
    with TableInfo<$StanceTableTable, Stance> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StanceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _personIdMeta =
      const VerificationMeta('personId');
  @override
  late final GeneratedColumn<int> personId = GeneratedColumn<int>(
      'person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _openToAdoptionMeta =
      const VerificationMeta('openToAdoption');
  @override
  late final GeneratedColumn<bool> openToAdoption =
      GeneratedColumn<bool>('open_to_adoption', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("open_to_adoption" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _openToSexWorkerPartnerMeta =
      const VerificationMeta('openToSexWorkerPartner');
  @override
  late final GeneratedColumn<bool> openToSexWorkerPartner =
      GeneratedColumn<bool>('open_to_sex_worker_partner', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("open_to_sex_worker_partner" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _openToAbortionMeta =
      const VerificationMeta('openToAbortion');
  @override
  late final GeneratedColumn<bool> openToAbortion =
      GeneratedColumn<bool>('open_to_abortion', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("open_to_abortion" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _openToSurrogacyMeta =
      const VerificationMeta('openToSurrogacy');
  @override
  late final GeneratedColumn<bool> openToSurrogacy =
      GeneratedColumn<bool>('open_to_surrogacy', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("open_to_surrogacy" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _openToAlternativeFertilityMethodsMeta =
      const VerificationMeta('openToAlternativeFertilityMethods');
  @override
  late final GeneratedColumn<bool> openToAlternativeFertilityMethods =
      GeneratedColumn<bool>(
          'open_to_alternative_fertility_methods', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite:
                'CHECK ("open_to_alternative_fertility_methods" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _openToSigningPrenupMeta =
      const VerificationMeta('openToSigningPrenup');
  @override
  late final GeneratedColumn<bool> openToSigningPrenup =
      GeneratedColumn<bool>('open_to_signing_prenup', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("open_to_signing_prenup" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _wantsPartnerToSignPrenupMeta =
      const VerificationMeta('wantsPartnerToSignPrenup');
  @override
  late final GeneratedColumn<bool> wantsPartnerToSignPrenup =
      GeneratedColumn<bool>('wants_partner_to_sign_prenup', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite:
                'CHECK ("wants_partner_to_sign_prenup" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _openToCrimesMeta =
      const VerificationMeta('openToCrimes');
  @override
  late final GeneratedColumn<bool> openToCrimes =
      GeneratedColumn<bool>('open_to_crimes', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("open_to_crimes" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _openToStayAtHomeParentingMeta =
      const VerificationMeta('openToStayAtHomeParenting');
  @override
  late final GeneratedColumn<bool> openToStayAtHomeParenting =
      GeneratedColumn<bool>(
          'open_to_stay_at_home_parenting', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite:
                'CHECK ("open_to_stay_at_home_parenting" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _openToPremaritalSexMeta =
      const VerificationMeta('openToPremaritalSex');
  @override
  late final GeneratedColumn<bool> openToPremaritalSex =
      GeneratedColumn<bool>('open_to_premarital_sex', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("open_to_premarital_sex" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        personId,
        openToAdoption,
        openToSexWorkerPartner,
        openToAbortion,
        openToSurrogacy,
        openToAlternativeFertilityMethods,
        openToSigningPrenup,
        wantsPartnerToSignPrenup,
        openToCrimes,
        openToStayAtHomeParenting,
        openToPremaritalSex
      ];
  @override
  String get aliasedName => _alias ?? 'stance';
  @override
  String get actualTableName => 'stance';
  @override
  VerificationContext validateIntegrity(Insertable<Stance> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('person_id')) {
      context.handle(_personIdMeta,
          personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta));
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('open_to_adoption')) {
      context.handle(
          _openToAdoptionMeta,
          openToAdoption.isAcceptableOrUnknown(
              data['open_to_adoption']!, _openToAdoptionMeta));
    } else if (isInserting) {
      context.missing(_openToAdoptionMeta);
    }
    if (data.containsKey('open_to_sex_worker_partner')) {
      context.handle(
          _openToSexWorkerPartnerMeta,
          openToSexWorkerPartner.isAcceptableOrUnknown(
              data['open_to_sex_worker_partner']!,
              _openToSexWorkerPartnerMeta));
    } else if (isInserting) {
      context.missing(_openToSexWorkerPartnerMeta);
    }
    if (data.containsKey('open_to_abortion')) {
      context.handle(
          _openToAbortionMeta,
          openToAbortion.isAcceptableOrUnknown(
              data['open_to_abortion']!, _openToAbortionMeta));
    } else if (isInserting) {
      context.missing(_openToAbortionMeta);
    }
    if (data.containsKey('open_to_surrogacy')) {
      context.handle(
          _openToSurrogacyMeta,
          openToSurrogacy.isAcceptableOrUnknown(
              data['open_to_surrogacy']!, _openToSurrogacyMeta));
    } else if (isInserting) {
      context.missing(_openToSurrogacyMeta);
    }
    if (data.containsKey('open_to_alternative_fertility_methods')) {
      context.handle(
          _openToAlternativeFertilityMethodsMeta,
          openToAlternativeFertilityMethods.isAcceptableOrUnknown(
              data['open_to_alternative_fertility_methods']!,
              _openToAlternativeFertilityMethodsMeta));
    } else if (isInserting) {
      context.missing(_openToAlternativeFertilityMethodsMeta);
    }
    if (data.containsKey('open_to_signing_prenup')) {
      context.handle(
          _openToSigningPrenupMeta,
          openToSigningPrenup.isAcceptableOrUnknown(
              data['open_to_signing_prenup']!, _openToSigningPrenupMeta));
    } else if (isInserting) {
      context.missing(_openToSigningPrenupMeta);
    }
    if (data.containsKey('wants_partner_to_sign_prenup')) {
      context.handle(
          _wantsPartnerToSignPrenupMeta,
          wantsPartnerToSignPrenup.isAcceptableOrUnknown(
              data['wants_partner_to_sign_prenup']!,
              _wantsPartnerToSignPrenupMeta));
    } else if (isInserting) {
      context.missing(_wantsPartnerToSignPrenupMeta);
    }
    if (data.containsKey('open_to_crimes')) {
      context.handle(
          _openToCrimesMeta,
          openToCrimes.isAcceptableOrUnknown(
              data['open_to_crimes']!, _openToCrimesMeta));
    } else if (isInserting) {
      context.missing(_openToCrimesMeta);
    }
    if (data.containsKey('open_to_stay_at_home_parenting')) {
      context.handle(
          _openToStayAtHomeParentingMeta,
          openToStayAtHomeParenting.isAcceptableOrUnknown(
              data['open_to_stay_at_home_parenting']!,
              _openToStayAtHomeParentingMeta));
    } else if (isInserting) {
      context.missing(_openToStayAtHomeParentingMeta);
    }
    if (data.containsKey('open_to_premarital_sex')) {
      context.handle(
          _openToPremaritalSexMeta,
          openToPremaritalSex.isAcceptableOrUnknown(
              data['open_to_premarital_sex']!, _openToPremaritalSexMeta));
    } else if (isInserting) {
      context.missing(_openToPremaritalSexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Stance map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Stance(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id'])!,
      openToAdoption: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}open_to_adoption'])!,
      openToSexWorkerPartner: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}open_to_sex_worker_partner'])!,
      openToAbortion: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}open_to_abortion'])!,
      openToSurrogacy: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}open_to_surrogacy'])!,
      openToAlternativeFertilityMethods: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}open_to_alternative_fertility_methods'])!,
      openToSigningPrenup: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}open_to_signing_prenup'])!,
      wantsPartnerToSignPrenup: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}wants_partner_to_sign_prenup'])!,
      openToCrimes: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}open_to_crimes'])!,
      openToStayAtHomeParenting: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}open_to_stay_at_home_parenting'])!,
      openToPremaritalSex: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}open_to_premarital_sex'])!,
    );
  }

  @override
  $StanceTableTable createAlias(String alias) {
    return $StanceTableTable(attachedDatabase, alias);
  }
}

class Stance extends DataClass implements Insertable<Stance> {
  final int id;
  final int personId;
  final bool openToAdoption;
  final bool openToSexWorkerPartner;
  final bool openToAbortion;
  final bool openToSurrogacy;
  final bool openToAlternativeFertilityMethods;
  final bool openToSigningPrenup;
  final bool wantsPartnerToSignPrenup;
  final bool openToCrimes;
  final bool openToStayAtHomeParenting;
  final bool openToPremaritalSex;
  const Stance(
      {required this.id,
      required this.personId,
      required this.openToAdoption,
      required this.openToSexWorkerPartner,
      required this.openToAbortion,
      required this.openToSurrogacy,
      required this.openToAlternativeFertilityMethods,
      required this.openToSigningPrenup,
      required this.wantsPartnerToSignPrenup,
      required this.openToCrimes,
      required this.openToStayAtHomeParenting,
      required this.openToPremaritalSex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['person_id'] = Variable<int>(personId);
    map['open_to_adoption'] = Variable<bool>(openToAdoption);
    map['open_to_sex_worker_partner'] = Variable<bool>(openToSexWorkerPartner);
    map['open_to_abortion'] = Variable<bool>(openToAbortion);
    map['open_to_surrogacy'] = Variable<bool>(openToSurrogacy);
    map['open_to_alternative_fertility_methods'] =
        Variable<bool>(openToAlternativeFertilityMethods);
    map['open_to_signing_prenup'] = Variable<bool>(openToSigningPrenup);
    map['wants_partner_to_sign_prenup'] =
        Variable<bool>(wantsPartnerToSignPrenup);
    map['open_to_crimes'] = Variable<bool>(openToCrimes);
    map['open_to_stay_at_home_parenting'] =
        Variable<bool>(openToStayAtHomeParenting);
    map['open_to_premarital_sex'] = Variable<bool>(openToPremaritalSex);
    return map;
  }

  StanceTableCompanion toCompanion(bool nullToAbsent) {
    return StanceTableCompanion(
      id: Value(id),
      personId: Value(personId),
      openToAdoption: Value(openToAdoption),
      openToSexWorkerPartner: Value(openToSexWorkerPartner),
      openToAbortion: Value(openToAbortion),
      openToSurrogacy: Value(openToSurrogacy),
      openToAlternativeFertilityMethods:
          Value(openToAlternativeFertilityMethods),
      openToSigningPrenup: Value(openToSigningPrenup),
      wantsPartnerToSignPrenup: Value(wantsPartnerToSignPrenup),
      openToCrimes: Value(openToCrimes),
      openToStayAtHomeParenting: Value(openToStayAtHomeParenting),
      openToPremaritalSex: Value(openToPremaritalSex),
    );
  }

  factory Stance.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Stance(
      id: serializer.fromJson<int>(json['id']),
      personId: serializer.fromJson<int>(json['personId']),
      openToAdoption: serializer.fromJson<bool>(json['openToAdoption']),
      openToSexWorkerPartner:
          serializer.fromJson<bool>(json['openToSexWorkerPartner']),
      openToAbortion: serializer.fromJson<bool>(json['openToAbortion']),
      openToSurrogacy: serializer.fromJson<bool>(json['openToSurrogacy']),
      openToAlternativeFertilityMethods:
          serializer.fromJson<bool>(json['openToAlternativeFertilityMethods']),
      openToSigningPrenup:
          serializer.fromJson<bool>(json['openToSigningPrenup']),
      wantsPartnerToSignPrenup:
          serializer.fromJson<bool>(json['wantsPartnerToSignPrenup']),
      openToCrimes: serializer.fromJson<bool>(json['openToCrimes']),
      openToStayAtHomeParenting:
          serializer.fromJson<bool>(json['openToStayAtHomeParenting']),
      openToPremaritalSex:
          serializer.fromJson<bool>(json['openToPremaritalSex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'personId': serializer.toJson<int>(personId),
      'openToAdoption': serializer.toJson<bool>(openToAdoption),
      'openToSexWorkerPartner': serializer.toJson<bool>(openToSexWorkerPartner),
      'openToAbortion': serializer.toJson<bool>(openToAbortion),
      'openToSurrogacy': serializer.toJson<bool>(openToSurrogacy),
      'openToAlternativeFertilityMethods':
          serializer.toJson<bool>(openToAlternativeFertilityMethods),
      'openToSigningPrenup': serializer.toJson<bool>(openToSigningPrenup),
      'wantsPartnerToSignPrenup':
          serializer.toJson<bool>(wantsPartnerToSignPrenup),
      'openToCrimes': serializer.toJson<bool>(openToCrimes),
      'openToStayAtHomeParenting':
          serializer.toJson<bool>(openToStayAtHomeParenting),
      'openToPremaritalSex': serializer.toJson<bool>(openToPremaritalSex),
    };
  }

  Stance copyWith(
          {int? id,
          int? personId,
          bool? openToAdoption,
          bool? openToSexWorkerPartner,
          bool? openToAbortion,
          bool? openToSurrogacy,
          bool? openToAlternativeFertilityMethods,
          bool? openToSigningPrenup,
          bool? wantsPartnerToSignPrenup,
          bool? openToCrimes,
          bool? openToStayAtHomeParenting,
          bool? openToPremaritalSex}) =>
      Stance(
        id: id ?? this.id,
        personId: personId ?? this.personId,
        openToAdoption: openToAdoption ?? this.openToAdoption,
        openToSexWorkerPartner:
            openToSexWorkerPartner ?? this.openToSexWorkerPartner,
        openToAbortion: openToAbortion ?? this.openToAbortion,
        openToSurrogacy: openToSurrogacy ?? this.openToSurrogacy,
        openToAlternativeFertilityMethods: openToAlternativeFertilityMethods ??
            this.openToAlternativeFertilityMethods,
        openToSigningPrenup: openToSigningPrenup ?? this.openToSigningPrenup,
        wantsPartnerToSignPrenup:
            wantsPartnerToSignPrenup ?? this.wantsPartnerToSignPrenup,
        openToCrimes: openToCrimes ?? this.openToCrimes,
        openToStayAtHomeParenting:
            openToStayAtHomeParenting ?? this.openToStayAtHomeParenting,
        openToPremaritalSex: openToPremaritalSex ?? this.openToPremaritalSex,
      );
  @override
  String toString() {
    return (StringBuffer('Stance(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('openToAdoption: $openToAdoption, ')
          ..write('openToSexWorkerPartner: $openToSexWorkerPartner, ')
          ..write('openToAbortion: $openToAbortion, ')
          ..write('openToSurrogacy: $openToSurrogacy, ')
          ..write(
              'openToAlternativeFertilityMethods: $openToAlternativeFertilityMethods, ')
          ..write('openToSigningPrenup: $openToSigningPrenup, ')
          ..write('wantsPartnerToSignPrenup: $wantsPartnerToSignPrenup, ')
          ..write('openToCrimes: $openToCrimes, ')
          ..write('openToStayAtHomeParenting: $openToStayAtHomeParenting, ')
          ..write('openToPremaritalSex: $openToPremaritalSex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      personId,
      openToAdoption,
      openToSexWorkerPartner,
      openToAbortion,
      openToSurrogacy,
      openToAlternativeFertilityMethods,
      openToSigningPrenup,
      wantsPartnerToSignPrenup,
      openToCrimes,
      openToStayAtHomeParenting,
      openToPremaritalSex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Stance &&
          other.id == this.id &&
          other.personId == this.personId &&
          other.openToAdoption == this.openToAdoption &&
          other.openToSexWorkerPartner == this.openToSexWorkerPartner &&
          other.openToAbortion == this.openToAbortion &&
          other.openToSurrogacy == this.openToSurrogacy &&
          other.openToAlternativeFertilityMethods ==
              this.openToAlternativeFertilityMethods &&
          other.openToSigningPrenup == this.openToSigningPrenup &&
          other.wantsPartnerToSignPrenup == this.wantsPartnerToSignPrenup &&
          other.openToCrimes == this.openToCrimes &&
          other.openToStayAtHomeParenting == this.openToStayAtHomeParenting &&
          other.openToPremaritalSex == this.openToPremaritalSex);
}

class StanceTableCompanion extends UpdateCompanion<Stance> {
  final Value<int> id;
  final Value<int> personId;
  final Value<bool> openToAdoption;
  final Value<bool> openToSexWorkerPartner;
  final Value<bool> openToAbortion;
  final Value<bool> openToSurrogacy;
  final Value<bool> openToAlternativeFertilityMethods;
  final Value<bool> openToSigningPrenup;
  final Value<bool> wantsPartnerToSignPrenup;
  final Value<bool> openToCrimes;
  final Value<bool> openToStayAtHomeParenting;
  final Value<bool> openToPremaritalSex;
  const StanceTableCompanion({
    this.id = const Value.absent(),
    this.personId = const Value.absent(),
    this.openToAdoption = const Value.absent(),
    this.openToSexWorkerPartner = const Value.absent(),
    this.openToAbortion = const Value.absent(),
    this.openToSurrogacy = const Value.absent(),
    this.openToAlternativeFertilityMethods = const Value.absent(),
    this.openToSigningPrenup = const Value.absent(),
    this.wantsPartnerToSignPrenup = const Value.absent(),
    this.openToCrimes = const Value.absent(),
    this.openToStayAtHomeParenting = const Value.absent(),
    this.openToPremaritalSex = const Value.absent(),
  });
  StanceTableCompanion.insert({
    this.id = const Value.absent(),
    required int personId,
    required bool openToAdoption,
    required bool openToSexWorkerPartner,
    required bool openToAbortion,
    required bool openToSurrogacy,
    required bool openToAlternativeFertilityMethods,
    required bool openToSigningPrenup,
    required bool wantsPartnerToSignPrenup,
    required bool openToCrimes,
    required bool openToStayAtHomeParenting,
    required bool openToPremaritalSex,
  })  : personId = Value(personId),
        openToAdoption = Value(openToAdoption),
        openToSexWorkerPartner = Value(openToSexWorkerPartner),
        openToAbortion = Value(openToAbortion),
        openToSurrogacy = Value(openToSurrogacy),
        openToAlternativeFertilityMethods =
            Value(openToAlternativeFertilityMethods),
        openToSigningPrenup = Value(openToSigningPrenup),
        wantsPartnerToSignPrenup = Value(wantsPartnerToSignPrenup),
        openToCrimes = Value(openToCrimes),
        openToStayAtHomeParenting = Value(openToStayAtHomeParenting),
        openToPremaritalSex = Value(openToPremaritalSex);
  static Insertable<Stance> custom({
    Expression<int>? id,
    Expression<int>? personId,
    Expression<bool>? openToAdoption,
    Expression<bool>? openToSexWorkerPartner,
    Expression<bool>? openToAbortion,
    Expression<bool>? openToSurrogacy,
    Expression<bool>? openToAlternativeFertilityMethods,
    Expression<bool>? openToSigningPrenup,
    Expression<bool>? wantsPartnerToSignPrenup,
    Expression<bool>? openToCrimes,
    Expression<bool>? openToStayAtHomeParenting,
    Expression<bool>? openToPremaritalSex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (personId != null) 'person_id': personId,
      if (openToAdoption != null) 'open_to_adoption': openToAdoption,
      if (openToSexWorkerPartner != null)
        'open_to_sex_worker_partner': openToSexWorkerPartner,
      if (openToAbortion != null) 'open_to_abortion': openToAbortion,
      if (openToSurrogacy != null) 'open_to_surrogacy': openToSurrogacy,
      if (openToAlternativeFertilityMethods != null)
        'open_to_alternative_fertility_methods':
            openToAlternativeFertilityMethods,
      if (openToSigningPrenup != null)
        'open_to_signing_prenup': openToSigningPrenup,
      if (wantsPartnerToSignPrenup != null)
        'wants_partner_to_sign_prenup': wantsPartnerToSignPrenup,
      if (openToCrimes != null) 'open_to_crimes': openToCrimes,
      if (openToStayAtHomeParenting != null)
        'open_to_stay_at_home_parenting': openToStayAtHomeParenting,
      if (openToPremaritalSex != null)
        'open_to_premarital_sex': openToPremaritalSex,
    });
  }

  StanceTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? personId,
      Value<bool>? openToAdoption,
      Value<bool>? openToSexWorkerPartner,
      Value<bool>? openToAbortion,
      Value<bool>? openToSurrogacy,
      Value<bool>? openToAlternativeFertilityMethods,
      Value<bool>? openToSigningPrenup,
      Value<bool>? wantsPartnerToSignPrenup,
      Value<bool>? openToCrimes,
      Value<bool>? openToStayAtHomeParenting,
      Value<bool>? openToPremaritalSex}) {
    return StanceTableCompanion(
      id: id ?? this.id,
      personId: personId ?? this.personId,
      openToAdoption: openToAdoption ?? this.openToAdoption,
      openToSexWorkerPartner:
          openToSexWorkerPartner ?? this.openToSexWorkerPartner,
      openToAbortion: openToAbortion ?? this.openToAbortion,
      openToSurrogacy: openToSurrogacy ?? this.openToSurrogacy,
      openToAlternativeFertilityMethods: openToAlternativeFertilityMethods ??
          this.openToAlternativeFertilityMethods,
      openToSigningPrenup: openToSigningPrenup ?? this.openToSigningPrenup,
      wantsPartnerToSignPrenup:
          wantsPartnerToSignPrenup ?? this.wantsPartnerToSignPrenup,
      openToCrimes: openToCrimes ?? this.openToCrimes,
      openToStayAtHomeParenting:
          openToStayAtHomeParenting ?? this.openToStayAtHomeParenting,
      openToPremaritalSex: openToPremaritalSex ?? this.openToPremaritalSex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<int>(personId.value);
    }
    if (openToAdoption.present) {
      map['open_to_adoption'] = Variable<bool>(openToAdoption.value);
    }
    if (openToSexWorkerPartner.present) {
      map['open_to_sex_worker_partner'] =
          Variable<bool>(openToSexWorkerPartner.value);
    }
    if (openToAbortion.present) {
      map['open_to_abortion'] = Variable<bool>(openToAbortion.value);
    }
    if (openToSurrogacy.present) {
      map['open_to_surrogacy'] = Variable<bool>(openToSurrogacy.value);
    }
    if (openToAlternativeFertilityMethods.present) {
      map['open_to_alternative_fertility_methods'] =
          Variable<bool>(openToAlternativeFertilityMethods.value);
    }
    if (openToSigningPrenup.present) {
      map['open_to_signing_prenup'] = Variable<bool>(openToSigningPrenup.value);
    }
    if (wantsPartnerToSignPrenup.present) {
      map['wants_partner_to_sign_prenup'] =
          Variable<bool>(wantsPartnerToSignPrenup.value);
    }
    if (openToCrimes.present) {
      map['open_to_crimes'] = Variable<bool>(openToCrimes.value);
    }
    if (openToStayAtHomeParenting.present) {
      map['open_to_stay_at_home_parenting'] =
          Variable<bool>(openToStayAtHomeParenting.value);
    }
    if (openToPremaritalSex.present) {
      map['open_to_premarital_sex'] = Variable<bool>(openToPremaritalSex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StanceTableCompanion(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('openToAdoption: $openToAdoption, ')
          ..write('openToSexWorkerPartner: $openToSexWorkerPartner, ')
          ..write('openToAbortion: $openToAbortion, ')
          ..write('openToSurrogacy: $openToSurrogacy, ')
          ..write(
              'openToAlternativeFertilityMethods: $openToAlternativeFertilityMethods, ')
          ..write('openToSigningPrenup: $openToSigningPrenup, ')
          ..write('wantsPartnerToSignPrenup: $wantsPartnerToSignPrenup, ')
          ..write('openToCrimes: $openToCrimes, ')
          ..write('openToStayAtHomeParenting: $openToStayAtHomeParenting, ')
          ..write('openToPremaritalSex: $openToPremaritalSex')
          ..write(')'))
        .toString();
  }
}

class $BabyTraitsTableTable extends BabyTraitsTable
    with TableInfo<$BabyTraitsTableTable, BabyTraits> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BabyTraitsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _personIdMeta =
      const VerificationMeta('personId');
  @override
  late final GeneratedColumn<int> personId = GeneratedColumn<int>(
      'person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _fussinessMeta =
      const VerificationMeta('fussiness');
  @override
  late final GeneratedColumn<int> fussiness = GeneratedColumn<int>(
      'fussiness', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _appetiteMeta =
      const VerificationMeta('appetite');
  @override
  late final GeneratedColumn<int> appetite = GeneratedColumn<int>(
      'appetite', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _needsChangingMeta =
      const VerificationMeta('needsChanging');
  @override
  late final GeneratedColumn<bool> needsChanging =
      GeneratedColumn<bool>('needs_changing', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("needs_changing" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns =>
      [id, personId, fussiness, appetite, needsChanging];
  @override
  String get aliasedName => _alias ?? 'baby_traits';
  @override
  String get actualTableName => 'baby_traits';
  @override
  VerificationContext validateIntegrity(Insertable<BabyTraits> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('person_id')) {
      context.handle(_personIdMeta,
          personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta));
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('fussiness')) {
      context.handle(_fussinessMeta,
          fussiness.isAcceptableOrUnknown(data['fussiness']!, _fussinessMeta));
    } else if (isInserting) {
      context.missing(_fussinessMeta);
    }
    if (data.containsKey('appetite')) {
      context.handle(_appetiteMeta,
          appetite.isAcceptableOrUnknown(data['appetite']!, _appetiteMeta));
    } else if (isInserting) {
      context.missing(_appetiteMeta);
    }
    if (data.containsKey('needs_changing')) {
      context.handle(
          _needsChangingMeta,
          needsChanging.isAcceptableOrUnknown(
              data['needs_changing']!, _needsChangingMeta));
    } else if (isInserting) {
      context.missing(_needsChangingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BabyTraits map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BabyTraits(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id'])!,
      fussiness: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fussiness'])!,
      appetite: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}appetite'])!,
      needsChanging: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}needs_changing'])!,
    );
  }

  @override
  $BabyTraitsTableTable createAlias(String alias) {
    return $BabyTraitsTableTable(attachedDatabase, alias);
  }
}

class BabyTraits extends DataClass implements Insertable<BabyTraits> {
  final int id;
  final int personId;
  final int fussiness;
  final int appetite;
  final bool needsChanging;
  const BabyTraits(
      {required this.id,
      required this.personId,
      required this.fussiness,
      required this.appetite,
      required this.needsChanging});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['person_id'] = Variable<int>(personId);
    map['fussiness'] = Variable<int>(fussiness);
    map['appetite'] = Variable<int>(appetite);
    map['needs_changing'] = Variable<bool>(needsChanging);
    return map;
  }

  BabyTraitsTableCompanion toCompanion(bool nullToAbsent) {
    return BabyTraitsTableCompanion(
      id: Value(id),
      personId: Value(personId),
      fussiness: Value(fussiness),
      appetite: Value(appetite),
      needsChanging: Value(needsChanging),
    );
  }

  factory BabyTraits.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BabyTraits(
      id: serializer.fromJson<int>(json['id']),
      personId: serializer.fromJson<int>(json['personId']),
      fussiness: serializer.fromJson<int>(json['fussiness']),
      appetite: serializer.fromJson<int>(json['appetite']),
      needsChanging: serializer.fromJson<bool>(json['needsChanging']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'personId': serializer.toJson<int>(personId),
      'fussiness': serializer.toJson<int>(fussiness),
      'appetite': serializer.toJson<int>(appetite),
      'needsChanging': serializer.toJson<bool>(needsChanging),
    };
  }

  BabyTraits copyWith(
          {int? id,
          int? personId,
          int? fussiness,
          int? appetite,
          bool? needsChanging}) =>
      BabyTraits(
        id: id ?? this.id,
        personId: personId ?? this.personId,
        fussiness: fussiness ?? this.fussiness,
        appetite: appetite ?? this.appetite,
        needsChanging: needsChanging ?? this.needsChanging,
      );
  @override
  String toString() {
    return (StringBuffer('BabyTraits(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('fussiness: $fussiness, ')
          ..write('appetite: $appetite, ')
          ..write('needsChanging: $needsChanging')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, personId, fussiness, appetite, needsChanging);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BabyTraits &&
          other.id == this.id &&
          other.personId == this.personId &&
          other.fussiness == this.fussiness &&
          other.appetite == this.appetite &&
          other.needsChanging == this.needsChanging);
}

class BabyTraitsTableCompanion extends UpdateCompanion<BabyTraits> {
  final Value<int> id;
  final Value<int> personId;
  final Value<int> fussiness;
  final Value<int> appetite;
  final Value<bool> needsChanging;
  const BabyTraitsTableCompanion({
    this.id = const Value.absent(),
    this.personId = const Value.absent(),
    this.fussiness = const Value.absent(),
    this.appetite = const Value.absent(),
    this.needsChanging = const Value.absent(),
  });
  BabyTraitsTableCompanion.insert({
    this.id = const Value.absent(),
    required int personId,
    required int fussiness,
    required int appetite,
    required bool needsChanging,
  })  : personId = Value(personId),
        fussiness = Value(fussiness),
        appetite = Value(appetite),
        needsChanging = Value(needsChanging);
  static Insertable<BabyTraits> custom({
    Expression<int>? id,
    Expression<int>? personId,
    Expression<int>? fussiness,
    Expression<int>? appetite,
    Expression<bool>? needsChanging,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (personId != null) 'person_id': personId,
      if (fussiness != null) 'fussiness': fussiness,
      if (appetite != null) 'appetite': appetite,
      if (needsChanging != null) 'needs_changing': needsChanging,
    });
  }

  BabyTraitsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? personId,
      Value<int>? fussiness,
      Value<int>? appetite,
      Value<bool>? needsChanging}) {
    return BabyTraitsTableCompanion(
      id: id ?? this.id,
      personId: personId ?? this.personId,
      fussiness: fussiness ?? this.fussiness,
      appetite: appetite ?? this.appetite,
      needsChanging: needsChanging ?? this.needsChanging,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<int>(personId.value);
    }
    if (fussiness.present) {
      map['fussiness'] = Variable<int>(fussiness.value);
    }
    if (appetite.present) {
      map['appetite'] = Variable<int>(appetite.value);
    }
    if (needsChanging.present) {
      map['needs_changing'] = Variable<bool>(needsChanging.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BabyTraitsTableCompanion(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('fussiness: $fussiness, ')
          ..write('appetite: $appetite, ')
          ..write('needsChanging: $needsChanging')
          ..write(')'))
        .toString();
  }
}

class $RelationshipTraitsTableTable extends RelationshipTraitsTable
    with TableInfo<$RelationshipTraitsTableTable, RelationshipTraits> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelationshipTraitsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _personIdMeta =
      const VerificationMeta('personId');
  @override
  late final GeneratedColumn<int> personId = GeneratedColumn<int>(
      'person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _helpfulnessMeta =
      const VerificationMeta('helpfulness');
  @override
  late final GeneratedColumn<int> helpfulness = GeneratedColumn<int>(
      'helpfulness', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _daysToDateBeforeMarriageMeta =
      const VerificationMeta('daysToDateBeforeMarriage');
  @override
  late final GeneratedColumn<int> daysToDateBeforeMarriage =
      GeneratedColumn<int>('days_to_date_before_marriage', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _economicalMeta =
      const VerificationMeta('economical');
  @override
  late final GeneratedColumn<bool> economical =
      GeneratedColumn<bool>('economical', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("economical" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _materialisticMeta =
      const VerificationMeta('materialistic');
  @override
  late final GeneratedColumn<bool> materialistic =
      GeneratedColumn<bool>('materialistic', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("materialistic" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _jealousMeta =
      const VerificationMeta('jealous');
  @override
  late final GeneratedColumn<bool> jealous =
      GeneratedColumn<bool>('jealous', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("jealous" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _cheaterMeta =
      const VerificationMeta('cheater');
  @override
  late final GeneratedColumn<bool> cheater =
      GeneratedColumn<bool>('cheater', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("cheater" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        personId,
        helpfulness,
        daysToDateBeforeMarriage,
        economical,
        materialistic,
        jealous,
        cheater
      ];
  @override
  String get aliasedName => _alias ?? 'relationship_traits';
  @override
  String get actualTableName => 'relationship_traits';
  @override
  VerificationContext validateIntegrity(Insertable<RelationshipTraits> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('person_id')) {
      context.handle(_personIdMeta,
          personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta));
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('helpfulness')) {
      context.handle(
          _helpfulnessMeta,
          helpfulness.isAcceptableOrUnknown(
              data['helpfulness']!, _helpfulnessMeta));
    } else if (isInserting) {
      context.missing(_helpfulnessMeta);
    }
    if (data.containsKey('days_to_date_before_marriage')) {
      context.handle(
          _daysToDateBeforeMarriageMeta,
          daysToDateBeforeMarriage.isAcceptableOrUnknown(
              data['days_to_date_before_marriage']!,
              _daysToDateBeforeMarriageMeta));
    } else if (isInserting) {
      context.missing(_daysToDateBeforeMarriageMeta);
    }
    if (data.containsKey('economical')) {
      context.handle(
          _economicalMeta,
          economical.isAcceptableOrUnknown(
              data['economical']!, _economicalMeta));
    } else if (isInserting) {
      context.missing(_economicalMeta);
    }
    if (data.containsKey('materialistic')) {
      context.handle(
          _materialisticMeta,
          materialistic.isAcceptableOrUnknown(
              data['materialistic']!, _materialisticMeta));
    } else if (isInserting) {
      context.missing(_materialisticMeta);
    }
    if (data.containsKey('jealous')) {
      context.handle(_jealousMeta,
          jealous.isAcceptableOrUnknown(data['jealous']!, _jealousMeta));
    } else if (isInserting) {
      context.missing(_jealousMeta);
    }
    if (data.containsKey('cheater')) {
      context.handle(_cheaterMeta,
          cheater.isAcceptableOrUnknown(data['cheater']!, _cheaterMeta));
    } else if (isInserting) {
      context.missing(_cheaterMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RelationshipTraits map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RelationshipTraits(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id'])!,
      helpfulness: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}helpfulness'])!,
      daysToDateBeforeMarriage: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}days_to_date_before_marriage'])!,
      economical: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}economical'])!,
      materialistic: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}materialistic'])!,
      jealous: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}jealous'])!,
      cheater: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}cheater'])!,
    );
  }

  @override
  $RelationshipTraitsTableTable createAlias(String alias) {
    return $RelationshipTraitsTableTable(attachedDatabase, alias);
  }
}

class RelationshipTraits extends DataClass
    implements Insertable<RelationshipTraits> {
  final int id;
  final int personId;
  final int helpfulness;
  final int daysToDateBeforeMarriage;
  final bool economical;
  final bool materialistic;
  final bool jealous;
  final bool cheater;
  const RelationshipTraits(
      {required this.id,
      required this.personId,
      required this.helpfulness,
      required this.daysToDateBeforeMarriage,
      required this.economical,
      required this.materialistic,
      required this.jealous,
      required this.cheater});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['person_id'] = Variable<int>(personId);
    map['helpfulness'] = Variable<int>(helpfulness);
    map['days_to_date_before_marriage'] =
        Variable<int>(daysToDateBeforeMarriage);
    map['economical'] = Variable<bool>(economical);
    map['materialistic'] = Variable<bool>(materialistic);
    map['jealous'] = Variable<bool>(jealous);
    map['cheater'] = Variable<bool>(cheater);
    return map;
  }

  RelationshipTraitsTableCompanion toCompanion(bool nullToAbsent) {
    return RelationshipTraitsTableCompanion(
      id: Value(id),
      personId: Value(personId),
      helpfulness: Value(helpfulness),
      daysToDateBeforeMarriage: Value(daysToDateBeforeMarriage),
      economical: Value(economical),
      materialistic: Value(materialistic),
      jealous: Value(jealous),
      cheater: Value(cheater),
    );
  }

  factory RelationshipTraits.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RelationshipTraits(
      id: serializer.fromJson<int>(json['id']),
      personId: serializer.fromJson<int>(json['personId']),
      helpfulness: serializer.fromJson<int>(json['helpfulness']),
      daysToDateBeforeMarriage:
          serializer.fromJson<int>(json['daysToDateBeforeMarriage']),
      economical: serializer.fromJson<bool>(json['economical']),
      materialistic: serializer.fromJson<bool>(json['materialistic']),
      jealous: serializer.fromJson<bool>(json['jealous']),
      cheater: serializer.fromJson<bool>(json['cheater']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'personId': serializer.toJson<int>(personId),
      'helpfulness': serializer.toJson<int>(helpfulness),
      'daysToDateBeforeMarriage':
          serializer.toJson<int>(daysToDateBeforeMarriage),
      'economical': serializer.toJson<bool>(economical),
      'materialistic': serializer.toJson<bool>(materialistic),
      'jealous': serializer.toJson<bool>(jealous),
      'cheater': serializer.toJson<bool>(cheater),
    };
  }

  RelationshipTraits copyWith(
          {int? id,
          int? personId,
          int? helpfulness,
          int? daysToDateBeforeMarriage,
          bool? economical,
          bool? materialistic,
          bool? jealous,
          bool? cheater}) =>
      RelationshipTraits(
        id: id ?? this.id,
        personId: personId ?? this.personId,
        helpfulness: helpfulness ?? this.helpfulness,
        daysToDateBeforeMarriage:
            daysToDateBeforeMarriage ?? this.daysToDateBeforeMarriage,
        economical: economical ?? this.economical,
        materialistic: materialistic ?? this.materialistic,
        jealous: jealous ?? this.jealous,
        cheater: cheater ?? this.cheater,
      );
  @override
  String toString() {
    return (StringBuffer('RelationshipTraits(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('helpfulness: $helpfulness, ')
          ..write('daysToDateBeforeMarriage: $daysToDateBeforeMarriage, ')
          ..write('economical: $economical, ')
          ..write('materialistic: $materialistic, ')
          ..write('jealous: $jealous, ')
          ..write('cheater: $cheater')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, personId, helpfulness,
      daysToDateBeforeMarriage, economical, materialistic, jealous, cheater);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RelationshipTraits &&
          other.id == this.id &&
          other.personId == this.personId &&
          other.helpfulness == this.helpfulness &&
          other.daysToDateBeforeMarriage == this.daysToDateBeforeMarriage &&
          other.economical == this.economical &&
          other.materialistic == this.materialistic &&
          other.jealous == this.jealous &&
          other.cheater == this.cheater);
}

class RelationshipTraitsTableCompanion
    extends UpdateCompanion<RelationshipTraits> {
  final Value<int> id;
  final Value<int> personId;
  final Value<int> helpfulness;
  final Value<int> daysToDateBeforeMarriage;
  final Value<bool> economical;
  final Value<bool> materialistic;
  final Value<bool> jealous;
  final Value<bool> cheater;
  const RelationshipTraitsTableCompanion({
    this.id = const Value.absent(),
    this.personId = const Value.absent(),
    this.helpfulness = const Value.absent(),
    this.daysToDateBeforeMarriage = const Value.absent(),
    this.economical = const Value.absent(),
    this.materialistic = const Value.absent(),
    this.jealous = const Value.absent(),
    this.cheater = const Value.absent(),
  });
  RelationshipTraitsTableCompanion.insert({
    this.id = const Value.absent(),
    required int personId,
    required int helpfulness,
    required int daysToDateBeforeMarriage,
    required bool economical,
    required bool materialistic,
    required bool jealous,
    required bool cheater,
  })  : personId = Value(personId),
        helpfulness = Value(helpfulness),
        daysToDateBeforeMarriage = Value(daysToDateBeforeMarriage),
        economical = Value(economical),
        materialistic = Value(materialistic),
        jealous = Value(jealous),
        cheater = Value(cheater);
  static Insertable<RelationshipTraits> custom({
    Expression<int>? id,
    Expression<int>? personId,
    Expression<int>? helpfulness,
    Expression<int>? daysToDateBeforeMarriage,
    Expression<bool>? economical,
    Expression<bool>? materialistic,
    Expression<bool>? jealous,
    Expression<bool>? cheater,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (personId != null) 'person_id': personId,
      if (helpfulness != null) 'helpfulness': helpfulness,
      if (daysToDateBeforeMarriage != null)
        'days_to_date_before_marriage': daysToDateBeforeMarriage,
      if (economical != null) 'economical': economical,
      if (materialistic != null) 'materialistic': materialistic,
      if (jealous != null) 'jealous': jealous,
      if (cheater != null) 'cheater': cheater,
    });
  }

  RelationshipTraitsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? personId,
      Value<int>? helpfulness,
      Value<int>? daysToDateBeforeMarriage,
      Value<bool>? economical,
      Value<bool>? materialistic,
      Value<bool>? jealous,
      Value<bool>? cheater}) {
    return RelationshipTraitsTableCompanion(
      id: id ?? this.id,
      personId: personId ?? this.personId,
      helpfulness: helpfulness ?? this.helpfulness,
      daysToDateBeforeMarriage:
          daysToDateBeforeMarriage ?? this.daysToDateBeforeMarriage,
      economical: economical ?? this.economical,
      materialistic: materialistic ?? this.materialistic,
      jealous: jealous ?? this.jealous,
      cheater: cheater ?? this.cheater,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<int>(personId.value);
    }
    if (helpfulness.present) {
      map['helpfulness'] = Variable<int>(helpfulness.value);
    }
    if (daysToDateBeforeMarriage.present) {
      map['days_to_date_before_marriage'] =
          Variable<int>(daysToDateBeforeMarriage.value);
    }
    if (economical.present) {
      map['economical'] = Variable<bool>(economical.value);
    }
    if (materialistic.present) {
      map['materialistic'] = Variable<bool>(materialistic.value);
    }
    if (jealous.present) {
      map['jealous'] = Variable<bool>(jealous.value);
    }
    if (cheater.present) {
      map['cheater'] = Variable<bool>(cheater.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelationshipTraitsTableCompanion(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('helpfulness: $helpfulness, ')
          ..write('daysToDateBeforeMarriage: $daysToDateBeforeMarriage, ')
          ..write('economical: $economical, ')
          ..write('materialistic: $materialistic, ')
          ..write('jealous: $jealous, ')
          ..write('cheater: $cheater')
          ..write(')'))
        .toString();
  }
}

abstract class _$DatabaseProvider extends GeneratedDatabase {
  _$DatabaseProvider(QueryExecutor e) : super(e);
  late final $GameTableTable gameTable = $GameTableTable(this);
  late final $PersonTableTable personTable = $PersonTableTable(this);
  late final $StatsTableTable statsTable = $StatsTableTable(this);
  late final $StanceTableTable stanceTable = $StanceTableTable(this);
  late final $BabyTraitsTableTable babyTraitsTable =
      $BabyTraitsTableTable(this);
  late final $RelationshipTraitsTableTable relationshipTraitsTable =
      $RelationshipTraitsTableTable(this);
  late final GameDaoImpl gameDaoImpl = GameDaoImpl(this as DatabaseProvider);
  late final PersonDaoImpl personDaoImpl =
      PersonDaoImpl(this as DatabaseProvider);
  late final StatsDaoImpl statsDaoImpl = StatsDaoImpl(this as DatabaseProvider);
  late final StanceDaoImpl stanceDaoImpl =
      StanceDaoImpl(this as DatabaseProvider);
  late final BabyTraitsDaoImpl babyTraitsDaoImpl =
      BabyTraitsDaoImpl(this as DatabaseProvider);
  late final RelationshipTraitsDaoImpl relationshipTraitsDaoImpl =
      RelationshipTraitsDaoImpl(this as DatabaseProvider);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        gameTable,
        personTable,
        statsTable,
        stanceTable,
        babyTraitsTable,
        relationshipTraitsTable
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('game',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('person', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('game',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('person', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('stats', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('stats', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('stance', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('stance', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('baby_traits', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('baby_traits', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('relationship_traits', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('relationship_traits', kind: UpdateKind.update),
            ],
          ),
        ],
      );
}
