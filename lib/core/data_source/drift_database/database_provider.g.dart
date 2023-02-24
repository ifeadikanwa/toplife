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

class $AcquaintanceTableTable extends AcquaintanceTable
    with TableInfo<$AcquaintanceTableTable, Acquaintance> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AcquaintanceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mainPersonIdMeta =
      const VerificationMeta('mainPersonId');
  @override
  late final GeneratedColumn<int> mainPersonId = GeneratedColumn<int>(
      'main_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _acquaintanceIdMeta =
      const VerificationMeta('acquaintanceId');
  @override
  late final GeneratedColumn<int> acquaintanceId = GeneratedColumn<int>(
      'acquaintance_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _metAtMeta = const VerificationMeta('metAt');
  @override
  late final GeneratedColumn<String> metAt = GeneratedColumn<String>(
      'met_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _relationshipMeta =
      const VerificationMeta('relationship');
  @override
  late final GeneratedColumn<int> relationship = GeneratedColumn<int>(
      'relationship', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentlyLivingTogetherMeta =
      const VerificationMeta('currentlyLivingTogether');
  @override
  late final GeneratedColumn<bool> currentlyLivingTogether =
      GeneratedColumn<bool>('currently_living_together', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("currently_living_together" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        mainPersonId,
        acquaintanceId,
        metAt,
        relationship,
        currentlyLivingTogether
      ];
  @override
  String get aliasedName => _alias ?? 'acquaintance';
  @override
  String get actualTableName => 'acquaintance';
  @override
  VerificationContext validateIntegrity(Insertable<Acquaintance> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('main_person_id')) {
      context.handle(
          _mainPersonIdMeta,
          mainPersonId.isAcceptableOrUnknown(
              data['main_person_id']!, _mainPersonIdMeta));
    } else if (isInserting) {
      context.missing(_mainPersonIdMeta);
    }
    if (data.containsKey('acquaintance_id')) {
      context.handle(
          _acquaintanceIdMeta,
          acquaintanceId.isAcceptableOrUnknown(
              data['acquaintance_id']!, _acquaintanceIdMeta));
    } else if (isInserting) {
      context.missing(_acquaintanceIdMeta);
    }
    if (data.containsKey('met_at')) {
      context.handle(
          _metAtMeta, metAt.isAcceptableOrUnknown(data['met_at']!, _metAtMeta));
    } else if (isInserting) {
      context.missing(_metAtMeta);
    }
    if (data.containsKey('relationship')) {
      context.handle(
          _relationshipMeta,
          relationship.isAcceptableOrUnknown(
              data['relationship']!, _relationshipMeta));
    } else if (isInserting) {
      context.missing(_relationshipMeta);
    }
    if (data.containsKey('currently_living_together')) {
      context.handle(
          _currentlyLivingTogetherMeta,
          currentlyLivingTogether.isAcceptableOrUnknown(
              data['currently_living_together']!,
              _currentlyLivingTogetherMeta));
    } else if (isInserting) {
      context.missing(_currentlyLivingTogetherMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mainPersonId, acquaintanceId};
  @override
  Acquaintance map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Acquaintance(
      mainPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}main_person_id'])!,
      acquaintanceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}acquaintance_id'])!,
      metAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}met_at'])!,
      relationship: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}relationship'])!,
      currentlyLivingTogether: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}currently_living_together'])!,
    );
  }

  @override
  $AcquaintanceTableTable createAlias(String alias) {
    return $AcquaintanceTableTable(attachedDatabase, alias);
  }
}

class Acquaintance extends DataClass implements Insertable<Acquaintance> {
  final int mainPersonId;
  final int acquaintanceId;
  final String metAt;
  final int relationship;
  final bool currentlyLivingTogether;
  const Acquaintance(
      {required this.mainPersonId,
      required this.acquaintanceId,
      required this.metAt,
      required this.relationship,
      required this.currentlyLivingTogether});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['main_person_id'] = Variable<int>(mainPersonId);
    map['acquaintance_id'] = Variable<int>(acquaintanceId);
    map['met_at'] = Variable<String>(metAt);
    map['relationship'] = Variable<int>(relationship);
    map['currently_living_together'] = Variable<bool>(currentlyLivingTogether);
    return map;
  }

  AcquaintanceTableCompanion toCompanion(bool nullToAbsent) {
    return AcquaintanceTableCompanion(
      mainPersonId: Value(mainPersonId),
      acquaintanceId: Value(acquaintanceId),
      metAt: Value(metAt),
      relationship: Value(relationship),
      currentlyLivingTogether: Value(currentlyLivingTogether),
    );
  }

  factory Acquaintance.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Acquaintance(
      mainPersonId: serializer.fromJson<int>(json['mainPersonId']),
      acquaintanceId: serializer.fromJson<int>(json['acquaintanceId']),
      metAt: serializer.fromJson<String>(json['metAt']),
      relationship: serializer.fromJson<int>(json['relationship']),
      currentlyLivingTogether:
          serializer.fromJson<bool>(json['currentlyLivingTogether']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mainPersonId': serializer.toJson<int>(mainPersonId),
      'acquaintanceId': serializer.toJson<int>(acquaintanceId),
      'metAt': serializer.toJson<String>(metAt),
      'relationship': serializer.toJson<int>(relationship),
      'currentlyLivingTogether':
          serializer.toJson<bool>(currentlyLivingTogether),
    };
  }

  Acquaintance copyWith(
          {int? mainPersonId,
          int? acquaintanceId,
          String? metAt,
          int? relationship,
          bool? currentlyLivingTogether}) =>
      Acquaintance(
        mainPersonId: mainPersonId ?? this.mainPersonId,
        acquaintanceId: acquaintanceId ?? this.acquaintanceId,
        metAt: metAt ?? this.metAt,
        relationship: relationship ?? this.relationship,
        currentlyLivingTogether:
            currentlyLivingTogether ?? this.currentlyLivingTogether,
      );
  @override
  String toString() {
    return (StringBuffer('Acquaintance(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('acquaintanceId: $acquaintanceId, ')
          ..write('metAt: $metAt, ')
          ..write('relationship: $relationship, ')
          ..write('currentlyLivingTogether: $currentlyLivingTogether')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mainPersonId, acquaintanceId, metAt,
      relationship, currentlyLivingTogether);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Acquaintance &&
          other.mainPersonId == this.mainPersonId &&
          other.acquaintanceId == this.acquaintanceId &&
          other.metAt == this.metAt &&
          other.relationship == this.relationship &&
          other.currentlyLivingTogether == this.currentlyLivingTogether);
}

class AcquaintanceTableCompanion extends UpdateCompanion<Acquaintance> {
  final Value<int> mainPersonId;
  final Value<int> acquaintanceId;
  final Value<String> metAt;
  final Value<int> relationship;
  final Value<bool> currentlyLivingTogether;
  const AcquaintanceTableCompanion({
    this.mainPersonId = const Value.absent(),
    this.acquaintanceId = const Value.absent(),
    this.metAt = const Value.absent(),
    this.relationship = const Value.absent(),
    this.currentlyLivingTogether = const Value.absent(),
  });
  AcquaintanceTableCompanion.insert({
    required int mainPersonId,
    required int acquaintanceId,
    required String metAt,
    required int relationship,
    required bool currentlyLivingTogether,
  })  : mainPersonId = Value(mainPersonId),
        acquaintanceId = Value(acquaintanceId),
        metAt = Value(metAt),
        relationship = Value(relationship),
        currentlyLivingTogether = Value(currentlyLivingTogether);
  static Insertable<Acquaintance> custom({
    Expression<int>? mainPersonId,
    Expression<int>? acquaintanceId,
    Expression<String>? metAt,
    Expression<int>? relationship,
    Expression<bool>? currentlyLivingTogether,
  }) {
    return RawValuesInsertable({
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (acquaintanceId != null) 'acquaintance_id': acquaintanceId,
      if (metAt != null) 'met_at': metAt,
      if (relationship != null) 'relationship': relationship,
      if (currentlyLivingTogether != null)
        'currently_living_together': currentlyLivingTogether,
    });
  }

  AcquaintanceTableCompanion copyWith(
      {Value<int>? mainPersonId,
      Value<int>? acquaintanceId,
      Value<String>? metAt,
      Value<int>? relationship,
      Value<bool>? currentlyLivingTogether}) {
    return AcquaintanceTableCompanion(
      mainPersonId: mainPersonId ?? this.mainPersonId,
      acquaintanceId: acquaintanceId ?? this.acquaintanceId,
      metAt: metAt ?? this.metAt,
      relationship: relationship ?? this.relationship,
      currentlyLivingTogether:
          currentlyLivingTogether ?? this.currentlyLivingTogether,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mainPersonId.present) {
      map['main_person_id'] = Variable<int>(mainPersonId.value);
    }
    if (acquaintanceId.present) {
      map['acquaintance_id'] = Variable<int>(acquaintanceId.value);
    }
    if (metAt.present) {
      map['met_at'] = Variable<String>(metAt.value);
    }
    if (relationship.present) {
      map['relationship'] = Variable<int>(relationship.value);
    }
    if (currentlyLivingTogether.present) {
      map['currently_living_together'] =
          Variable<bool>(currentlyLivingTogether.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AcquaintanceTableCompanion(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('acquaintanceId: $acquaintanceId, ')
          ..write('metAt: $metAt, ')
          ..write('relationship: $relationship, ')
          ..write('currentlyLivingTogether: $currentlyLivingTogether')
          ..write(')'))
        .toString();
  }
}

class $ChildTableTable extends ChildTable
    with TableInfo<$ChildTableTable, Child> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChildTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mainPersonIdMeta =
      const VerificationMeta('mainPersonId');
  @override
  late final GeneratedColumn<int> mainPersonId = GeneratedColumn<int>(
      'main_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _childIdMeta =
      const VerificationMeta('childId');
  @override
  late final GeneratedColumn<int> childId = GeneratedColumn<int>(
      'child_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _currentlyLivingTogetherMeta =
      const VerificationMeta('currentlyLivingTogether');
  @override
  late final GeneratedColumn<bool> currentlyLivingTogether =
      GeneratedColumn<bool>('currently_living_together', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("currently_living_together" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _childRelationshipTypeMeta =
      const VerificationMeta('childRelationshipType');
  @override
  late final GeneratedColumn<String> childRelationshipType =
      GeneratedColumn<String>('child_relationship_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hiddenMeta = const VerificationMeta('hidden');
  @override
  late final GeneratedColumn<bool> hidden =
      GeneratedColumn<bool>('hidden', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("hidden" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _paternityFraudMeta =
      const VerificationMeta('paternityFraud');
  @override
  late final GeneratedColumn<bool> paternityFraud =
      GeneratedColumn<bool>('paternity_fraud', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("paternity_fraud" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _assumedRelationshipTypeMeta =
      const VerificationMeta('assumedRelationshipType');
  @override
  late final GeneratedColumn<String> assumedRelationshipType =
      GeneratedColumn<String>('assumed_relationship_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _relationshipMeta =
      const VerificationMeta('relationship');
  @override
  late final GeneratedColumn<int> relationship = GeneratedColumn<int>(
      'relationship', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        mainPersonId,
        childId,
        currentlyLivingTogether,
        childRelationshipType,
        hidden,
        paternityFraud,
        assumedRelationshipType,
        relationship
      ];
  @override
  String get aliasedName => _alias ?? 'child';
  @override
  String get actualTableName => 'child';
  @override
  VerificationContext validateIntegrity(Insertable<Child> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('main_person_id')) {
      context.handle(
          _mainPersonIdMeta,
          mainPersonId.isAcceptableOrUnknown(
              data['main_person_id']!, _mainPersonIdMeta));
    } else if (isInserting) {
      context.missing(_mainPersonIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(_childIdMeta,
          childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta));
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('currently_living_together')) {
      context.handle(
          _currentlyLivingTogetherMeta,
          currentlyLivingTogether.isAcceptableOrUnknown(
              data['currently_living_together']!,
              _currentlyLivingTogetherMeta));
    } else if (isInserting) {
      context.missing(_currentlyLivingTogetherMeta);
    }
    if (data.containsKey('child_relationship_type')) {
      context.handle(
          _childRelationshipTypeMeta,
          childRelationshipType.isAcceptableOrUnknown(
              data['child_relationship_type']!, _childRelationshipTypeMeta));
    } else if (isInserting) {
      context.missing(_childRelationshipTypeMeta);
    }
    if (data.containsKey('hidden')) {
      context.handle(_hiddenMeta,
          hidden.isAcceptableOrUnknown(data['hidden']!, _hiddenMeta));
    } else if (isInserting) {
      context.missing(_hiddenMeta);
    }
    if (data.containsKey('paternity_fraud')) {
      context.handle(
          _paternityFraudMeta,
          paternityFraud.isAcceptableOrUnknown(
              data['paternity_fraud']!, _paternityFraudMeta));
    } else if (isInserting) {
      context.missing(_paternityFraudMeta);
    }
    if (data.containsKey('assumed_relationship_type')) {
      context.handle(
          _assumedRelationshipTypeMeta,
          assumedRelationshipType.isAcceptableOrUnknown(
              data['assumed_relationship_type']!,
              _assumedRelationshipTypeMeta));
    } else if (isInserting) {
      context.missing(_assumedRelationshipTypeMeta);
    }
    if (data.containsKey('relationship')) {
      context.handle(
          _relationshipMeta,
          relationship.isAcceptableOrUnknown(
              data['relationship']!, _relationshipMeta));
    } else if (isInserting) {
      context.missing(_relationshipMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mainPersonId, childId};
  @override
  Child map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Child(
      mainPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}main_person_id'])!,
      childId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}child_id'])!,
      currentlyLivingTogether: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}currently_living_together'])!,
      childRelationshipType: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}child_relationship_type'])!,
      hidden: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}hidden'])!,
      paternityFraud: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}paternity_fraud'])!,
      assumedRelationshipType: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}assumed_relationship_type'])!,
      relationship: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}relationship'])!,
    );
  }

  @override
  $ChildTableTable createAlias(String alias) {
    return $ChildTableTable(attachedDatabase, alias);
  }
}

class Child extends DataClass implements Insertable<Child> {
  final int mainPersonId;
  final int childId;
  final bool currentlyLivingTogether;
  final String childRelationshipType;
  final bool hidden;
  final bool paternityFraud;
  final String assumedRelationshipType;
  final int relationship;
  const Child(
      {required this.mainPersonId,
      required this.childId,
      required this.currentlyLivingTogether,
      required this.childRelationshipType,
      required this.hidden,
      required this.paternityFraud,
      required this.assumedRelationshipType,
      required this.relationship});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['main_person_id'] = Variable<int>(mainPersonId);
    map['child_id'] = Variable<int>(childId);
    map['currently_living_together'] = Variable<bool>(currentlyLivingTogether);
    map['child_relationship_type'] = Variable<String>(childRelationshipType);
    map['hidden'] = Variable<bool>(hidden);
    map['paternity_fraud'] = Variable<bool>(paternityFraud);
    map['assumed_relationship_type'] =
        Variable<String>(assumedRelationshipType);
    map['relationship'] = Variable<int>(relationship);
    return map;
  }

  ChildTableCompanion toCompanion(bool nullToAbsent) {
    return ChildTableCompanion(
      mainPersonId: Value(mainPersonId),
      childId: Value(childId),
      currentlyLivingTogether: Value(currentlyLivingTogether),
      childRelationshipType: Value(childRelationshipType),
      hidden: Value(hidden),
      paternityFraud: Value(paternityFraud),
      assumedRelationshipType: Value(assumedRelationshipType),
      relationship: Value(relationship),
    );
  }

  factory Child.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Child(
      mainPersonId: serializer.fromJson<int>(json['mainPersonId']),
      childId: serializer.fromJson<int>(json['childId']),
      currentlyLivingTogether:
          serializer.fromJson<bool>(json['currentlyLivingTogether']),
      childRelationshipType:
          serializer.fromJson<String>(json['childRelationshipType']),
      hidden: serializer.fromJson<bool>(json['hidden']),
      paternityFraud: serializer.fromJson<bool>(json['paternityFraud']),
      assumedRelationshipType:
          serializer.fromJson<String>(json['assumedRelationshipType']),
      relationship: serializer.fromJson<int>(json['relationship']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mainPersonId': serializer.toJson<int>(mainPersonId),
      'childId': serializer.toJson<int>(childId),
      'currentlyLivingTogether':
          serializer.toJson<bool>(currentlyLivingTogether),
      'childRelationshipType': serializer.toJson<String>(childRelationshipType),
      'hidden': serializer.toJson<bool>(hidden),
      'paternityFraud': serializer.toJson<bool>(paternityFraud),
      'assumedRelationshipType':
          serializer.toJson<String>(assumedRelationshipType),
      'relationship': serializer.toJson<int>(relationship),
    };
  }

  Child copyWith(
          {int? mainPersonId,
          int? childId,
          bool? currentlyLivingTogether,
          String? childRelationshipType,
          bool? hidden,
          bool? paternityFraud,
          String? assumedRelationshipType,
          int? relationship}) =>
      Child(
        mainPersonId: mainPersonId ?? this.mainPersonId,
        childId: childId ?? this.childId,
        currentlyLivingTogether:
            currentlyLivingTogether ?? this.currentlyLivingTogether,
        childRelationshipType:
            childRelationshipType ?? this.childRelationshipType,
        hidden: hidden ?? this.hidden,
        paternityFraud: paternityFraud ?? this.paternityFraud,
        assumedRelationshipType:
            assumedRelationshipType ?? this.assumedRelationshipType,
        relationship: relationship ?? this.relationship,
      );
  @override
  String toString() {
    return (StringBuffer('Child(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('childId: $childId, ')
          ..write('currentlyLivingTogether: $currentlyLivingTogether, ')
          ..write('childRelationshipType: $childRelationshipType, ')
          ..write('hidden: $hidden, ')
          ..write('paternityFraud: $paternityFraud, ')
          ..write('assumedRelationshipType: $assumedRelationshipType, ')
          ..write('relationship: $relationship')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      mainPersonId,
      childId,
      currentlyLivingTogether,
      childRelationshipType,
      hidden,
      paternityFraud,
      assumedRelationshipType,
      relationship);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Child &&
          other.mainPersonId == this.mainPersonId &&
          other.childId == this.childId &&
          other.currentlyLivingTogether == this.currentlyLivingTogether &&
          other.childRelationshipType == this.childRelationshipType &&
          other.hidden == this.hidden &&
          other.paternityFraud == this.paternityFraud &&
          other.assumedRelationshipType == this.assumedRelationshipType &&
          other.relationship == this.relationship);
}

class ChildTableCompanion extends UpdateCompanion<Child> {
  final Value<int> mainPersonId;
  final Value<int> childId;
  final Value<bool> currentlyLivingTogether;
  final Value<String> childRelationshipType;
  final Value<bool> hidden;
  final Value<bool> paternityFraud;
  final Value<String> assumedRelationshipType;
  final Value<int> relationship;
  const ChildTableCompanion({
    this.mainPersonId = const Value.absent(),
    this.childId = const Value.absent(),
    this.currentlyLivingTogether = const Value.absent(),
    this.childRelationshipType = const Value.absent(),
    this.hidden = const Value.absent(),
    this.paternityFraud = const Value.absent(),
    this.assumedRelationshipType = const Value.absent(),
    this.relationship = const Value.absent(),
  });
  ChildTableCompanion.insert({
    required int mainPersonId,
    required int childId,
    required bool currentlyLivingTogether,
    required String childRelationshipType,
    required bool hidden,
    required bool paternityFraud,
    required String assumedRelationshipType,
    required int relationship,
  })  : mainPersonId = Value(mainPersonId),
        childId = Value(childId),
        currentlyLivingTogether = Value(currentlyLivingTogether),
        childRelationshipType = Value(childRelationshipType),
        hidden = Value(hidden),
        paternityFraud = Value(paternityFraud),
        assumedRelationshipType = Value(assumedRelationshipType),
        relationship = Value(relationship);
  static Insertable<Child> custom({
    Expression<int>? mainPersonId,
    Expression<int>? childId,
    Expression<bool>? currentlyLivingTogether,
    Expression<String>? childRelationshipType,
    Expression<bool>? hidden,
    Expression<bool>? paternityFraud,
    Expression<String>? assumedRelationshipType,
    Expression<int>? relationship,
  }) {
    return RawValuesInsertable({
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (childId != null) 'child_id': childId,
      if (currentlyLivingTogether != null)
        'currently_living_together': currentlyLivingTogether,
      if (childRelationshipType != null)
        'child_relationship_type': childRelationshipType,
      if (hidden != null) 'hidden': hidden,
      if (paternityFraud != null) 'paternity_fraud': paternityFraud,
      if (assumedRelationshipType != null)
        'assumed_relationship_type': assumedRelationshipType,
      if (relationship != null) 'relationship': relationship,
    });
  }

  ChildTableCompanion copyWith(
      {Value<int>? mainPersonId,
      Value<int>? childId,
      Value<bool>? currentlyLivingTogether,
      Value<String>? childRelationshipType,
      Value<bool>? hidden,
      Value<bool>? paternityFraud,
      Value<String>? assumedRelationshipType,
      Value<int>? relationship}) {
    return ChildTableCompanion(
      mainPersonId: mainPersonId ?? this.mainPersonId,
      childId: childId ?? this.childId,
      currentlyLivingTogether:
          currentlyLivingTogether ?? this.currentlyLivingTogether,
      childRelationshipType:
          childRelationshipType ?? this.childRelationshipType,
      hidden: hidden ?? this.hidden,
      paternityFraud: paternityFraud ?? this.paternityFraud,
      assumedRelationshipType:
          assumedRelationshipType ?? this.assumedRelationshipType,
      relationship: relationship ?? this.relationship,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mainPersonId.present) {
      map['main_person_id'] = Variable<int>(mainPersonId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<int>(childId.value);
    }
    if (currentlyLivingTogether.present) {
      map['currently_living_together'] =
          Variable<bool>(currentlyLivingTogether.value);
    }
    if (childRelationshipType.present) {
      map['child_relationship_type'] =
          Variable<String>(childRelationshipType.value);
    }
    if (hidden.present) {
      map['hidden'] = Variable<bool>(hidden.value);
    }
    if (paternityFraud.present) {
      map['paternity_fraud'] = Variable<bool>(paternityFraud.value);
    }
    if (assumedRelationshipType.present) {
      map['assumed_relationship_type'] =
          Variable<String>(assumedRelationshipType.value);
    }
    if (relationship.present) {
      map['relationship'] = Variable<int>(relationship.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChildTableCompanion(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('childId: $childId, ')
          ..write('currentlyLivingTogether: $currentlyLivingTogether, ')
          ..write('childRelationshipType: $childRelationshipType, ')
          ..write('hidden: $hidden, ')
          ..write('paternityFraud: $paternityFraud, ')
          ..write('assumedRelationshipType: $assumedRelationshipType, ')
          ..write('relationship: $relationship')
          ..write(')'))
        .toString();
  }
}

class $FriendTableTable extends FriendTable
    with TableInfo<$FriendTableTable, Friend> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FriendTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mainPersonIdMeta =
      const VerificationMeta('mainPersonId');
  @override
  late final GeneratedColumn<int> mainPersonId = GeneratedColumn<int>(
      'main_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _friendIdMeta =
      const VerificationMeta('friendId');
  @override
  late final GeneratedColumn<int> friendId = GeneratedColumn<int>(
      'friend_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _metAtMeta = const VerificationMeta('metAt');
  @override
  late final GeneratedColumn<String> metAt = GeneratedColumn<String>(
      'met_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _haveRomanticRelationshipMeta =
      const VerificationMeta('haveRomanticRelationship');
  @override
  late final GeneratedColumn<bool> haveRomanticRelationship =
      GeneratedColumn<bool>('have_romantic_relationship', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("have_romantic_relationship" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _relationshipMeta =
      const VerificationMeta('relationship');
  @override
  late final GeneratedColumn<int> relationship = GeneratedColumn<int>(
      'relationship', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentlyLivingTogetherMeta =
      const VerificationMeta('currentlyLivingTogether');
  @override
  late final GeneratedColumn<bool> currentlyLivingTogether =
      GeneratedColumn<bool>('currently_living_together', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("currently_living_together" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        mainPersonId,
        friendId,
        metAt,
        haveRomanticRelationship,
        relationship,
        currentlyLivingTogether
      ];
  @override
  String get aliasedName => _alias ?? 'friend';
  @override
  String get actualTableName => 'friend';
  @override
  VerificationContext validateIntegrity(Insertable<Friend> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('main_person_id')) {
      context.handle(
          _mainPersonIdMeta,
          mainPersonId.isAcceptableOrUnknown(
              data['main_person_id']!, _mainPersonIdMeta));
    } else if (isInserting) {
      context.missing(_mainPersonIdMeta);
    }
    if (data.containsKey('friend_id')) {
      context.handle(_friendIdMeta,
          friendId.isAcceptableOrUnknown(data['friend_id']!, _friendIdMeta));
    } else if (isInserting) {
      context.missing(_friendIdMeta);
    }
    if (data.containsKey('met_at')) {
      context.handle(
          _metAtMeta, metAt.isAcceptableOrUnknown(data['met_at']!, _metAtMeta));
    } else if (isInserting) {
      context.missing(_metAtMeta);
    }
    if (data.containsKey('have_romantic_relationship')) {
      context.handle(
          _haveRomanticRelationshipMeta,
          haveRomanticRelationship.isAcceptableOrUnknown(
              data['have_romantic_relationship']!,
              _haveRomanticRelationshipMeta));
    } else if (isInserting) {
      context.missing(_haveRomanticRelationshipMeta);
    }
    if (data.containsKey('relationship')) {
      context.handle(
          _relationshipMeta,
          relationship.isAcceptableOrUnknown(
              data['relationship']!, _relationshipMeta));
    } else if (isInserting) {
      context.missing(_relationshipMeta);
    }
    if (data.containsKey('currently_living_together')) {
      context.handle(
          _currentlyLivingTogetherMeta,
          currentlyLivingTogether.isAcceptableOrUnknown(
              data['currently_living_together']!,
              _currentlyLivingTogetherMeta));
    } else if (isInserting) {
      context.missing(_currentlyLivingTogetherMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mainPersonId, friendId};
  @override
  Friend map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Friend(
      mainPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}main_person_id'])!,
      friendId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}friend_id'])!,
      metAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}met_at'])!,
      haveRomanticRelationship: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}have_romantic_relationship'])!,
      relationship: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}relationship'])!,
      currentlyLivingTogether: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}currently_living_together'])!,
    );
  }

  @override
  $FriendTableTable createAlias(String alias) {
    return $FriendTableTable(attachedDatabase, alias);
  }
}

class Friend extends DataClass implements Insertable<Friend> {
  final int mainPersonId;
  final int friendId;
  final String metAt;
  final bool haveRomanticRelationship;
  final int relationship;
  final bool currentlyLivingTogether;
  const Friend(
      {required this.mainPersonId,
      required this.friendId,
      required this.metAt,
      required this.haveRomanticRelationship,
      required this.relationship,
      required this.currentlyLivingTogether});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['main_person_id'] = Variable<int>(mainPersonId);
    map['friend_id'] = Variable<int>(friendId);
    map['met_at'] = Variable<String>(metAt);
    map['have_romantic_relationship'] =
        Variable<bool>(haveRomanticRelationship);
    map['relationship'] = Variable<int>(relationship);
    map['currently_living_together'] = Variable<bool>(currentlyLivingTogether);
    return map;
  }

  FriendTableCompanion toCompanion(bool nullToAbsent) {
    return FriendTableCompanion(
      mainPersonId: Value(mainPersonId),
      friendId: Value(friendId),
      metAt: Value(metAt),
      haveRomanticRelationship: Value(haveRomanticRelationship),
      relationship: Value(relationship),
      currentlyLivingTogether: Value(currentlyLivingTogether),
    );
  }

  factory Friend.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Friend(
      mainPersonId: serializer.fromJson<int>(json['mainPersonId']),
      friendId: serializer.fromJson<int>(json['friendId']),
      metAt: serializer.fromJson<String>(json['metAt']),
      haveRomanticRelationship:
          serializer.fromJson<bool>(json['haveRomanticRelationship']),
      relationship: serializer.fromJson<int>(json['relationship']),
      currentlyLivingTogether:
          serializer.fromJson<bool>(json['currentlyLivingTogether']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mainPersonId': serializer.toJson<int>(mainPersonId),
      'friendId': serializer.toJson<int>(friendId),
      'metAt': serializer.toJson<String>(metAt),
      'haveRomanticRelationship':
          serializer.toJson<bool>(haveRomanticRelationship),
      'relationship': serializer.toJson<int>(relationship),
      'currentlyLivingTogether':
          serializer.toJson<bool>(currentlyLivingTogether),
    };
  }

  Friend copyWith(
          {int? mainPersonId,
          int? friendId,
          String? metAt,
          bool? haveRomanticRelationship,
          int? relationship,
          bool? currentlyLivingTogether}) =>
      Friend(
        mainPersonId: mainPersonId ?? this.mainPersonId,
        friendId: friendId ?? this.friendId,
        metAt: metAt ?? this.metAt,
        haveRomanticRelationship:
            haveRomanticRelationship ?? this.haveRomanticRelationship,
        relationship: relationship ?? this.relationship,
        currentlyLivingTogether:
            currentlyLivingTogether ?? this.currentlyLivingTogether,
      );
  @override
  String toString() {
    return (StringBuffer('Friend(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('friendId: $friendId, ')
          ..write('metAt: $metAt, ')
          ..write('haveRomanticRelationship: $haveRomanticRelationship, ')
          ..write('relationship: $relationship, ')
          ..write('currentlyLivingTogether: $currentlyLivingTogether')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mainPersonId, friendId, metAt,
      haveRomanticRelationship, relationship, currentlyLivingTogether);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Friend &&
          other.mainPersonId == this.mainPersonId &&
          other.friendId == this.friendId &&
          other.metAt == this.metAt &&
          other.haveRomanticRelationship == this.haveRomanticRelationship &&
          other.relationship == this.relationship &&
          other.currentlyLivingTogether == this.currentlyLivingTogether);
}

class FriendTableCompanion extends UpdateCompanion<Friend> {
  final Value<int> mainPersonId;
  final Value<int> friendId;
  final Value<String> metAt;
  final Value<bool> haveRomanticRelationship;
  final Value<int> relationship;
  final Value<bool> currentlyLivingTogether;
  const FriendTableCompanion({
    this.mainPersonId = const Value.absent(),
    this.friendId = const Value.absent(),
    this.metAt = const Value.absent(),
    this.haveRomanticRelationship = const Value.absent(),
    this.relationship = const Value.absent(),
    this.currentlyLivingTogether = const Value.absent(),
  });
  FriendTableCompanion.insert({
    required int mainPersonId,
    required int friendId,
    required String metAt,
    required bool haveRomanticRelationship,
    required int relationship,
    required bool currentlyLivingTogether,
  })  : mainPersonId = Value(mainPersonId),
        friendId = Value(friendId),
        metAt = Value(metAt),
        haveRomanticRelationship = Value(haveRomanticRelationship),
        relationship = Value(relationship),
        currentlyLivingTogether = Value(currentlyLivingTogether);
  static Insertable<Friend> custom({
    Expression<int>? mainPersonId,
    Expression<int>? friendId,
    Expression<String>? metAt,
    Expression<bool>? haveRomanticRelationship,
    Expression<int>? relationship,
    Expression<bool>? currentlyLivingTogether,
  }) {
    return RawValuesInsertable({
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (friendId != null) 'friend_id': friendId,
      if (metAt != null) 'met_at': metAt,
      if (haveRomanticRelationship != null)
        'have_romantic_relationship': haveRomanticRelationship,
      if (relationship != null) 'relationship': relationship,
      if (currentlyLivingTogether != null)
        'currently_living_together': currentlyLivingTogether,
    });
  }

  FriendTableCompanion copyWith(
      {Value<int>? mainPersonId,
      Value<int>? friendId,
      Value<String>? metAt,
      Value<bool>? haveRomanticRelationship,
      Value<int>? relationship,
      Value<bool>? currentlyLivingTogether}) {
    return FriendTableCompanion(
      mainPersonId: mainPersonId ?? this.mainPersonId,
      friendId: friendId ?? this.friendId,
      metAt: metAt ?? this.metAt,
      haveRomanticRelationship:
          haveRomanticRelationship ?? this.haveRomanticRelationship,
      relationship: relationship ?? this.relationship,
      currentlyLivingTogether:
          currentlyLivingTogether ?? this.currentlyLivingTogether,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mainPersonId.present) {
      map['main_person_id'] = Variable<int>(mainPersonId.value);
    }
    if (friendId.present) {
      map['friend_id'] = Variable<int>(friendId.value);
    }
    if (metAt.present) {
      map['met_at'] = Variable<String>(metAt.value);
    }
    if (haveRomanticRelationship.present) {
      map['have_romantic_relationship'] =
          Variable<bool>(haveRomanticRelationship.value);
    }
    if (relationship.present) {
      map['relationship'] = Variable<int>(relationship.value);
    }
    if (currentlyLivingTogether.present) {
      map['currently_living_together'] =
          Variable<bool>(currentlyLivingTogether.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FriendTableCompanion(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('friendId: $friendId, ')
          ..write('metAt: $metAt, ')
          ..write('haveRomanticRelationship: $haveRomanticRelationship, ')
          ..write('relationship: $relationship, ')
          ..write('currentlyLivingTogether: $currentlyLivingTogether')
          ..write(')'))
        .toString();
  }
}

class $GraveTableTable extends GraveTable
    with TableInfo<$GraveTableTable, Grave> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GraveTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mainPersonIdMeta =
      const VerificationMeta('mainPersonId');
  @override
  late final GeneratedColumn<int> mainPersonId = GeneratedColumn<int>(
      'main_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _deadPersonIdMeta =
      const VerificationMeta('deadPersonId');
  @override
  late final GeneratedColumn<int> deadPersonId = GeneratedColumn<int>(
      'dead_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _relationshipTypeMeta =
      const VerificationMeta('relationshipType');
  @override
  late final GeneratedColumn<String> relationshipType = GeneratedColumn<String>(
      'relationship_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dayOfDeathMeta =
      const VerificationMeta('dayOfDeath');
  @override
  late final GeneratedColumn<int> dayOfDeath = GeneratedColumn<int>(
      'day_of_death', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ageAtDeathMeta =
      const VerificationMeta('ageAtDeath');
  @override
  late final GeneratedColumn<String> ageAtDeath = GeneratedColumn<String>(
      'age_at_death', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        mainPersonId,
        deadPersonId,
        relationshipType,
        dayOfDeath,
        fullName,
        ageAtDeath
      ];
  @override
  String get aliasedName => _alias ?? 'grave';
  @override
  String get actualTableName => 'grave';
  @override
  VerificationContext validateIntegrity(Insertable<Grave> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('main_person_id')) {
      context.handle(
          _mainPersonIdMeta,
          mainPersonId.isAcceptableOrUnknown(
              data['main_person_id']!, _mainPersonIdMeta));
    } else if (isInserting) {
      context.missing(_mainPersonIdMeta);
    }
    if (data.containsKey('dead_person_id')) {
      context.handle(
          _deadPersonIdMeta,
          deadPersonId.isAcceptableOrUnknown(
              data['dead_person_id']!, _deadPersonIdMeta));
    } else if (isInserting) {
      context.missing(_deadPersonIdMeta);
    }
    if (data.containsKey('relationship_type')) {
      context.handle(
          _relationshipTypeMeta,
          relationshipType.isAcceptableOrUnknown(
              data['relationship_type']!, _relationshipTypeMeta));
    } else if (isInserting) {
      context.missing(_relationshipTypeMeta);
    }
    if (data.containsKey('day_of_death')) {
      context.handle(
          _dayOfDeathMeta,
          dayOfDeath.isAcceptableOrUnknown(
              data['day_of_death']!, _dayOfDeathMeta));
    } else if (isInserting) {
      context.missing(_dayOfDeathMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('age_at_death')) {
      context.handle(
          _ageAtDeathMeta,
          ageAtDeath.isAcceptableOrUnknown(
              data['age_at_death']!, _ageAtDeathMeta));
    } else if (isInserting) {
      context.missing(_ageAtDeathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mainPersonId, deadPersonId};
  @override
  Grave map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Grave(
      mainPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}main_person_id'])!,
      deadPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dead_person_id'])!,
      relationshipType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}relationship_type'])!,
      dayOfDeath: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_of_death'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      ageAtDeath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}age_at_death'])!,
    );
  }

  @override
  $GraveTableTable createAlias(String alias) {
    return $GraveTableTable(attachedDatabase, alias);
  }
}

class Grave extends DataClass implements Insertable<Grave> {
  final int mainPersonId;
  final int deadPersonId;
  final String relationshipType;
  final int dayOfDeath;
  final String fullName;
  final String ageAtDeath;
  const Grave(
      {required this.mainPersonId,
      required this.deadPersonId,
      required this.relationshipType,
      required this.dayOfDeath,
      required this.fullName,
      required this.ageAtDeath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['main_person_id'] = Variable<int>(mainPersonId);
    map['dead_person_id'] = Variable<int>(deadPersonId);
    map['relationship_type'] = Variable<String>(relationshipType);
    map['day_of_death'] = Variable<int>(dayOfDeath);
    map['full_name'] = Variable<String>(fullName);
    map['age_at_death'] = Variable<String>(ageAtDeath);
    return map;
  }

  GraveTableCompanion toCompanion(bool nullToAbsent) {
    return GraveTableCompanion(
      mainPersonId: Value(mainPersonId),
      deadPersonId: Value(deadPersonId),
      relationshipType: Value(relationshipType),
      dayOfDeath: Value(dayOfDeath),
      fullName: Value(fullName),
      ageAtDeath: Value(ageAtDeath),
    );
  }

  factory Grave.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Grave(
      mainPersonId: serializer.fromJson<int>(json['mainPersonId']),
      deadPersonId: serializer.fromJson<int>(json['deadPersonId']),
      relationshipType: serializer.fromJson<String>(json['relationshipType']),
      dayOfDeath: serializer.fromJson<int>(json['dayOfDeath']),
      fullName: serializer.fromJson<String>(json['fullName']),
      ageAtDeath: serializer.fromJson<String>(json['ageAtDeath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mainPersonId': serializer.toJson<int>(mainPersonId),
      'deadPersonId': serializer.toJson<int>(deadPersonId),
      'relationshipType': serializer.toJson<String>(relationshipType),
      'dayOfDeath': serializer.toJson<int>(dayOfDeath),
      'fullName': serializer.toJson<String>(fullName),
      'ageAtDeath': serializer.toJson<String>(ageAtDeath),
    };
  }

  Grave copyWith(
          {int? mainPersonId,
          int? deadPersonId,
          String? relationshipType,
          int? dayOfDeath,
          String? fullName,
          String? ageAtDeath}) =>
      Grave(
        mainPersonId: mainPersonId ?? this.mainPersonId,
        deadPersonId: deadPersonId ?? this.deadPersonId,
        relationshipType: relationshipType ?? this.relationshipType,
        dayOfDeath: dayOfDeath ?? this.dayOfDeath,
        fullName: fullName ?? this.fullName,
        ageAtDeath: ageAtDeath ?? this.ageAtDeath,
      );
  @override
  String toString() {
    return (StringBuffer('Grave(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('deadPersonId: $deadPersonId, ')
          ..write('relationshipType: $relationshipType, ')
          ..write('dayOfDeath: $dayOfDeath, ')
          ..write('fullName: $fullName, ')
          ..write('ageAtDeath: $ageAtDeath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mainPersonId, deadPersonId, relationshipType,
      dayOfDeath, fullName, ageAtDeath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Grave &&
          other.mainPersonId == this.mainPersonId &&
          other.deadPersonId == this.deadPersonId &&
          other.relationshipType == this.relationshipType &&
          other.dayOfDeath == this.dayOfDeath &&
          other.fullName == this.fullName &&
          other.ageAtDeath == this.ageAtDeath);
}

class GraveTableCompanion extends UpdateCompanion<Grave> {
  final Value<int> mainPersonId;
  final Value<int> deadPersonId;
  final Value<String> relationshipType;
  final Value<int> dayOfDeath;
  final Value<String> fullName;
  final Value<String> ageAtDeath;
  const GraveTableCompanion({
    this.mainPersonId = const Value.absent(),
    this.deadPersonId = const Value.absent(),
    this.relationshipType = const Value.absent(),
    this.dayOfDeath = const Value.absent(),
    this.fullName = const Value.absent(),
    this.ageAtDeath = const Value.absent(),
  });
  GraveTableCompanion.insert({
    required int mainPersonId,
    required int deadPersonId,
    required String relationshipType,
    required int dayOfDeath,
    required String fullName,
    required String ageAtDeath,
  })  : mainPersonId = Value(mainPersonId),
        deadPersonId = Value(deadPersonId),
        relationshipType = Value(relationshipType),
        dayOfDeath = Value(dayOfDeath),
        fullName = Value(fullName),
        ageAtDeath = Value(ageAtDeath);
  static Insertable<Grave> custom({
    Expression<int>? mainPersonId,
    Expression<int>? deadPersonId,
    Expression<String>? relationshipType,
    Expression<int>? dayOfDeath,
    Expression<String>? fullName,
    Expression<String>? ageAtDeath,
  }) {
    return RawValuesInsertable({
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (deadPersonId != null) 'dead_person_id': deadPersonId,
      if (relationshipType != null) 'relationship_type': relationshipType,
      if (dayOfDeath != null) 'day_of_death': dayOfDeath,
      if (fullName != null) 'full_name': fullName,
      if (ageAtDeath != null) 'age_at_death': ageAtDeath,
    });
  }

  GraveTableCompanion copyWith(
      {Value<int>? mainPersonId,
      Value<int>? deadPersonId,
      Value<String>? relationshipType,
      Value<int>? dayOfDeath,
      Value<String>? fullName,
      Value<String>? ageAtDeath}) {
    return GraveTableCompanion(
      mainPersonId: mainPersonId ?? this.mainPersonId,
      deadPersonId: deadPersonId ?? this.deadPersonId,
      relationshipType: relationshipType ?? this.relationshipType,
      dayOfDeath: dayOfDeath ?? this.dayOfDeath,
      fullName: fullName ?? this.fullName,
      ageAtDeath: ageAtDeath ?? this.ageAtDeath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mainPersonId.present) {
      map['main_person_id'] = Variable<int>(mainPersonId.value);
    }
    if (deadPersonId.present) {
      map['dead_person_id'] = Variable<int>(deadPersonId.value);
    }
    if (relationshipType.present) {
      map['relationship_type'] = Variable<String>(relationshipType.value);
    }
    if (dayOfDeath.present) {
      map['day_of_death'] = Variable<int>(dayOfDeath.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (ageAtDeath.present) {
      map['age_at_death'] = Variable<String>(ageAtDeath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GraveTableCompanion(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('deadPersonId: $deadPersonId, ')
          ..write('relationshipType: $relationshipType, ')
          ..write('dayOfDeath: $dayOfDeath, ')
          ..write('fullName: $fullName, ')
          ..write('ageAtDeath: $ageAtDeath')
          ..write(')'))
        .toString();
  }
}

class $InLawTableTable extends InLawTable
    with TableInfo<$InLawTableTable, InLaw> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InLawTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mainPersonIdMeta =
      const VerificationMeta('mainPersonId');
  @override
  late final GeneratedColumn<int> mainPersonId = GeneratedColumn<int>(
      'main_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _inLawIdMeta =
      const VerificationMeta('inLawId');
  @override
  late final GeneratedColumn<int> inLawId = GeneratedColumn<int>(
      'in_law_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _likesMainPersonMeta =
      const VerificationMeta('likesMainPerson');
  @override
  late final GeneratedColumn<bool> likesMainPerson =
      GeneratedColumn<bool>('likes_main_person', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("likes_main_person" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _inLawRelationshipTypeMeta =
      const VerificationMeta('inLawRelationshipType');
  @override
  late final GeneratedColumn<String> inLawRelationshipType =
      GeneratedColumn<String>('in_law_relationship_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _haveRomanticRelationshipMeta =
      const VerificationMeta('haveRomanticRelationship');
  @override
  late final GeneratedColumn<bool> haveRomanticRelationship =
      GeneratedColumn<bool>('have_romantic_relationship', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("have_romantic_relationship" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _relationshipMeta =
      const VerificationMeta('relationship');
  @override
  late final GeneratedColumn<int> relationship = GeneratedColumn<int>(
      'relationship', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentlyLivingTogetherMeta =
      const VerificationMeta('currentlyLivingTogether');
  @override
  late final GeneratedColumn<bool> currentlyLivingTogether =
      GeneratedColumn<bool>('currently_living_together', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("currently_living_together" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        mainPersonId,
        inLawId,
        likesMainPerson,
        inLawRelationshipType,
        haveRomanticRelationship,
        relationship,
        currentlyLivingTogether
      ];
  @override
  String get aliasedName => _alias ?? 'inlaw';
  @override
  String get actualTableName => 'inlaw';
  @override
  VerificationContext validateIntegrity(Insertable<InLaw> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('main_person_id')) {
      context.handle(
          _mainPersonIdMeta,
          mainPersonId.isAcceptableOrUnknown(
              data['main_person_id']!, _mainPersonIdMeta));
    } else if (isInserting) {
      context.missing(_mainPersonIdMeta);
    }
    if (data.containsKey('in_law_id')) {
      context.handle(_inLawIdMeta,
          inLawId.isAcceptableOrUnknown(data['in_law_id']!, _inLawIdMeta));
    } else if (isInserting) {
      context.missing(_inLawIdMeta);
    }
    if (data.containsKey('likes_main_person')) {
      context.handle(
          _likesMainPersonMeta,
          likesMainPerson.isAcceptableOrUnknown(
              data['likes_main_person']!, _likesMainPersonMeta));
    } else if (isInserting) {
      context.missing(_likesMainPersonMeta);
    }
    if (data.containsKey('in_law_relationship_type')) {
      context.handle(
          _inLawRelationshipTypeMeta,
          inLawRelationshipType.isAcceptableOrUnknown(
              data['in_law_relationship_type']!, _inLawRelationshipTypeMeta));
    } else if (isInserting) {
      context.missing(_inLawRelationshipTypeMeta);
    }
    if (data.containsKey('have_romantic_relationship')) {
      context.handle(
          _haveRomanticRelationshipMeta,
          haveRomanticRelationship.isAcceptableOrUnknown(
              data['have_romantic_relationship']!,
              _haveRomanticRelationshipMeta));
    } else if (isInserting) {
      context.missing(_haveRomanticRelationshipMeta);
    }
    if (data.containsKey('relationship')) {
      context.handle(
          _relationshipMeta,
          relationship.isAcceptableOrUnknown(
              data['relationship']!, _relationshipMeta));
    } else if (isInserting) {
      context.missing(_relationshipMeta);
    }
    if (data.containsKey('currently_living_together')) {
      context.handle(
          _currentlyLivingTogetherMeta,
          currentlyLivingTogether.isAcceptableOrUnknown(
              data['currently_living_together']!,
              _currentlyLivingTogetherMeta));
    } else if (isInserting) {
      context.missing(_currentlyLivingTogetherMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mainPersonId, inLawId};
  @override
  InLaw map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InLaw(
      mainPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}main_person_id'])!,
      inLawId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}in_law_id'])!,
      likesMainPerson: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}likes_main_person'])!,
      inLawRelationshipType: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}in_law_relationship_type'])!,
      haveRomanticRelationship: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}have_romantic_relationship'])!,
      relationship: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}relationship'])!,
      currentlyLivingTogether: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}currently_living_together'])!,
    );
  }

  @override
  $InLawTableTable createAlias(String alias) {
    return $InLawTableTable(attachedDatabase, alias);
  }
}

class InLaw extends DataClass implements Insertable<InLaw> {
  final int mainPersonId;
  final int inLawId;
  final bool likesMainPerson;
  final String inLawRelationshipType;
  final bool haveRomanticRelationship;
  final int relationship;
  final bool currentlyLivingTogether;
  const InLaw(
      {required this.mainPersonId,
      required this.inLawId,
      required this.likesMainPerson,
      required this.inLawRelationshipType,
      required this.haveRomanticRelationship,
      required this.relationship,
      required this.currentlyLivingTogether});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['main_person_id'] = Variable<int>(mainPersonId);
    map['in_law_id'] = Variable<int>(inLawId);
    map['likes_main_person'] = Variable<bool>(likesMainPerson);
    map['in_law_relationship_type'] = Variable<String>(inLawRelationshipType);
    map['have_romantic_relationship'] =
        Variable<bool>(haveRomanticRelationship);
    map['relationship'] = Variable<int>(relationship);
    map['currently_living_together'] = Variable<bool>(currentlyLivingTogether);
    return map;
  }

  InLawTableCompanion toCompanion(bool nullToAbsent) {
    return InLawTableCompanion(
      mainPersonId: Value(mainPersonId),
      inLawId: Value(inLawId),
      likesMainPerson: Value(likesMainPerson),
      inLawRelationshipType: Value(inLawRelationshipType),
      haveRomanticRelationship: Value(haveRomanticRelationship),
      relationship: Value(relationship),
      currentlyLivingTogether: Value(currentlyLivingTogether),
    );
  }

  factory InLaw.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InLaw(
      mainPersonId: serializer.fromJson<int>(json['mainPersonId']),
      inLawId: serializer.fromJson<int>(json['inLawId']),
      likesMainPerson: serializer.fromJson<bool>(json['likesMainPerson']),
      inLawRelationshipType:
          serializer.fromJson<String>(json['inLawRelationshipType']),
      haveRomanticRelationship:
          serializer.fromJson<bool>(json['haveRomanticRelationship']),
      relationship: serializer.fromJson<int>(json['relationship']),
      currentlyLivingTogether:
          serializer.fromJson<bool>(json['currentlyLivingTogether']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mainPersonId': serializer.toJson<int>(mainPersonId),
      'inLawId': serializer.toJson<int>(inLawId),
      'likesMainPerson': serializer.toJson<bool>(likesMainPerson),
      'inLawRelationshipType': serializer.toJson<String>(inLawRelationshipType),
      'haveRomanticRelationship':
          serializer.toJson<bool>(haveRomanticRelationship),
      'relationship': serializer.toJson<int>(relationship),
      'currentlyLivingTogether':
          serializer.toJson<bool>(currentlyLivingTogether),
    };
  }

  InLaw copyWith(
          {int? mainPersonId,
          int? inLawId,
          bool? likesMainPerson,
          String? inLawRelationshipType,
          bool? haveRomanticRelationship,
          int? relationship,
          bool? currentlyLivingTogether}) =>
      InLaw(
        mainPersonId: mainPersonId ?? this.mainPersonId,
        inLawId: inLawId ?? this.inLawId,
        likesMainPerson: likesMainPerson ?? this.likesMainPerson,
        inLawRelationshipType:
            inLawRelationshipType ?? this.inLawRelationshipType,
        haveRomanticRelationship:
            haveRomanticRelationship ?? this.haveRomanticRelationship,
        relationship: relationship ?? this.relationship,
        currentlyLivingTogether:
            currentlyLivingTogether ?? this.currentlyLivingTogether,
      );
  @override
  String toString() {
    return (StringBuffer('InLaw(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('inLawId: $inLawId, ')
          ..write('likesMainPerson: $likesMainPerson, ')
          ..write('inLawRelationshipType: $inLawRelationshipType, ')
          ..write('haveRomanticRelationship: $haveRomanticRelationship, ')
          ..write('relationship: $relationship, ')
          ..write('currentlyLivingTogether: $currentlyLivingTogether')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      mainPersonId,
      inLawId,
      likesMainPerson,
      inLawRelationshipType,
      haveRomanticRelationship,
      relationship,
      currentlyLivingTogether);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InLaw &&
          other.mainPersonId == this.mainPersonId &&
          other.inLawId == this.inLawId &&
          other.likesMainPerson == this.likesMainPerson &&
          other.inLawRelationshipType == this.inLawRelationshipType &&
          other.haveRomanticRelationship == this.haveRomanticRelationship &&
          other.relationship == this.relationship &&
          other.currentlyLivingTogether == this.currentlyLivingTogether);
}

class InLawTableCompanion extends UpdateCompanion<InLaw> {
  final Value<int> mainPersonId;
  final Value<int> inLawId;
  final Value<bool> likesMainPerson;
  final Value<String> inLawRelationshipType;
  final Value<bool> haveRomanticRelationship;
  final Value<int> relationship;
  final Value<bool> currentlyLivingTogether;
  const InLawTableCompanion({
    this.mainPersonId = const Value.absent(),
    this.inLawId = const Value.absent(),
    this.likesMainPerson = const Value.absent(),
    this.inLawRelationshipType = const Value.absent(),
    this.haveRomanticRelationship = const Value.absent(),
    this.relationship = const Value.absent(),
    this.currentlyLivingTogether = const Value.absent(),
  });
  InLawTableCompanion.insert({
    required int mainPersonId,
    required int inLawId,
    required bool likesMainPerson,
    required String inLawRelationshipType,
    required bool haveRomanticRelationship,
    required int relationship,
    required bool currentlyLivingTogether,
  })  : mainPersonId = Value(mainPersonId),
        inLawId = Value(inLawId),
        likesMainPerson = Value(likesMainPerson),
        inLawRelationshipType = Value(inLawRelationshipType),
        haveRomanticRelationship = Value(haveRomanticRelationship),
        relationship = Value(relationship),
        currentlyLivingTogether = Value(currentlyLivingTogether);
  static Insertable<InLaw> custom({
    Expression<int>? mainPersonId,
    Expression<int>? inLawId,
    Expression<bool>? likesMainPerson,
    Expression<String>? inLawRelationshipType,
    Expression<bool>? haveRomanticRelationship,
    Expression<int>? relationship,
    Expression<bool>? currentlyLivingTogether,
  }) {
    return RawValuesInsertable({
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (inLawId != null) 'in_law_id': inLawId,
      if (likesMainPerson != null) 'likes_main_person': likesMainPerson,
      if (inLawRelationshipType != null)
        'in_law_relationship_type': inLawRelationshipType,
      if (haveRomanticRelationship != null)
        'have_romantic_relationship': haveRomanticRelationship,
      if (relationship != null) 'relationship': relationship,
      if (currentlyLivingTogether != null)
        'currently_living_together': currentlyLivingTogether,
    });
  }

  InLawTableCompanion copyWith(
      {Value<int>? mainPersonId,
      Value<int>? inLawId,
      Value<bool>? likesMainPerson,
      Value<String>? inLawRelationshipType,
      Value<bool>? haveRomanticRelationship,
      Value<int>? relationship,
      Value<bool>? currentlyLivingTogether}) {
    return InLawTableCompanion(
      mainPersonId: mainPersonId ?? this.mainPersonId,
      inLawId: inLawId ?? this.inLawId,
      likesMainPerson: likesMainPerson ?? this.likesMainPerson,
      inLawRelationshipType:
          inLawRelationshipType ?? this.inLawRelationshipType,
      haveRomanticRelationship:
          haveRomanticRelationship ?? this.haveRomanticRelationship,
      relationship: relationship ?? this.relationship,
      currentlyLivingTogether:
          currentlyLivingTogether ?? this.currentlyLivingTogether,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mainPersonId.present) {
      map['main_person_id'] = Variable<int>(mainPersonId.value);
    }
    if (inLawId.present) {
      map['in_law_id'] = Variable<int>(inLawId.value);
    }
    if (likesMainPerson.present) {
      map['likes_main_person'] = Variable<bool>(likesMainPerson.value);
    }
    if (inLawRelationshipType.present) {
      map['in_law_relationship_type'] =
          Variable<String>(inLawRelationshipType.value);
    }
    if (haveRomanticRelationship.present) {
      map['have_romantic_relationship'] =
          Variable<bool>(haveRomanticRelationship.value);
    }
    if (relationship.present) {
      map['relationship'] = Variable<int>(relationship.value);
    }
    if (currentlyLivingTogether.present) {
      map['currently_living_together'] =
          Variable<bool>(currentlyLivingTogether.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InLawTableCompanion(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('inLawId: $inLawId, ')
          ..write('likesMainPerson: $likesMainPerson, ')
          ..write('inLawRelationshipType: $inLawRelationshipType, ')
          ..write('haveRomanticRelationship: $haveRomanticRelationship, ')
          ..write('relationship: $relationship, ')
          ..write('currentlyLivingTogether: $currentlyLivingTogether')
          ..write(')'))
        .toString();
  }
}

class $ParentTableTable extends ParentTable
    with TableInfo<$ParentTableTable, Parent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParentTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mainPersonIdMeta =
      const VerificationMeta('mainPersonId');
  @override
  late final GeneratedColumn<int> mainPersonId = GeneratedColumn<int>(
      'main_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
      'parent_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _parentRelationshipTypeMeta =
      const VerificationMeta('parentRelationshipType');
  @override
  late final GeneratedColumn<String> parentRelationshipType =
      GeneratedColumn<String>('parent_relationship_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hiddenMeta = const VerificationMeta('hidden');
  @override
  late final GeneratedColumn<bool> hidden =
      GeneratedColumn<bool>('hidden', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("hidden" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _paternityFraudMeta =
      const VerificationMeta('paternityFraud');
  @override
  late final GeneratedColumn<bool> paternityFraud =
      GeneratedColumn<bool>('paternity_fraud', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("paternity_fraud" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _assumedRelationshipTypeMeta =
      const VerificationMeta('assumedRelationshipType');
  @override
  late final GeneratedColumn<String> assumedRelationshipType =
      GeneratedColumn<String>('assumed_relationship_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _relationshipMeta =
      const VerificationMeta('relationship');
  @override
  late final GeneratedColumn<int> relationship = GeneratedColumn<int>(
      'relationship', aliasedName, false,
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
  static const VerificationMeta _currentlyLivingTogetherMeta =
      const VerificationMeta('currentlyLivingTogether');
  @override
  late final GeneratedColumn<bool> currentlyLivingTogether =
      GeneratedColumn<bool>('currently_living_together', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("currently_living_together" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        mainPersonId,
        parentId,
        parentRelationshipType,
        hidden,
        paternityFraud,
        assumedRelationshipType,
        relationship,
        isActive,
        currentlyLivingTogether
      ];
  @override
  String get aliasedName => _alias ?? 'parent';
  @override
  String get actualTableName => 'parent';
  @override
  VerificationContext validateIntegrity(Insertable<Parent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('main_person_id')) {
      context.handle(
          _mainPersonIdMeta,
          mainPersonId.isAcceptableOrUnknown(
              data['main_person_id']!, _mainPersonIdMeta));
    } else if (isInserting) {
      context.missing(_mainPersonIdMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    if (data.containsKey('parent_relationship_type')) {
      context.handle(
          _parentRelationshipTypeMeta,
          parentRelationshipType.isAcceptableOrUnknown(
              data['parent_relationship_type']!, _parentRelationshipTypeMeta));
    } else if (isInserting) {
      context.missing(_parentRelationshipTypeMeta);
    }
    if (data.containsKey('hidden')) {
      context.handle(_hiddenMeta,
          hidden.isAcceptableOrUnknown(data['hidden']!, _hiddenMeta));
    } else if (isInserting) {
      context.missing(_hiddenMeta);
    }
    if (data.containsKey('paternity_fraud')) {
      context.handle(
          _paternityFraudMeta,
          paternityFraud.isAcceptableOrUnknown(
              data['paternity_fraud']!, _paternityFraudMeta));
    } else if (isInserting) {
      context.missing(_paternityFraudMeta);
    }
    if (data.containsKey('assumed_relationship_type')) {
      context.handle(
          _assumedRelationshipTypeMeta,
          assumedRelationshipType.isAcceptableOrUnknown(
              data['assumed_relationship_type']!,
              _assumedRelationshipTypeMeta));
    } else if (isInserting) {
      context.missing(_assumedRelationshipTypeMeta);
    }
    if (data.containsKey('relationship')) {
      context.handle(
          _relationshipMeta,
          relationship.isAcceptableOrUnknown(
              data['relationship']!, _relationshipMeta));
    } else if (isInserting) {
      context.missing(_relationshipMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    if (data.containsKey('currently_living_together')) {
      context.handle(
          _currentlyLivingTogetherMeta,
          currentlyLivingTogether.isAcceptableOrUnknown(
              data['currently_living_together']!,
              _currentlyLivingTogetherMeta));
    } else if (isInserting) {
      context.missing(_currentlyLivingTogetherMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mainPersonId, parentId};
  @override
  Parent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Parent(
      mainPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}main_person_id'])!,
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_id'])!,
      parentRelationshipType: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}parent_relationship_type'])!,
      hidden: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}hidden'])!,
      paternityFraud: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}paternity_fraud'])!,
      assumedRelationshipType: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}assumed_relationship_type'])!,
      relationship: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}relationship'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      currentlyLivingTogether: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}currently_living_together'])!,
    );
  }

  @override
  $ParentTableTable createAlias(String alias) {
    return $ParentTableTable(attachedDatabase, alias);
  }
}

class Parent extends DataClass implements Insertable<Parent> {
  final int mainPersonId;
  final int parentId;
  final String parentRelationshipType;
  final bool hidden;
  final bool paternityFraud;
  final String assumedRelationshipType;
  final int relationship;
  final bool isActive;
  final bool currentlyLivingTogether;
  const Parent(
      {required this.mainPersonId,
      required this.parentId,
      required this.parentRelationshipType,
      required this.hidden,
      required this.paternityFraud,
      required this.assumedRelationshipType,
      required this.relationship,
      required this.isActive,
      required this.currentlyLivingTogether});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['main_person_id'] = Variable<int>(mainPersonId);
    map['parent_id'] = Variable<int>(parentId);
    map['parent_relationship_type'] = Variable<String>(parentRelationshipType);
    map['hidden'] = Variable<bool>(hidden);
    map['paternity_fraud'] = Variable<bool>(paternityFraud);
    map['assumed_relationship_type'] =
        Variable<String>(assumedRelationshipType);
    map['relationship'] = Variable<int>(relationship);
    map['is_active'] = Variable<bool>(isActive);
    map['currently_living_together'] = Variable<bool>(currentlyLivingTogether);
    return map;
  }

  ParentTableCompanion toCompanion(bool nullToAbsent) {
    return ParentTableCompanion(
      mainPersonId: Value(mainPersonId),
      parentId: Value(parentId),
      parentRelationshipType: Value(parentRelationshipType),
      hidden: Value(hidden),
      paternityFraud: Value(paternityFraud),
      assumedRelationshipType: Value(assumedRelationshipType),
      relationship: Value(relationship),
      isActive: Value(isActive),
      currentlyLivingTogether: Value(currentlyLivingTogether),
    );
  }

  factory Parent.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Parent(
      mainPersonId: serializer.fromJson<int>(json['mainPersonId']),
      parentId: serializer.fromJson<int>(json['parentId']),
      parentRelationshipType:
          serializer.fromJson<String>(json['parentRelationshipType']),
      hidden: serializer.fromJson<bool>(json['hidden']),
      paternityFraud: serializer.fromJson<bool>(json['paternityFraud']),
      assumedRelationshipType:
          serializer.fromJson<String>(json['assumedRelationshipType']),
      relationship: serializer.fromJson<int>(json['relationship']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      currentlyLivingTogether:
          serializer.fromJson<bool>(json['currentlyLivingTogether']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mainPersonId': serializer.toJson<int>(mainPersonId),
      'parentId': serializer.toJson<int>(parentId),
      'parentRelationshipType':
          serializer.toJson<String>(parentRelationshipType),
      'hidden': serializer.toJson<bool>(hidden),
      'paternityFraud': serializer.toJson<bool>(paternityFraud),
      'assumedRelationshipType':
          serializer.toJson<String>(assumedRelationshipType),
      'relationship': serializer.toJson<int>(relationship),
      'isActive': serializer.toJson<bool>(isActive),
      'currentlyLivingTogether':
          serializer.toJson<bool>(currentlyLivingTogether),
    };
  }

  Parent copyWith(
          {int? mainPersonId,
          int? parentId,
          String? parentRelationshipType,
          bool? hidden,
          bool? paternityFraud,
          String? assumedRelationshipType,
          int? relationship,
          bool? isActive,
          bool? currentlyLivingTogether}) =>
      Parent(
        mainPersonId: mainPersonId ?? this.mainPersonId,
        parentId: parentId ?? this.parentId,
        parentRelationshipType:
            parentRelationshipType ?? this.parentRelationshipType,
        hidden: hidden ?? this.hidden,
        paternityFraud: paternityFraud ?? this.paternityFraud,
        assumedRelationshipType:
            assumedRelationshipType ?? this.assumedRelationshipType,
        relationship: relationship ?? this.relationship,
        isActive: isActive ?? this.isActive,
        currentlyLivingTogether:
            currentlyLivingTogether ?? this.currentlyLivingTogether,
      );
  @override
  String toString() {
    return (StringBuffer('Parent(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('parentId: $parentId, ')
          ..write('parentRelationshipType: $parentRelationshipType, ')
          ..write('hidden: $hidden, ')
          ..write('paternityFraud: $paternityFraud, ')
          ..write('assumedRelationshipType: $assumedRelationshipType, ')
          ..write('relationship: $relationship, ')
          ..write('isActive: $isActive, ')
          ..write('currentlyLivingTogether: $currentlyLivingTogether')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      mainPersonId,
      parentId,
      parentRelationshipType,
      hidden,
      paternityFraud,
      assumedRelationshipType,
      relationship,
      isActive,
      currentlyLivingTogether);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Parent &&
          other.mainPersonId == this.mainPersonId &&
          other.parentId == this.parentId &&
          other.parentRelationshipType == this.parentRelationshipType &&
          other.hidden == this.hidden &&
          other.paternityFraud == this.paternityFraud &&
          other.assumedRelationshipType == this.assumedRelationshipType &&
          other.relationship == this.relationship &&
          other.isActive == this.isActive &&
          other.currentlyLivingTogether == this.currentlyLivingTogether);
}

class ParentTableCompanion extends UpdateCompanion<Parent> {
  final Value<int> mainPersonId;
  final Value<int> parentId;
  final Value<String> parentRelationshipType;
  final Value<bool> hidden;
  final Value<bool> paternityFraud;
  final Value<String> assumedRelationshipType;
  final Value<int> relationship;
  final Value<bool> isActive;
  final Value<bool> currentlyLivingTogether;
  const ParentTableCompanion({
    this.mainPersonId = const Value.absent(),
    this.parentId = const Value.absent(),
    this.parentRelationshipType = const Value.absent(),
    this.hidden = const Value.absent(),
    this.paternityFraud = const Value.absent(),
    this.assumedRelationshipType = const Value.absent(),
    this.relationship = const Value.absent(),
    this.isActive = const Value.absent(),
    this.currentlyLivingTogether = const Value.absent(),
  });
  ParentTableCompanion.insert({
    required int mainPersonId,
    required int parentId,
    required String parentRelationshipType,
    required bool hidden,
    required bool paternityFraud,
    required String assumedRelationshipType,
    required int relationship,
    required bool isActive,
    required bool currentlyLivingTogether,
  })  : mainPersonId = Value(mainPersonId),
        parentId = Value(parentId),
        parentRelationshipType = Value(parentRelationshipType),
        hidden = Value(hidden),
        paternityFraud = Value(paternityFraud),
        assumedRelationshipType = Value(assumedRelationshipType),
        relationship = Value(relationship),
        isActive = Value(isActive),
        currentlyLivingTogether = Value(currentlyLivingTogether);
  static Insertable<Parent> custom({
    Expression<int>? mainPersonId,
    Expression<int>? parentId,
    Expression<String>? parentRelationshipType,
    Expression<bool>? hidden,
    Expression<bool>? paternityFraud,
    Expression<String>? assumedRelationshipType,
    Expression<int>? relationship,
    Expression<bool>? isActive,
    Expression<bool>? currentlyLivingTogether,
  }) {
    return RawValuesInsertable({
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (parentId != null) 'parent_id': parentId,
      if (parentRelationshipType != null)
        'parent_relationship_type': parentRelationshipType,
      if (hidden != null) 'hidden': hidden,
      if (paternityFraud != null) 'paternity_fraud': paternityFraud,
      if (assumedRelationshipType != null)
        'assumed_relationship_type': assumedRelationshipType,
      if (relationship != null) 'relationship': relationship,
      if (isActive != null) 'is_active': isActive,
      if (currentlyLivingTogether != null)
        'currently_living_together': currentlyLivingTogether,
    });
  }

  ParentTableCompanion copyWith(
      {Value<int>? mainPersonId,
      Value<int>? parentId,
      Value<String>? parentRelationshipType,
      Value<bool>? hidden,
      Value<bool>? paternityFraud,
      Value<String>? assumedRelationshipType,
      Value<int>? relationship,
      Value<bool>? isActive,
      Value<bool>? currentlyLivingTogether}) {
    return ParentTableCompanion(
      mainPersonId: mainPersonId ?? this.mainPersonId,
      parentId: parentId ?? this.parentId,
      parentRelationshipType:
          parentRelationshipType ?? this.parentRelationshipType,
      hidden: hidden ?? this.hidden,
      paternityFraud: paternityFraud ?? this.paternityFraud,
      assumedRelationshipType:
          assumedRelationshipType ?? this.assumedRelationshipType,
      relationship: relationship ?? this.relationship,
      isActive: isActive ?? this.isActive,
      currentlyLivingTogether:
          currentlyLivingTogether ?? this.currentlyLivingTogether,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mainPersonId.present) {
      map['main_person_id'] = Variable<int>(mainPersonId.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (parentRelationshipType.present) {
      map['parent_relationship_type'] =
          Variable<String>(parentRelationshipType.value);
    }
    if (hidden.present) {
      map['hidden'] = Variable<bool>(hidden.value);
    }
    if (paternityFraud.present) {
      map['paternity_fraud'] = Variable<bool>(paternityFraud.value);
    }
    if (assumedRelationshipType.present) {
      map['assumed_relationship_type'] =
          Variable<String>(assumedRelationshipType.value);
    }
    if (relationship.present) {
      map['relationship'] = Variable<int>(relationship.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (currentlyLivingTogether.present) {
      map['currently_living_together'] =
          Variable<bool>(currentlyLivingTogether.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParentTableCompanion(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('parentId: $parentId, ')
          ..write('parentRelationshipType: $parentRelationshipType, ')
          ..write('hidden: $hidden, ')
          ..write('paternityFraud: $paternityFraud, ')
          ..write('assumedRelationshipType: $assumedRelationshipType, ')
          ..write('relationship: $relationship, ')
          ..write('isActive: $isActive, ')
          ..write('currentlyLivingTogether: $currentlyLivingTogether')
          ..write(')'))
        .toString();
  }
}

class $PartnerTableTable extends PartnerTable
    with TableInfo<$PartnerTableTable, Partner> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartnerTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mainPersonIdMeta =
      const VerificationMeta('mainPersonId');
  @override
  late final GeneratedColumn<int> mainPersonId = GeneratedColumn<int>(
      'main_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _partnerIdMeta =
      const VerificationMeta('partnerId');
  @override
  late final GeneratedColumn<int> partnerId = GeneratedColumn<int>(
      'partner_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _partnerRelationshipTypeMeta =
      const VerificationMeta('partnerRelationshipType');
  @override
  late final GeneratedColumn<String> partnerRelationshipType =
      GeneratedColumn<String>('partner_relationship_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
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
  static const VerificationMeta _jointMoneyMeta =
      const VerificationMeta('jointMoney');
  @override
  late final GeneratedColumn<int> jointMoney = GeneratedColumn<int>(
      'joint_money', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _startDayMeta =
      const VerificationMeta('startDay');
  @override
  late final GeneratedColumn<int> startDay = GeneratedColumn<int>(
      'start_day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _endDayMeta = const VerificationMeta('endDay');
  @override
  late final GeneratedColumn<int> endDay = GeneratedColumn<int>(
      'end_day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isCoParentMeta =
      const VerificationMeta('isCoParent');
  @override
  late final GeneratedColumn<bool> isCoParent =
      GeneratedColumn<bool>('is_co_parent', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_co_parent" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _metAtMeta = const VerificationMeta('metAt');
  @override
  late final GeneratedColumn<String> metAt = GeneratedColumn<String>(
      'met_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _relationshipMeta =
      const VerificationMeta('relationship');
  @override
  late final GeneratedColumn<int> relationship = GeneratedColumn<int>(
      'relationship', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentlyLivingTogetherMeta =
      const VerificationMeta('currentlyLivingTogether');
  @override
  late final GeneratedColumn<bool> currentlyLivingTogether =
      GeneratedColumn<bool>('currently_living_together', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("currently_living_together" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        mainPersonId,
        partnerId,
        partnerRelationshipType,
        isActive,
        jointMoney,
        startDay,
        endDay,
        isCoParent,
        metAt,
        relationship,
        currentlyLivingTogether
      ];
  @override
  String get aliasedName => _alias ?? 'partner';
  @override
  String get actualTableName => 'partner';
  @override
  VerificationContext validateIntegrity(Insertable<Partner> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('main_person_id')) {
      context.handle(
          _mainPersonIdMeta,
          mainPersonId.isAcceptableOrUnknown(
              data['main_person_id']!, _mainPersonIdMeta));
    } else if (isInserting) {
      context.missing(_mainPersonIdMeta);
    }
    if (data.containsKey('partner_id')) {
      context.handle(_partnerIdMeta,
          partnerId.isAcceptableOrUnknown(data['partner_id']!, _partnerIdMeta));
    } else if (isInserting) {
      context.missing(_partnerIdMeta);
    }
    if (data.containsKey('partner_relationship_type')) {
      context.handle(
          _partnerRelationshipTypeMeta,
          partnerRelationshipType.isAcceptableOrUnknown(
              data['partner_relationship_type']!,
              _partnerRelationshipTypeMeta));
    } else if (isInserting) {
      context.missing(_partnerRelationshipTypeMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    if (data.containsKey('joint_money')) {
      context.handle(
          _jointMoneyMeta,
          jointMoney.isAcceptableOrUnknown(
              data['joint_money']!, _jointMoneyMeta));
    } else if (isInserting) {
      context.missing(_jointMoneyMeta);
    }
    if (data.containsKey('start_day')) {
      context.handle(_startDayMeta,
          startDay.isAcceptableOrUnknown(data['start_day']!, _startDayMeta));
    } else if (isInserting) {
      context.missing(_startDayMeta);
    }
    if (data.containsKey('end_day')) {
      context.handle(_endDayMeta,
          endDay.isAcceptableOrUnknown(data['end_day']!, _endDayMeta));
    } else if (isInserting) {
      context.missing(_endDayMeta);
    }
    if (data.containsKey('is_co_parent')) {
      context.handle(
          _isCoParentMeta,
          isCoParent.isAcceptableOrUnknown(
              data['is_co_parent']!, _isCoParentMeta));
    } else if (isInserting) {
      context.missing(_isCoParentMeta);
    }
    if (data.containsKey('met_at')) {
      context.handle(
          _metAtMeta, metAt.isAcceptableOrUnknown(data['met_at']!, _metAtMeta));
    } else if (isInserting) {
      context.missing(_metAtMeta);
    }
    if (data.containsKey('relationship')) {
      context.handle(
          _relationshipMeta,
          relationship.isAcceptableOrUnknown(
              data['relationship']!, _relationshipMeta));
    } else if (isInserting) {
      context.missing(_relationshipMeta);
    }
    if (data.containsKey('currently_living_together')) {
      context.handle(
          _currentlyLivingTogetherMeta,
          currentlyLivingTogether.isAcceptableOrUnknown(
              data['currently_living_together']!,
              _currentlyLivingTogetherMeta));
    } else if (isInserting) {
      context.missing(_currentlyLivingTogetherMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mainPersonId, partnerId};
  @override
  Partner map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Partner(
      mainPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}main_person_id'])!,
      partnerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}partner_id'])!,
      partnerRelationshipType: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}partner_relationship_type'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      jointMoney: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}joint_money'])!,
      startDay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}start_day'])!,
      endDay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}end_day'])!,
      isCoParent: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_co_parent'])!,
      metAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}met_at'])!,
      relationship: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}relationship'])!,
      currentlyLivingTogether: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}currently_living_together'])!,
    );
  }

  @override
  $PartnerTableTable createAlias(String alias) {
    return $PartnerTableTable(attachedDatabase, alias);
  }
}

class Partner extends DataClass implements Insertable<Partner> {
  final int mainPersonId;
  final int partnerId;
  final String partnerRelationshipType;
  final bool isActive;
  final int jointMoney;
  final int startDay;
  final int endDay;
  final bool isCoParent;
  final String metAt;
  final int relationship;
  final bool currentlyLivingTogether;
  const Partner(
      {required this.mainPersonId,
      required this.partnerId,
      required this.partnerRelationshipType,
      required this.isActive,
      required this.jointMoney,
      required this.startDay,
      required this.endDay,
      required this.isCoParent,
      required this.metAt,
      required this.relationship,
      required this.currentlyLivingTogether});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['main_person_id'] = Variable<int>(mainPersonId);
    map['partner_id'] = Variable<int>(partnerId);
    map['partner_relationship_type'] =
        Variable<String>(partnerRelationshipType);
    map['is_active'] = Variable<bool>(isActive);
    map['joint_money'] = Variable<int>(jointMoney);
    map['start_day'] = Variable<int>(startDay);
    map['end_day'] = Variable<int>(endDay);
    map['is_co_parent'] = Variable<bool>(isCoParent);
    map['met_at'] = Variable<String>(metAt);
    map['relationship'] = Variable<int>(relationship);
    map['currently_living_together'] = Variable<bool>(currentlyLivingTogether);
    return map;
  }

  PartnerTableCompanion toCompanion(bool nullToAbsent) {
    return PartnerTableCompanion(
      mainPersonId: Value(mainPersonId),
      partnerId: Value(partnerId),
      partnerRelationshipType: Value(partnerRelationshipType),
      isActive: Value(isActive),
      jointMoney: Value(jointMoney),
      startDay: Value(startDay),
      endDay: Value(endDay),
      isCoParent: Value(isCoParent),
      metAt: Value(metAt),
      relationship: Value(relationship),
      currentlyLivingTogether: Value(currentlyLivingTogether),
    );
  }

  factory Partner.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Partner(
      mainPersonId: serializer.fromJson<int>(json['mainPersonId']),
      partnerId: serializer.fromJson<int>(json['partnerId']),
      partnerRelationshipType:
          serializer.fromJson<String>(json['partnerRelationshipType']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      jointMoney: serializer.fromJson<int>(json['jointMoney']),
      startDay: serializer.fromJson<int>(json['startDay']),
      endDay: serializer.fromJson<int>(json['endDay']),
      isCoParent: serializer.fromJson<bool>(json['isCoParent']),
      metAt: serializer.fromJson<String>(json['metAt']),
      relationship: serializer.fromJson<int>(json['relationship']),
      currentlyLivingTogether:
          serializer.fromJson<bool>(json['currentlyLivingTogether']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mainPersonId': serializer.toJson<int>(mainPersonId),
      'partnerId': serializer.toJson<int>(partnerId),
      'partnerRelationshipType':
          serializer.toJson<String>(partnerRelationshipType),
      'isActive': serializer.toJson<bool>(isActive),
      'jointMoney': serializer.toJson<int>(jointMoney),
      'startDay': serializer.toJson<int>(startDay),
      'endDay': serializer.toJson<int>(endDay),
      'isCoParent': serializer.toJson<bool>(isCoParent),
      'metAt': serializer.toJson<String>(metAt),
      'relationship': serializer.toJson<int>(relationship),
      'currentlyLivingTogether':
          serializer.toJson<bool>(currentlyLivingTogether),
    };
  }

  Partner copyWith(
          {int? mainPersonId,
          int? partnerId,
          String? partnerRelationshipType,
          bool? isActive,
          int? jointMoney,
          int? startDay,
          int? endDay,
          bool? isCoParent,
          String? metAt,
          int? relationship,
          bool? currentlyLivingTogether}) =>
      Partner(
        mainPersonId: mainPersonId ?? this.mainPersonId,
        partnerId: partnerId ?? this.partnerId,
        partnerRelationshipType:
            partnerRelationshipType ?? this.partnerRelationshipType,
        isActive: isActive ?? this.isActive,
        jointMoney: jointMoney ?? this.jointMoney,
        startDay: startDay ?? this.startDay,
        endDay: endDay ?? this.endDay,
        isCoParent: isCoParent ?? this.isCoParent,
        metAt: metAt ?? this.metAt,
        relationship: relationship ?? this.relationship,
        currentlyLivingTogether:
            currentlyLivingTogether ?? this.currentlyLivingTogether,
      );
  @override
  String toString() {
    return (StringBuffer('Partner(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('partnerId: $partnerId, ')
          ..write('partnerRelationshipType: $partnerRelationshipType, ')
          ..write('isActive: $isActive, ')
          ..write('jointMoney: $jointMoney, ')
          ..write('startDay: $startDay, ')
          ..write('endDay: $endDay, ')
          ..write('isCoParent: $isCoParent, ')
          ..write('metAt: $metAt, ')
          ..write('relationship: $relationship, ')
          ..write('currentlyLivingTogether: $currentlyLivingTogether')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      mainPersonId,
      partnerId,
      partnerRelationshipType,
      isActive,
      jointMoney,
      startDay,
      endDay,
      isCoParent,
      metAt,
      relationship,
      currentlyLivingTogether);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Partner &&
          other.mainPersonId == this.mainPersonId &&
          other.partnerId == this.partnerId &&
          other.partnerRelationshipType == this.partnerRelationshipType &&
          other.isActive == this.isActive &&
          other.jointMoney == this.jointMoney &&
          other.startDay == this.startDay &&
          other.endDay == this.endDay &&
          other.isCoParent == this.isCoParent &&
          other.metAt == this.metAt &&
          other.relationship == this.relationship &&
          other.currentlyLivingTogether == this.currentlyLivingTogether);
}

class PartnerTableCompanion extends UpdateCompanion<Partner> {
  final Value<int> mainPersonId;
  final Value<int> partnerId;
  final Value<String> partnerRelationshipType;
  final Value<bool> isActive;
  final Value<int> jointMoney;
  final Value<int> startDay;
  final Value<int> endDay;
  final Value<bool> isCoParent;
  final Value<String> metAt;
  final Value<int> relationship;
  final Value<bool> currentlyLivingTogether;
  const PartnerTableCompanion({
    this.mainPersonId = const Value.absent(),
    this.partnerId = const Value.absent(),
    this.partnerRelationshipType = const Value.absent(),
    this.isActive = const Value.absent(),
    this.jointMoney = const Value.absent(),
    this.startDay = const Value.absent(),
    this.endDay = const Value.absent(),
    this.isCoParent = const Value.absent(),
    this.metAt = const Value.absent(),
    this.relationship = const Value.absent(),
    this.currentlyLivingTogether = const Value.absent(),
  });
  PartnerTableCompanion.insert({
    required int mainPersonId,
    required int partnerId,
    required String partnerRelationshipType,
    required bool isActive,
    required int jointMoney,
    required int startDay,
    required int endDay,
    required bool isCoParent,
    required String metAt,
    required int relationship,
    required bool currentlyLivingTogether,
  })  : mainPersonId = Value(mainPersonId),
        partnerId = Value(partnerId),
        partnerRelationshipType = Value(partnerRelationshipType),
        isActive = Value(isActive),
        jointMoney = Value(jointMoney),
        startDay = Value(startDay),
        endDay = Value(endDay),
        isCoParent = Value(isCoParent),
        metAt = Value(metAt),
        relationship = Value(relationship),
        currentlyLivingTogether = Value(currentlyLivingTogether);
  static Insertable<Partner> custom({
    Expression<int>? mainPersonId,
    Expression<int>? partnerId,
    Expression<String>? partnerRelationshipType,
    Expression<bool>? isActive,
    Expression<int>? jointMoney,
    Expression<int>? startDay,
    Expression<int>? endDay,
    Expression<bool>? isCoParent,
    Expression<String>? metAt,
    Expression<int>? relationship,
    Expression<bool>? currentlyLivingTogether,
  }) {
    return RawValuesInsertable({
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (partnerId != null) 'partner_id': partnerId,
      if (partnerRelationshipType != null)
        'partner_relationship_type': partnerRelationshipType,
      if (isActive != null) 'is_active': isActive,
      if (jointMoney != null) 'joint_money': jointMoney,
      if (startDay != null) 'start_day': startDay,
      if (endDay != null) 'end_day': endDay,
      if (isCoParent != null) 'is_co_parent': isCoParent,
      if (metAt != null) 'met_at': metAt,
      if (relationship != null) 'relationship': relationship,
      if (currentlyLivingTogether != null)
        'currently_living_together': currentlyLivingTogether,
    });
  }

  PartnerTableCompanion copyWith(
      {Value<int>? mainPersonId,
      Value<int>? partnerId,
      Value<String>? partnerRelationshipType,
      Value<bool>? isActive,
      Value<int>? jointMoney,
      Value<int>? startDay,
      Value<int>? endDay,
      Value<bool>? isCoParent,
      Value<String>? metAt,
      Value<int>? relationship,
      Value<bool>? currentlyLivingTogether}) {
    return PartnerTableCompanion(
      mainPersonId: mainPersonId ?? this.mainPersonId,
      partnerId: partnerId ?? this.partnerId,
      partnerRelationshipType:
          partnerRelationshipType ?? this.partnerRelationshipType,
      isActive: isActive ?? this.isActive,
      jointMoney: jointMoney ?? this.jointMoney,
      startDay: startDay ?? this.startDay,
      endDay: endDay ?? this.endDay,
      isCoParent: isCoParent ?? this.isCoParent,
      metAt: metAt ?? this.metAt,
      relationship: relationship ?? this.relationship,
      currentlyLivingTogether:
          currentlyLivingTogether ?? this.currentlyLivingTogether,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mainPersonId.present) {
      map['main_person_id'] = Variable<int>(mainPersonId.value);
    }
    if (partnerId.present) {
      map['partner_id'] = Variable<int>(partnerId.value);
    }
    if (partnerRelationshipType.present) {
      map['partner_relationship_type'] =
          Variable<String>(partnerRelationshipType.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (jointMoney.present) {
      map['joint_money'] = Variable<int>(jointMoney.value);
    }
    if (startDay.present) {
      map['start_day'] = Variable<int>(startDay.value);
    }
    if (endDay.present) {
      map['end_day'] = Variable<int>(endDay.value);
    }
    if (isCoParent.present) {
      map['is_co_parent'] = Variable<bool>(isCoParent.value);
    }
    if (metAt.present) {
      map['met_at'] = Variable<String>(metAt.value);
    }
    if (relationship.present) {
      map['relationship'] = Variable<int>(relationship.value);
    }
    if (currentlyLivingTogether.present) {
      map['currently_living_together'] =
          Variable<bool>(currentlyLivingTogether.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartnerTableCompanion(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('partnerId: $partnerId, ')
          ..write('partnerRelationshipType: $partnerRelationshipType, ')
          ..write('isActive: $isActive, ')
          ..write('jointMoney: $jointMoney, ')
          ..write('startDay: $startDay, ')
          ..write('endDay: $endDay, ')
          ..write('isCoParent: $isCoParent, ')
          ..write('metAt: $metAt, ')
          ..write('relationship: $relationship, ')
          ..write('currentlyLivingTogether: $currentlyLivingTogether')
          ..write(')'))
        .toString();
  }
}

class $RelativeTableTable extends RelativeTable
    with TableInfo<$RelativeTableTable, Relative> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelativeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mainPersonIdMeta =
      const VerificationMeta('mainPersonId');
  @override
  late final GeneratedColumn<int> mainPersonId = GeneratedColumn<int>(
      'main_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _relativeIdMeta =
      const VerificationMeta('relativeId');
  @override
  late final GeneratedColumn<int> relativeId = GeneratedColumn<int>(
      'relative_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _currentlyLivingTogetherMeta =
      const VerificationMeta('currentlyLivingTogether');
  @override
  late final GeneratedColumn<bool> currentlyLivingTogether =
      GeneratedColumn<bool>('currently_living_together', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("currently_living_together" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _relativeRelationshipTypeMeta =
      const VerificationMeta('relativeRelationshipType');
  @override
  late final GeneratedColumn<String> relativeRelationshipType =
      GeneratedColumn<String>('relative_relationship_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _relationshipMeta =
      const VerificationMeta('relationship');
  @override
  late final GeneratedColumn<int> relationship = GeneratedColumn<int>(
      'relationship', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        mainPersonId,
        relativeId,
        currentlyLivingTogether,
        relativeRelationshipType,
        relationship
      ];
  @override
  String get aliasedName => _alias ?? 'relative';
  @override
  String get actualTableName => 'relative';
  @override
  VerificationContext validateIntegrity(Insertable<Relative> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('main_person_id')) {
      context.handle(
          _mainPersonIdMeta,
          mainPersonId.isAcceptableOrUnknown(
              data['main_person_id']!, _mainPersonIdMeta));
    } else if (isInserting) {
      context.missing(_mainPersonIdMeta);
    }
    if (data.containsKey('relative_id')) {
      context.handle(
          _relativeIdMeta,
          relativeId.isAcceptableOrUnknown(
              data['relative_id']!, _relativeIdMeta));
    } else if (isInserting) {
      context.missing(_relativeIdMeta);
    }
    if (data.containsKey('currently_living_together')) {
      context.handle(
          _currentlyLivingTogetherMeta,
          currentlyLivingTogether.isAcceptableOrUnknown(
              data['currently_living_together']!,
              _currentlyLivingTogetherMeta));
    } else if (isInserting) {
      context.missing(_currentlyLivingTogetherMeta);
    }
    if (data.containsKey('relative_relationship_type')) {
      context.handle(
          _relativeRelationshipTypeMeta,
          relativeRelationshipType.isAcceptableOrUnknown(
              data['relative_relationship_type']!,
              _relativeRelationshipTypeMeta));
    } else if (isInserting) {
      context.missing(_relativeRelationshipTypeMeta);
    }
    if (data.containsKey('relationship')) {
      context.handle(
          _relationshipMeta,
          relationship.isAcceptableOrUnknown(
              data['relationship']!, _relationshipMeta));
    } else if (isInserting) {
      context.missing(_relationshipMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mainPersonId, relativeId};
  @override
  Relative map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Relative(
      mainPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}main_person_id'])!,
      relativeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}relative_id'])!,
      currentlyLivingTogether: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}currently_living_together'])!,
      relativeRelationshipType: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}relative_relationship_type'])!,
      relationship: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}relationship'])!,
    );
  }

  @override
  $RelativeTableTable createAlias(String alias) {
    return $RelativeTableTable(attachedDatabase, alias);
  }
}

class Relative extends DataClass implements Insertable<Relative> {
  final int mainPersonId;
  final int relativeId;
  final bool currentlyLivingTogether;
  final String relativeRelationshipType;
  final int relationship;
  const Relative(
      {required this.mainPersonId,
      required this.relativeId,
      required this.currentlyLivingTogether,
      required this.relativeRelationshipType,
      required this.relationship});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['main_person_id'] = Variable<int>(mainPersonId);
    map['relative_id'] = Variable<int>(relativeId);
    map['currently_living_together'] = Variable<bool>(currentlyLivingTogether);
    map['relative_relationship_type'] =
        Variable<String>(relativeRelationshipType);
    map['relationship'] = Variable<int>(relationship);
    return map;
  }

  RelativeTableCompanion toCompanion(bool nullToAbsent) {
    return RelativeTableCompanion(
      mainPersonId: Value(mainPersonId),
      relativeId: Value(relativeId),
      currentlyLivingTogether: Value(currentlyLivingTogether),
      relativeRelationshipType: Value(relativeRelationshipType),
      relationship: Value(relationship),
    );
  }

  factory Relative.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Relative(
      mainPersonId: serializer.fromJson<int>(json['mainPersonId']),
      relativeId: serializer.fromJson<int>(json['relativeId']),
      currentlyLivingTogether:
          serializer.fromJson<bool>(json['currentlyLivingTogether']),
      relativeRelationshipType:
          serializer.fromJson<String>(json['relativeRelationshipType']),
      relationship: serializer.fromJson<int>(json['relationship']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mainPersonId': serializer.toJson<int>(mainPersonId),
      'relativeId': serializer.toJson<int>(relativeId),
      'currentlyLivingTogether':
          serializer.toJson<bool>(currentlyLivingTogether),
      'relativeRelationshipType':
          serializer.toJson<String>(relativeRelationshipType),
      'relationship': serializer.toJson<int>(relationship),
    };
  }

  Relative copyWith(
          {int? mainPersonId,
          int? relativeId,
          bool? currentlyLivingTogether,
          String? relativeRelationshipType,
          int? relationship}) =>
      Relative(
        mainPersonId: mainPersonId ?? this.mainPersonId,
        relativeId: relativeId ?? this.relativeId,
        currentlyLivingTogether:
            currentlyLivingTogether ?? this.currentlyLivingTogether,
        relativeRelationshipType:
            relativeRelationshipType ?? this.relativeRelationshipType,
        relationship: relationship ?? this.relationship,
      );
  @override
  String toString() {
    return (StringBuffer('Relative(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('relativeId: $relativeId, ')
          ..write('currentlyLivingTogether: $currentlyLivingTogether, ')
          ..write('relativeRelationshipType: $relativeRelationshipType, ')
          ..write('relationship: $relationship')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mainPersonId, relativeId,
      currentlyLivingTogether, relativeRelationshipType, relationship);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Relative &&
          other.mainPersonId == this.mainPersonId &&
          other.relativeId == this.relativeId &&
          other.currentlyLivingTogether == this.currentlyLivingTogether &&
          other.relativeRelationshipType == this.relativeRelationshipType &&
          other.relationship == this.relationship);
}

class RelativeTableCompanion extends UpdateCompanion<Relative> {
  final Value<int> mainPersonId;
  final Value<int> relativeId;
  final Value<bool> currentlyLivingTogether;
  final Value<String> relativeRelationshipType;
  final Value<int> relationship;
  const RelativeTableCompanion({
    this.mainPersonId = const Value.absent(),
    this.relativeId = const Value.absent(),
    this.currentlyLivingTogether = const Value.absent(),
    this.relativeRelationshipType = const Value.absent(),
    this.relationship = const Value.absent(),
  });
  RelativeTableCompanion.insert({
    required int mainPersonId,
    required int relativeId,
    required bool currentlyLivingTogether,
    required String relativeRelationshipType,
    required int relationship,
  })  : mainPersonId = Value(mainPersonId),
        relativeId = Value(relativeId),
        currentlyLivingTogether = Value(currentlyLivingTogether),
        relativeRelationshipType = Value(relativeRelationshipType),
        relationship = Value(relationship);
  static Insertable<Relative> custom({
    Expression<int>? mainPersonId,
    Expression<int>? relativeId,
    Expression<bool>? currentlyLivingTogether,
    Expression<String>? relativeRelationshipType,
    Expression<int>? relationship,
  }) {
    return RawValuesInsertable({
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (relativeId != null) 'relative_id': relativeId,
      if (currentlyLivingTogether != null)
        'currently_living_together': currentlyLivingTogether,
      if (relativeRelationshipType != null)
        'relative_relationship_type': relativeRelationshipType,
      if (relationship != null) 'relationship': relationship,
    });
  }

  RelativeTableCompanion copyWith(
      {Value<int>? mainPersonId,
      Value<int>? relativeId,
      Value<bool>? currentlyLivingTogether,
      Value<String>? relativeRelationshipType,
      Value<int>? relationship}) {
    return RelativeTableCompanion(
      mainPersonId: mainPersonId ?? this.mainPersonId,
      relativeId: relativeId ?? this.relativeId,
      currentlyLivingTogether:
          currentlyLivingTogether ?? this.currentlyLivingTogether,
      relativeRelationshipType:
          relativeRelationshipType ?? this.relativeRelationshipType,
      relationship: relationship ?? this.relationship,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mainPersonId.present) {
      map['main_person_id'] = Variable<int>(mainPersonId.value);
    }
    if (relativeId.present) {
      map['relative_id'] = Variable<int>(relativeId.value);
    }
    if (currentlyLivingTogether.present) {
      map['currently_living_together'] =
          Variable<bool>(currentlyLivingTogether.value);
    }
    if (relativeRelationshipType.present) {
      map['relative_relationship_type'] =
          Variable<String>(relativeRelationshipType.value);
    }
    if (relationship.present) {
      map['relationship'] = Variable<int>(relationship.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelativeTableCompanion(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('relativeId: $relativeId, ')
          ..write('currentlyLivingTogether: $currentlyLivingTogether, ')
          ..write('relativeRelationshipType: $relativeRelationshipType, ')
          ..write('relationship: $relationship')
          ..write(')'))
        .toString();
  }
}

class $SiblingTableTable extends SiblingTable
    with TableInfo<$SiblingTableTable, Sibling> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SiblingTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mainPersonIdMeta =
      const VerificationMeta('mainPersonId');
  @override
  late final GeneratedColumn<int> mainPersonId = GeneratedColumn<int>(
      'main_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _siblingIdMeta =
      const VerificationMeta('siblingId');
  @override
  late final GeneratedColumn<int> siblingId = GeneratedColumn<int>(
      'sibling_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _siblingRelationshipTypeMeta =
      const VerificationMeta('siblingRelationshipType');
  @override
  late final GeneratedColumn<String> siblingRelationshipType =
      GeneratedColumn<String>('sibling_relationship_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _relationshipMeta =
      const VerificationMeta('relationship');
  @override
  late final GeneratedColumn<int> relationship = GeneratedColumn<int>(
      'relationship', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentlyLivingTogetherMeta =
      const VerificationMeta('currentlyLivingTogether');
  @override
  late final GeneratedColumn<bool> currentlyLivingTogether =
      GeneratedColumn<bool>('currently_living_together', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("currently_living_together" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        mainPersonId,
        siblingId,
        siblingRelationshipType,
        relationship,
        currentlyLivingTogether
      ];
  @override
  String get aliasedName => _alias ?? 'sibling';
  @override
  String get actualTableName => 'sibling';
  @override
  VerificationContext validateIntegrity(Insertable<Sibling> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('main_person_id')) {
      context.handle(
          _mainPersonIdMeta,
          mainPersonId.isAcceptableOrUnknown(
              data['main_person_id']!, _mainPersonIdMeta));
    } else if (isInserting) {
      context.missing(_mainPersonIdMeta);
    }
    if (data.containsKey('sibling_id')) {
      context.handle(_siblingIdMeta,
          siblingId.isAcceptableOrUnknown(data['sibling_id']!, _siblingIdMeta));
    } else if (isInserting) {
      context.missing(_siblingIdMeta);
    }
    if (data.containsKey('sibling_relationship_type')) {
      context.handle(
          _siblingRelationshipTypeMeta,
          siblingRelationshipType.isAcceptableOrUnknown(
              data['sibling_relationship_type']!,
              _siblingRelationshipTypeMeta));
    } else if (isInserting) {
      context.missing(_siblingRelationshipTypeMeta);
    }
    if (data.containsKey('relationship')) {
      context.handle(
          _relationshipMeta,
          relationship.isAcceptableOrUnknown(
              data['relationship']!, _relationshipMeta));
    } else if (isInserting) {
      context.missing(_relationshipMeta);
    }
    if (data.containsKey('currently_living_together')) {
      context.handle(
          _currentlyLivingTogetherMeta,
          currentlyLivingTogether.isAcceptableOrUnknown(
              data['currently_living_together']!,
              _currentlyLivingTogetherMeta));
    } else if (isInserting) {
      context.missing(_currentlyLivingTogetherMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mainPersonId, siblingId};
  @override
  Sibling map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Sibling(
      mainPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}main_person_id'])!,
      siblingId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sibling_id'])!,
      siblingRelationshipType: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sibling_relationship_type'])!,
      relationship: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}relationship'])!,
      currentlyLivingTogether: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}currently_living_together'])!,
    );
  }

  @override
  $SiblingTableTable createAlias(String alias) {
    return $SiblingTableTable(attachedDatabase, alias);
  }
}

class Sibling extends DataClass implements Insertable<Sibling> {
  final int mainPersonId;
  final int siblingId;
  final String siblingRelationshipType;
  final int relationship;
  final bool currentlyLivingTogether;
  const Sibling(
      {required this.mainPersonId,
      required this.siblingId,
      required this.siblingRelationshipType,
      required this.relationship,
      required this.currentlyLivingTogether});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['main_person_id'] = Variable<int>(mainPersonId);
    map['sibling_id'] = Variable<int>(siblingId);
    map['sibling_relationship_type'] =
        Variable<String>(siblingRelationshipType);
    map['relationship'] = Variable<int>(relationship);
    map['currently_living_together'] = Variable<bool>(currentlyLivingTogether);
    return map;
  }

  SiblingTableCompanion toCompanion(bool nullToAbsent) {
    return SiblingTableCompanion(
      mainPersonId: Value(mainPersonId),
      siblingId: Value(siblingId),
      siblingRelationshipType: Value(siblingRelationshipType),
      relationship: Value(relationship),
      currentlyLivingTogether: Value(currentlyLivingTogether),
    );
  }

  factory Sibling.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Sibling(
      mainPersonId: serializer.fromJson<int>(json['mainPersonId']),
      siblingId: serializer.fromJson<int>(json['siblingId']),
      siblingRelationshipType:
          serializer.fromJson<String>(json['siblingRelationshipType']),
      relationship: serializer.fromJson<int>(json['relationship']),
      currentlyLivingTogether:
          serializer.fromJson<bool>(json['currentlyLivingTogether']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mainPersonId': serializer.toJson<int>(mainPersonId),
      'siblingId': serializer.toJson<int>(siblingId),
      'siblingRelationshipType':
          serializer.toJson<String>(siblingRelationshipType),
      'relationship': serializer.toJson<int>(relationship),
      'currentlyLivingTogether':
          serializer.toJson<bool>(currentlyLivingTogether),
    };
  }

  Sibling copyWith(
          {int? mainPersonId,
          int? siblingId,
          String? siblingRelationshipType,
          int? relationship,
          bool? currentlyLivingTogether}) =>
      Sibling(
        mainPersonId: mainPersonId ?? this.mainPersonId,
        siblingId: siblingId ?? this.siblingId,
        siblingRelationshipType:
            siblingRelationshipType ?? this.siblingRelationshipType,
        relationship: relationship ?? this.relationship,
        currentlyLivingTogether:
            currentlyLivingTogether ?? this.currentlyLivingTogether,
      );
  @override
  String toString() {
    return (StringBuffer('Sibling(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('siblingId: $siblingId, ')
          ..write('siblingRelationshipType: $siblingRelationshipType, ')
          ..write('relationship: $relationship, ')
          ..write('currentlyLivingTogether: $currentlyLivingTogether')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mainPersonId, siblingId,
      siblingRelationshipType, relationship, currentlyLivingTogether);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Sibling &&
          other.mainPersonId == this.mainPersonId &&
          other.siblingId == this.siblingId &&
          other.siblingRelationshipType == this.siblingRelationshipType &&
          other.relationship == this.relationship &&
          other.currentlyLivingTogether == this.currentlyLivingTogether);
}

class SiblingTableCompanion extends UpdateCompanion<Sibling> {
  final Value<int> mainPersonId;
  final Value<int> siblingId;
  final Value<String> siblingRelationshipType;
  final Value<int> relationship;
  final Value<bool> currentlyLivingTogether;
  const SiblingTableCompanion({
    this.mainPersonId = const Value.absent(),
    this.siblingId = const Value.absent(),
    this.siblingRelationshipType = const Value.absent(),
    this.relationship = const Value.absent(),
    this.currentlyLivingTogether = const Value.absent(),
  });
  SiblingTableCompanion.insert({
    required int mainPersonId,
    required int siblingId,
    required String siblingRelationshipType,
    required int relationship,
    required bool currentlyLivingTogether,
  })  : mainPersonId = Value(mainPersonId),
        siblingId = Value(siblingId),
        siblingRelationshipType = Value(siblingRelationshipType),
        relationship = Value(relationship),
        currentlyLivingTogether = Value(currentlyLivingTogether);
  static Insertable<Sibling> custom({
    Expression<int>? mainPersonId,
    Expression<int>? siblingId,
    Expression<String>? siblingRelationshipType,
    Expression<int>? relationship,
    Expression<bool>? currentlyLivingTogether,
  }) {
    return RawValuesInsertable({
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (siblingId != null) 'sibling_id': siblingId,
      if (siblingRelationshipType != null)
        'sibling_relationship_type': siblingRelationshipType,
      if (relationship != null) 'relationship': relationship,
      if (currentlyLivingTogether != null)
        'currently_living_together': currentlyLivingTogether,
    });
  }

  SiblingTableCompanion copyWith(
      {Value<int>? mainPersonId,
      Value<int>? siblingId,
      Value<String>? siblingRelationshipType,
      Value<int>? relationship,
      Value<bool>? currentlyLivingTogether}) {
    return SiblingTableCompanion(
      mainPersonId: mainPersonId ?? this.mainPersonId,
      siblingId: siblingId ?? this.siblingId,
      siblingRelationshipType:
          siblingRelationshipType ?? this.siblingRelationshipType,
      relationship: relationship ?? this.relationship,
      currentlyLivingTogether:
          currentlyLivingTogether ?? this.currentlyLivingTogether,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mainPersonId.present) {
      map['main_person_id'] = Variable<int>(mainPersonId.value);
    }
    if (siblingId.present) {
      map['sibling_id'] = Variable<int>(siblingId.value);
    }
    if (siblingRelationshipType.present) {
      map['sibling_relationship_type'] =
          Variable<String>(siblingRelationshipType.value);
    }
    if (relationship.present) {
      map['relationship'] = Variable<int>(relationship.value);
    }
    if (currentlyLivingTogether.present) {
      map['currently_living_together'] =
          Variable<bool>(currentlyLivingTogether.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SiblingTableCompanion(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('siblingId: $siblingId, ')
          ..write('siblingRelationshipType: $siblingRelationshipType, ')
          ..write('relationship: $relationship, ')
          ..write('currentlyLivingTogether: $currentlyLivingTogether')
          ..write(')'))
        .toString();
  }
}

class $EventTableTable extends EventTable
    with TableInfo<$EventTableTable, Event> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventTableTable(this.attachedDatabase, [this._alias]);
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
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES game (id)'));
  static const VerificationMeta _eventTypeMeta =
      const VerificationMeta('eventType');
  @override
  late final GeneratedColumn<String> eventType = GeneratedColumn<String>(
      'event_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _eventDayMeta =
      const VerificationMeta('eventDay');
  @override
  late final GeneratedColumn<int> eventDay = GeneratedColumn<int>(
      'event_day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _mainPersonIdMeta =
      const VerificationMeta('mainPersonId');
  @override
  late final GeneratedColumn<int> mainPersonId = GeneratedColumn<int>(
      'main_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES person (id)'));
  static const VerificationMeta _otherPersonIdMeta =
      const VerificationMeta('otherPersonId');
  @override
  late final GeneratedColumn<int> otherPersonId = GeneratedColumn<int>(
      'other_person_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES person (id)'));
  static const VerificationMeta _relationshipToMainPlayerMeta =
      const VerificationMeta('relationshipToMainPlayer');
  @override
  late final GeneratedColumn<String> relationshipToMainPlayer =
      GeneratedColumn<String>('relationship_to_main_player', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<int> startTime = GeneratedColumn<int>(
      'start_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<int> endTime = GeneratedColumn<int>(
      'end_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _journalEntryOnlyMeta =
      const VerificationMeta('journalEntryOnly');
  @override
  late final GeneratedColumn<bool> journalEntryOnly =
      GeneratedColumn<bool>('journal_entry_only', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("journal_entry_only" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _performedMeta =
      const VerificationMeta('performed');
  @override
  late final GeneratedColumn<bool> performed =
      GeneratedColumn<bool>('performed', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("performed" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        gameId,
        eventType,
        eventDay,
        mainPersonId,
        otherPersonId,
        relationshipToMainPlayer,
        startTime,
        endTime,
        journalEntryOnly,
        performed
      ];
  @override
  String get aliasedName => _alias ?? 'event';
  @override
  String get actualTableName => 'event';
  @override
  VerificationContext validateIntegrity(Insertable<Event> instance,
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
    if (data.containsKey('event_type')) {
      context.handle(_eventTypeMeta,
          eventType.isAcceptableOrUnknown(data['event_type']!, _eventTypeMeta));
    } else if (isInserting) {
      context.missing(_eventTypeMeta);
    }
    if (data.containsKey('event_day')) {
      context.handle(_eventDayMeta,
          eventDay.isAcceptableOrUnknown(data['event_day']!, _eventDayMeta));
    } else if (isInserting) {
      context.missing(_eventDayMeta);
    }
    if (data.containsKey('main_person_id')) {
      context.handle(
          _mainPersonIdMeta,
          mainPersonId.isAcceptableOrUnknown(
              data['main_person_id']!, _mainPersonIdMeta));
    } else if (isInserting) {
      context.missing(_mainPersonIdMeta);
    }
    if (data.containsKey('other_person_id')) {
      context.handle(
          _otherPersonIdMeta,
          otherPersonId.isAcceptableOrUnknown(
              data['other_person_id']!, _otherPersonIdMeta));
    }
    if (data.containsKey('relationship_to_main_player')) {
      context.handle(
          _relationshipToMainPlayerMeta,
          relationshipToMainPlayer.isAcceptableOrUnknown(
              data['relationship_to_main_player']!,
              _relationshipToMainPlayerMeta));
    } else if (isInserting) {
      context.missing(_relationshipToMainPlayerMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    }
    if (data.containsKey('journal_entry_only')) {
      context.handle(
          _journalEntryOnlyMeta,
          journalEntryOnly.isAcceptableOrUnknown(
              data['journal_entry_only']!, _journalEntryOnlyMeta));
    } else if (isInserting) {
      context.missing(_journalEntryOnlyMeta);
    }
    if (data.containsKey('performed')) {
      context.handle(_performedMeta,
          performed.isAcceptableOrUnknown(data['performed']!, _performedMeta));
    } else if (isInserting) {
      context.missing(_performedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Event map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Event(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      gameId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}game_id'])!,
      eventType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}event_type'])!,
      eventDay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}event_day'])!,
      mainPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}main_person_id'])!,
      otherPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}other_person_id']),
      relationshipToMainPlayer: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}relationship_to_main_player'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}start_time']),
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}end_time']),
      journalEntryOnly: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}journal_entry_only'])!,
      performed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}performed'])!,
    );
  }

  @override
  $EventTableTable createAlias(String alias) {
    return $EventTableTable(attachedDatabase, alias);
  }
}

class Event extends DataClass implements Insertable<Event> {
  final int id;
  final int gameId;
  final String eventType;
  final int eventDay;
  final int mainPersonId;
  final int? otherPersonId;
  final String relationshipToMainPlayer;
  final int? startTime;
  final int? endTime;
  final bool journalEntryOnly;
  final bool performed;
  const Event(
      {required this.id,
      required this.gameId,
      required this.eventType,
      required this.eventDay,
      required this.mainPersonId,
      this.otherPersonId,
      required this.relationshipToMainPlayer,
      this.startTime,
      this.endTime,
      required this.journalEntryOnly,
      required this.performed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['game_id'] = Variable<int>(gameId);
    map['event_type'] = Variable<String>(eventType);
    map['event_day'] = Variable<int>(eventDay);
    map['main_person_id'] = Variable<int>(mainPersonId);
    if (!nullToAbsent || otherPersonId != null) {
      map['other_person_id'] = Variable<int>(otherPersonId);
    }
    map['relationship_to_main_player'] =
        Variable<String>(relationshipToMainPlayer);
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<int>(startTime);
    }
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<int>(endTime);
    }
    map['journal_entry_only'] = Variable<bool>(journalEntryOnly);
    map['performed'] = Variable<bool>(performed);
    return map;
  }

  EventTableCompanion toCompanion(bool nullToAbsent) {
    return EventTableCompanion(
      id: Value(id),
      gameId: Value(gameId),
      eventType: Value(eventType),
      eventDay: Value(eventDay),
      mainPersonId: Value(mainPersonId),
      otherPersonId: otherPersonId == null && nullToAbsent
          ? const Value.absent()
          : Value(otherPersonId),
      relationshipToMainPlayer: Value(relationshipToMainPlayer),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      journalEntryOnly: Value(journalEntryOnly),
      performed: Value(performed),
    );
  }

  factory Event.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Event(
      id: serializer.fromJson<int>(json['id']),
      gameId: serializer.fromJson<int>(json['gameId']),
      eventType: serializer.fromJson<String>(json['eventType']),
      eventDay: serializer.fromJson<int>(json['eventDay']),
      mainPersonId: serializer.fromJson<int>(json['mainPersonId']),
      otherPersonId: serializer.fromJson<int?>(json['otherPersonId']),
      relationshipToMainPlayer:
          serializer.fromJson<String>(json['relationshipToMainPlayer']),
      startTime: serializer.fromJson<int?>(json['startTime']),
      endTime: serializer.fromJson<int?>(json['endTime']),
      journalEntryOnly: serializer.fromJson<bool>(json['journalEntryOnly']),
      performed: serializer.fromJson<bool>(json['performed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameId': serializer.toJson<int>(gameId),
      'eventType': serializer.toJson<String>(eventType),
      'eventDay': serializer.toJson<int>(eventDay),
      'mainPersonId': serializer.toJson<int>(mainPersonId),
      'otherPersonId': serializer.toJson<int?>(otherPersonId),
      'relationshipToMainPlayer':
          serializer.toJson<String>(relationshipToMainPlayer),
      'startTime': serializer.toJson<int?>(startTime),
      'endTime': serializer.toJson<int?>(endTime),
      'journalEntryOnly': serializer.toJson<bool>(journalEntryOnly),
      'performed': serializer.toJson<bool>(performed),
    };
  }

  Event copyWith(
          {int? id,
          int? gameId,
          String? eventType,
          int? eventDay,
          int? mainPersonId,
          Value<int?> otherPersonId = const Value.absent(),
          String? relationshipToMainPlayer,
          Value<int?> startTime = const Value.absent(),
          Value<int?> endTime = const Value.absent(),
          bool? journalEntryOnly,
          bool? performed}) =>
      Event(
        id: id ?? this.id,
        gameId: gameId ?? this.gameId,
        eventType: eventType ?? this.eventType,
        eventDay: eventDay ?? this.eventDay,
        mainPersonId: mainPersonId ?? this.mainPersonId,
        otherPersonId:
            otherPersonId.present ? otherPersonId.value : this.otherPersonId,
        relationshipToMainPlayer:
            relationshipToMainPlayer ?? this.relationshipToMainPlayer,
        startTime: startTime.present ? startTime.value : this.startTime,
        endTime: endTime.present ? endTime.value : this.endTime,
        journalEntryOnly: journalEntryOnly ?? this.journalEntryOnly,
        performed: performed ?? this.performed,
      );
  @override
  String toString() {
    return (StringBuffer('Event(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('eventType: $eventType, ')
          ..write('eventDay: $eventDay, ')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('otherPersonId: $otherPersonId, ')
          ..write('relationshipToMainPlayer: $relationshipToMainPlayer, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('journalEntryOnly: $journalEntryOnly, ')
          ..write('performed: $performed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      gameId,
      eventType,
      eventDay,
      mainPersonId,
      otherPersonId,
      relationshipToMainPlayer,
      startTime,
      endTime,
      journalEntryOnly,
      performed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Event &&
          other.id == this.id &&
          other.gameId == this.gameId &&
          other.eventType == this.eventType &&
          other.eventDay == this.eventDay &&
          other.mainPersonId == this.mainPersonId &&
          other.otherPersonId == this.otherPersonId &&
          other.relationshipToMainPlayer == this.relationshipToMainPlayer &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.journalEntryOnly == this.journalEntryOnly &&
          other.performed == this.performed);
}

class EventTableCompanion extends UpdateCompanion<Event> {
  final Value<int> id;
  final Value<int> gameId;
  final Value<String> eventType;
  final Value<int> eventDay;
  final Value<int> mainPersonId;
  final Value<int?> otherPersonId;
  final Value<String> relationshipToMainPlayer;
  final Value<int?> startTime;
  final Value<int?> endTime;
  final Value<bool> journalEntryOnly;
  final Value<bool> performed;
  const EventTableCompanion({
    this.id = const Value.absent(),
    this.gameId = const Value.absent(),
    this.eventType = const Value.absent(),
    this.eventDay = const Value.absent(),
    this.mainPersonId = const Value.absent(),
    this.otherPersonId = const Value.absent(),
    this.relationshipToMainPlayer = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.journalEntryOnly = const Value.absent(),
    this.performed = const Value.absent(),
  });
  EventTableCompanion.insert({
    this.id = const Value.absent(),
    required int gameId,
    required String eventType,
    required int eventDay,
    required int mainPersonId,
    this.otherPersonId = const Value.absent(),
    required String relationshipToMainPlayer,
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    required bool journalEntryOnly,
    required bool performed,
  })  : gameId = Value(gameId),
        eventType = Value(eventType),
        eventDay = Value(eventDay),
        mainPersonId = Value(mainPersonId),
        relationshipToMainPlayer = Value(relationshipToMainPlayer),
        journalEntryOnly = Value(journalEntryOnly),
        performed = Value(performed);
  static Insertable<Event> custom({
    Expression<int>? id,
    Expression<int>? gameId,
    Expression<String>? eventType,
    Expression<int>? eventDay,
    Expression<int>? mainPersonId,
    Expression<int>? otherPersonId,
    Expression<String>? relationshipToMainPlayer,
    Expression<int>? startTime,
    Expression<int>? endTime,
    Expression<bool>? journalEntryOnly,
    Expression<bool>? performed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameId != null) 'game_id': gameId,
      if (eventType != null) 'event_type': eventType,
      if (eventDay != null) 'event_day': eventDay,
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (otherPersonId != null) 'other_person_id': otherPersonId,
      if (relationshipToMainPlayer != null)
        'relationship_to_main_player': relationshipToMainPlayer,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (journalEntryOnly != null) 'journal_entry_only': journalEntryOnly,
      if (performed != null) 'performed': performed,
    });
  }

  EventTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? gameId,
      Value<String>? eventType,
      Value<int>? eventDay,
      Value<int>? mainPersonId,
      Value<int?>? otherPersonId,
      Value<String>? relationshipToMainPlayer,
      Value<int?>? startTime,
      Value<int?>? endTime,
      Value<bool>? journalEntryOnly,
      Value<bool>? performed}) {
    return EventTableCompanion(
      id: id ?? this.id,
      gameId: gameId ?? this.gameId,
      eventType: eventType ?? this.eventType,
      eventDay: eventDay ?? this.eventDay,
      mainPersonId: mainPersonId ?? this.mainPersonId,
      otherPersonId: otherPersonId ?? this.otherPersonId,
      relationshipToMainPlayer:
          relationshipToMainPlayer ?? this.relationshipToMainPlayer,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      journalEntryOnly: journalEntryOnly ?? this.journalEntryOnly,
      performed: performed ?? this.performed,
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
    if (eventType.present) {
      map['event_type'] = Variable<String>(eventType.value);
    }
    if (eventDay.present) {
      map['event_day'] = Variable<int>(eventDay.value);
    }
    if (mainPersonId.present) {
      map['main_person_id'] = Variable<int>(mainPersonId.value);
    }
    if (otherPersonId.present) {
      map['other_person_id'] = Variable<int>(otherPersonId.value);
    }
    if (relationshipToMainPlayer.present) {
      map['relationship_to_main_player'] =
          Variable<String>(relationshipToMainPlayer.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<int>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<int>(endTime.value);
    }
    if (journalEntryOnly.present) {
      map['journal_entry_only'] = Variable<bool>(journalEntryOnly.value);
    }
    if (performed.present) {
      map['performed'] = Variable<bool>(performed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventTableCompanion(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('eventType: $eventType, ')
          ..write('eventDay: $eventDay, ')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('otherPersonId: $otherPersonId, ')
          ..write('relationshipToMainPlayer: $relationshipToMainPlayer, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('journalEntryOnly: $journalEntryOnly, ')
          ..write('performed: $performed')
          ..write(')'))
        .toString();
  }
}

class $CarTableTable extends CarTable with TableInfo<$CarTableTable, Car> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CarTableTable(this.attachedDatabase, [this._alias]);
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
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES person (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _percentageOfTravelTimeMeta =
      const VerificationMeta('percentageOfTravelTime');
  @override
  late final GeneratedColumn<int> percentageOfTravelTime = GeneratedColumn<int>(
      'percentage_of_travel_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _qualityMeta =
      const VerificationMeta('quality');
  @override
  late final GeneratedColumn<String> quality = GeneratedColumn<String>(
      'quality', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _basePriceMeta =
      const VerificationMeta('basePrice');
  @override
  late final GeneratedColumn<int> basePrice = GeneratedColumn<int>(
      'base_price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dayOfPurchaseMeta =
      const VerificationMeta('dayOfPurchase');
  @override
  late final GeneratedColumn<int> dayOfPurchase = GeneratedColumn<int>(
      'day_of_purchase', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fuelTankMeta =
      const VerificationMeta('fuelTank');
  @override
  late final GeneratedColumn<int> fuelTank = GeneratedColumn<int>(
      'fuel_tank', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _problemMeta =
      const VerificationMeta('problem');
  @override
  late final GeneratedColumn<String> problem = GeneratedColumn<String>(
      'problem', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _useConditionMeta =
      const VerificationMeta('useCondition');
  @override
  late final GeneratedColumn<int> useCondition = GeneratedColumn<int>(
      'use_condition', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _maxConditionAtPurchaseMeta =
      const VerificationMeta('maxConditionAtPurchase');
  @override
  late final GeneratedColumn<int> maxConditionAtPurchase = GeneratedColumn<int>(
      'max_condition_at_purchase', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fullyPaidForMeta =
      const VerificationMeta('fullyPaidFor');
  @override
  late final GeneratedColumn<bool> fullyPaidFor =
      GeneratedColumn<bool>('fully_paid_for', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("fully_paid_for" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _currentlyDrivingMeta =
      const VerificationMeta('currentlyDriving');
  @override
  late final GeneratedColumn<bool> currentlyDriving =
      GeneratedColumn<bool>('currently_driving', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("currently_driving" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _isInsuredMeta =
      const VerificationMeta('isInsured');
  @override
  late final GeneratedColumn<bool> isInsured =
      GeneratedColumn<bool>('is_insured', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_insured" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _insuranceCostMeta =
      const VerificationMeta('insuranceCost');
  @override
  late final GeneratedColumn<int> insuranceCost = GeneratedColumn<int>(
      'insurance_cost', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _insuranceTypeMeta =
      const VerificationMeta('insuranceType');
  @override
  late final GeneratedColumn<String> insuranceType = GeneratedColumn<String>(
      'insurance_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        personId,
        name,
        type,
        percentageOfTravelTime,
        quality,
        basePrice,
        dayOfPurchase,
        fuelTank,
        problem,
        useCondition,
        maxConditionAtPurchase,
        fullyPaidFor,
        currentlyDriving,
        isInsured,
        insuranceCost,
        insuranceType
      ];
  @override
  String get aliasedName => _alias ?? 'car';
  @override
  String get actualTableName => 'car';
  @override
  VerificationContext validateIntegrity(Insertable<Car> instance,
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
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('percentage_of_travel_time')) {
      context.handle(
          _percentageOfTravelTimeMeta,
          percentageOfTravelTime.isAcceptableOrUnknown(
              data['percentage_of_travel_time']!, _percentageOfTravelTimeMeta));
    } else if (isInserting) {
      context.missing(_percentageOfTravelTimeMeta);
    }
    if (data.containsKey('quality')) {
      context.handle(_qualityMeta,
          quality.isAcceptableOrUnknown(data['quality']!, _qualityMeta));
    } else if (isInserting) {
      context.missing(_qualityMeta);
    }
    if (data.containsKey('base_price')) {
      context.handle(_basePriceMeta,
          basePrice.isAcceptableOrUnknown(data['base_price']!, _basePriceMeta));
    } else if (isInserting) {
      context.missing(_basePriceMeta);
    }
    if (data.containsKey('day_of_purchase')) {
      context.handle(
          _dayOfPurchaseMeta,
          dayOfPurchase.isAcceptableOrUnknown(
              data['day_of_purchase']!, _dayOfPurchaseMeta));
    } else if (isInserting) {
      context.missing(_dayOfPurchaseMeta);
    }
    if (data.containsKey('fuel_tank')) {
      context.handle(_fuelTankMeta,
          fuelTank.isAcceptableOrUnknown(data['fuel_tank']!, _fuelTankMeta));
    } else if (isInserting) {
      context.missing(_fuelTankMeta);
    }
    if (data.containsKey('problem')) {
      context.handle(_problemMeta,
          problem.isAcceptableOrUnknown(data['problem']!, _problemMeta));
    } else if (isInserting) {
      context.missing(_problemMeta);
    }
    if (data.containsKey('use_condition')) {
      context.handle(
          _useConditionMeta,
          useCondition.isAcceptableOrUnknown(
              data['use_condition']!, _useConditionMeta));
    } else if (isInserting) {
      context.missing(_useConditionMeta);
    }
    if (data.containsKey('max_condition_at_purchase')) {
      context.handle(
          _maxConditionAtPurchaseMeta,
          maxConditionAtPurchase.isAcceptableOrUnknown(
              data['max_condition_at_purchase']!, _maxConditionAtPurchaseMeta));
    } else if (isInserting) {
      context.missing(_maxConditionAtPurchaseMeta);
    }
    if (data.containsKey('fully_paid_for')) {
      context.handle(
          _fullyPaidForMeta,
          fullyPaidFor.isAcceptableOrUnknown(
              data['fully_paid_for']!, _fullyPaidForMeta));
    } else if (isInserting) {
      context.missing(_fullyPaidForMeta);
    }
    if (data.containsKey('currently_driving')) {
      context.handle(
          _currentlyDrivingMeta,
          currentlyDriving.isAcceptableOrUnknown(
              data['currently_driving']!, _currentlyDrivingMeta));
    } else if (isInserting) {
      context.missing(_currentlyDrivingMeta);
    }
    if (data.containsKey('is_insured')) {
      context.handle(_isInsuredMeta,
          isInsured.isAcceptableOrUnknown(data['is_insured']!, _isInsuredMeta));
    } else if (isInserting) {
      context.missing(_isInsuredMeta);
    }
    if (data.containsKey('insurance_cost')) {
      context.handle(
          _insuranceCostMeta,
          insuranceCost.isAcceptableOrUnknown(
              data['insurance_cost']!, _insuranceCostMeta));
    } else if (isInserting) {
      context.missing(_insuranceCostMeta);
    }
    if (data.containsKey('insurance_type')) {
      context.handle(
          _insuranceTypeMeta,
          insuranceType.isAcceptableOrUnknown(
              data['insurance_type']!, _insuranceTypeMeta));
    } else if (isInserting) {
      context.missing(_insuranceTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Car map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Car(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      percentageOfTravelTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}percentage_of_travel_time'])!,
      quality: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}quality'])!,
      basePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}base_price'])!,
      dayOfPurchase: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_of_purchase'])!,
      fuelTank: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fuel_tank'])!,
      problem: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}problem'])!,
      useCondition: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}use_condition'])!,
      maxConditionAtPurchase: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}max_condition_at_purchase'])!,
      fullyPaidFor: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fully_paid_for'])!,
      currentlyDriving: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}currently_driving'])!,
      isInsured: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_insured'])!,
      insuranceCost: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}insurance_cost'])!,
      insuranceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}insurance_type'])!,
    );
  }

  @override
  $CarTableTable createAlias(String alias) {
    return $CarTableTable(attachedDatabase, alias);
  }
}

class Car extends DataClass implements Insertable<Car> {
  final int id;
  final int personId;
  final String name;
  final String type;
  final int percentageOfTravelTime;
  final String quality;
  final int basePrice;
  final int dayOfPurchase;
  final int fuelTank;
  final String problem;
  final int useCondition;
  final int maxConditionAtPurchase;
  final bool fullyPaidFor;
  final bool currentlyDriving;
  final bool isInsured;
  final int insuranceCost;
  final String insuranceType;
  const Car(
      {required this.id,
      required this.personId,
      required this.name,
      required this.type,
      required this.percentageOfTravelTime,
      required this.quality,
      required this.basePrice,
      required this.dayOfPurchase,
      required this.fuelTank,
      required this.problem,
      required this.useCondition,
      required this.maxConditionAtPurchase,
      required this.fullyPaidFor,
      required this.currentlyDriving,
      required this.isInsured,
      required this.insuranceCost,
      required this.insuranceType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['person_id'] = Variable<int>(personId);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['percentage_of_travel_time'] = Variable<int>(percentageOfTravelTime);
    map['quality'] = Variable<String>(quality);
    map['base_price'] = Variable<int>(basePrice);
    map['day_of_purchase'] = Variable<int>(dayOfPurchase);
    map['fuel_tank'] = Variable<int>(fuelTank);
    map['problem'] = Variable<String>(problem);
    map['use_condition'] = Variable<int>(useCondition);
    map['max_condition_at_purchase'] = Variable<int>(maxConditionAtPurchase);
    map['fully_paid_for'] = Variable<bool>(fullyPaidFor);
    map['currently_driving'] = Variable<bool>(currentlyDriving);
    map['is_insured'] = Variable<bool>(isInsured);
    map['insurance_cost'] = Variable<int>(insuranceCost);
    map['insurance_type'] = Variable<String>(insuranceType);
    return map;
  }

  CarTableCompanion toCompanion(bool nullToAbsent) {
    return CarTableCompanion(
      id: Value(id),
      personId: Value(personId),
      name: Value(name),
      type: Value(type),
      percentageOfTravelTime: Value(percentageOfTravelTime),
      quality: Value(quality),
      basePrice: Value(basePrice),
      dayOfPurchase: Value(dayOfPurchase),
      fuelTank: Value(fuelTank),
      problem: Value(problem),
      useCondition: Value(useCondition),
      maxConditionAtPurchase: Value(maxConditionAtPurchase),
      fullyPaidFor: Value(fullyPaidFor),
      currentlyDriving: Value(currentlyDriving),
      isInsured: Value(isInsured),
      insuranceCost: Value(insuranceCost),
      insuranceType: Value(insuranceType),
    );
  }

  factory Car.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Car(
      id: serializer.fromJson<int>(json['id']),
      personId: serializer.fromJson<int>(json['personId']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      percentageOfTravelTime:
          serializer.fromJson<int>(json['percentageOfTravelTime']),
      quality: serializer.fromJson<String>(json['quality']),
      basePrice: serializer.fromJson<int>(json['basePrice']),
      dayOfPurchase: serializer.fromJson<int>(json['dayOfPurchase']),
      fuelTank: serializer.fromJson<int>(json['fuelTank']),
      problem: serializer.fromJson<String>(json['problem']),
      useCondition: serializer.fromJson<int>(json['useCondition']),
      maxConditionAtPurchase:
          serializer.fromJson<int>(json['maxConditionAtPurchase']),
      fullyPaidFor: serializer.fromJson<bool>(json['fullyPaidFor']),
      currentlyDriving: serializer.fromJson<bool>(json['currentlyDriving']),
      isInsured: serializer.fromJson<bool>(json['isInsured']),
      insuranceCost: serializer.fromJson<int>(json['insuranceCost']),
      insuranceType: serializer.fromJson<String>(json['insuranceType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'personId': serializer.toJson<int>(personId),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'percentageOfTravelTime': serializer.toJson<int>(percentageOfTravelTime),
      'quality': serializer.toJson<String>(quality),
      'basePrice': serializer.toJson<int>(basePrice),
      'dayOfPurchase': serializer.toJson<int>(dayOfPurchase),
      'fuelTank': serializer.toJson<int>(fuelTank),
      'problem': serializer.toJson<String>(problem),
      'useCondition': serializer.toJson<int>(useCondition),
      'maxConditionAtPurchase': serializer.toJson<int>(maxConditionAtPurchase),
      'fullyPaidFor': serializer.toJson<bool>(fullyPaidFor),
      'currentlyDriving': serializer.toJson<bool>(currentlyDriving),
      'isInsured': serializer.toJson<bool>(isInsured),
      'insuranceCost': serializer.toJson<int>(insuranceCost),
      'insuranceType': serializer.toJson<String>(insuranceType),
    };
  }

  Car copyWith(
          {int? id,
          int? personId,
          String? name,
          String? type,
          int? percentageOfTravelTime,
          String? quality,
          int? basePrice,
          int? dayOfPurchase,
          int? fuelTank,
          String? problem,
          int? useCondition,
          int? maxConditionAtPurchase,
          bool? fullyPaidFor,
          bool? currentlyDriving,
          bool? isInsured,
          int? insuranceCost,
          String? insuranceType}) =>
      Car(
        id: id ?? this.id,
        personId: personId ?? this.personId,
        name: name ?? this.name,
        type: type ?? this.type,
        percentageOfTravelTime:
            percentageOfTravelTime ?? this.percentageOfTravelTime,
        quality: quality ?? this.quality,
        basePrice: basePrice ?? this.basePrice,
        dayOfPurchase: dayOfPurchase ?? this.dayOfPurchase,
        fuelTank: fuelTank ?? this.fuelTank,
        problem: problem ?? this.problem,
        useCondition: useCondition ?? this.useCondition,
        maxConditionAtPurchase:
            maxConditionAtPurchase ?? this.maxConditionAtPurchase,
        fullyPaidFor: fullyPaidFor ?? this.fullyPaidFor,
        currentlyDriving: currentlyDriving ?? this.currentlyDriving,
        isInsured: isInsured ?? this.isInsured,
        insuranceCost: insuranceCost ?? this.insuranceCost,
        insuranceType: insuranceType ?? this.insuranceType,
      );
  @override
  String toString() {
    return (StringBuffer('Car(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('percentageOfTravelTime: $percentageOfTravelTime, ')
          ..write('quality: $quality, ')
          ..write('basePrice: $basePrice, ')
          ..write('dayOfPurchase: $dayOfPurchase, ')
          ..write('fuelTank: $fuelTank, ')
          ..write('problem: $problem, ')
          ..write('useCondition: $useCondition, ')
          ..write('maxConditionAtPurchase: $maxConditionAtPurchase, ')
          ..write('fullyPaidFor: $fullyPaidFor, ')
          ..write('currentlyDriving: $currentlyDriving, ')
          ..write('isInsured: $isInsured, ')
          ..write('insuranceCost: $insuranceCost, ')
          ..write('insuranceType: $insuranceType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      personId,
      name,
      type,
      percentageOfTravelTime,
      quality,
      basePrice,
      dayOfPurchase,
      fuelTank,
      problem,
      useCondition,
      maxConditionAtPurchase,
      fullyPaidFor,
      currentlyDriving,
      isInsured,
      insuranceCost,
      insuranceType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Car &&
          other.id == this.id &&
          other.personId == this.personId &&
          other.name == this.name &&
          other.type == this.type &&
          other.percentageOfTravelTime == this.percentageOfTravelTime &&
          other.quality == this.quality &&
          other.basePrice == this.basePrice &&
          other.dayOfPurchase == this.dayOfPurchase &&
          other.fuelTank == this.fuelTank &&
          other.problem == this.problem &&
          other.useCondition == this.useCondition &&
          other.maxConditionAtPurchase == this.maxConditionAtPurchase &&
          other.fullyPaidFor == this.fullyPaidFor &&
          other.currentlyDriving == this.currentlyDriving &&
          other.isInsured == this.isInsured &&
          other.insuranceCost == this.insuranceCost &&
          other.insuranceType == this.insuranceType);
}

class CarTableCompanion extends UpdateCompanion<Car> {
  final Value<int> id;
  final Value<int> personId;
  final Value<String> name;
  final Value<String> type;
  final Value<int> percentageOfTravelTime;
  final Value<String> quality;
  final Value<int> basePrice;
  final Value<int> dayOfPurchase;
  final Value<int> fuelTank;
  final Value<String> problem;
  final Value<int> useCondition;
  final Value<int> maxConditionAtPurchase;
  final Value<bool> fullyPaidFor;
  final Value<bool> currentlyDriving;
  final Value<bool> isInsured;
  final Value<int> insuranceCost;
  final Value<String> insuranceType;
  const CarTableCompanion({
    this.id = const Value.absent(),
    this.personId = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.percentageOfTravelTime = const Value.absent(),
    this.quality = const Value.absent(),
    this.basePrice = const Value.absent(),
    this.dayOfPurchase = const Value.absent(),
    this.fuelTank = const Value.absent(),
    this.problem = const Value.absent(),
    this.useCondition = const Value.absent(),
    this.maxConditionAtPurchase = const Value.absent(),
    this.fullyPaidFor = const Value.absent(),
    this.currentlyDriving = const Value.absent(),
    this.isInsured = const Value.absent(),
    this.insuranceCost = const Value.absent(),
    this.insuranceType = const Value.absent(),
  });
  CarTableCompanion.insert({
    this.id = const Value.absent(),
    required int personId,
    required String name,
    required String type,
    required int percentageOfTravelTime,
    required String quality,
    required int basePrice,
    required int dayOfPurchase,
    required int fuelTank,
    required String problem,
    required int useCondition,
    required int maxConditionAtPurchase,
    required bool fullyPaidFor,
    required bool currentlyDriving,
    required bool isInsured,
    required int insuranceCost,
    required String insuranceType,
  })  : personId = Value(personId),
        name = Value(name),
        type = Value(type),
        percentageOfTravelTime = Value(percentageOfTravelTime),
        quality = Value(quality),
        basePrice = Value(basePrice),
        dayOfPurchase = Value(dayOfPurchase),
        fuelTank = Value(fuelTank),
        problem = Value(problem),
        useCondition = Value(useCondition),
        maxConditionAtPurchase = Value(maxConditionAtPurchase),
        fullyPaidFor = Value(fullyPaidFor),
        currentlyDriving = Value(currentlyDriving),
        isInsured = Value(isInsured),
        insuranceCost = Value(insuranceCost),
        insuranceType = Value(insuranceType);
  static Insertable<Car> custom({
    Expression<int>? id,
    Expression<int>? personId,
    Expression<String>? name,
    Expression<String>? type,
    Expression<int>? percentageOfTravelTime,
    Expression<String>? quality,
    Expression<int>? basePrice,
    Expression<int>? dayOfPurchase,
    Expression<int>? fuelTank,
    Expression<String>? problem,
    Expression<int>? useCondition,
    Expression<int>? maxConditionAtPurchase,
    Expression<bool>? fullyPaidFor,
    Expression<bool>? currentlyDriving,
    Expression<bool>? isInsured,
    Expression<int>? insuranceCost,
    Expression<String>? insuranceType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (personId != null) 'person_id': personId,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (percentageOfTravelTime != null)
        'percentage_of_travel_time': percentageOfTravelTime,
      if (quality != null) 'quality': quality,
      if (basePrice != null) 'base_price': basePrice,
      if (dayOfPurchase != null) 'day_of_purchase': dayOfPurchase,
      if (fuelTank != null) 'fuel_tank': fuelTank,
      if (problem != null) 'problem': problem,
      if (useCondition != null) 'use_condition': useCondition,
      if (maxConditionAtPurchase != null)
        'max_condition_at_purchase': maxConditionAtPurchase,
      if (fullyPaidFor != null) 'fully_paid_for': fullyPaidFor,
      if (currentlyDriving != null) 'currently_driving': currentlyDriving,
      if (isInsured != null) 'is_insured': isInsured,
      if (insuranceCost != null) 'insurance_cost': insuranceCost,
      if (insuranceType != null) 'insurance_type': insuranceType,
    });
  }

  CarTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? personId,
      Value<String>? name,
      Value<String>? type,
      Value<int>? percentageOfTravelTime,
      Value<String>? quality,
      Value<int>? basePrice,
      Value<int>? dayOfPurchase,
      Value<int>? fuelTank,
      Value<String>? problem,
      Value<int>? useCondition,
      Value<int>? maxConditionAtPurchase,
      Value<bool>? fullyPaidFor,
      Value<bool>? currentlyDriving,
      Value<bool>? isInsured,
      Value<int>? insuranceCost,
      Value<String>? insuranceType}) {
    return CarTableCompanion(
      id: id ?? this.id,
      personId: personId ?? this.personId,
      name: name ?? this.name,
      type: type ?? this.type,
      percentageOfTravelTime:
          percentageOfTravelTime ?? this.percentageOfTravelTime,
      quality: quality ?? this.quality,
      basePrice: basePrice ?? this.basePrice,
      dayOfPurchase: dayOfPurchase ?? this.dayOfPurchase,
      fuelTank: fuelTank ?? this.fuelTank,
      problem: problem ?? this.problem,
      useCondition: useCondition ?? this.useCondition,
      maxConditionAtPurchase:
          maxConditionAtPurchase ?? this.maxConditionAtPurchase,
      fullyPaidFor: fullyPaidFor ?? this.fullyPaidFor,
      currentlyDriving: currentlyDriving ?? this.currentlyDriving,
      isInsured: isInsured ?? this.isInsured,
      insuranceCost: insuranceCost ?? this.insuranceCost,
      insuranceType: insuranceType ?? this.insuranceType,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (percentageOfTravelTime.present) {
      map['percentage_of_travel_time'] =
          Variable<int>(percentageOfTravelTime.value);
    }
    if (quality.present) {
      map['quality'] = Variable<String>(quality.value);
    }
    if (basePrice.present) {
      map['base_price'] = Variable<int>(basePrice.value);
    }
    if (dayOfPurchase.present) {
      map['day_of_purchase'] = Variable<int>(dayOfPurchase.value);
    }
    if (fuelTank.present) {
      map['fuel_tank'] = Variable<int>(fuelTank.value);
    }
    if (problem.present) {
      map['problem'] = Variable<String>(problem.value);
    }
    if (useCondition.present) {
      map['use_condition'] = Variable<int>(useCondition.value);
    }
    if (maxConditionAtPurchase.present) {
      map['max_condition_at_purchase'] =
          Variable<int>(maxConditionAtPurchase.value);
    }
    if (fullyPaidFor.present) {
      map['fully_paid_for'] = Variable<bool>(fullyPaidFor.value);
    }
    if (currentlyDriving.present) {
      map['currently_driving'] = Variable<bool>(currentlyDriving.value);
    }
    if (isInsured.present) {
      map['is_insured'] = Variable<bool>(isInsured.value);
    }
    if (insuranceCost.present) {
      map['insurance_cost'] = Variable<int>(insuranceCost.value);
    }
    if (insuranceType.present) {
      map['insurance_type'] = Variable<String>(insuranceType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CarTableCompanion(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('percentageOfTravelTime: $percentageOfTravelTime, ')
          ..write('quality: $quality, ')
          ..write('basePrice: $basePrice, ')
          ..write('dayOfPurchase: $dayOfPurchase, ')
          ..write('fuelTank: $fuelTank, ')
          ..write('problem: $problem, ')
          ..write('useCondition: $useCondition, ')
          ..write('maxConditionAtPurchase: $maxConditionAtPurchase, ')
          ..write('fullyPaidFor: $fullyPaidFor, ')
          ..write('currentlyDriving: $currentlyDriving, ')
          ..write('isInsured: $isInsured, ')
          ..write('insuranceCost: $insuranceCost, ')
          ..write('insuranceType: $insuranceType')
          ..write(')'))
        .toString();
  }
}

class $FoodTableTable extends FoodTable with TableInfo<$FoodTableTable, Food> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoodTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _basePriceMeta =
      const VerificationMeta('basePrice');
  @override
  late final GeneratedColumn<int> basePrice = GeneratedColumn<int>(
      'base_price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lifespanInDaysMeta =
      const VerificationMeta('lifespanInDays');
  @override
  late final GeneratedColumn<int> lifespanInDays = GeneratedColumn<int>(
      'lifespan_in_days', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nutritionMeta =
      const VerificationMeta('nutrition');
  @override
  late final GeneratedColumn<int> nutrition = GeneratedColumn<int>(
      'nutrition', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _servingsMeta =
      const VerificationMeta('servings');
  @override
  late final GeneratedColumn<int> servings = GeneratedColumn<int>(
      'servings', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isOrganicMeta =
      const VerificationMeta('isOrganic');
  @override
  late final GeneratedColumn<bool> isOrganic =
      GeneratedColumn<bool>('is_organic', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_organic" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        type,
        basePrice,
        lifespanInDays,
        nutrition,
        servings,
        isOrganic
      ];
  @override
  String get aliasedName => _alias ?? 'food';
  @override
  String get actualTableName => 'food';
  @override
  VerificationContext validateIntegrity(Insertable<Food> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('base_price')) {
      context.handle(_basePriceMeta,
          basePrice.isAcceptableOrUnknown(data['base_price']!, _basePriceMeta));
    } else if (isInserting) {
      context.missing(_basePriceMeta);
    }
    if (data.containsKey('lifespan_in_days')) {
      context.handle(
          _lifespanInDaysMeta,
          lifespanInDays.isAcceptableOrUnknown(
              data['lifespan_in_days']!, _lifespanInDaysMeta));
    } else if (isInserting) {
      context.missing(_lifespanInDaysMeta);
    }
    if (data.containsKey('nutrition')) {
      context.handle(_nutritionMeta,
          nutrition.isAcceptableOrUnknown(data['nutrition']!, _nutritionMeta));
    } else if (isInserting) {
      context.missing(_nutritionMeta);
    }
    if (data.containsKey('servings')) {
      context.handle(_servingsMeta,
          servings.isAcceptableOrUnknown(data['servings']!, _servingsMeta));
    } else if (isInserting) {
      context.missing(_servingsMeta);
    }
    if (data.containsKey('is_organic')) {
      context.handle(_isOrganicMeta,
          isOrganic.isAcceptableOrUnknown(data['is_organic']!, _isOrganicMeta));
    } else if (isInserting) {
      context.missing(_isOrganicMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Food map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Food(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      basePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}base_price'])!,
      lifespanInDays: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}lifespan_in_days'])!,
      nutrition: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}nutrition'])!,
      servings: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}servings'])!,
      isOrganic: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_organic'])!,
    );
  }

  @override
  $FoodTableTable createAlias(String alias) {
    return $FoodTableTable(attachedDatabase, alias);
  }
}

class Food extends DataClass implements Insertable<Food> {
  final int id;
  final String name;
  final String type;
  final int basePrice;
  final int lifespanInDays;
  final int nutrition;
  final int servings;
  final bool isOrganic;
  const Food(
      {required this.id,
      required this.name,
      required this.type,
      required this.basePrice,
      required this.lifespanInDays,
      required this.nutrition,
      required this.servings,
      required this.isOrganic});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['base_price'] = Variable<int>(basePrice);
    map['lifespan_in_days'] = Variable<int>(lifespanInDays);
    map['nutrition'] = Variable<int>(nutrition);
    map['servings'] = Variable<int>(servings);
    map['is_organic'] = Variable<bool>(isOrganic);
    return map;
  }

  FoodTableCompanion toCompanion(bool nullToAbsent) {
    return FoodTableCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      basePrice: Value(basePrice),
      lifespanInDays: Value(lifespanInDays),
      nutrition: Value(nutrition),
      servings: Value(servings),
      isOrganic: Value(isOrganic),
    );
  }

  factory Food.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Food(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      basePrice: serializer.fromJson<int>(json['basePrice']),
      lifespanInDays: serializer.fromJson<int>(json['lifespanInDays']),
      nutrition: serializer.fromJson<int>(json['nutrition']),
      servings: serializer.fromJson<int>(json['servings']),
      isOrganic: serializer.fromJson<bool>(json['isOrganic']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'basePrice': serializer.toJson<int>(basePrice),
      'lifespanInDays': serializer.toJson<int>(lifespanInDays),
      'nutrition': serializer.toJson<int>(nutrition),
      'servings': serializer.toJson<int>(servings),
      'isOrganic': serializer.toJson<bool>(isOrganic),
    };
  }

  Food copyWith(
          {int? id,
          String? name,
          String? type,
          int? basePrice,
          int? lifespanInDays,
          int? nutrition,
          int? servings,
          bool? isOrganic}) =>
      Food(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        basePrice: basePrice ?? this.basePrice,
        lifespanInDays: lifespanInDays ?? this.lifespanInDays,
        nutrition: nutrition ?? this.nutrition,
        servings: servings ?? this.servings,
        isOrganic: isOrganic ?? this.isOrganic,
      );
  @override
  String toString() {
    return (StringBuffer('Food(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('basePrice: $basePrice, ')
          ..write('lifespanInDays: $lifespanInDays, ')
          ..write('nutrition: $nutrition, ')
          ..write('servings: $servings, ')
          ..write('isOrganic: $isOrganic')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type, basePrice, lifespanInDays,
      nutrition, servings, isOrganic);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Food &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.basePrice == this.basePrice &&
          other.lifespanInDays == this.lifespanInDays &&
          other.nutrition == this.nutrition &&
          other.servings == this.servings &&
          other.isOrganic == this.isOrganic);
}

class FoodTableCompanion extends UpdateCompanion<Food> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> type;
  final Value<int> basePrice;
  final Value<int> lifespanInDays;
  final Value<int> nutrition;
  final Value<int> servings;
  final Value<bool> isOrganic;
  const FoodTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.basePrice = const Value.absent(),
    this.lifespanInDays = const Value.absent(),
    this.nutrition = const Value.absent(),
    this.servings = const Value.absent(),
    this.isOrganic = const Value.absent(),
  });
  FoodTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String type,
    required int basePrice,
    required int lifespanInDays,
    required int nutrition,
    required int servings,
    required bool isOrganic,
  })  : name = Value(name),
        type = Value(type),
        basePrice = Value(basePrice),
        lifespanInDays = Value(lifespanInDays),
        nutrition = Value(nutrition),
        servings = Value(servings),
        isOrganic = Value(isOrganic);
  static Insertable<Food> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<int>? basePrice,
    Expression<int>? lifespanInDays,
    Expression<int>? nutrition,
    Expression<int>? servings,
    Expression<bool>? isOrganic,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (basePrice != null) 'base_price': basePrice,
      if (lifespanInDays != null) 'lifespan_in_days': lifespanInDays,
      if (nutrition != null) 'nutrition': nutrition,
      if (servings != null) 'servings': servings,
      if (isOrganic != null) 'is_organic': isOrganic,
    });
  }

  FoodTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? type,
      Value<int>? basePrice,
      Value<int>? lifespanInDays,
      Value<int>? nutrition,
      Value<int>? servings,
      Value<bool>? isOrganic}) {
    return FoodTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      basePrice: basePrice ?? this.basePrice,
      lifespanInDays: lifespanInDays ?? this.lifespanInDays,
      nutrition: nutrition ?? this.nutrition,
      servings: servings ?? this.servings,
      isOrganic: isOrganic ?? this.isOrganic,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (basePrice.present) {
      map['base_price'] = Variable<int>(basePrice.value);
    }
    if (lifespanInDays.present) {
      map['lifespan_in_days'] = Variable<int>(lifespanInDays.value);
    }
    if (nutrition.present) {
      map['nutrition'] = Variable<int>(nutrition.value);
    }
    if (servings.present) {
      map['servings'] = Variable<int>(servings.value);
    }
    if (isOrganic.present) {
      map['is_organic'] = Variable<bool>(isOrganic.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('basePrice: $basePrice, ')
          ..write('lifespanInDays: $lifespanInDays, ')
          ..write('nutrition: $nutrition, ')
          ..write('servings: $servings, ')
          ..write('isOrganic: $isOrganic')
          ..write(')'))
        .toString();
  }
}

class $FridgeFoodTableTable extends FridgeFoodTable
    with TableInfo<$FridgeFoodTableTable, FridgeFood> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FridgeFoodTableTable(this.attachedDatabase, [this._alias]);
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
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES person (id)'));
  static const VerificationMeta _foodIdMeta = const VerificationMeta('foodId');
  @override
  late final GeneratedColumn<int> foodId = GeneratedColumn<int>(
      'food_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES food (id)'));
  static const VerificationMeta _servingsLeftMeta =
      const VerificationMeta('servingsLeft');
  @override
  late final GeneratedColumn<int> servingsLeft = GeneratedColumn<int>(
      'servings_left', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _expiryDayMeta =
      const VerificationMeta('expiryDay');
  @override
  late final GeneratedColumn<int> expiryDay = GeneratedColumn<int>(
      'expiry_day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, personId, foodId, servingsLeft, expiryDay];
  @override
  String get aliasedName => _alias ?? 'fridge_food';
  @override
  String get actualTableName => 'fridge_food';
  @override
  VerificationContext validateIntegrity(Insertable<FridgeFood> instance,
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
    if (data.containsKey('food_id')) {
      context.handle(_foodIdMeta,
          foodId.isAcceptableOrUnknown(data['food_id']!, _foodIdMeta));
    } else if (isInserting) {
      context.missing(_foodIdMeta);
    }
    if (data.containsKey('servings_left')) {
      context.handle(
          _servingsLeftMeta,
          servingsLeft.isAcceptableOrUnknown(
              data['servings_left']!, _servingsLeftMeta));
    } else if (isInserting) {
      context.missing(_servingsLeftMeta);
    }
    if (data.containsKey('expiry_day')) {
      context.handle(_expiryDayMeta,
          expiryDay.isAcceptableOrUnknown(data['expiry_day']!, _expiryDayMeta));
    } else if (isInserting) {
      context.missing(_expiryDayMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FridgeFood map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FridgeFood(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id'])!,
      foodId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}food_id'])!,
      servingsLeft: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}servings_left'])!,
      expiryDay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}expiry_day'])!,
    );
  }

  @override
  $FridgeFoodTableTable createAlias(String alias) {
    return $FridgeFoodTableTable(attachedDatabase, alias);
  }
}

class FridgeFood extends DataClass implements Insertable<FridgeFood> {
  final int id;
  final int personId;
  final int foodId;
  final int servingsLeft;
  final int expiryDay;
  const FridgeFood(
      {required this.id,
      required this.personId,
      required this.foodId,
      required this.servingsLeft,
      required this.expiryDay});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['person_id'] = Variable<int>(personId);
    map['food_id'] = Variable<int>(foodId);
    map['servings_left'] = Variable<int>(servingsLeft);
    map['expiry_day'] = Variable<int>(expiryDay);
    return map;
  }

  FridgeFoodTableCompanion toCompanion(bool nullToAbsent) {
    return FridgeFoodTableCompanion(
      id: Value(id),
      personId: Value(personId),
      foodId: Value(foodId),
      servingsLeft: Value(servingsLeft),
      expiryDay: Value(expiryDay),
    );
  }

  factory FridgeFood.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FridgeFood(
      id: serializer.fromJson<int>(json['id']),
      personId: serializer.fromJson<int>(json['personId']),
      foodId: serializer.fromJson<int>(json['foodId']),
      servingsLeft: serializer.fromJson<int>(json['servingsLeft']),
      expiryDay: serializer.fromJson<int>(json['expiryDay']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'personId': serializer.toJson<int>(personId),
      'foodId': serializer.toJson<int>(foodId),
      'servingsLeft': serializer.toJson<int>(servingsLeft),
      'expiryDay': serializer.toJson<int>(expiryDay),
    };
  }

  FridgeFood copyWith(
          {int? id,
          int? personId,
          int? foodId,
          int? servingsLeft,
          int? expiryDay}) =>
      FridgeFood(
        id: id ?? this.id,
        personId: personId ?? this.personId,
        foodId: foodId ?? this.foodId,
        servingsLeft: servingsLeft ?? this.servingsLeft,
        expiryDay: expiryDay ?? this.expiryDay,
      );
  @override
  String toString() {
    return (StringBuffer('FridgeFood(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('foodId: $foodId, ')
          ..write('servingsLeft: $servingsLeft, ')
          ..write('expiryDay: $expiryDay')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, personId, foodId, servingsLeft, expiryDay);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FridgeFood &&
          other.id == this.id &&
          other.personId == this.personId &&
          other.foodId == this.foodId &&
          other.servingsLeft == this.servingsLeft &&
          other.expiryDay == this.expiryDay);
}

class FridgeFoodTableCompanion extends UpdateCompanion<FridgeFood> {
  final Value<int> id;
  final Value<int> personId;
  final Value<int> foodId;
  final Value<int> servingsLeft;
  final Value<int> expiryDay;
  const FridgeFoodTableCompanion({
    this.id = const Value.absent(),
    this.personId = const Value.absent(),
    this.foodId = const Value.absent(),
    this.servingsLeft = const Value.absent(),
    this.expiryDay = const Value.absent(),
  });
  FridgeFoodTableCompanion.insert({
    this.id = const Value.absent(),
    required int personId,
    required int foodId,
    required int servingsLeft,
    required int expiryDay,
  })  : personId = Value(personId),
        foodId = Value(foodId),
        servingsLeft = Value(servingsLeft),
        expiryDay = Value(expiryDay);
  static Insertable<FridgeFood> custom({
    Expression<int>? id,
    Expression<int>? personId,
    Expression<int>? foodId,
    Expression<int>? servingsLeft,
    Expression<int>? expiryDay,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (personId != null) 'person_id': personId,
      if (foodId != null) 'food_id': foodId,
      if (servingsLeft != null) 'servings_left': servingsLeft,
      if (expiryDay != null) 'expiry_day': expiryDay,
    });
  }

  FridgeFoodTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? personId,
      Value<int>? foodId,
      Value<int>? servingsLeft,
      Value<int>? expiryDay}) {
    return FridgeFoodTableCompanion(
      id: id ?? this.id,
      personId: personId ?? this.personId,
      foodId: foodId ?? this.foodId,
      servingsLeft: servingsLeft ?? this.servingsLeft,
      expiryDay: expiryDay ?? this.expiryDay,
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
    if (foodId.present) {
      map['food_id'] = Variable<int>(foodId.value);
    }
    if (servingsLeft.present) {
      map['servings_left'] = Variable<int>(servingsLeft.value);
    }
    if (expiryDay.present) {
      map['expiry_day'] = Variable<int>(expiryDay.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FridgeFoodTableCompanion(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('foodId: $foodId, ')
          ..write('servingsLeft: $servingsLeft, ')
          ..write('expiryDay: $expiryDay')
          ..write(')'))
        .toString();
  }
}

class $HouseTableTable extends HouseTable
    with TableInfo<$HouseTableTable, House> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HouseTableTable(this.attachedDatabase, [this._alias]);
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
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES person (id)'));
  static const VerificationMeta _isCurrentHomeMeta =
      const VerificationMeta('isCurrentHome');
  @override
  late final GeneratedColumn<bool> isCurrentHome =
      GeneratedColumn<bool>('is_current_home', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_current_home" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _bedroomsMeta =
      const VerificationMeta('bedrooms');
  @override
  late final GeneratedColumn<int> bedrooms = GeneratedColumn<int>(
      'bedrooms', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _bathroomsMeta =
      const VerificationMeta('bathrooms');
  @override
  late final GeneratedColumn<int> bathrooms = GeneratedColumn<int>(
      'bathrooms', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _storageMeta =
      const VerificationMeta('storage');
  @override
  late final GeneratedColumn<int> storage = GeneratedColumn<int>(
      'storage', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isForRentMeta =
      const VerificationMeta('isForRent');
  @override
  late final GeneratedColumn<bool> isForRent =
      GeneratedColumn<bool>('is_for_rent', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_for_rent" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _buildingTypeMeta =
      const VerificationMeta('buildingType');
  @override
  late final GeneratedColumn<String> buildingType = GeneratedColumn<String>(
      'building_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _settlementMeta =
      const VerificationMeta('settlement');
  @override
  late final GeneratedColumn<String> settlement = GeneratedColumn<String>(
      'settlement', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _styleMeta = const VerificationMeta('style');
  @override
  late final GeneratedColumn<String> style = GeneratedColumn<String>(
      'style', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastMaintainedDayMeta =
      const VerificationMeta('lastMaintainedDay');
  @override
  late final GeneratedColumn<int> lastMaintainedDay = GeneratedColumn<int>(
      'last_maintained_day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _basePriceMeta =
      const VerificationMeta('basePrice');
  @override
  late final GeneratedColumn<int> basePrice = GeneratedColumn<int>(
      'base_price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dayOfPurchaseMeta =
      const VerificationMeta('dayOfPurchase');
  @override
  late final GeneratedColumn<int> dayOfPurchase = GeneratedColumn<int>(
      'day_of_purchase', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _endOfLeaseDayMeta =
      const VerificationMeta('endOfLeaseDay');
  @override
  late final GeneratedColumn<int> endOfLeaseDay = GeneratedColumn<int>(
      'end_of_lease_day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _conditionMeta =
      const VerificationMeta('condition');
  @override
  late final GeneratedColumn<int> condition = GeneratedColumn<int>(
      'condition', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _purchasePriceMeta =
      const VerificationMeta('purchasePrice');
  @override
  late final GeneratedColumn<int> purchasePrice = GeneratedColumn<int>(
      'purchase_price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fullyPaidForMeta =
      const VerificationMeta('fullyPaidFor');
  @override
  late final GeneratedColumn<bool> fullyPaidFor =
      GeneratedColumn<bool>('fully_paid_for', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("fully_paid_for" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        personId,
        isCurrentHome,
        bedrooms,
        bathrooms,
        storage,
        address,
        isForRent,
        buildingType,
        settlement,
        country,
        style,
        lastMaintainedDay,
        basePrice,
        dayOfPurchase,
        endOfLeaseDay,
        condition,
        purchasePrice,
        fullyPaidFor
      ];
  @override
  String get aliasedName => _alias ?? 'house';
  @override
  String get actualTableName => 'house';
  @override
  VerificationContext validateIntegrity(Insertable<House> instance,
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
    if (data.containsKey('is_current_home')) {
      context.handle(
          _isCurrentHomeMeta,
          isCurrentHome.isAcceptableOrUnknown(
              data['is_current_home']!, _isCurrentHomeMeta));
    } else if (isInserting) {
      context.missing(_isCurrentHomeMeta);
    }
    if (data.containsKey('bedrooms')) {
      context.handle(_bedroomsMeta,
          bedrooms.isAcceptableOrUnknown(data['bedrooms']!, _bedroomsMeta));
    } else if (isInserting) {
      context.missing(_bedroomsMeta);
    }
    if (data.containsKey('bathrooms')) {
      context.handle(_bathroomsMeta,
          bathrooms.isAcceptableOrUnknown(data['bathrooms']!, _bathroomsMeta));
    } else if (isInserting) {
      context.missing(_bathroomsMeta);
    }
    if (data.containsKey('storage')) {
      context.handle(_storageMeta,
          storage.isAcceptableOrUnknown(data['storage']!, _storageMeta));
    } else if (isInserting) {
      context.missing(_storageMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('is_for_rent')) {
      context.handle(
          _isForRentMeta,
          isForRent.isAcceptableOrUnknown(
              data['is_for_rent']!, _isForRentMeta));
    } else if (isInserting) {
      context.missing(_isForRentMeta);
    }
    if (data.containsKey('building_type')) {
      context.handle(
          _buildingTypeMeta,
          buildingType.isAcceptableOrUnknown(
              data['building_type']!, _buildingTypeMeta));
    } else if (isInserting) {
      context.missing(_buildingTypeMeta);
    }
    if (data.containsKey('settlement')) {
      context.handle(
          _settlementMeta,
          settlement.isAcceptableOrUnknown(
              data['settlement']!, _settlementMeta));
    } else if (isInserting) {
      context.missing(_settlementMeta);
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('style')) {
      context.handle(
          _styleMeta, style.isAcceptableOrUnknown(data['style']!, _styleMeta));
    } else if (isInserting) {
      context.missing(_styleMeta);
    }
    if (data.containsKey('last_maintained_day')) {
      context.handle(
          _lastMaintainedDayMeta,
          lastMaintainedDay.isAcceptableOrUnknown(
              data['last_maintained_day']!, _lastMaintainedDayMeta));
    } else if (isInserting) {
      context.missing(_lastMaintainedDayMeta);
    }
    if (data.containsKey('base_price')) {
      context.handle(_basePriceMeta,
          basePrice.isAcceptableOrUnknown(data['base_price']!, _basePriceMeta));
    } else if (isInserting) {
      context.missing(_basePriceMeta);
    }
    if (data.containsKey('day_of_purchase')) {
      context.handle(
          _dayOfPurchaseMeta,
          dayOfPurchase.isAcceptableOrUnknown(
              data['day_of_purchase']!, _dayOfPurchaseMeta));
    } else if (isInserting) {
      context.missing(_dayOfPurchaseMeta);
    }
    if (data.containsKey('end_of_lease_day')) {
      context.handle(
          _endOfLeaseDayMeta,
          endOfLeaseDay.isAcceptableOrUnknown(
              data['end_of_lease_day']!, _endOfLeaseDayMeta));
    } else if (isInserting) {
      context.missing(_endOfLeaseDayMeta);
    }
    if (data.containsKey('condition')) {
      context.handle(_conditionMeta,
          condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta));
    } else if (isInserting) {
      context.missing(_conditionMeta);
    }
    if (data.containsKey('purchase_price')) {
      context.handle(
          _purchasePriceMeta,
          purchasePrice.isAcceptableOrUnknown(
              data['purchase_price']!, _purchasePriceMeta));
    } else if (isInserting) {
      context.missing(_purchasePriceMeta);
    }
    if (data.containsKey('fully_paid_for')) {
      context.handle(
          _fullyPaidForMeta,
          fullyPaidFor.isAcceptableOrUnknown(
              data['fully_paid_for']!, _fullyPaidForMeta));
    } else if (isInserting) {
      context.missing(_fullyPaidForMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  House map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return House(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id'])!,
      isCurrentHome: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_current_home'])!,
      bedrooms: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bedrooms'])!,
      bathrooms: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bathrooms'])!,
      storage: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}storage'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      isForRent: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_for_rent'])!,
      buildingType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}building_type'])!,
      settlement: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}settlement'])!,
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country'])!,
      style: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}style'])!,
      lastMaintainedDay: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}last_maintained_day'])!,
      basePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}base_price'])!,
      dayOfPurchase: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_of_purchase'])!,
      endOfLeaseDay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}end_of_lease_day'])!,
      condition: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}condition'])!,
      purchasePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}purchase_price'])!,
      fullyPaidFor: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fully_paid_for'])!,
    );
  }

  @override
  $HouseTableTable createAlias(String alias) {
    return $HouseTableTable(attachedDatabase, alias);
  }
}

class House extends DataClass implements Insertable<House> {
  final int id;
  final int personId;
  final bool isCurrentHome;
  final int bedrooms;
  final int bathrooms;
  final int storage;
  final String address;
  final bool isForRent;
  final String buildingType;
  final String settlement;
  final String country;
  final String style;
  final int lastMaintainedDay;
  final int basePrice;
  final int dayOfPurchase;
  final int endOfLeaseDay;
  final int condition;
  final int purchasePrice;
  final bool fullyPaidFor;
  const House(
      {required this.id,
      required this.personId,
      required this.isCurrentHome,
      required this.bedrooms,
      required this.bathrooms,
      required this.storage,
      required this.address,
      required this.isForRent,
      required this.buildingType,
      required this.settlement,
      required this.country,
      required this.style,
      required this.lastMaintainedDay,
      required this.basePrice,
      required this.dayOfPurchase,
      required this.endOfLeaseDay,
      required this.condition,
      required this.purchasePrice,
      required this.fullyPaidFor});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['person_id'] = Variable<int>(personId);
    map['is_current_home'] = Variable<bool>(isCurrentHome);
    map['bedrooms'] = Variable<int>(bedrooms);
    map['bathrooms'] = Variable<int>(bathrooms);
    map['storage'] = Variable<int>(storage);
    map['address'] = Variable<String>(address);
    map['is_for_rent'] = Variable<bool>(isForRent);
    map['building_type'] = Variable<String>(buildingType);
    map['settlement'] = Variable<String>(settlement);
    map['country'] = Variable<String>(country);
    map['style'] = Variable<String>(style);
    map['last_maintained_day'] = Variable<int>(lastMaintainedDay);
    map['base_price'] = Variable<int>(basePrice);
    map['day_of_purchase'] = Variable<int>(dayOfPurchase);
    map['end_of_lease_day'] = Variable<int>(endOfLeaseDay);
    map['condition'] = Variable<int>(condition);
    map['purchase_price'] = Variable<int>(purchasePrice);
    map['fully_paid_for'] = Variable<bool>(fullyPaidFor);
    return map;
  }

  HouseTableCompanion toCompanion(bool nullToAbsent) {
    return HouseTableCompanion(
      id: Value(id),
      personId: Value(personId),
      isCurrentHome: Value(isCurrentHome),
      bedrooms: Value(bedrooms),
      bathrooms: Value(bathrooms),
      storage: Value(storage),
      address: Value(address),
      isForRent: Value(isForRent),
      buildingType: Value(buildingType),
      settlement: Value(settlement),
      country: Value(country),
      style: Value(style),
      lastMaintainedDay: Value(lastMaintainedDay),
      basePrice: Value(basePrice),
      dayOfPurchase: Value(dayOfPurchase),
      endOfLeaseDay: Value(endOfLeaseDay),
      condition: Value(condition),
      purchasePrice: Value(purchasePrice),
      fullyPaidFor: Value(fullyPaidFor),
    );
  }

  factory House.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return House(
      id: serializer.fromJson<int>(json['id']),
      personId: serializer.fromJson<int>(json['personId']),
      isCurrentHome: serializer.fromJson<bool>(json['isCurrentHome']),
      bedrooms: serializer.fromJson<int>(json['bedrooms']),
      bathrooms: serializer.fromJson<int>(json['bathrooms']),
      storage: serializer.fromJson<int>(json['storage']),
      address: serializer.fromJson<String>(json['address']),
      isForRent: serializer.fromJson<bool>(json['isForRent']),
      buildingType: serializer.fromJson<String>(json['buildingType']),
      settlement: serializer.fromJson<String>(json['settlement']),
      country: serializer.fromJson<String>(json['country']),
      style: serializer.fromJson<String>(json['style']),
      lastMaintainedDay: serializer.fromJson<int>(json['lastMaintainedDay']),
      basePrice: serializer.fromJson<int>(json['basePrice']),
      dayOfPurchase: serializer.fromJson<int>(json['dayOfPurchase']),
      endOfLeaseDay: serializer.fromJson<int>(json['endOfLeaseDay']),
      condition: serializer.fromJson<int>(json['condition']),
      purchasePrice: serializer.fromJson<int>(json['purchasePrice']),
      fullyPaidFor: serializer.fromJson<bool>(json['fullyPaidFor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'personId': serializer.toJson<int>(personId),
      'isCurrentHome': serializer.toJson<bool>(isCurrentHome),
      'bedrooms': serializer.toJson<int>(bedrooms),
      'bathrooms': serializer.toJson<int>(bathrooms),
      'storage': serializer.toJson<int>(storage),
      'address': serializer.toJson<String>(address),
      'isForRent': serializer.toJson<bool>(isForRent),
      'buildingType': serializer.toJson<String>(buildingType),
      'settlement': serializer.toJson<String>(settlement),
      'country': serializer.toJson<String>(country),
      'style': serializer.toJson<String>(style),
      'lastMaintainedDay': serializer.toJson<int>(lastMaintainedDay),
      'basePrice': serializer.toJson<int>(basePrice),
      'dayOfPurchase': serializer.toJson<int>(dayOfPurchase),
      'endOfLeaseDay': serializer.toJson<int>(endOfLeaseDay),
      'condition': serializer.toJson<int>(condition),
      'purchasePrice': serializer.toJson<int>(purchasePrice),
      'fullyPaidFor': serializer.toJson<bool>(fullyPaidFor),
    };
  }

  House copyWith(
          {int? id,
          int? personId,
          bool? isCurrentHome,
          int? bedrooms,
          int? bathrooms,
          int? storage,
          String? address,
          bool? isForRent,
          String? buildingType,
          String? settlement,
          String? country,
          String? style,
          int? lastMaintainedDay,
          int? basePrice,
          int? dayOfPurchase,
          int? endOfLeaseDay,
          int? condition,
          int? purchasePrice,
          bool? fullyPaidFor}) =>
      House(
        id: id ?? this.id,
        personId: personId ?? this.personId,
        isCurrentHome: isCurrentHome ?? this.isCurrentHome,
        bedrooms: bedrooms ?? this.bedrooms,
        bathrooms: bathrooms ?? this.bathrooms,
        storage: storage ?? this.storage,
        address: address ?? this.address,
        isForRent: isForRent ?? this.isForRent,
        buildingType: buildingType ?? this.buildingType,
        settlement: settlement ?? this.settlement,
        country: country ?? this.country,
        style: style ?? this.style,
        lastMaintainedDay: lastMaintainedDay ?? this.lastMaintainedDay,
        basePrice: basePrice ?? this.basePrice,
        dayOfPurchase: dayOfPurchase ?? this.dayOfPurchase,
        endOfLeaseDay: endOfLeaseDay ?? this.endOfLeaseDay,
        condition: condition ?? this.condition,
        purchasePrice: purchasePrice ?? this.purchasePrice,
        fullyPaidFor: fullyPaidFor ?? this.fullyPaidFor,
      );
  @override
  String toString() {
    return (StringBuffer('House(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('isCurrentHome: $isCurrentHome, ')
          ..write('bedrooms: $bedrooms, ')
          ..write('bathrooms: $bathrooms, ')
          ..write('storage: $storage, ')
          ..write('address: $address, ')
          ..write('isForRent: $isForRent, ')
          ..write('buildingType: $buildingType, ')
          ..write('settlement: $settlement, ')
          ..write('country: $country, ')
          ..write('style: $style, ')
          ..write('lastMaintainedDay: $lastMaintainedDay, ')
          ..write('basePrice: $basePrice, ')
          ..write('dayOfPurchase: $dayOfPurchase, ')
          ..write('endOfLeaseDay: $endOfLeaseDay, ')
          ..write('condition: $condition, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('fullyPaidFor: $fullyPaidFor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      personId,
      isCurrentHome,
      bedrooms,
      bathrooms,
      storage,
      address,
      isForRent,
      buildingType,
      settlement,
      country,
      style,
      lastMaintainedDay,
      basePrice,
      dayOfPurchase,
      endOfLeaseDay,
      condition,
      purchasePrice,
      fullyPaidFor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is House &&
          other.id == this.id &&
          other.personId == this.personId &&
          other.isCurrentHome == this.isCurrentHome &&
          other.bedrooms == this.bedrooms &&
          other.bathrooms == this.bathrooms &&
          other.storage == this.storage &&
          other.address == this.address &&
          other.isForRent == this.isForRent &&
          other.buildingType == this.buildingType &&
          other.settlement == this.settlement &&
          other.country == this.country &&
          other.style == this.style &&
          other.lastMaintainedDay == this.lastMaintainedDay &&
          other.basePrice == this.basePrice &&
          other.dayOfPurchase == this.dayOfPurchase &&
          other.endOfLeaseDay == this.endOfLeaseDay &&
          other.condition == this.condition &&
          other.purchasePrice == this.purchasePrice &&
          other.fullyPaidFor == this.fullyPaidFor);
}

class HouseTableCompanion extends UpdateCompanion<House> {
  final Value<int> id;
  final Value<int> personId;
  final Value<bool> isCurrentHome;
  final Value<int> bedrooms;
  final Value<int> bathrooms;
  final Value<int> storage;
  final Value<String> address;
  final Value<bool> isForRent;
  final Value<String> buildingType;
  final Value<String> settlement;
  final Value<String> country;
  final Value<String> style;
  final Value<int> lastMaintainedDay;
  final Value<int> basePrice;
  final Value<int> dayOfPurchase;
  final Value<int> endOfLeaseDay;
  final Value<int> condition;
  final Value<int> purchasePrice;
  final Value<bool> fullyPaidFor;
  const HouseTableCompanion({
    this.id = const Value.absent(),
    this.personId = const Value.absent(),
    this.isCurrentHome = const Value.absent(),
    this.bedrooms = const Value.absent(),
    this.bathrooms = const Value.absent(),
    this.storage = const Value.absent(),
    this.address = const Value.absent(),
    this.isForRent = const Value.absent(),
    this.buildingType = const Value.absent(),
    this.settlement = const Value.absent(),
    this.country = const Value.absent(),
    this.style = const Value.absent(),
    this.lastMaintainedDay = const Value.absent(),
    this.basePrice = const Value.absent(),
    this.dayOfPurchase = const Value.absent(),
    this.endOfLeaseDay = const Value.absent(),
    this.condition = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.fullyPaidFor = const Value.absent(),
  });
  HouseTableCompanion.insert({
    this.id = const Value.absent(),
    required int personId,
    required bool isCurrentHome,
    required int bedrooms,
    required int bathrooms,
    required int storage,
    required String address,
    required bool isForRent,
    required String buildingType,
    required String settlement,
    required String country,
    required String style,
    required int lastMaintainedDay,
    required int basePrice,
    required int dayOfPurchase,
    required int endOfLeaseDay,
    required int condition,
    required int purchasePrice,
    required bool fullyPaidFor,
  })  : personId = Value(personId),
        isCurrentHome = Value(isCurrentHome),
        bedrooms = Value(bedrooms),
        bathrooms = Value(bathrooms),
        storage = Value(storage),
        address = Value(address),
        isForRent = Value(isForRent),
        buildingType = Value(buildingType),
        settlement = Value(settlement),
        country = Value(country),
        style = Value(style),
        lastMaintainedDay = Value(lastMaintainedDay),
        basePrice = Value(basePrice),
        dayOfPurchase = Value(dayOfPurchase),
        endOfLeaseDay = Value(endOfLeaseDay),
        condition = Value(condition),
        purchasePrice = Value(purchasePrice),
        fullyPaidFor = Value(fullyPaidFor);
  static Insertable<House> custom({
    Expression<int>? id,
    Expression<int>? personId,
    Expression<bool>? isCurrentHome,
    Expression<int>? bedrooms,
    Expression<int>? bathrooms,
    Expression<int>? storage,
    Expression<String>? address,
    Expression<bool>? isForRent,
    Expression<String>? buildingType,
    Expression<String>? settlement,
    Expression<String>? country,
    Expression<String>? style,
    Expression<int>? lastMaintainedDay,
    Expression<int>? basePrice,
    Expression<int>? dayOfPurchase,
    Expression<int>? endOfLeaseDay,
    Expression<int>? condition,
    Expression<int>? purchasePrice,
    Expression<bool>? fullyPaidFor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (personId != null) 'person_id': personId,
      if (isCurrentHome != null) 'is_current_home': isCurrentHome,
      if (bedrooms != null) 'bedrooms': bedrooms,
      if (bathrooms != null) 'bathrooms': bathrooms,
      if (storage != null) 'storage': storage,
      if (address != null) 'address': address,
      if (isForRent != null) 'is_for_rent': isForRent,
      if (buildingType != null) 'building_type': buildingType,
      if (settlement != null) 'settlement': settlement,
      if (country != null) 'country': country,
      if (style != null) 'style': style,
      if (lastMaintainedDay != null) 'last_maintained_day': lastMaintainedDay,
      if (basePrice != null) 'base_price': basePrice,
      if (dayOfPurchase != null) 'day_of_purchase': dayOfPurchase,
      if (endOfLeaseDay != null) 'end_of_lease_day': endOfLeaseDay,
      if (condition != null) 'condition': condition,
      if (purchasePrice != null) 'purchase_price': purchasePrice,
      if (fullyPaidFor != null) 'fully_paid_for': fullyPaidFor,
    });
  }

  HouseTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? personId,
      Value<bool>? isCurrentHome,
      Value<int>? bedrooms,
      Value<int>? bathrooms,
      Value<int>? storage,
      Value<String>? address,
      Value<bool>? isForRent,
      Value<String>? buildingType,
      Value<String>? settlement,
      Value<String>? country,
      Value<String>? style,
      Value<int>? lastMaintainedDay,
      Value<int>? basePrice,
      Value<int>? dayOfPurchase,
      Value<int>? endOfLeaseDay,
      Value<int>? condition,
      Value<int>? purchasePrice,
      Value<bool>? fullyPaidFor}) {
    return HouseTableCompanion(
      id: id ?? this.id,
      personId: personId ?? this.personId,
      isCurrentHome: isCurrentHome ?? this.isCurrentHome,
      bedrooms: bedrooms ?? this.bedrooms,
      bathrooms: bathrooms ?? this.bathrooms,
      storage: storage ?? this.storage,
      address: address ?? this.address,
      isForRent: isForRent ?? this.isForRent,
      buildingType: buildingType ?? this.buildingType,
      settlement: settlement ?? this.settlement,
      country: country ?? this.country,
      style: style ?? this.style,
      lastMaintainedDay: lastMaintainedDay ?? this.lastMaintainedDay,
      basePrice: basePrice ?? this.basePrice,
      dayOfPurchase: dayOfPurchase ?? this.dayOfPurchase,
      endOfLeaseDay: endOfLeaseDay ?? this.endOfLeaseDay,
      condition: condition ?? this.condition,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      fullyPaidFor: fullyPaidFor ?? this.fullyPaidFor,
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
    if (isCurrentHome.present) {
      map['is_current_home'] = Variable<bool>(isCurrentHome.value);
    }
    if (bedrooms.present) {
      map['bedrooms'] = Variable<int>(bedrooms.value);
    }
    if (bathrooms.present) {
      map['bathrooms'] = Variable<int>(bathrooms.value);
    }
    if (storage.present) {
      map['storage'] = Variable<int>(storage.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (isForRent.present) {
      map['is_for_rent'] = Variable<bool>(isForRent.value);
    }
    if (buildingType.present) {
      map['building_type'] = Variable<String>(buildingType.value);
    }
    if (settlement.present) {
      map['settlement'] = Variable<String>(settlement.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (style.present) {
      map['style'] = Variable<String>(style.value);
    }
    if (lastMaintainedDay.present) {
      map['last_maintained_day'] = Variable<int>(lastMaintainedDay.value);
    }
    if (basePrice.present) {
      map['base_price'] = Variable<int>(basePrice.value);
    }
    if (dayOfPurchase.present) {
      map['day_of_purchase'] = Variable<int>(dayOfPurchase.value);
    }
    if (endOfLeaseDay.present) {
      map['end_of_lease_day'] = Variable<int>(endOfLeaseDay.value);
    }
    if (condition.present) {
      map['condition'] = Variable<int>(condition.value);
    }
    if (purchasePrice.present) {
      map['purchase_price'] = Variable<int>(purchasePrice.value);
    }
    if (fullyPaidFor.present) {
      map['fully_paid_for'] = Variable<bool>(fullyPaidFor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HouseTableCompanion(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('isCurrentHome: $isCurrentHome, ')
          ..write('bedrooms: $bedrooms, ')
          ..write('bathrooms: $bathrooms, ')
          ..write('storage: $storage, ')
          ..write('address: $address, ')
          ..write('isForRent: $isForRent, ')
          ..write('buildingType: $buildingType, ')
          ..write('settlement: $settlement, ')
          ..write('country: $country, ')
          ..write('style: $style, ')
          ..write('lastMaintainedDay: $lastMaintainedDay, ')
          ..write('basePrice: $basePrice, ')
          ..write('dayOfPurchase: $dayOfPurchase, ')
          ..write('endOfLeaseDay: $endOfLeaseDay, ')
          ..write('condition: $condition, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('fullyPaidFor: $fullyPaidFor')
          ..write(')'))
        .toString();
  }
}

class $ItemTableTable extends ItemTable with TableInfo<$ItemTableTable, Item> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _basePriceMeta =
      const VerificationMeta('basePrice');
  @override
  late final GeneratedColumn<int> basePrice = GeneratedColumn<int>(
      'base_price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
      'count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, type, basePrice, count];
  @override
  String get aliasedName => _alias ?? 'item';
  @override
  String get actualTableName => 'item';
  @override
  VerificationContext validateIntegrity(Insertable<Item> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('base_price')) {
      context.handle(_basePriceMeta,
          basePrice.isAcceptableOrUnknown(data['base_price']!, _basePriceMeta));
    } else if (isInserting) {
      context.missing(_basePriceMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Item map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Item(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      basePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}base_price'])!,
      count: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count'])!,
    );
  }

  @override
  $ItemTableTable createAlias(String alias) {
    return $ItemTableTable(attachedDatabase, alias);
  }
}

class Item extends DataClass implements Insertable<Item> {
  final int id;
  final String name;
  final String type;
  final int basePrice;
  final int count;
  const Item(
      {required this.id,
      required this.name,
      required this.type,
      required this.basePrice,
      required this.count});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['base_price'] = Variable<int>(basePrice);
    map['count'] = Variable<int>(count);
    return map;
  }

  ItemTableCompanion toCompanion(bool nullToAbsent) {
    return ItemTableCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      basePrice: Value(basePrice),
      count: Value(count),
    );
  }

  factory Item.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Item(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      basePrice: serializer.fromJson<int>(json['basePrice']),
      count: serializer.fromJson<int>(json['count']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'basePrice': serializer.toJson<int>(basePrice),
      'count': serializer.toJson<int>(count),
    };
  }

  Item copyWith(
          {int? id, String? name, String? type, int? basePrice, int? count}) =>
      Item(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        basePrice: basePrice ?? this.basePrice,
        count: count ?? this.count,
      );
  @override
  String toString() {
    return (StringBuffer('Item(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('basePrice: $basePrice, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type, basePrice, count);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.basePrice == this.basePrice &&
          other.count == this.count);
}

class ItemTableCompanion extends UpdateCompanion<Item> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> type;
  final Value<int> basePrice;
  final Value<int> count;
  const ItemTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.basePrice = const Value.absent(),
    this.count = const Value.absent(),
  });
  ItemTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String type,
    required int basePrice,
    required int count,
  })  : name = Value(name),
        type = Value(type),
        basePrice = Value(basePrice),
        count = Value(count);
  static Insertable<Item> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<int>? basePrice,
    Expression<int>? count,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (basePrice != null) 'base_price': basePrice,
      if (count != null) 'count': count,
    });
  }

  ItemTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? type,
      Value<int>? basePrice,
      Value<int>? count}) {
    return ItemTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      basePrice: basePrice ?? this.basePrice,
      count: count ?? this.count,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (basePrice.present) {
      map['base_price'] = Variable<int>(basePrice.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('basePrice: $basePrice, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }
}

class $JewelryTableTable extends JewelryTable
    with TableInfo<$JewelryTableTable, Jewelry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JewelryTableTable(this.attachedDatabase, [this._alias]);
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
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES person (id)'));
  static const VerificationMeta _jewelMeta = const VerificationMeta('jewel');
  @override
  late final GeneratedColumn<String> jewel = GeneratedColumn<String>(
      'jewel', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _caratMeta = const VerificationMeta('carat');
  @override
  late final GeneratedColumn<double> carat = GeneratedColumn<double>(
      'carat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _qualityMeta =
      const VerificationMeta('quality');
  @override
  late final GeneratedColumn<String> quality = GeneratedColumn<String>(
      'quality', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _basePriceMeta =
      const VerificationMeta('basePrice');
  @override
  late final GeneratedColumn<int> basePrice = GeneratedColumn<int>(
      'base_price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dayOfPurchaseMeta =
      const VerificationMeta('dayOfPurchase');
  @override
  late final GeneratedColumn<int> dayOfPurchase = GeneratedColumn<int>(
      'day_of_purchase', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _maxConditionAtPurchaseMeta =
      const VerificationMeta('maxConditionAtPurchase');
  @override
  late final GeneratedColumn<int> maxConditionAtPurchase = GeneratedColumn<int>(
      'max_condition_at_purchase', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        personId,
        jewel,
        type,
        carat,
        quality,
        basePrice,
        dayOfPurchase,
        maxConditionAtPurchase
      ];
  @override
  String get aliasedName => _alias ?? 'jewelry';
  @override
  String get actualTableName => 'jewelry';
  @override
  VerificationContext validateIntegrity(Insertable<Jewelry> instance,
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
    if (data.containsKey('jewel')) {
      context.handle(
          _jewelMeta, jewel.isAcceptableOrUnknown(data['jewel']!, _jewelMeta));
    } else if (isInserting) {
      context.missing(_jewelMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('carat')) {
      context.handle(
          _caratMeta, carat.isAcceptableOrUnknown(data['carat']!, _caratMeta));
    } else if (isInserting) {
      context.missing(_caratMeta);
    }
    if (data.containsKey('quality')) {
      context.handle(_qualityMeta,
          quality.isAcceptableOrUnknown(data['quality']!, _qualityMeta));
    } else if (isInserting) {
      context.missing(_qualityMeta);
    }
    if (data.containsKey('base_price')) {
      context.handle(_basePriceMeta,
          basePrice.isAcceptableOrUnknown(data['base_price']!, _basePriceMeta));
    } else if (isInserting) {
      context.missing(_basePriceMeta);
    }
    if (data.containsKey('day_of_purchase')) {
      context.handle(
          _dayOfPurchaseMeta,
          dayOfPurchase.isAcceptableOrUnknown(
              data['day_of_purchase']!, _dayOfPurchaseMeta));
    } else if (isInserting) {
      context.missing(_dayOfPurchaseMeta);
    }
    if (data.containsKey('max_condition_at_purchase')) {
      context.handle(
          _maxConditionAtPurchaseMeta,
          maxConditionAtPurchase.isAcceptableOrUnknown(
              data['max_condition_at_purchase']!, _maxConditionAtPurchaseMeta));
    } else if (isInserting) {
      context.missing(_maxConditionAtPurchaseMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Jewelry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Jewelry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id'])!,
      jewel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}jewel'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      carat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}carat'])!,
      quality: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}quality'])!,
      basePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}base_price'])!,
      dayOfPurchase: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_of_purchase'])!,
      maxConditionAtPurchase: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}max_condition_at_purchase'])!,
    );
  }

  @override
  $JewelryTableTable createAlias(String alias) {
    return $JewelryTableTable(attachedDatabase, alias);
  }
}

class Jewelry extends DataClass implements Insertable<Jewelry> {
  final int id;
  final int personId;
  final String jewel;
  final String type;
  final double carat;
  final String quality;
  final int basePrice;
  final int dayOfPurchase;
  final int maxConditionAtPurchase;
  const Jewelry(
      {required this.id,
      required this.personId,
      required this.jewel,
      required this.type,
      required this.carat,
      required this.quality,
      required this.basePrice,
      required this.dayOfPurchase,
      required this.maxConditionAtPurchase});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['person_id'] = Variable<int>(personId);
    map['jewel'] = Variable<String>(jewel);
    map['type'] = Variable<String>(type);
    map['carat'] = Variable<double>(carat);
    map['quality'] = Variable<String>(quality);
    map['base_price'] = Variable<int>(basePrice);
    map['day_of_purchase'] = Variable<int>(dayOfPurchase);
    map['max_condition_at_purchase'] = Variable<int>(maxConditionAtPurchase);
    return map;
  }

  JewelryTableCompanion toCompanion(bool nullToAbsent) {
    return JewelryTableCompanion(
      id: Value(id),
      personId: Value(personId),
      jewel: Value(jewel),
      type: Value(type),
      carat: Value(carat),
      quality: Value(quality),
      basePrice: Value(basePrice),
      dayOfPurchase: Value(dayOfPurchase),
      maxConditionAtPurchase: Value(maxConditionAtPurchase),
    );
  }

  factory Jewelry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Jewelry(
      id: serializer.fromJson<int>(json['id']),
      personId: serializer.fromJson<int>(json['personId']),
      jewel: serializer.fromJson<String>(json['jewel']),
      type: serializer.fromJson<String>(json['type']),
      carat: serializer.fromJson<double>(json['carat']),
      quality: serializer.fromJson<String>(json['quality']),
      basePrice: serializer.fromJson<int>(json['basePrice']),
      dayOfPurchase: serializer.fromJson<int>(json['dayOfPurchase']),
      maxConditionAtPurchase:
          serializer.fromJson<int>(json['maxConditionAtPurchase']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'personId': serializer.toJson<int>(personId),
      'jewel': serializer.toJson<String>(jewel),
      'type': serializer.toJson<String>(type),
      'carat': serializer.toJson<double>(carat),
      'quality': serializer.toJson<String>(quality),
      'basePrice': serializer.toJson<int>(basePrice),
      'dayOfPurchase': serializer.toJson<int>(dayOfPurchase),
      'maxConditionAtPurchase': serializer.toJson<int>(maxConditionAtPurchase),
    };
  }

  Jewelry copyWith(
          {int? id,
          int? personId,
          String? jewel,
          String? type,
          double? carat,
          String? quality,
          int? basePrice,
          int? dayOfPurchase,
          int? maxConditionAtPurchase}) =>
      Jewelry(
        id: id ?? this.id,
        personId: personId ?? this.personId,
        jewel: jewel ?? this.jewel,
        type: type ?? this.type,
        carat: carat ?? this.carat,
        quality: quality ?? this.quality,
        basePrice: basePrice ?? this.basePrice,
        dayOfPurchase: dayOfPurchase ?? this.dayOfPurchase,
        maxConditionAtPurchase:
            maxConditionAtPurchase ?? this.maxConditionAtPurchase,
      );
  @override
  String toString() {
    return (StringBuffer('Jewelry(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('jewel: $jewel, ')
          ..write('type: $type, ')
          ..write('carat: $carat, ')
          ..write('quality: $quality, ')
          ..write('basePrice: $basePrice, ')
          ..write('dayOfPurchase: $dayOfPurchase, ')
          ..write('maxConditionAtPurchase: $maxConditionAtPurchase')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, personId, jewel, type, carat, quality,
      basePrice, dayOfPurchase, maxConditionAtPurchase);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Jewelry &&
          other.id == this.id &&
          other.personId == this.personId &&
          other.jewel == this.jewel &&
          other.type == this.type &&
          other.carat == this.carat &&
          other.quality == this.quality &&
          other.basePrice == this.basePrice &&
          other.dayOfPurchase == this.dayOfPurchase &&
          other.maxConditionAtPurchase == this.maxConditionAtPurchase);
}

class JewelryTableCompanion extends UpdateCompanion<Jewelry> {
  final Value<int> id;
  final Value<int> personId;
  final Value<String> jewel;
  final Value<String> type;
  final Value<double> carat;
  final Value<String> quality;
  final Value<int> basePrice;
  final Value<int> dayOfPurchase;
  final Value<int> maxConditionAtPurchase;
  const JewelryTableCompanion({
    this.id = const Value.absent(),
    this.personId = const Value.absent(),
    this.jewel = const Value.absent(),
    this.type = const Value.absent(),
    this.carat = const Value.absent(),
    this.quality = const Value.absent(),
    this.basePrice = const Value.absent(),
    this.dayOfPurchase = const Value.absent(),
    this.maxConditionAtPurchase = const Value.absent(),
  });
  JewelryTableCompanion.insert({
    this.id = const Value.absent(),
    required int personId,
    required String jewel,
    required String type,
    required double carat,
    required String quality,
    required int basePrice,
    required int dayOfPurchase,
    required int maxConditionAtPurchase,
  })  : personId = Value(personId),
        jewel = Value(jewel),
        type = Value(type),
        carat = Value(carat),
        quality = Value(quality),
        basePrice = Value(basePrice),
        dayOfPurchase = Value(dayOfPurchase),
        maxConditionAtPurchase = Value(maxConditionAtPurchase);
  static Insertable<Jewelry> custom({
    Expression<int>? id,
    Expression<int>? personId,
    Expression<String>? jewel,
    Expression<String>? type,
    Expression<double>? carat,
    Expression<String>? quality,
    Expression<int>? basePrice,
    Expression<int>? dayOfPurchase,
    Expression<int>? maxConditionAtPurchase,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (personId != null) 'person_id': personId,
      if (jewel != null) 'jewel': jewel,
      if (type != null) 'type': type,
      if (carat != null) 'carat': carat,
      if (quality != null) 'quality': quality,
      if (basePrice != null) 'base_price': basePrice,
      if (dayOfPurchase != null) 'day_of_purchase': dayOfPurchase,
      if (maxConditionAtPurchase != null)
        'max_condition_at_purchase': maxConditionAtPurchase,
    });
  }

  JewelryTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? personId,
      Value<String>? jewel,
      Value<String>? type,
      Value<double>? carat,
      Value<String>? quality,
      Value<int>? basePrice,
      Value<int>? dayOfPurchase,
      Value<int>? maxConditionAtPurchase}) {
    return JewelryTableCompanion(
      id: id ?? this.id,
      personId: personId ?? this.personId,
      jewel: jewel ?? this.jewel,
      type: type ?? this.type,
      carat: carat ?? this.carat,
      quality: quality ?? this.quality,
      basePrice: basePrice ?? this.basePrice,
      dayOfPurchase: dayOfPurchase ?? this.dayOfPurchase,
      maxConditionAtPurchase:
          maxConditionAtPurchase ?? this.maxConditionAtPurchase,
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
    if (jewel.present) {
      map['jewel'] = Variable<String>(jewel.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (carat.present) {
      map['carat'] = Variable<double>(carat.value);
    }
    if (quality.present) {
      map['quality'] = Variable<String>(quality.value);
    }
    if (basePrice.present) {
      map['base_price'] = Variable<int>(basePrice.value);
    }
    if (dayOfPurchase.present) {
      map['day_of_purchase'] = Variable<int>(dayOfPurchase.value);
    }
    if (maxConditionAtPurchase.present) {
      map['max_condition_at_purchase'] =
          Variable<int>(maxConditionAtPurchase.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JewelryTableCompanion(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('jewel: $jewel, ')
          ..write('type: $type, ')
          ..write('carat: $carat, ')
          ..write('quality: $quality, ')
          ..write('basePrice: $basePrice, ')
          ..write('dayOfPurchase: $dayOfPurchase, ')
          ..write('maxConditionAtPurchase: $maxConditionAtPurchase')
          ..write(')'))
        .toString();
  }
}

class $StoreroomItemTableTable extends StoreroomItemTable
    with TableInfo<$StoreroomItemTableTable, StoreroomItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoreroomItemTableTable(this.attachedDatabase, [this._alias]);
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
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES person (id)'));
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES item (id)'));
  static const VerificationMeta _countsLeftMeta =
      const VerificationMeta('countsLeft');
  @override
  late final GeneratedColumn<int> countsLeft = GeneratedColumn<int>(
      'counts_left', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, personId, itemId, countsLeft];
  @override
  String get aliasedName => _alias ?? 'storeroom_item';
  @override
  String get actualTableName => 'storeroom_item';
  @override
  VerificationContext validateIntegrity(Insertable<StoreroomItem> instance,
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
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('counts_left')) {
      context.handle(
          _countsLeftMeta,
          countsLeft.isAcceptableOrUnknown(
              data['counts_left']!, _countsLeftMeta));
    } else if (isInserting) {
      context.missing(_countsLeftMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StoreroomItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoreroomItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id'])!,
      countsLeft: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}counts_left'])!,
    );
  }

  @override
  $StoreroomItemTableTable createAlias(String alias) {
    return $StoreroomItemTableTable(attachedDatabase, alias);
  }
}

class StoreroomItem extends DataClass implements Insertable<StoreroomItem> {
  final int id;
  final int personId;
  final int itemId;
  final int countsLeft;
  const StoreroomItem(
      {required this.id,
      required this.personId,
      required this.itemId,
      required this.countsLeft});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['person_id'] = Variable<int>(personId);
    map['item_id'] = Variable<int>(itemId);
    map['counts_left'] = Variable<int>(countsLeft);
    return map;
  }

  StoreroomItemTableCompanion toCompanion(bool nullToAbsent) {
    return StoreroomItemTableCompanion(
      id: Value(id),
      personId: Value(personId),
      itemId: Value(itemId),
      countsLeft: Value(countsLeft),
    );
  }

  factory StoreroomItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoreroomItem(
      id: serializer.fromJson<int>(json['id']),
      personId: serializer.fromJson<int>(json['personId']),
      itemId: serializer.fromJson<int>(json['itemId']),
      countsLeft: serializer.fromJson<int>(json['countsLeft']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'personId': serializer.toJson<int>(personId),
      'itemId': serializer.toJson<int>(itemId),
      'countsLeft': serializer.toJson<int>(countsLeft),
    };
  }

  StoreroomItem copyWith(
          {int? id, int? personId, int? itemId, int? countsLeft}) =>
      StoreroomItem(
        id: id ?? this.id,
        personId: personId ?? this.personId,
        itemId: itemId ?? this.itemId,
        countsLeft: countsLeft ?? this.countsLeft,
      );
  @override
  String toString() {
    return (StringBuffer('StoreroomItem(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('itemId: $itemId, ')
          ..write('countsLeft: $countsLeft')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, personId, itemId, countsLeft);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoreroomItem &&
          other.id == this.id &&
          other.personId == this.personId &&
          other.itemId == this.itemId &&
          other.countsLeft == this.countsLeft);
}

class StoreroomItemTableCompanion extends UpdateCompanion<StoreroomItem> {
  final Value<int> id;
  final Value<int> personId;
  final Value<int> itemId;
  final Value<int> countsLeft;
  const StoreroomItemTableCompanion({
    this.id = const Value.absent(),
    this.personId = const Value.absent(),
    this.itemId = const Value.absent(),
    this.countsLeft = const Value.absent(),
  });
  StoreroomItemTableCompanion.insert({
    this.id = const Value.absent(),
    required int personId,
    required int itemId,
    required int countsLeft,
  })  : personId = Value(personId),
        itemId = Value(itemId),
        countsLeft = Value(countsLeft);
  static Insertable<StoreroomItem> custom({
    Expression<int>? id,
    Expression<int>? personId,
    Expression<int>? itemId,
    Expression<int>? countsLeft,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (personId != null) 'person_id': personId,
      if (itemId != null) 'item_id': itemId,
      if (countsLeft != null) 'counts_left': countsLeft,
    });
  }

  StoreroomItemTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? personId,
      Value<int>? itemId,
      Value<int>? countsLeft}) {
    return StoreroomItemTableCompanion(
      id: id ?? this.id,
      personId: personId ?? this.personId,
      itemId: itemId ?? this.itemId,
      countsLeft: countsLeft ?? this.countsLeft,
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
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (countsLeft.present) {
      map['counts_left'] = Variable<int>(countsLeft.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoreroomItemTableCompanion(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('itemId: $itemId, ')
          ..write('countsLeft: $countsLeft')
          ..write(')'))
        .toString();
  }
}

class $JournalTableTable extends JournalTable
    with TableInfo<$JournalTableTable, Journal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _gameIdMeta = const VerificationMeta('gameId');
  @override
  late final GeneratedColumn<int> gameId = GeneratedColumn<int>(
      'game_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES game (id)'));
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<int> day = GeneratedColumn<int>(
      'day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _mainPlayerIdMeta =
      const VerificationMeta('mainPlayerId');
  @override
  late final GeneratedColumn<int> mainPlayerId = GeneratedColumn<int>(
      'main_player_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES person (id)'));
  static const VerificationMeta _entryMeta = const VerificationMeta('entry');
  @override
  late final GeneratedColumn<String> entry = GeneratedColumn<String>(
      'entry', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [gameId, day, mainPlayerId, entry];
  @override
  String get aliasedName => _alias ?? 'journal';
  @override
  String get actualTableName => 'journal';
  @override
  VerificationContext validateIntegrity(Insertable<Journal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('game_id')) {
      context.handle(_gameIdMeta,
          gameId.isAcceptableOrUnknown(data['game_id']!, _gameIdMeta));
    } else if (isInserting) {
      context.missing(_gameIdMeta);
    }
    if (data.containsKey('day')) {
      context.handle(
          _dayMeta, day.isAcceptableOrUnknown(data['day']!, _dayMeta));
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    if (data.containsKey('main_player_id')) {
      context.handle(
          _mainPlayerIdMeta,
          mainPlayerId.isAcceptableOrUnknown(
              data['main_player_id']!, _mainPlayerIdMeta));
    } else if (isInserting) {
      context.missing(_mainPlayerIdMeta);
    }
    if (data.containsKey('entry')) {
      context.handle(
          _entryMeta, entry.isAcceptableOrUnknown(data['entry']!, _entryMeta));
    } else if (isInserting) {
      context.missing(_entryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {gameId, day};
  @override
  Journal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Journal(
      gameId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}game_id'])!,
      day: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day'])!,
      mainPlayerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}main_player_id'])!,
      entry: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entry'])!,
    );
  }

  @override
  $JournalTableTable createAlias(String alias) {
    return $JournalTableTable(attachedDatabase, alias);
  }
}

class Journal extends DataClass implements Insertable<Journal> {
  final int gameId;
  final int day;
  final int mainPlayerId;
  final String entry;
  const Journal(
      {required this.gameId,
      required this.day,
      required this.mainPlayerId,
      required this.entry});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['game_id'] = Variable<int>(gameId);
    map['day'] = Variable<int>(day);
    map['main_player_id'] = Variable<int>(mainPlayerId);
    map['entry'] = Variable<String>(entry);
    return map;
  }

  JournalTableCompanion toCompanion(bool nullToAbsent) {
    return JournalTableCompanion(
      gameId: Value(gameId),
      day: Value(day),
      mainPlayerId: Value(mainPlayerId),
      entry: Value(entry),
    );
  }

  factory Journal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Journal(
      gameId: serializer.fromJson<int>(json['gameId']),
      day: serializer.fromJson<int>(json['day']),
      mainPlayerId: serializer.fromJson<int>(json['mainPlayerId']),
      entry: serializer.fromJson<String>(json['entry']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'gameId': serializer.toJson<int>(gameId),
      'day': serializer.toJson<int>(day),
      'mainPlayerId': serializer.toJson<int>(mainPlayerId),
      'entry': serializer.toJson<String>(entry),
    };
  }

  Journal copyWith({int? gameId, int? day, int? mainPlayerId, String? entry}) =>
      Journal(
        gameId: gameId ?? this.gameId,
        day: day ?? this.day,
        mainPlayerId: mainPlayerId ?? this.mainPlayerId,
        entry: entry ?? this.entry,
      );
  @override
  String toString() {
    return (StringBuffer('Journal(')
          ..write('gameId: $gameId, ')
          ..write('day: $day, ')
          ..write('mainPlayerId: $mainPlayerId, ')
          ..write('entry: $entry')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(gameId, day, mainPlayerId, entry);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Journal &&
          other.gameId == this.gameId &&
          other.day == this.day &&
          other.mainPlayerId == this.mainPlayerId &&
          other.entry == this.entry);
}

class JournalTableCompanion extends UpdateCompanion<Journal> {
  final Value<int> gameId;
  final Value<int> day;
  final Value<int> mainPlayerId;
  final Value<String> entry;
  const JournalTableCompanion({
    this.gameId = const Value.absent(),
    this.day = const Value.absent(),
    this.mainPlayerId = const Value.absent(),
    this.entry = const Value.absent(),
  });
  JournalTableCompanion.insert({
    required int gameId,
    required int day,
    required int mainPlayerId,
    required String entry,
  })  : gameId = Value(gameId),
        day = Value(day),
        mainPlayerId = Value(mainPlayerId),
        entry = Value(entry);
  static Insertable<Journal> custom({
    Expression<int>? gameId,
    Expression<int>? day,
    Expression<int>? mainPlayerId,
    Expression<String>? entry,
  }) {
    return RawValuesInsertable({
      if (gameId != null) 'game_id': gameId,
      if (day != null) 'day': day,
      if (mainPlayerId != null) 'main_player_id': mainPlayerId,
      if (entry != null) 'entry': entry,
    });
  }

  JournalTableCompanion copyWith(
      {Value<int>? gameId,
      Value<int>? day,
      Value<int>? mainPlayerId,
      Value<String>? entry}) {
    return JournalTableCompanion(
      gameId: gameId ?? this.gameId,
      day: day ?? this.day,
      mainPlayerId: mainPlayerId ?? this.mainPlayerId,
      entry: entry ?? this.entry,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (gameId.present) {
      map['game_id'] = Variable<int>(gameId.value);
    }
    if (day.present) {
      map['day'] = Variable<int>(day.value);
    }
    if (mainPlayerId.present) {
      map['main_player_id'] = Variable<int>(mainPlayerId.value);
    }
    if (entry.present) {
      map['entry'] = Variable<String>(entry.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalTableCompanion(')
          ..write('gameId: $gameId, ')
          ..write('day: $day, ')
          ..write('mainPlayerId: $mainPlayerId, ')
          ..write('entry: $entry')
          ..write(')'))
        .toString();
  }
}

class $RecurringBillTableTable extends RecurringBillTable
    with TableInfo<$RecurringBillTableTable, RecurringBill> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecurringBillTableTable(this.attachedDatabase, [this._alias]);
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
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES person (id)'));
  static const VerificationMeta _billTypeMeta =
      const VerificationMeta('billType');
  @override
  late final GeneratedColumn<String> billType = GeneratedColumn<String>(
      'bill_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _billDescriptionMeta =
      const VerificationMeta('billDescription');
  @override
  late final GeneratedColumn<String> billDescription = GeneratedColumn<String>(
      'bill_description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _billAmountMeta =
      const VerificationMeta('billAmount');
  @override
  late final GeneratedColumn<int> billAmount = GeneratedColumn<int>(
      'bill_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _paymentsLeftMeta =
      const VerificationMeta('paymentsLeft');
  @override
  late final GeneratedColumn<int> paymentsLeft = GeneratedColumn<int>(
      'payments_left', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dueDayMeta = const VerificationMeta('dueDay');
  @override
  late final GeneratedColumn<int> dueDay = GeneratedColumn<int>(
      'due_day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _purchaseIdMeta =
      const VerificationMeta('purchaseId');
  @override
  late final GeneratedColumn<int> purchaseId = GeneratedColumn<int>(
      'purchase_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _missedPaymentsMeta =
      const VerificationMeta('missedPayments');
  @override
  late final GeneratedColumn<int> missedPayments = GeneratedColumn<int>(
      'missed_payments', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isUrgentMeta =
      const VerificationMeta('isUrgent');
  @override
  late final GeneratedColumn<bool> isUrgent =
      GeneratedColumn<bool>('is_urgent', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_urgent" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        personId,
        billType,
        billDescription,
        billAmount,
        paymentsLeft,
        dueDay,
        purchaseId,
        missedPayments,
        isUrgent
      ];
  @override
  String get aliasedName => _alias ?? 'recurring_bill';
  @override
  String get actualTableName => 'recurring_bill';
  @override
  VerificationContext validateIntegrity(Insertable<RecurringBill> instance,
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
    if (data.containsKey('bill_type')) {
      context.handle(_billTypeMeta,
          billType.isAcceptableOrUnknown(data['bill_type']!, _billTypeMeta));
    } else if (isInserting) {
      context.missing(_billTypeMeta);
    }
    if (data.containsKey('bill_description')) {
      context.handle(
          _billDescriptionMeta,
          billDescription.isAcceptableOrUnknown(
              data['bill_description']!, _billDescriptionMeta));
    } else if (isInserting) {
      context.missing(_billDescriptionMeta);
    }
    if (data.containsKey('bill_amount')) {
      context.handle(
          _billAmountMeta,
          billAmount.isAcceptableOrUnknown(
              data['bill_amount']!, _billAmountMeta));
    } else if (isInserting) {
      context.missing(_billAmountMeta);
    }
    if (data.containsKey('payments_left')) {
      context.handle(
          _paymentsLeftMeta,
          paymentsLeft.isAcceptableOrUnknown(
              data['payments_left']!, _paymentsLeftMeta));
    } else if (isInserting) {
      context.missing(_paymentsLeftMeta);
    }
    if (data.containsKey('due_day')) {
      context.handle(_dueDayMeta,
          dueDay.isAcceptableOrUnknown(data['due_day']!, _dueDayMeta));
    } else if (isInserting) {
      context.missing(_dueDayMeta);
    }
    if (data.containsKey('purchase_id')) {
      context.handle(
          _purchaseIdMeta,
          purchaseId.isAcceptableOrUnknown(
              data['purchase_id']!, _purchaseIdMeta));
    } else if (isInserting) {
      context.missing(_purchaseIdMeta);
    }
    if (data.containsKey('missed_payments')) {
      context.handle(
          _missedPaymentsMeta,
          missedPayments.isAcceptableOrUnknown(
              data['missed_payments']!, _missedPaymentsMeta));
    } else if (isInserting) {
      context.missing(_missedPaymentsMeta);
    }
    if (data.containsKey('is_urgent')) {
      context.handle(_isUrgentMeta,
          isUrgent.isAcceptableOrUnknown(data['is_urgent']!, _isUrgentMeta));
    } else if (isInserting) {
      context.missing(_isUrgentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecurringBill map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecurringBill(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id'])!,
      billType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bill_type'])!,
      billDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}bill_description'])!,
      billAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bill_amount'])!,
      paymentsLeft: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}payments_left'])!,
      dueDay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}due_day'])!,
      purchaseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}purchase_id'])!,
      missedPayments: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}missed_payments'])!,
      isUrgent: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_urgent'])!,
    );
  }

  @override
  $RecurringBillTableTable createAlias(String alias) {
    return $RecurringBillTableTable(attachedDatabase, alias);
  }
}

class RecurringBill extends DataClass implements Insertable<RecurringBill> {
  final int id;
  final int personId;
  final String billType;
  final String billDescription;
  final int billAmount;
  final int paymentsLeft;
  final int dueDay;
  final int purchaseId;
  final int missedPayments;
  final bool isUrgent;
  const RecurringBill(
      {required this.id,
      required this.personId,
      required this.billType,
      required this.billDescription,
      required this.billAmount,
      required this.paymentsLeft,
      required this.dueDay,
      required this.purchaseId,
      required this.missedPayments,
      required this.isUrgent});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['person_id'] = Variable<int>(personId);
    map['bill_type'] = Variable<String>(billType);
    map['bill_description'] = Variable<String>(billDescription);
    map['bill_amount'] = Variable<int>(billAmount);
    map['payments_left'] = Variable<int>(paymentsLeft);
    map['due_day'] = Variable<int>(dueDay);
    map['purchase_id'] = Variable<int>(purchaseId);
    map['missed_payments'] = Variable<int>(missedPayments);
    map['is_urgent'] = Variable<bool>(isUrgent);
    return map;
  }

  RecurringBillTableCompanion toCompanion(bool nullToAbsent) {
    return RecurringBillTableCompanion(
      id: Value(id),
      personId: Value(personId),
      billType: Value(billType),
      billDescription: Value(billDescription),
      billAmount: Value(billAmount),
      paymentsLeft: Value(paymentsLeft),
      dueDay: Value(dueDay),
      purchaseId: Value(purchaseId),
      missedPayments: Value(missedPayments),
      isUrgent: Value(isUrgent),
    );
  }

  factory RecurringBill.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecurringBill(
      id: serializer.fromJson<int>(json['id']),
      personId: serializer.fromJson<int>(json['personId']),
      billType: serializer.fromJson<String>(json['billType']),
      billDescription: serializer.fromJson<String>(json['billDescription']),
      billAmount: serializer.fromJson<int>(json['billAmount']),
      paymentsLeft: serializer.fromJson<int>(json['paymentsLeft']),
      dueDay: serializer.fromJson<int>(json['dueDay']),
      purchaseId: serializer.fromJson<int>(json['purchaseId']),
      missedPayments: serializer.fromJson<int>(json['missedPayments']),
      isUrgent: serializer.fromJson<bool>(json['isUrgent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'personId': serializer.toJson<int>(personId),
      'billType': serializer.toJson<String>(billType),
      'billDescription': serializer.toJson<String>(billDescription),
      'billAmount': serializer.toJson<int>(billAmount),
      'paymentsLeft': serializer.toJson<int>(paymentsLeft),
      'dueDay': serializer.toJson<int>(dueDay),
      'purchaseId': serializer.toJson<int>(purchaseId),
      'missedPayments': serializer.toJson<int>(missedPayments),
      'isUrgent': serializer.toJson<bool>(isUrgent),
    };
  }

  RecurringBill copyWith(
          {int? id,
          int? personId,
          String? billType,
          String? billDescription,
          int? billAmount,
          int? paymentsLeft,
          int? dueDay,
          int? purchaseId,
          int? missedPayments,
          bool? isUrgent}) =>
      RecurringBill(
        id: id ?? this.id,
        personId: personId ?? this.personId,
        billType: billType ?? this.billType,
        billDescription: billDescription ?? this.billDescription,
        billAmount: billAmount ?? this.billAmount,
        paymentsLeft: paymentsLeft ?? this.paymentsLeft,
        dueDay: dueDay ?? this.dueDay,
        purchaseId: purchaseId ?? this.purchaseId,
        missedPayments: missedPayments ?? this.missedPayments,
        isUrgent: isUrgent ?? this.isUrgent,
      );
  @override
  String toString() {
    return (StringBuffer('RecurringBill(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('billType: $billType, ')
          ..write('billDescription: $billDescription, ')
          ..write('billAmount: $billAmount, ')
          ..write('paymentsLeft: $paymentsLeft, ')
          ..write('dueDay: $dueDay, ')
          ..write('purchaseId: $purchaseId, ')
          ..write('missedPayments: $missedPayments, ')
          ..write('isUrgent: $isUrgent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, personId, billType, billDescription,
      billAmount, paymentsLeft, dueDay, purchaseId, missedPayments, isUrgent);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecurringBill &&
          other.id == this.id &&
          other.personId == this.personId &&
          other.billType == this.billType &&
          other.billDescription == this.billDescription &&
          other.billAmount == this.billAmount &&
          other.paymentsLeft == this.paymentsLeft &&
          other.dueDay == this.dueDay &&
          other.purchaseId == this.purchaseId &&
          other.missedPayments == this.missedPayments &&
          other.isUrgent == this.isUrgent);
}

class RecurringBillTableCompanion extends UpdateCompanion<RecurringBill> {
  final Value<int> id;
  final Value<int> personId;
  final Value<String> billType;
  final Value<String> billDescription;
  final Value<int> billAmount;
  final Value<int> paymentsLeft;
  final Value<int> dueDay;
  final Value<int> purchaseId;
  final Value<int> missedPayments;
  final Value<bool> isUrgent;
  const RecurringBillTableCompanion({
    this.id = const Value.absent(),
    this.personId = const Value.absent(),
    this.billType = const Value.absent(),
    this.billDescription = const Value.absent(),
    this.billAmount = const Value.absent(),
    this.paymentsLeft = const Value.absent(),
    this.dueDay = const Value.absent(),
    this.purchaseId = const Value.absent(),
    this.missedPayments = const Value.absent(),
    this.isUrgent = const Value.absent(),
  });
  RecurringBillTableCompanion.insert({
    this.id = const Value.absent(),
    required int personId,
    required String billType,
    required String billDescription,
    required int billAmount,
    required int paymentsLeft,
    required int dueDay,
    required int purchaseId,
    required int missedPayments,
    required bool isUrgent,
  })  : personId = Value(personId),
        billType = Value(billType),
        billDescription = Value(billDescription),
        billAmount = Value(billAmount),
        paymentsLeft = Value(paymentsLeft),
        dueDay = Value(dueDay),
        purchaseId = Value(purchaseId),
        missedPayments = Value(missedPayments),
        isUrgent = Value(isUrgent);
  static Insertable<RecurringBill> custom({
    Expression<int>? id,
    Expression<int>? personId,
    Expression<String>? billType,
    Expression<String>? billDescription,
    Expression<int>? billAmount,
    Expression<int>? paymentsLeft,
    Expression<int>? dueDay,
    Expression<int>? purchaseId,
    Expression<int>? missedPayments,
    Expression<bool>? isUrgent,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (personId != null) 'person_id': personId,
      if (billType != null) 'bill_type': billType,
      if (billDescription != null) 'bill_description': billDescription,
      if (billAmount != null) 'bill_amount': billAmount,
      if (paymentsLeft != null) 'payments_left': paymentsLeft,
      if (dueDay != null) 'due_day': dueDay,
      if (purchaseId != null) 'purchase_id': purchaseId,
      if (missedPayments != null) 'missed_payments': missedPayments,
      if (isUrgent != null) 'is_urgent': isUrgent,
    });
  }

  RecurringBillTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? personId,
      Value<String>? billType,
      Value<String>? billDescription,
      Value<int>? billAmount,
      Value<int>? paymentsLeft,
      Value<int>? dueDay,
      Value<int>? purchaseId,
      Value<int>? missedPayments,
      Value<bool>? isUrgent}) {
    return RecurringBillTableCompanion(
      id: id ?? this.id,
      personId: personId ?? this.personId,
      billType: billType ?? this.billType,
      billDescription: billDescription ?? this.billDescription,
      billAmount: billAmount ?? this.billAmount,
      paymentsLeft: paymentsLeft ?? this.paymentsLeft,
      dueDay: dueDay ?? this.dueDay,
      purchaseId: purchaseId ?? this.purchaseId,
      missedPayments: missedPayments ?? this.missedPayments,
      isUrgent: isUrgent ?? this.isUrgent,
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
    if (billType.present) {
      map['bill_type'] = Variable<String>(billType.value);
    }
    if (billDescription.present) {
      map['bill_description'] = Variable<String>(billDescription.value);
    }
    if (billAmount.present) {
      map['bill_amount'] = Variable<int>(billAmount.value);
    }
    if (paymentsLeft.present) {
      map['payments_left'] = Variable<int>(paymentsLeft.value);
    }
    if (dueDay.present) {
      map['due_day'] = Variable<int>(dueDay.value);
    }
    if (purchaseId.present) {
      map['purchase_id'] = Variable<int>(purchaseId.value);
    }
    if (missedPayments.present) {
      map['missed_payments'] = Variable<int>(missedPayments.value);
    }
    if (isUrgent.present) {
      map['is_urgent'] = Variable<bool>(isUrgent.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecurringBillTableCompanion(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('billType: $billType, ')
          ..write('billDescription: $billDescription, ')
          ..write('billAmount: $billAmount, ')
          ..write('paymentsLeft: $paymentsLeft, ')
          ..write('dueDay: $dueDay, ')
          ..write('purchaseId: $purchaseId, ')
          ..write('missedPayments: $missedPayments, ')
          ..write('isUrgent: $isUrgent')
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
  late final $AcquaintanceTableTable acquaintanceTable =
      $AcquaintanceTableTable(this);
  late final $ChildTableTable childTable = $ChildTableTable(this);
  late final $FriendTableTable friendTable = $FriendTableTable(this);
  late final $GraveTableTable graveTable = $GraveTableTable(this);
  late final $InLawTableTable inLawTable = $InLawTableTable(this);
  late final $ParentTableTable parentTable = $ParentTableTable(this);
  late final $PartnerTableTable partnerTable = $PartnerTableTable(this);
  late final $RelativeTableTable relativeTable = $RelativeTableTable(this);
  late final $SiblingTableTable siblingTable = $SiblingTableTable(this);
  late final $EventTableTable eventTable = $EventTableTable(this);
  late final $CarTableTable carTable = $CarTableTable(this);
  late final $FoodTableTable foodTable = $FoodTableTable(this);
  late final $FridgeFoodTableTable fridgeFoodTable =
      $FridgeFoodTableTable(this);
  late final $HouseTableTable houseTable = $HouseTableTable(this);
  late final $ItemTableTable itemTable = $ItemTableTable(this);
  late final $JewelryTableTable jewelryTable = $JewelryTableTable(this);
  late final $StoreroomItemTableTable storeroomItemTable =
      $StoreroomItemTableTable(this);
  late final $JournalTableTable journalTable = $JournalTableTable(this);
  late final $RecurringBillTableTable recurringBillTable =
      $RecurringBillTableTable(this);
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
  late final AcquaintanceDaoImpl acquaintanceDaoImpl =
      AcquaintanceDaoImpl(this as DatabaseProvider);
  late final ChildDaoImpl childDaoImpl = ChildDaoImpl(this as DatabaseProvider);
  late final FriendDaoImpl friendDaoImpl =
      FriendDaoImpl(this as DatabaseProvider);
  late final GraveDaoImpl graveDaoImpl = GraveDaoImpl(this as DatabaseProvider);
  late final InLawDaoImpl inLawDaoImpl = InLawDaoImpl(this as DatabaseProvider);
  late final ParentDaoImpl parentDaoImpl =
      ParentDaoImpl(this as DatabaseProvider);
  late final PartnerDaoImpl partnerDaoImpl =
      PartnerDaoImpl(this as DatabaseProvider);
  late final RelativeDaoImpl relativeDaoImpl =
      RelativeDaoImpl(this as DatabaseProvider);
  late final SiblingDaoImpl siblingDaoImpl =
      SiblingDaoImpl(this as DatabaseProvider);
  late final EventDaoImpl eventDaoImpl = EventDaoImpl(this as DatabaseProvider);
  late final CarDaoImpl carDaoImpl = CarDaoImpl(this as DatabaseProvider);
  late final FoodDaoImpl foodDaoImpl = FoodDaoImpl(this as DatabaseProvider);
  late final FridgeFoodDaoImpl fridgeFoodDaoImpl =
      FridgeFoodDaoImpl(this as DatabaseProvider);
  late final HouseDaoImpl houseDaoImpl = HouseDaoImpl(this as DatabaseProvider);
  late final ItemDaoImpl itemDaoImpl = ItemDaoImpl(this as DatabaseProvider);
  late final JewelryDaoImpl jewelryDaoImpl =
      JewelryDaoImpl(this as DatabaseProvider);
  late final StoreroomItemDaoImpl storeroomItemDaoImpl =
      StoreroomItemDaoImpl(this as DatabaseProvider);
  late final JournalDaoImpl journalDaoImpl =
      JournalDaoImpl(this as DatabaseProvider);
  late final RecurringBillDaoImpl recurringBillDaoImpl =
      RecurringBillDaoImpl(this as DatabaseProvider);
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
        relationshipTraitsTable,
        acquaintanceTable,
        childTable,
        friendTable,
        graveTable,
        inLawTable,
        parentTable,
        partnerTable,
        relativeTable,
        siblingTable,
        eventTable,
        carTable,
        foodTable,
        fridgeFoodTable,
        houseTable,
        itemTable,
        jewelryTable,
        storeroomItemTable,
        journalTable,
        recurringBillTable
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
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('acquaintance', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('acquaintance', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('acquaintance', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('acquaintance', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('child', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('child', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('child', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('child', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('friend', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('friend', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('friend', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('friend', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('grave', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('grave', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('grave', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('grave', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('inlaw', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('inlaw', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('inlaw', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('inlaw', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('parent', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('parent', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('parent', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('parent', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('partner', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('partner', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('partner', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('partner', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('relative', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('relative', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('relative', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('relative', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('sibling', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('sibling', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('sibling', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('sibling', kind: UpdateKind.update),
            ],
          ),
        ],
      );
}
