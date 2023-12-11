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
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'));
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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game';
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
  static const VerificationMeta _emotionalStateMeta =
      const VerificationMeta('emotionalState');
  @override
  late final GeneratedColumn<String> emotionalState = GeneratedColumn<String>(
      'emotional_state', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _zodiacSignMeta =
      const VerificationMeta('zodiacSign');
  @override
  late final GeneratedColumn<String> zodiacSign = GeneratedColumn<String>(
      'zodiac_sign', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hasDriversLicenseMeta =
      const VerificationMeta('hasDriversLicense');
  @override
  late final GeneratedColumn<bool> hasDriversLicense = GeneratedColumn<bool>(
      'has_drivers_license', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_drivers_license" IN (0, 1))'));
  static const VerificationMeta _transportModeMeta =
      const VerificationMeta('transportMode');
  @override
  late final GeneratedColumn<String> transportMode = GeneratedColumn<String>(
      'transport_mode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _drivingModeMeta =
      const VerificationMeta('drivingMode');
  @override
  late final GeneratedColumn<String> drivingMode = GeneratedColumn<String>(
      'driving_mode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hasFertilityIssuesMeta =
      const VerificationMeta('hasFertilityIssues');
  @override
  late final GeneratedColumn<bool> hasFertilityIssues = GeneratedColumn<bool>(
      'has_fertility_issues', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_fertility_issues" IN (0, 1))'));
  static const VerificationMeta _onBirthControlMeta =
      const VerificationMeta('onBirthControl');
  @override
  late final GeneratedColumn<bool> onBirthControl = GeneratedColumn<bool>(
      'on_birth_control', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("on_birth_control" IN (0, 1))'));
  static const VerificationMeta _isSterileMeta =
      const VerificationMeta('isSterile');
  @override
  late final GeneratedColumn<bool> isSterile = GeneratedColumn<bool>(
      'is_sterile', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_sterile" IN (0, 1))'));
  static const VerificationMeta _sicklyMeta = const VerificationMeta('sickly');
  @override
  late final GeneratedColumn<bool> sickly = GeneratedColumn<bool>(
      'sickly', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("sickly" IN (0, 1))'));
  static const VerificationMeta _deadMeta = const VerificationMeta('dead');
  @override
  late final GeneratedColumn<bool> dead = GeneratedColumn<bool>(
      'dead', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("dead" IN (0, 1))'));
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
        emotionalState,
        zodiacSign,
        hasDriversLicense,
        transportMode,
        drivingMode,
        hasFertilityIssues,
        onBirthControl,
        isSterile,
        sickly,
        dead
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'person';
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
    if (data.containsKey('emotional_state')) {
      context.handle(
          _emotionalStateMeta,
          emotionalState.isAcceptableOrUnknown(
              data['emotional_state']!, _emotionalStateMeta));
    } else if (isInserting) {
      context.missing(_emotionalStateMeta);
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
    if (data.containsKey('driving_mode')) {
      context.handle(
          _drivingModeMeta,
          drivingMode.isAcceptableOrUnknown(
              data['driving_mode']!, _drivingModeMeta));
    } else if (isInserting) {
      context.missing(_drivingModeMeta);
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
      emotionalState: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}emotional_state'])!,
      zodiacSign: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}zodiac_sign'])!,
      hasDriversLicense: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}has_drivers_license'])!,
      transportMode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}transport_mode'])!,
      drivingMode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}driving_mode'])!,
      hasFertilityIssues: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}has_fertility_issues'])!,
      onBirthControl: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}on_birth_control'])!,
      isSterile: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_sterile'])!,
      sickly: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sickly'])!,
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
  final String emotionalState;
  final String zodiacSign;
  final bool hasDriversLicense;
  final String transportMode;
  final String drivingMode;
  final bool hasFertilityIssues;
  final bool onBirthControl;
  final bool isSterile;
  final bool sickly;
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
      required this.emotionalState,
      required this.zodiacSign,
      required this.hasDriversLicense,
      required this.transportMode,
      required this.drivingMode,
      required this.hasFertilityIssues,
      required this.onBirthControl,
      required this.isSterile,
      required this.sickly,
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
    map['emotional_state'] = Variable<String>(emotionalState);
    map['zodiac_sign'] = Variable<String>(zodiacSign);
    map['has_drivers_license'] = Variable<bool>(hasDriversLicense);
    map['transport_mode'] = Variable<String>(transportMode);
    map['driving_mode'] = Variable<String>(drivingMode);
    map['has_fertility_issues'] = Variable<bool>(hasFertilityIssues);
    map['on_birth_control'] = Variable<bool>(onBirthControl);
    map['is_sterile'] = Variable<bool>(isSterile);
    map['sickly'] = Variable<bool>(sickly);
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
      emotionalState: Value(emotionalState),
      zodiacSign: Value(zodiacSign),
      hasDriversLicense: Value(hasDriversLicense),
      transportMode: Value(transportMode),
      drivingMode: Value(drivingMode),
      hasFertilityIssues: Value(hasFertilityIssues),
      onBirthControl: Value(onBirthControl),
      isSterile: Value(isSterile),
      sickly: Value(sickly),
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
      emotionalState: serializer.fromJson<String>(json['emotionalState']),
      zodiacSign: serializer.fromJson<String>(json['zodiacSign']),
      hasDriversLicense: serializer.fromJson<bool>(json['hasDriversLicense']),
      transportMode: serializer.fromJson<String>(json['transportMode']),
      drivingMode: serializer.fromJson<String>(json['drivingMode']),
      hasFertilityIssues: serializer.fromJson<bool>(json['hasFertilityIssues']),
      onBirthControl: serializer.fromJson<bool>(json['onBirthControl']),
      isSterile: serializer.fromJson<bool>(json['isSterile']),
      sickly: serializer.fromJson<bool>(json['sickly']),
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
      'emotionalState': serializer.toJson<String>(emotionalState),
      'zodiacSign': serializer.toJson<String>(zodiacSign),
      'hasDriversLicense': serializer.toJson<bool>(hasDriversLicense),
      'transportMode': serializer.toJson<String>(transportMode),
      'drivingMode': serializer.toJson<String>(drivingMode),
      'hasFertilityIssues': serializer.toJson<bool>(hasFertilityIssues),
      'onBirthControl': serializer.toJson<bool>(onBirthControl),
      'isSterile': serializer.toJson<bool>(isSterile),
      'sickly': serializer.toJson<bool>(sickly),
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
          String? emotionalState,
          String? zodiacSign,
          bool? hasDriversLicense,
          String? transportMode,
          String? drivingMode,
          bool? hasFertilityIssues,
          bool? onBirthControl,
          bool? isSterile,
          bool? sickly,
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
        emotionalState: emotionalState ?? this.emotionalState,
        zodiacSign: zodiacSign ?? this.zodiacSign,
        hasDriversLicense: hasDriversLicense ?? this.hasDriversLicense,
        transportMode: transportMode ?? this.transportMode,
        drivingMode: drivingMode ?? this.drivingMode,
        hasFertilityIssues: hasFertilityIssues ?? this.hasFertilityIssues,
        onBirthControl: onBirthControl ?? this.onBirthControl,
        isSterile: isSterile ?? this.isSterile,
        sickly: sickly ?? this.sickly,
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
          ..write('emotionalState: $emotionalState, ')
          ..write('zodiacSign: $zodiacSign, ')
          ..write('hasDriversLicense: $hasDriversLicense, ')
          ..write('transportMode: $transportMode, ')
          ..write('drivingMode: $drivingMode, ')
          ..write('hasFertilityIssues: $hasFertilityIssues, ')
          ..write('onBirthControl: $onBirthControl, ')
          ..write('isSterile: $isSterile, ')
          ..write('sickly: $sickly, ')
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
        emotionalState,
        zodiacSign,
        hasDriversLicense,
        transportMode,
        drivingMode,
        hasFertilityIssues,
        onBirthControl,
        isSterile,
        sickly,
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
          other.emotionalState == this.emotionalState &&
          other.zodiacSign == this.zodiacSign &&
          other.hasDriversLicense == this.hasDriversLicense &&
          other.transportMode == this.transportMode &&
          other.drivingMode == this.drivingMode &&
          other.hasFertilityIssues == this.hasFertilityIssues &&
          other.onBirthControl == this.onBirthControl &&
          other.isSterile == this.isSterile &&
          other.sickly == this.sickly &&
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
  final Value<String> emotionalState;
  final Value<String> zodiacSign;
  final Value<bool> hasDriversLicense;
  final Value<String> transportMode;
  final Value<String> drivingMode;
  final Value<bool> hasFertilityIssues;
  final Value<bool> onBirthControl;
  final Value<bool> isSterile;
  final Value<bool> sickly;
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
    this.emotionalState = const Value.absent(),
    this.zodiacSign = const Value.absent(),
    this.hasDriversLicense = const Value.absent(),
    this.transportMode = const Value.absent(),
    this.drivingMode = const Value.absent(),
    this.hasFertilityIssues = const Value.absent(),
    this.onBirthControl = const Value.absent(),
    this.isSterile = const Value.absent(),
    this.sickly = const Value.absent(),
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
    required String emotionalState,
    required String zodiacSign,
    required bool hasDriversLicense,
    required String transportMode,
    required String drivingMode,
    required bool hasFertilityIssues,
    required bool onBirthControl,
    required bool isSterile,
    required bool sickly,
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
        emotionalState = Value(emotionalState),
        zodiacSign = Value(zodiacSign),
        hasDriversLicense = Value(hasDriversLicense),
        transportMode = Value(transportMode),
        drivingMode = Value(drivingMode),
        hasFertilityIssues = Value(hasFertilityIssues),
        onBirthControl = Value(onBirthControl),
        isSterile = Value(isSterile),
        sickly = Value(sickly),
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
    Expression<String>? emotionalState,
    Expression<String>? zodiacSign,
    Expression<bool>? hasDriversLicense,
    Expression<String>? transportMode,
    Expression<String>? drivingMode,
    Expression<bool>? hasFertilityIssues,
    Expression<bool>? onBirthControl,
    Expression<bool>? isSterile,
    Expression<bool>? sickly,
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
      if (emotionalState != null) 'emotional_state': emotionalState,
      if (zodiacSign != null) 'zodiac_sign': zodiacSign,
      if (hasDriversLicense != null) 'has_drivers_license': hasDriversLicense,
      if (transportMode != null) 'transport_mode': transportMode,
      if (drivingMode != null) 'driving_mode': drivingMode,
      if (hasFertilityIssues != null)
        'has_fertility_issues': hasFertilityIssues,
      if (onBirthControl != null) 'on_birth_control': onBirthControl,
      if (isSterile != null) 'is_sterile': isSterile,
      if (sickly != null) 'sickly': sickly,
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
      Value<String>? emotionalState,
      Value<String>? zodiacSign,
      Value<bool>? hasDriversLicense,
      Value<String>? transportMode,
      Value<String>? drivingMode,
      Value<bool>? hasFertilityIssues,
      Value<bool>? onBirthControl,
      Value<bool>? isSterile,
      Value<bool>? sickly,
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
      emotionalState: emotionalState ?? this.emotionalState,
      zodiacSign: zodiacSign ?? this.zodiacSign,
      hasDriversLicense: hasDriversLicense ?? this.hasDriversLicense,
      transportMode: transportMode ?? this.transportMode,
      drivingMode: drivingMode ?? this.drivingMode,
      hasFertilityIssues: hasFertilityIssues ?? this.hasFertilityIssues,
      onBirthControl: onBirthControl ?? this.onBirthControl,
      isSterile: isSterile ?? this.isSterile,
      sickly: sickly ?? this.sickly,
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
    if (emotionalState.present) {
      map['emotional_state'] = Variable<String>(emotionalState.value);
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
    if (drivingMode.present) {
      map['driving_mode'] = Variable<String>(drivingMode.value);
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
          ..write('emotionalState: $emotionalState, ')
          ..write('zodiacSign: $zodiacSign, ')
          ..write('hasDriversLicense: $hasDriversLicense, ')
          ..write('transportMode: $transportMode, ')
          ..write('drivingMode: $drivingMode, ')
          ..write('hasFertilityIssues: $hasFertilityIssues, ')
          ..write('onBirthControl: $onBirthControl, ')
          ..write('isSterile: $isSterile, ')
          ..write('sickly: $sickly, ')
          ..write('dead: $dead')
          ..write(')'))
        .toString();
  }
}

class $AppearanceTableTable extends AppearanceTable
    with TableInfo<$AppearanceTableTable, Appearance> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppearanceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _personIdMeta =
      const VerificationMeta('personId');
  @override
  late final GeneratedColumn<int> personId = GeneratedColumn<int>(
      'person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'UNIQUE REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _skinColorMeta =
      const VerificationMeta('skinColor');
  @override
  late final GeneratedColumn<String> skinColor = GeneratedColumn<String>(
      'skin_color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _eyeColorMeta =
      const VerificationMeta('eyeColor');
  @override
  late final GeneratedColumn<String> eyeColor = GeneratedColumn<String>(
      'eye_color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hairstyleMeta =
      const VerificationMeta('hairstyle');
  @override
  late final GeneratedColumn<String> hairstyle = GeneratedColumn<String>(
      'hairstyle', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _naturalHairColorMeta =
      const VerificationMeta('naturalHairColor');
  @override
  late final GeneratedColumn<String> naturalHairColor = GeneratedColumn<String>(
      'natural_hair_color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dyeHairColorMeta =
      const VerificationMeta('dyeHairColor');
  @override
  late final GeneratedColumn<String> dyeHairColor = GeneratedColumn<String>(
      'dye_hair_color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currentHeightInInchesMeta =
      const VerificationMeta('currentHeightInInches');
  @override
  late final GeneratedColumn<int> currentHeightInInches = GeneratedColumn<int>(
      'current_height_in_inches', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _maxHeightInInchesMeta =
      const VerificationMeta('maxHeightInInches');
  @override
  late final GeneratedColumn<int> maxHeightInInches = GeneratedColumn<int>(
      'max_height_in_inches', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _hasBeardsMeta =
      const VerificationMeta('hasBeards');
  @override
  late final GeneratedColumn<bool> hasBeards = GeneratedColumn<bool>(
      'has_beards', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("has_beards" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        personId,
        skinColor,
        eyeColor,
        hairstyle,
        naturalHairColor,
        dyeHairColor,
        currentHeightInInches,
        maxHeightInInches,
        hasBeards
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'appearance';
  @override
  VerificationContext validateIntegrity(Insertable<Appearance> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('person_id')) {
      context.handle(_personIdMeta,
          personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta));
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('skin_color')) {
      context.handle(_skinColorMeta,
          skinColor.isAcceptableOrUnknown(data['skin_color']!, _skinColorMeta));
    } else if (isInserting) {
      context.missing(_skinColorMeta);
    }
    if (data.containsKey('eye_color')) {
      context.handle(_eyeColorMeta,
          eyeColor.isAcceptableOrUnknown(data['eye_color']!, _eyeColorMeta));
    } else if (isInserting) {
      context.missing(_eyeColorMeta);
    }
    if (data.containsKey('hairstyle')) {
      context.handle(_hairstyleMeta,
          hairstyle.isAcceptableOrUnknown(data['hairstyle']!, _hairstyleMeta));
    } else if (isInserting) {
      context.missing(_hairstyleMeta);
    }
    if (data.containsKey('natural_hair_color')) {
      context.handle(
          _naturalHairColorMeta,
          naturalHairColor.isAcceptableOrUnknown(
              data['natural_hair_color']!, _naturalHairColorMeta));
    } else if (isInserting) {
      context.missing(_naturalHairColorMeta);
    }
    if (data.containsKey('dye_hair_color')) {
      context.handle(
          _dyeHairColorMeta,
          dyeHairColor.isAcceptableOrUnknown(
              data['dye_hair_color']!, _dyeHairColorMeta));
    } else if (isInserting) {
      context.missing(_dyeHairColorMeta);
    }
    if (data.containsKey('current_height_in_inches')) {
      context.handle(
          _currentHeightInInchesMeta,
          currentHeightInInches.isAcceptableOrUnknown(
              data['current_height_in_inches']!, _currentHeightInInchesMeta));
    } else if (isInserting) {
      context.missing(_currentHeightInInchesMeta);
    }
    if (data.containsKey('max_height_in_inches')) {
      context.handle(
          _maxHeightInInchesMeta,
          maxHeightInInches.isAcceptableOrUnknown(
              data['max_height_in_inches']!, _maxHeightInInchesMeta));
    } else if (isInserting) {
      context.missing(_maxHeightInInchesMeta);
    }
    if (data.containsKey('has_beards')) {
      context.handle(_hasBeardsMeta,
          hasBeards.isAcceptableOrUnknown(data['has_beards']!, _hasBeardsMeta));
    } else if (isInserting) {
      context.missing(_hasBeardsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Appearance map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Appearance(
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id'])!,
      skinColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}skin_color'])!,
      eyeColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}eye_color'])!,
      hairstyle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hairstyle'])!,
      naturalHairColor: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}natural_hair_color'])!,
      dyeHairColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dye_hair_color'])!,
      currentHeightInInches: attachedDatabase.typeMapping.read(DriftSqlType.int,
          data['${effectivePrefix}current_height_in_inches'])!,
      maxHeightInInches: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}max_height_in_inches'])!,
      hasBeards: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_beards'])!,
    );
  }

  @override
  $AppearanceTableTable createAlias(String alias) {
    return $AppearanceTableTable(attachedDatabase, alias);
  }
}

class Appearance extends DataClass implements Insertable<Appearance> {
  final int personId;
  final String skinColor;
  final String eyeColor;
  final String hairstyle;
  final String naturalHairColor;
  final String dyeHairColor;
  final int currentHeightInInches;
  final int maxHeightInInches;
  final bool hasBeards;
  const Appearance(
      {required this.personId,
      required this.skinColor,
      required this.eyeColor,
      required this.hairstyle,
      required this.naturalHairColor,
      required this.dyeHairColor,
      required this.currentHeightInInches,
      required this.maxHeightInInches,
      required this.hasBeards});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['person_id'] = Variable<int>(personId);
    map['skin_color'] = Variable<String>(skinColor);
    map['eye_color'] = Variable<String>(eyeColor);
    map['hairstyle'] = Variable<String>(hairstyle);
    map['natural_hair_color'] = Variable<String>(naturalHairColor);
    map['dye_hair_color'] = Variable<String>(dyeHairColor);
    map['current_height_in_inches'] = Variable<int>(currentHeightInInches);
    map['max_height_in_inches'] = Variable<int>(maxHeightInInches);
    map['has_beards'] = Variable<bool>(hasBeards);
    return map;
  }

  AppearanceTableCompanion toCompanion(bool nullToAbsent) {
    return AppearanceTableCompanion(
      personId: Value(personId),
      skinColor: Value(skinColor),
      eyeColor: Value(eyeColor),
      hairstyle: Value(hairstyle),
      naturalHairColor: Value(naturalHairColor),
      dyeHairColor: Value(dyeHairColor),
      currentHeightInInches: Value(currentHeightInInches),
      maxHeightInInches: Value(maxHeightInInches),
      hasBeards: Value(hasBeards),
    );
  }

  factory Appearance.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Appearance(
      personId: serializer.fromJson<int>(json['personId']),
      skinColor: serializer.fromJson<String>(json['skinColor']),
      eyeColor: serializer.fromJson<String>(json['eyeColor']),
      hairstyle: serializer.fromJson<String>(json['hairstyle']),
      naturalHairColor: serializer.fromJson<String>(json['naturalHairColor']),
      dyeHairColor: serializer.fromJson<String>(json['dyeHairColor']),
      currentHeightInInches:
          serializer.fromJson<int>(json['currentHeightInInches']),
      maxHeightInInches: serializer.fromJson<int>(json['maxHeightInInches']),
      hasBeards: serializer.fromJson<bool>(json['hasBeards']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'personId': serializer.toJson<int>(personId),
      'skinColor': serializer.toJson<String>(skinColor),
      'eyeColor': serializer.toJson<String>(eyeColor),
      'hairstyle': serializer.toJson<String>(hairstyle),
      'naturalHairColor': serializer.toJson<String>(naturalHairColor),
      'dyeHairColor': serializer.toJson<String>(dyeHairColor),
      'currentHeightInInches': serializer.toJson<int>(currentHeightInInches),
      'maxHeightInInches': serializer.toJson<int>(maxHeightInInches),
      'hasBeards': serializer.toJson<bool>(hasBeards),
    };
  }

  Appearance copyWith(
          {int? personId,
          String? skinColor,
          String? eyeColor,
          String? hairstyle,
          String? naturalHairColor,
          String? dyeHairColor,
          int? currentHeightInInches,
          int? maxHeightInInches,
          bool? hasBeards}) =>
      Appearance(
        personId: personId ?? this.personId,
        skinColor: skinColor ?? this.skinColor,
        eyeColor: eyeColor ?? this.eyeColor,
        hairstyle: hairstyle ?? this.hairstyle,
        naturalHairColor: naturalHairColor ?? this.naturalHairColor,
        dyeHairColor: dyeHairColor ?? this.dyeHairColor,
        currentHeightInInches:
            currentHeightInInches ?? this.currentHeightInInches,
        maxHeightInInches: maxHeightInInches ?? this.maxHeightInInches,
        hasBeards: hasBeards ?? this.hasBeards,
      );
  @override
  String toString() {
    return (StringBuffer('Appearance(')
          ..write('personId: $personId, ')
          ..write('skinColor: $skinColor, ')
          ..write('eyeColor: $eyeColor, ')
          ..write('hairstyle: $hairstyle, ')
          ..write('naturalHairColor: $naturalHairColor, ')
          ..write('dyeHairColor: $dyeHairColor, ')
          ..write('currentHeightInInches: $currentHeightInInches, ')
          ..write('maxHeightInInches: $maxHeightInInches, ')
          ..write('hasBeards: $hasBeards')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      personId,
      skinColor,
      eyeColor,
      hairstyle,
      naturalHairColor,
      dyeHairColor,
      currentHeightInInches,
      maxHeightInInches,
      hasBeards);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Appearance &&
          other.personId == this.personId &&
          other.skinColor == this.skinColor &&
          other.eyeColor == this.eyeColor &&
          other.hairstyle == this.hairstyle &&
          other.naturalHairColor == this.naturalHairColor &&
          other.dyeHairColor == this.dyeHairColor &&
          other.currentHeightInInches == this.currentHeightInInches &&
          other.maxHeightInInches == this.maxHeightInInches &&
          other.hasBeards == this.hasBeards);
}

class AppearanceTableCompanion extends UpdateCompanion<Appearance> {
  final Value<int> personId;
  final Value<String> skinColor;
  final Value<String> eyeColor;
  final Value<String> hairstyle;
  final Value<String> naturalHairColor;
  final Value<String> dyeHairColor;
  final Value<int> currentHeightInInches;
  final Value<int> maxHeightInInches;
  final Value<bool> hasBeards;
  final Value<int> rowid;
  const AppearanceTableCompanion({
    this.personId = const Value.absent(),
    this.skinColor = const Value.absent(),
    this.eyeColor = const Value.absent(),
    this.hairstyle = const Value.absent(),
    this.naturalHairColor = const Value.absent(),
    this.dyeHairColor = const Value.absent(),
    this.currentHeightInInches = const Value.absent(),
    this.maxHeightInInches = const Value.absent(),
    this.hasBeards = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppearanceTableCompanion.insert({
    required int personId,
    required String skinColor,
    required String eyeColor,
    required String hairstyle,
    required String naturalHairColor,
    required String dyeHairColor,
    required int currentHeightInInches,
    required int maxHeightInInches,
    required bool hasBeards,
    this.rowid = const Value.absent(),
  })  : personId = Value(personId),
        skinColor = Value(skinColor),
        eyeColor = Value(eyeColor),
        hairstyle = Value(hairstyle),
        naturalHairColor = Value(naturalHairColor),
        dyeHairColor = Value(dyeHairColor),
        currentHeightInInches = Value(currentHeightInInches),
        maxHeightInInches = Value(maxHeightInInches),
        hasBeards = Value(hasBeards);
  static Insertable<Appearance> custom({
    Expression<int>? personId,
    Expression<String>? skinColor,
    Expression<String>? eyeColor,
    Expression<String>? hairstyle,
    Expression<String>? naturalHairColor,
    Expression<String>? dyeHairColor,
    Expression<int>? currentHeightInInches,
    Expression<int>? maxHeightInInches,
    Expression<bool>? hasBeards,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (personId != null) 'person_id': personId,
      if (skinColor != null) 'skin_color': skinColor,
      if (eyeColor != null) 'eye_color': eyeColor,
      if (hairstyle != null) 'hairstyle': hairstyle,
      if (naturalHairColor != null) 'natural_hair_color': naturalHairColor,
      if (dyeHairColor != null) 'dye_hair_color': dyeHairColor,
      if (currentHeightInInches != null)
        'current_height_in_inches': currentHeightInInches,
      if (maxHeightInInches != null) 'max_height_in_inches': maxHeightInInches,
      if (hasBeards != null) 'has_beards': hasBeards,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppearanceTableCompanion copyWith(
      {Value<int>? personId,
      Value<String>? skinColor,
      Value<String>? eyeColor,
      Value<String>? hairstyle,
      Value<String>? naturalHairColor,
      Value<String>? dyeHairColor,
      Value<int>? currentHeightInInches,
      Value<int>? maxHeightInInches,
      Value<bool>? hasBeards,
      Value<int>? rowid}) {
    return AppearanceTableCompanion(
      personId: personId ?? this.personId,
      skinColor: skinColor ?? this.skinColor,
      eyeColor: eyeColor ?? this.eyeColor,
      hairstyle: hairstyle ?? this.hairstyle,
      naturalHairColor: naturalHairColor ?? this.naturalHairColor,
      dyeHairColor: dyeHairColor ?? this.dyeHairColor,
      currentHeightInInches:
          currentHeightInInches ?? this.currentHeightInInches,
      maxHeightInInches: maxHeightInInches ?? this.maxHeightInInches,
      hasBeards: hasBeards ?? this.hasBeards,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (personId.present) {
      map['person_id'] = Variable<int>(personId.value);
    }
    if (skinColor.present) {
      map['skin_color'] = Variable<String>(skinColor.value);
    }
    if (eyeColor.present) {
      map['eye_color'] = Variable<String>(eyeColor.value);
    }
    if (hairstyle.present) {
      map['hairstyle'] = Variable<String>(hairstyle.value);
    }
    if (naturalHairColor.present) {
      map['natural_hair_color'] = Variable<String>(naturalHairColor.value);
    }
    if (dyeHairColor.present) {
      map['dye_hair_color'] = Variable<String>(dyeHairColor.value);
    }
    if (currentHeightInInches.present) {
      map['current_height_in_inches'] =
          Variable<int>(currentHeightInInches.value);
    }
    if (maxHeightInInches.present) {
      map['max_height_in_inches'] = Variable<int>(maxHeightInInches.value);
    }
    if (hasBeards.present) {
      map['has_beards'] = Variable<bool>(hasBeards.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppearanceTableCompanion(')
          ..write('personId: $personId, ')
          ..write('skinColor: $skinColor, ')
          ..write('eyeColor: $eyeColor, ')
          ..write('hairstyle: $hairstyle, ')
          ..write('naturalHairColor: $naturalHairColor, ')
          ..write('dyeHairColor: $dyeHairColor, ')
          ..write('currentHeightInInches: $currentHeightInInches, ')
          ..write('maxHeightInInches: $maxHeightInInches, ')
          ..write('hasBeards: $hasBeards, ')
          ..write('rowid: $rowid')
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
  static const VerificationMeta _moodMeta = const VerificationMeta('mood');
  @override
  late final GeneratedColumn<int> mood = GeneratedColumn<int>(
      'mood', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _healthMeta = const VerificationMeta('health');
  @override
  late final GeneratedColumn<int> health = GeneratedColumn<int>(
      'health', aliasedName, false,
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
  static const VerificationMeta _alcoholToleranceMeta =
      const VerificationMeta('alcoholTolerance');
  @override
  late final GeneratedColumn<int> alcoholTolerance = GeneratedColumn<int>(
      'alcohol_tolerance', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        personId,
        energy,
        hunger,
        mood,
        health,
        sober,
        looks,
        athleticism,
        intellect,
        alcoholTolerance
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stats';
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
    if (data.containsKey('mood')) {
      context.handle(
          _moodMeta, mood.isAcceptableOrUnknown(data['mood']!, _moodMeta));
    } else if (isInserting) {
      context.missing(_moodMeta);
    }
    if (data.containsKey('health')) {
      context.handle(_healthMeta,
          health.isAcceptableOrUnknown(data['health']!, _healthMeta));
    } else if (isInserting) {
      context.missing(_healthMeta);
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
    if (data.containsKey('alcohol_tolerance')) {
      context.handle(
          _alcoholToleranceMeta,
          alcoholTolerance.isAcceptableOrUnknown(
              data['alcohol_tolerance']!, _alcoholToleranceMeta));
    } else if (isInserting) {
      context.missing(_alcoholToleranceMeta);
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
      mood: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mood'])!,
      health: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}health'])!,
      sober: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sober'])!,
      looks: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}looks'])!,
      athleticism: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}athleticism'])!,
      intellect: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}intellect'])!,
      alcoholTolerance: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}alcohol_tolerance'])!,
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
  final int mood;
  final int health;
  final int sober;
  final int looks;
  final int athleticism;
  final int intellect;
  final int alcoholTolerance;
  const Stats(
      {required this.id,
      required this.personId,
      required this.energy,
      required this.hunger,
      required this.mood,
      required this.health,
      required this.sober,
      required this.looks,
      required this.athleticism,
      required this.intellect,
      required this.alcoholTolerance});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['person_id'] = Variable<int>(personId);
    map['energy'] = Variable<int>(energy);
    map['hunger'] = Variable<int>(hunger);
    map['mood'] = Variable<int>(mood);
    map['health'] = Variable<int>(health);
    map['sober'] = Variable<int>(sober);
    map['looks'] = Variable<int>(looks);
    map['athleticism'] = Variable<int>(athleticism);
    map['intellect'] = Variable<int>(intellect);
    map['alcohol_tolerance'] = Variable<int>(alcoholTolerance);
    return map;
  }

  StatsTableCompanion toCompanion(bool nullToAbsent) {
    return StatsTableCompanion(
      id: Value(id),
      personId: Value(personId),
      energy: Value(energy),
      hunger: Value(hunger),
      mood: Value(mood),
      health: Value(health),
      sober: Value(sober),
      looks: Value(looks),
      athleticism: Value(athleticism),
      intellect: Value(intellect),
      alcoholTolerance: Value(alcoholTolerance),
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
      mood: serializer.fromJson<int>(json['mood']),
      health: serializer.fromJson<int>(json['health']),
      sober: serializer.fromJson<int>(json['sober']),
      looks: serializer.fromJson<int>(json['looks']),
      athleticism: serializer.fromJson<int>(json['athleticism']),
      intellect: serializer.fromJson<int>(json['intellect']),
      alcoholTolerance: serializer.fromJson<int>(json['alcoholTolerance']),
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
      'mood': serializer.toJson<int>(mood),
      'health': serializer.toJson<int>(health),
      'sober': serializer.toJson<int>(sober),
      'looks': serializer.toJson<int>(looks),
      'athleticism': serializer.toJson<int>(athleticism),
      'intellect': serializer.toJson<int>(intellect),
      'alcoholTolerance': serializer.toJson<int>(alcoholTolerance),
    };
  }

  Stats copyWith(
          {int? id,
          int? personId,
          int? energy,
          int? hunger,
          int? mood,
          int? health,
          int? sober,
          int? looks,
          int? athleticism,
          int? intellect,
          int? alcoholTolerance}) =>
      Stats(
        id: id ?? this.id,
        personId: personId ?? this.personId,
        energy: energy ?? this.energy,
        hunger: hunger ?? this.hunger,
        mood: mood ?? this.mood,
        health: health ?? this.health,
        sober: sober ?? this.sober,
        looks: looks ?? this.looks,
        athleticism: athleticism ?? this.athleticism,
        intellect: intellect ?? this.intellect,
        alcoholTolerance: alcoholTolerance ?? this.alcoholTolerance,
      );
  @override
  String toString() {
    return (StringBuffer('Stats(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('energy: $energy, ')
          ..write('hunger: $hunger, ')
          ..write('mood: $mood, ')
          ..write('health: $health, ')
          ..write('sober: $sober, ')
          ..write('looks: $looks, ')
          ..write('athleticism: $athleticism, ')
          ..write('intellect: $intellect, ')
          ..write('alcoholTolerance: $alcoholTolerance')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, personId, energy, hunger, mood, health,
      sober, looks, athleticism, intellect, alcoholTolerance);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Stats &&
          other.id == this.id &&
          other.personId == this.personId &&
          other.energy == this.energy &&
          other.hunger == this.hunger &&
          other.mood == this.mood &&
          other.health == this.health &&
          other.sober == this.sober &&
          other.looks == this.looks &&
          other.athleticism == this.athleticism &&
          other.intellect == this.intellect &&
          other.alcoholTolerance == this.alcoholTolerance);
}

class StatsTableCompanion extends UpdateCompanion<Stats> {
  final Value<int> id;
  final Value<int> personId;
  final Value<int> energy;
  final Value<int> hunger;
  final Value<int> mood;
  final Value<int> health;
  final Value<int> sober;
  final Value<int> looks;
  final Value<int> athleticism;
  final Value<int> intellect;
  final Value<int> alcoholTolerance;
  const StatsTableCompanion({
    this.id = const Value.absent(),
    this.personId = const Value.absent(),
    this.energy = const Value.absent(),
    this.hunger = const Value.absent(),
    this.mood = const Value.absent(),
    this.health = const Value.absent(),
    this.sober = const Value.absent(),
    this.looks = const Value.absent(),
    this.athleticism = const Value.absent(),
    this.intellect = const Value.absent(),
    this.alcoholTolerance = const Value.absent(),
  });
  StatsTableCompanion.insert({
    this.id = const Value.absent(),
    required int personId,
    required int energy,
    required int hunger,
    required int mood,
    required int health,
    required int sober,
    required int looks,
    required int athleticism,
    required int intellect,
    required int alcoholTolerance,
  })  : personId = Value(personId),
        energy = Value(energy),
        hunger = Value(hunger),
        mood = Value(mood),
        health = Value(health),
        sober = Value(sober),
        looks = Value(looks),
        athleticism = Value(athleticism),
        intellect = Value(intellect),
        alcoholTolerance = Value(alcoholTolerance);
  static Insertable<Stats> custom({
    Expression<int>? id,
    Expression<int>? personId,
    Expression<int>? energy,
    Expression<int>? hunger,
    Expression<int>? mood,
    Expression<int>? health,
    Expression<int>? sober,
    Expression<int>? looks,
    Expression<int>? athleticism,
    Expression<int>? intellect,
    Expression<int>? alcoholTolerance,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (personId != null) 'person_id': personId,
      if (energy != null) 'energy': energy,
      if (hunger != null) 'hunger': hunger,
      if (mood != null) 'mood': mood,
      if (health != null) 'health': health,
      if (sober != null) 'sober': sober,
      if (looks != null) 'looks': looks,
      if (athleticism != null) 'athleticism': athleticism,
      if (intellect != null) 'intellect': intellect,
      if (alcoholTolerance != null) 'alcohol_tolerance': alcoholTolerance,
    });
  }

  StatsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? personId,
      Value<int>? energy,
      Value<int>? hunger,
      Value<int>? mood,
      Value<int>? health,
      Value<int>? sober,
      Value<int>? looks,
      Value<int>? athleticism,
      Value<int>? intellect,
      Value<int>? alcoholTolerance}) {
    return StatsTableCompanion(
      id: id ?? this.id,
      personId: personId ?? this.personId,
      energy: energy ?? this.energy,
      hunger: hunger ?? this.hunger,
      mood: mood ?? this.mood,
      health: health ?? this.health,
      sober: sober ?? this.sober,
      looks: looks ?? this.looks,
      athleticism: athleticism ?? this.athleticism,
      intellect: intellect ?? this.intellect,
      alcoholTolerance: alcoholTolerance ?? this.alcoholTolerance,
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
    if (mood.present) {
      map['mood'] = Variable<int>(mood.value);
    }
    if (health.present) {
      map['health'] = Variable<int>(health.value);
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
    if (alcoholTolerance.present) {
      map['alcohol_tolerance'] = Variable<int>(alcoholTolerance.value);
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
          ..write('mood: $mood, ')
          ..write('health: $health, ')
          ..write('sober: $sober, ')
          ..write('looks: $looks, ')
          ..write('athleticism: $athleticism, ')
          ..write('intellect: $intellect, ')
          ..write('alcoholTolerance: $alcoholTolerance')
          ..write(')'))
        .toString();
  }
}

class $DepleteStatsFlagTableTable extends DepleteStatsFlagTable
    with TableInfo<$DepleteStatsFlagTableTable, DepleteStatsFlag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DepleteStatsFlagTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _personIdMeta =
      const VerificationMeta('personId');
  @override
  late final GeneratedColumn<int> personId = GeneratedColumn<int>(
      'person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'UNIQUE REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _energyMeta = const VerificationMeta('energy');
  @override
  late final GeneratedColumn<bool> energy = GeneratedColumn<bool>(
      'energy', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("energy" IN (0, 1))'));
  static const VerificationMeta _hungerMeta = const VerificationMeta('hunger');
  @override
  late final GeneratedColumn<bool> hunger = GeneratedColumn<bool>(
      'hunger', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("hunger" IN (0, 1))'));
  static const VerificationMeta _moodMeta = const VerificationMeta('mood');
  @override
  late final GeneratedColumn<bool> mood = GeneratedColumn<bool>(
      'mood', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("mood" IN (0, 1))'));
  static const VerificationMeta _healthMeta = const VerificationMeta('health');
  @override
  late final GeneratedColumn<bool> health = GeneratedColumn<bool>(
      'health', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("health" IN (0, 1))'));
  static const VerificationMeta _athleticismMeta =
      const VerificationMeta('athleticism');
  @override
  late final GeneratedColumn<bool> athleticism = GeneratedColumn<bool>(
      'athleticism', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("athleticism" IN (0, 1))'));
  static const VerificationMeta _soberMeta = const VerificationMeta('sober');
  @override
  late final GeneratedColumn<bool> sober = GeneratedColumn<bool>(
      'sober', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("sober" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [personId, energy, hunger, mood, health, athleticism, sober];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'deplete_stats_flag';
  @override
  VerificationContext validateIntegrity(Insertable<DepleteStatsFlag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
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
    if (data.containsKey('mood')) {
      context.handle(
          _moodMeta, mood.isAcceptableOrUnknown(data['mood']!, _moodMeta));
    } else if (isInserting) {
      context.missing(_moodMeta);
    }
    if (data.containsKey('health')) {
      context.handle(_healthMeta,
          health.isAcceptableOrUnknown(data['health']!, _healthMeta));
    } else if (isInserting) {
      context.missing(_healthMeta);
    }
    if (data.containsKey('athleticism')) {
      context.handle(
          _athleticismMeta,
          athleticism.isAcceptableOrUnknown(
              data['athleticism']!, _athleticismMeta));
    } else if (isInserting) {
      context.missing(_athleticismMeta);
    }
    if (data.containsKey('sober')) {
      context.handle(
          _soberMeta, sober.isAcceptableOrUnknown(data['sober']!, _soberMeta));
    } else if (isInserting) {
      context.missing(_soberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DepleteStatsFlag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DepleteStatsFlag(
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id'])!,
      energy: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}energy'])!,
      hunger: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}hunger'])!,
      mood: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}mood'])!,
      health: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}health'])!,
      athleticism: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}athleticism'])!,
      sober: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sober'])!,
    );
  }

  @override
  $DepleteStatsFlagTableTable createAlias(String alias) {
    return $DepleteStatsFlagTableTable(attachedDatabase, alias);
  }
}

class DepleteStatsFlag extends DataClass
    implements Insertable<DepleteStatsFlag> {
  final int personId;
  final bool energy;
  final bool hunger;
  final bool mood;
  final bool health;
  final bool athleticism;
  final bool sober;
  const DepleteStatsFlag(
      {required this.personId,
      required this.energy,
      required this.hunger,
      required this.mood,
      required this.health,
      required this.athleticism,
      required this.sober});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['person_id'] = Variable<int>(personId);
    map['energy'] = Variable<bool>(energy);
    map['hunger'] = Variable<bool>(hunger);
    map['mood'] = Variable<bool>(mood);
    map['health'] = Variable<bool>(health);
    map['athleticism'] = Variable<bool>(athleticism);
    map['sober'] = Variable<bool>(sober);
    return map;
  }

  DepleteStatsFlagTableCompanion toCompanion(bool nullToAbsent) {
    return DepleteStatsFlagTableCompanion(
      personId: Value(personId),
      energy: Value(energy),
      hunger: Value(hunger),
      mood: Value(mood),
      health: Value(health),
      athleticism: Value(athleticism),
      sober: Value(sober),
    );
  }

  factory DepleteStatsFlag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DepleteStatsFlag(
      personId: serializer.fromJson<int>(json['personId']),
      energy: serializer.fromJson<bool>(json['energy']),
      hunger: serializer.fromJson<bool>(json['hunger']),
      mood: serializer.fromJson<bool>(json['mood']),
      health: serializer.fromJson<bool>(json['health']),
      athleticism: serializer.fromJson<bool>(json['athleticism']),
      sober: serializer.fromJson<bool>(json['sober']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'personId': serializer.toJson<int>(personId),
      'energy': serializer.toJson<bool>(energy),
      'hunger': serializer.toJson<bool>(hunger),
      'mood': serializer.toJson<bool>(mood),
      'health': serializer.toJson<bool>(health),
      'athleticism': serializer.toJson<bool>(athleticism),
      'sober': serializer.toJson<bool>(sober),
    };
  }

  DepleteStatsFlag copyWith(
          {int? personId,
          bool? energy,
          bool? hunger,
          bool? mood,
          bool? health,
          bool? athleticism,
          bool? sober}) =>
      DepleteStatsFlag(
        personId: personId ?? this.personId,
        energy: energy ?? this.energy,
        hunger: hunger ?? this.hunger,
        mood: mood ?? this.mood,
        health: health ?? this.health,
        athleticism: athleticism ?? this.athleticism,
        sober: sober ?? this.sober,
      );
  @override
  String toString() {
    return (StringBuffer('DepleteStatsFlag(')
          ..write('personId: $personId, ')
          ..write('energy: $energy, ')
          ..write('hunger: $hunger, ')
          ..write('mood: $mood, ')
          ..write('health: $health, ')
          ..write('athleticism: $athleticism, ')
          ..write('sober: $sober')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(personId, energy, hunger, mood, health, athleticism, sober);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DepleteStatsFlag &&
          other.personId == this.personId &&
          other.energy == this.energy &&
          other.hunger == this.hunger &&
          other.mood == this.mood &&
          other.health == this.health &&
          other.athleticism == this.athleticism &&
          other.sober == this.sober);
}

class DepleteStatsFlagTableCompanion extends UpdateCompanion<DepleteStatsFlag> {
  final Value<int> personId;
  final Value<bool> energy;
  final Value<bool> hunger;
  final Value<bool> mood;
  final Value<bool> health;
  final Value<bool> athleticism;
  final Value<bool> sober;
  final Value<int> rowid;
  const DepleteStatsFlagTableCompanion({
    this.personId = const Value.absent(),
    this.energy = const Value.absent(),
    this.hunger = const Value.absent(),
    this.mood = const Value.absent(),
    this.health = const Value.absent(),
    this.athleticism = const Value.absent(),
    this.sober = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DepleteStatsFlagTableCompanion.insert({
    required int personId,
    required bool energy,
    required bool hunger,
    required bool mood,
    required bool health,
    required bool athleticism,
    required bool sober,
    this.rowid = const Value.absent(),
  })  : personId = Value(personId),
        energy = Value(energy),
        hunger = Value(hunger),
        mood = Value(mood),
        health = Value(health),
        athleticism = Value(athleticism),
        sober = Value(sober);
  static Insertable<DepleteStatsFlag> custom({
    Expression<int>? personId,
    Expression<bool>? energy,
    Expression<bool>? hunger,
    Expression<bool>? mood,
    Expression<bool>? health,
    Expression<bool>? athleticism,
    Expression<bool>? sober,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (personId != null) 'person_id': personId,
      if (energy != null) 'energy': energy,
      if (hunger != null) 'hunger': hunger,
      if (mood != null) 'mood': mood,
      if (health != null) 'health': health,
      if (athleticism != null) 'athleticism': athleticism,
      if (sober != null) 'sober': sober,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DepleteStatsFlagTableCompanion copyWith(
      {Value<int>? personId,
      Value<bool>? energy,
      Value<bool>? hunger,
      Value<bool>? mood,
      Value<bool>? health,
      Value<bool>? athleticism,
      Value<bool>? sober,
      Value<int>? rowid}) {
    return DepleteStatsFlagTableCompanion(
      personId: personId ?? this.personId,
      energy: energy ?? this.energy,
      hunger: hunger ?? this.hunger,
      mood: mood ?? this.mood,
      health: health ?? this.health,
      athleticism: athleticism ?? this.athleticism,
      sober: sober ?? this.sober,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (personId.present) {
      map['person_id'] = Variable<int>(personId.value);
    }
    if (energy.present) {
      map['energy'] = Variable<bool>(energy.value);
    }
    if (hunger.present) {
      map['hunger'] = Variable<bool>(hunger.value);
    }
    if (mood.present) {
      map['mood'] = Variable<bool>(mood.value);
    }
    if (health.present) {
      map['health'] = Variable<bool>(health.value);
    }
    if (athleticism.present) {
      map['athleticism'] = Variable<bool>(athleticism.value);
    }
    if (sober.present) {
      map['sober'] = Variable<bool>(sober.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DepleteStatsFlagTableCompanion(')
          ..write('personId: $personId, ')
          ..write('energy: $energy, ')
          ..write('hunger: $hunger, ')
          ..write('mood: $mood, ')
          ..write('health: $health, ')
          ..write('athleticism: $athleticism, ')
          ..write('sober: $sober, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PersonalityTableTable extends PersonalityTable
    with TableInfo<$PersonalityTableTable, Personality> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonalityTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _personIdMeta =
      const VerificationMeta('personId');
  @override
  late final GeneratedColumn<int> personId = GeneratedColumn<int>(
      'person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'UNIQUE REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _forgivingMeta =
      const VerificationMeta('forgiving');
  @override
  late final GeneratedColumn<int> forgiving = GeneratedColumn<int>(
      'forgiving', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _responsibleMeta =
      const VerificationMeta('responsible');
  @override
  late final GeneratedColumn<int> responsible = GeneratedColumn<int>(
      'responsible', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _generousMeta =
      const VerificationMeta('generous');
  @override
  late final GeneratedColumn<int> generous = GeneratedColumn<int>(
      'generous', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _libidoMeta = const VerificationMeta('libido');
  @override
  late final GeneratedColumn<int> libido = GeneratedColumn<int>(
      'libido', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _politeMeta = const VerificationMeta('polite');
  @override
  late final GeneratedColumn<int> polite = GeneratedColumn<int>(
      'polite', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _confrontationalMeta =
      const VerificationMeta('confrontational');
  @override
  late final GeneratedColumn<int> confrontational = GeneratedColumn<int>(
      'confrontational', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _rebelliousMeta =
      const VerificationMeta('rebellious');
  @override
  late final GeneratedColumn<int> rebellious = GeneratedColumn<int>(
      'rebellious', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _impulsiveMeta =
      const VerificationMeta('impulsive');
  @override
  late final GeneratedColumn<int> impulsive = GeneratedColumn<int>(
      'impulsive', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _loyalMeta = const VerificationMeta('loyal');
  @override
  late final GeneratedColumn<int> loyal = GeneratedColumn<int>(
      'loyal', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _violentMeta =
      const VerificationMeta('violent');
  @override
  late final GeneratedColumn<int> violent = GeneratedColumn<int>(
      'violent', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        personId,
        forgiving,
        responsible,
        generous,
        libido,
        polite,
        confrontational,
        rebellious,
        impulsive,
        loyal,
        violent
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'personality';
  @override
  VerificationContext validateIntegrity(Insertable<Personality> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('person_id')) {
      context.handle(_personIdMeta,
          personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta));
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('forgiving')) {
      context.handle(_forgivingMeta,
          forgiving.isAcceptableOrUnknown(data['forgiving']!, _forgivingMeta));
    } else if (isInserting) {
      context.missing(_forgivingMeta);
    }
    if (data.containsKey('responsible')) {
      context.handle(
          _responsibleMeta,
          responsible.isAcceptableOrUnknown(
              data['responsible']!, _responsibleMeta));
    } else if (isInserting) {
      context.missing(_responsibleMeta);
    }
    if (data.containsKey('generous')) {
      context.handle(_generousMeta,
          generous.isAcceptableOrUnknown(data['generous']!, _generousMeta));
    } else if (isInserting) {
      context.missing(_generousMeta);
    }
    if (data.containsKey('libido')) {
      context.handle(_libidoMeta,
          libido.isAcceptableOrUnknown(data['libido']!, _libidoMeta));
    } else if (isInserting) {
      context.missing(_libidoMeta);
    }
    if (data.containsKey('polite')) {
      context.handle(_politeMeta,
          polite.isAcceptableOrUnknown(data['polite']!, _politeMeta));
    } else if (isInserting) {
      context.missing(_politeMeta);
    }
    if (data.containsKey('confrontational')) {
      context.handle(
          _confrontationalMeta,
          confrontational.isAcceptableOrUnknown(
              data['confrontational']!, _confrontationalMeta));
    } else if (isInserting) {
      context.missing(_confrontationalMeta);
    }
    if (data.containsKey('rebellious')) {
      context.handle(
          _rebelliousMeta,
          rebellious.isAcceptableOrUnknown(
              data['rebellious']!, _rebelliousMeta));
    } else if (isInserting) {
      context.missing(_rebelliousMeta);
    }
    if (data.containsKey('impulsive')) {
      context.handle(_impulsiveMeta,
          impulsive.isAcceptableOrUnknown(data['impulsive']!, _impulsiveMeta));
    } else if (isInserting) {
      context.missing(_impulsiveMeta);
    }
    if (data.containsKey('loyal')) {
      context.handle(
          _loyalMeta, loyal.isAcceptableOrUnknown(data['loyal']!, _loyalMeta));
    } else if (isInserting) {
      context.missing(_loyalMeta);
    }
    if (data.containsKey('violent')) {
      context.handle(_violentMeta,
          violent.isAcceptableOrUnknown(data['violent']!, _violentMeta));
    } else if (isInserting) {
      context.missing(_violentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Personality map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Personality(
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id'])!,
      forgiving: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}forgiving'])!,
      responsible: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}responsible'])!,
      generous: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}generous'])!,
      libido: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}libido'])!,
      polite: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}polite'])!,
      confrontational: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}confrontational'])!,
      rebellious: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rebellious'])!,
      impulsive: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}impulsive'])!,
      loyal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}loyal'])!,
      violent: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}violent'])!,
    );
  }

  @override
  $PersonalityTableTable createAlias(String alias) {
    return $PersonalityTableTable(attachedDatabase, alias);
  }
}

class Personality extends DataClass implements Insertable<Personality> {
  final int personId;
  final int forgiving;
  final int responsible;
  final int generous;
  final int libido;
  final int polite;
  final int confrontational;
  final int rebellious;
  final int impulsive;
  final int loyal;
  final int violent;
  const Personality(
      {required this.personId,
      required this.forgiving,
      required this.responsible,
      required this.generous,
      required this.libido,
      required this.polite,
      required this.confrontational,
      required this.rebellious,
      required this.impulsive,
      required this.loyal,
      required this.violent});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['person_id'] = Variable<int>(personId);
    map['forgiving'] = Variable<int>(forgiving);
    map['responsible'] = Variable<int>(responsible);
    map['generous'] = Variable<int>(generous);
    map['libido'] = Variable<int>(libido);
    map['polite'] = Variable<int>(polite);
    map['confrontational'] = Variable<int>(confrontational);
    map['rebellious'] = Variable<int>(rebellious);
    map['impulsive'] = Variable<int>(impulsive);
    map['loyal'] = Variable<int>(loyal);
    map['violent'] = Variable<int>(violent);
    return map;
  }

  PersonalityTableCompanion toCompanion(bool nullToAbsent) {
    return PersonalityTableCompanion(
      personId: Value(personId),
      forgiving: Value(forgiving),
      responsible: Value(responsible),
      generous: Value(generous),
      libido: Value(libido),
      polite: Value(polite),
      confrontational: Value(confrontational),
      rebellious: Value(rebellious),
      impulsive: Value(impulsive),
      loyal: Value(loyal),
      violent: Value(violent),
    );
  }

  factory Personality.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Personality(
      personId: serializer.fromJson<int>(json['personId']),
      forgiving: serializer.fromJson<int>(json['forgiving']),
      responsible: serializer.fromJson<int>(json['responsible']),
      generous: serializer.fromJson<int>(json['generous']),
      libido: serializer.fromJson<int>(json['libido']),
      polite: serializer.fromJson<int>(json['polite']),
      confrontational: serializer.fromJson<int>(json['confrontational']),
      rebellious: serializer.fromJson<int>(json['rebellious']),
      impulsive: serializer.fromJson<int>(json['impulsive']),
      loyal: serializer.fromJson<int>(json['loyal']),
      violent: serializer.fromJson<int>(json['violent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'personId': serializer.toJson<int>(personId),
      'forgiving': serializer.toJson<int>(forgiving),
      'responsible': serializer.toJson<int>(responsible),
      'generous': serializer.toJson<int>(generous),
      'libido': serializer.toJson<int>(libido),
      'polite': serializer.toJson<int>(polite),
      'confrontational': serializer.toJson<int>(confrontational),
      'rebellious': serializer.toJson<int>(rebellious),
      'impulsive': serializer.toJson<int>(impulsive),
      'loyal': serializer.toJson<int>(loyal),
      'violent': serializer.toJson<int>(violent),
    };
  }

  Personality copyWith(
          {int? personId,
          int? forgiving,
          int? responsible,
          int? generous,
          int? libido,
          int? polite,
          int? confrontational,
          int? rebellious,
          int? impulsive,
          int? loyal,
          int? violent}) =>
      Personality(
        personId: personId ?? this.personId,
        forgiving: forgiving ?? this.forgiving,
        responsible: responsible ?? this.responsible,
        generous: generous ?? this.generous,
        libido: libido ?? this.libido,
        polite: polite ?? this.polite,
        confrontational: confrontational ?? this.confrontational,
        rebellious: rebellious ?? this.rebellious,
        impulsive: impulsive ?? this.impulsive,
        loyal: loyal ?? this.loyal,
        violent: violent ?? this.violent,
      );
  @override
  String toString() {
    return (StringBuffer('Personality(')
          ..write('personId: $personId, ')
          ..write('forgiving: $forgiving, ')
          ..write('responsible: $responsible, ')
          ..write('generous: $generous, ')
          ..write('libido: $libido, ')
          ..write('polite: $polite, ')
          ..write('confrontational: $confrontational, ')
          ..write('rebellious: $rebellious, ')
          ..write('impulsive: $impulsive, ')
          ..write('loyal: $loyal, ')
          ..write('violent: $violent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(personId, forgiving, responsible, generous,
      libido, polite, confrontational, rebellious, impulsive, loyal, violent);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Personality &&
          other.personId == this.personId &&
          other.forgiving == this.forgiving &&
          other.responsible == this.responsible &&
          other.generous == this.generous &&
          other.libido == this.libido &&
          other.polite == this.polite &&
          other.confrontational == this.confrontational &&
          other.rebellious == this.rebellious &&
          other.impulsive == this.impulsive &&
          other.loyal == this.loyal &&
          other.violent == this.violent);
}

class PersonalityTableCompanion extends UpdateCompanion<Personality> {
  final Value<int> personId;
  final Value<int> forgiving;
  final Value<int> responsible;
  final Value<int> generous;
  final Value<int> libido;
  final Value<int> polite;
  final Value<int> confrontational;
  final Value<int> rebellious;
  final Value<int> impulsive;
  final Value<int> loyal;
  final Value<int> violent;
  final Value<int> rowid;
  const PersonalityTableCompanion({
    this.personId = const Value.absent(),
    this.forgiving = const Value.absent(),
    this.responsible = const Value.absent(),
    this.generous = const Value.absent(),
    this.libido = const Value.absent(),
    this.polite = const Value.absent(),
    this.confrontational = const Value.absent(),
    this.rebellious = const Value.absent(),
    this.impulsive = const Value.absent(),
    this.loyal = const Value.absent(),
    this.violent = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PersonalityTableCompanion.insert({
    required int personId,
    required int forgiving,
    required int responsible,
    required int generous,
    required int libido,
    required int polite,
    required int confrontational,
    required int rebellious,
    required int impulsive,
    required int loyal,
    required int violent,
    this.rowid = const Value.absent(),
  })  : personId = Value(personId),
        forgiving = Value(forgiving),
        responsible = Value(responsible),
        generous = Value(generous),
        libido = Value(libido),
        polite = Value(polite),
        confrontational = Value(confrontational),
        rebellious = Value(rebellious),
        impulsive = Value(impulsive),
        loyal = Value(loyal),
        violent = Value(violent);
  static Insertable<Personality> custom({
    Expression<int>? personId,
    Expression<int>? forgiving,
    Expression<int>? responsible,
    Expression<int>? generous,
    Expression<int>? libido,
    Expression<int>? polite,
    Expression<int>? confrontational,
    Expression<int>? rebellious,
    Expression<int>? impulsive,
    Expression<int>? loyal,
    Expression<int>? violent,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (personId != null) 'person_id': personId,
      if (forgiving != null) 'forgiving': forgiving,
      if (responsible != null) 'responsible': responsible,
      if (generous != null) 'generous': generous,
      if (libido != null) 'libido': libido,
      if (polite != null) 'polite': polite,
      if (confrontational != null) 'confrontational': confrontational,
      if (rebellious != null) 'rebellious': rebellious,
      if (impulsive != null) 'impulsive': impulsive,
      if (loyal != null) 'loyal': loyal,
      if (violent != null) 'violent': violent,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PersonalityTableCompanion copyWith(
      {Value<int>? personId,
      Value<int>? forgiving,
      Value<int>? responsible,
      Value<int>? generous,
      Value<int>? libido,
      Value<int>? polite,
      Value<int>? confrontational,
      Value<int>? rebellious,
      Value<int>? impulsive,
      Value<int>? loyal,
      Value<int>? violent,
      Value<int>? rowid}) {
    return PersonalityTableCompanion(
      personId: personId ?? this.personId,
      forgiving: forgiving ?? this.forgiving,
      responsible: responsible ?? this.responsible,
      generous: generous ?? this.generous,
      libido: libido ?? this.libido,
      polite: polite ?? this.polite,
      confrontational: confrontational ?? this.confrontational,
      rebellious: rebellious ?? this.rebellious,
      impulsive: impulsive ?? this.impulsive,
      loyal: loyal ?? this.loyal,
      violent: violent ?? this.violent,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (personId.present) {
      map['person_id'] = Variable<int>(personId.value);
    }
    if (forgiving.present) {
      map['forgiving'] = Variable<int>(forgiving.value);
    }
    if (responsible.present) {
      map['responsible'] = Variable<int>(responsible.value);
    }
    if (generous.present) {
      map['generous'] = Variable<int>(generous.value);
    }
    if (libido.present) {
      map['libido'] = Variable<int>(libido.value);
    }
    if (polite.present) {
      map['polite'] = Variable<int>(polite.value);
    }
    if (confrontational.present) {
      map['confrontational'] = Variable<int>(confrontational.value);
    }
    if (rebellious.present) {
      map['rebellious'] = Variable<int>(rebellious.value);
    }
    if (impulsive.present) {
      map['impulsive'] = Variable<int>(impulsive.value);
    }
    if (loyal.present) {
      map['loyal'] = Variable<int>(loyal.value);
    }
    if (violent.present) {
      map['violent'] = Variable<int>(violent.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonalityTableCompanion(')
          ..write('personId: $personId, ')
          ..write('forgiving: $forgiving, ')
          ..write('responsible: $responsible, ')
          ..write('generous: $generous, ')
          ..write('libido: $libido, ')
          ..write('polite: $polite, ')
          ..write('confrontational: $confrontational, ')
          ..write('rebellious: $rebellious, ')
          ..write('impulsive: $impulsive, ')
          ..write('loyal: $loyal, ')
          ..write('violent: $violent, ')
          ..write('rowid: $rowid')
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
  late final GeneratedColumn<bool> openToAdoption = GeneratedColumn<bool>(
      'open_to_adoption', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("open_to_adoption" IN (0, 1))'));
  static const VerificationMeta _openToMarriageMeta =
      const VerificationMeta('openToMarriage');
  @override
  late final GeneratedColumn<bool> openToMarriage = GeneratedColumn<bool>(
      'open_to_marriage', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("open_to_marriage" IN (0, 1))'));
  static const VerificationMeta _openToSexWorkerPartnerMeta =
      const VerificationMeta('openToSexWorkerPartner');
  @override
  late final GeneratedColumn<bool> openToSexWorkerPartner =
      GeneratedColumn<bool>('open_to_sex_worker_partner', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("open_to_sex_worker_partner" IN (0, 1))'));
  static const VerificationMeta _openToAbortionMeta =
      const VerificationMeta('openToAbortion');
  @override
  late final GeneratedColumn<bool> openToAbortion = GeneratedColumn<bool>(
      'open_to_abortion', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("open_to_abortion" IN (0, 1))'));
  static const VerificationMeta _openToSurrogacyMeta =
      const VerificationMeta('openToSurrogacy');
  @override
  late final GeneratedColumn<bool> openToSurrogacy = GeneratedColumn<bool>(
      'open_to_surrogacy', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("open_to_surrogacy" IN (0, 1))'));
  static const VerificationMeta _openToAlternativeFertilityMethodsMeta =
      const VerificationMeta('openToAlternativeFertilityMethods');
  @override
  late final GeneratedColumn<bool> openToAlternativeFertilityMethods =
      GeneratedColumn<bool>(
          'open_to_alternative_fertility_methods', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("open_to_alternative_fertility_methods" IN (0, 1))'));
  static const VerificationMeta _openToSigningPrenupMeta =
      const VerificationMeta('openToSigningPrenup');
  @override
  late final GeneratedColumn<bool> openToSigningPrenup = GeneratedColumn<bool>(
      'open_to_signing_prenup', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("open_to_signing_prenup" IN (0, 1))'));
  static const VerificationMeta _wantsPartnerToSignPrenupMeta =
      const VerificationMeta('wantsPartnerToSignPrenup');
  @override
  late final GeneratedColumn<bool> wantsPartnerToSignPrenup =
      GeneratedColumn<bool>(
          'wants_partner_to_sign_prenup', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("wants_partner_to_sign_prenup" IN (0, 1))'));
  static const VerificationMeta _openToCrimesMeta =
      const VerificationMeta('openToCrimes');
  @override
  late final GeneratedColumn<bool> openToCrimes = GeneratedColumn<bool>(
      'open_to_crimes', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("open_to_crimes" IN (0, 1))'));
  static const VerificationMeta _openToStayAtHomeParentingMeta =
      const VerificationMeta('openToStayAtHomeParenting');
  @override
  late final GeneratedColumn<bool> openToStayAtHomeParenting =
      GeneratedColumn<bool>(
          'open_to_stay_at_home_parenting', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("open_to_stay_at_home_parenting" IN (0, 1))'));
  static const VerificationMeta _openToPremaritalSexMeta =
      const VerificationMeta('openToPremaritalSex');
  @override
  late final GeneratedColumn<bool> openToPremaritalSex = GeneratedColumn<bool>(
      'open_to_premarital_sex', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("open_to_premarital_sex" IN (0, 1))'));
  static const VerificationMeta _openToWorkingAJobMeta =
      const VerificationMeta('openToWorkingAJob');
  @override
  late final GeneratedColumn<bool> openToWorkingAJob = GeneratedColumn<bool>(
      'open_to_working_a_job', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("open_to_working_a_job" IN (0, 1))'));
  static const VerificationMeta _openToBeingPregnantMeta =
      const VerificationMeta('openToBeingPregnant');
  @override
  late final GeneratedColumn<bool> openToBeingPregnant = GeneratedColumn<bool>(
      'open_to_being_pregnant', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("open_to_being_pregnant" IN (0, 1))'));
  static const VerificationMeta _openToHavingChildrenMeta =
      const VerificationMeta('openToHavingChildren');
  @override
  late final GeneratedColumn<bool> openToHavingChildren = GeneratedColumn<bool>(
      'open_to_having_children', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("open_to_having_children" IN (0, 1))'));
  static const VerificationMeta _openToHavingChildrenOutsideAMarriageMeta =
      const VerificationMeta('openToHavingChildrenOutsideAMarriage');
  @override
  late final GeneratedColumn<
      bool> openToHavingChildrenOutsideAMarriage = GeneratedColumn<
          bool>(
      'open_to_having_children_outside_a_marriage', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("open_to_having_children_outside_a_marriage" IN (0, 1))'));
  static const VerificationMeta _openToHavingMultipleCoparentsMeta =
      const VerificationMeta('openToHavingMultipleCoparents');
  @override
  late final GeneratedColumn<bool> openToHavingMultipleCoparents =
      GeneratedColumn<bool>(
          'open_to_having_multiple_coparents', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("open_to_having_multiple_coparents" IN (0, 1))'));
  static const VerificationMeta _openToCheatingMeta =
      const VerificationMeta('openToCheating');
  @override
  late final GeneratedColumn<bool> openToCheating = GeneratedColumn<bool>(
      'open_to_cheating', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("open_to_cheating" IN (0, 1))'));
  static const VerificationMeta _openToGayPeopleMeta =
      const VerificationMeta('openToGayPeople');
  @override
  late final GeneratedColumn<bool> openToGayPeople = GeneratedColumn<bool>(
      'open_to_gay_people', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("open_to_gay_people" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        personId,
        openToAdoption,
        openToMarriage,
        openToSexWorkerPartner,
        openToAbortion,
        openToSurrogacy,
        openToAlternativeFertilityMethods,
        openToSigningPrenup,
        wantsPartnerToSignPrenup,
        openToCrimes,
        openToStayAtHomeParenting,
        openToPremaritalSex,
        openToWorkingAJob,
        openToBeingPregnant,
        openToHavingChildren,
        openToHavingChildrenOutsideAMarriage,
        openToHavingMultipleCoparents,
        openToCheating,
        openToGayPeople
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stance';
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
    if (data.containsKey('open_to_marriage')) {
      context.handle(
          _openToMarriageMeta,
          openToMarriage.isAcceptableOrUnknown(
              data['open_to_marriage']!, _openToMarriageMeta));
    } else if (isInserting) {
      context.missing(_openToMarriageMeta);
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
    if (data.containsKey('open_to_working_a_job')) {
      context.handle(
          _openToWorkingAJobMeta,
          openToWorkingAJob.isAcceptableOrUnknown(
              data['open_to_working_a_job']!, _openToWorkingAJobMeta));
    } else if (isInserting) {
      context.missing(_openToWorkingAJobMeta);
    }
    if (data.containsKey('open_to_being_pregnant')) {
      context.handle(
          _openToBeingPregnantMeta,
          openToBeingPregnant.isAcceptableOrUnknown(
              data['open_to_being_pregnant']!, _openToBeingPregnantMeta));
    } else if (isInserting) {
      context.missing(_openToBeingPregnantMeta);
    }
    if (data.containsKey('open_to_having_children')) {
      context.handle(
          _openToHavingChildrenMeta,
          openToHavingChildren.isAcceptableOrUnknown(
              data['open_to_having_children']!, _openToHavingChildrenMeta));
    } else if (isInserting) {
      context.missing(_openToHavingChildrenMeta);
    }
    if (data.containsKey('open_to_having_children_outside_a_marriage')) {
      context.handle(
          _openToHavingChildrenOutsideAMarriageMeta,
          openToHavingChildrenOutsideAMarriage.isAcceptableOrUnknown(
              data['open_to_having_children_outside_a_marriage']!,
              _openToHavingChildrenOutsideAMarriageMeta));
    } else if (isInserting) {
      context.missing(_openToHavingChildrenOutsideAMarriageMeta);
    }
    if (data.containsKey('open_to_having_multiple_coparents')) {
      context.handle(
          _openToHavingMultipleCoparentsMeta,
          openToHavingMultipleCoparents.isAcceptableOrUnknown(
              data['open_to_having_multiple_coparents']!,
              _openToHavingMultipleCoparentsMeta));
    } else if (isInserting) {
      context.missing(_openToHavingMultipleCoparentsMeta);
    }
    if (data.containsKey('open_to_cheating')) {
      context.handle(
          _openToCheatingMeta,
          openToCheating.isAcceptableOrUnknown(
              data['open_to_cheating']!, _openToCheatingMeta));
    } else if (isInserting) {
      context.missing(_openToCheatingMeta);
    }
    if (data.containsKey('open_to_gay_people')) {
      context.handle(
          _openToGayPeopleMeta,
          openToGayPeople.isAcceptableOrUnknown(
              data['open_to_gay_people']!, _openToGayPeopleMeta));
    } else if (isInserting) {
      context.missing(_openToGayPeopleMeta);
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
      openToMarriage: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}open_to_marriage'])!,
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
      openToWorkingAJob: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}open_to_working_a_job'])!,
      openToBeingPregnant: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}open_to_being_pregnant'])!,
      openToHavingChildren: attachedDatabase.typeMapping.read(DriftSqlType.bool,
          data['${effectivePrefix}open_to_having_children'])!,
      openToHavingChildrenOutsideAMarriage: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data[
              '${effectivePrefix}open_to_having_children_outside_a_marriage'])!,
      openToHavingMultipleCoparents: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}open_to_having_multiple_coparents'])!,
      openToCheating: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}open_to_cheating'])!,
      openToGayPeople: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}open_to_gay_people'])!,
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
  final bool openToMarriage;
  final bool openToSexWorkerPartner;
  final bool openToAbortion;
  final bool openToSurrogacy;
  final bool openToAlternativeFertilityMethods;
  final bool openToSigningPrenup;
  final bool wantsPartnerToSignPrenup;
  final bool openToCrimes;
  final bool openToStayAtHomeParenting;
  final bool openToPremaritalSex;
  final bool openToWorkingAJob;
  final bool openToBeingPregnant;
  final bool openToHavingChildren;
  final bool openToHavingChildrenOutsideAMarriage;
  final bool openToHavingMultipleCoparents;
  final bool openToCheating;
  final bool openToGayPeople;
  const Stance(
      {required this.id,
      required this.personId,
      required this.openToAdoption,
      required this.openToMarriage,
      required this.openToSexWorkerPartner,
      required this.openToAbortion,
      required this.openToSurrogacy,
      required this.openToAlternativeFertilityMethods,
      required this.openToSigningPrenup,
      required this.wantsPartnerToSignPrenup,
      required this.openToCrimes,
      required this.openToStayAtHomeParenting,
      required this.openToPremaritalSex,
      required this.openToWorkingAJob,
      required this.openToBeingPregnant,
      required this.openToHavingChildren,
      required this.openToHavingChildrenOutsideAMarriage,
      required this.openToHavingMultipleCoparents,
      required this.openToCheating,
      required this.openToGayPeople});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['person_id'] = Variable<int>(personId);
    map['open_to_adoption'] = Variable<bool>(openToAdoption);
    map['open_to_marriage'] = Variable<bool>(openToMarriage);
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
    map['open_to_working_a_job'] = Variable<bool>(openToWorkingAJob);
    map['open_to_being_pregnant'] = Variable<bool>(openToBeingPregnant);
    map['open_to_having_children'] = Variable<bool>(openToHavingChildren);
    map['open_to_having_children_outside_a_marriage'] =
        Variable<bool>(openToHavingChildrenOutsideAMarriage);
    map['open_to_having_multiple_coparents'] =
        Variable<bool>(openToHavingMultipleCoparents);
    map['open_to_cheating'] = Variable<bool>(openToCheating);
    map['open_to_gay_people'] = Variable<bool>(openToGayPeople);
    return map;
  }

  StanceTableCompanion toCompanion(bool nullToAbsent) {
    return StanceTableCompanion(
      id: Value(id),
      personId: Value(personId),
      openToAdoption: Value(openToAdoption),
      openToMarriage: Value(openToMarriage),
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
      openToWorkingAJob: Value(openToWorkingAJob),
      openToBeingPregnant: Value(openToBeingPregnant),
      openToHavingChildren: Value(openToHavingChildren),
      openToHavingChildrenOutsideAMarriage:
          Value(openToHavingChildrenOutsideAMarriage),
      openToHavingMultipleCoparents: Value(openToHavingMultipleCoparents),
      openToCheating: Value(openToCheating),
      openToGayPeople: Value(openToGayPeople),
    );
  }

  factory Stance.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Stance(
      id: serializer.fromJson<int>(json['id']),
      personId: serializer.fromJson<int>(json['personId']),
      openToAdoption: serializer.fromJson<bool>(json['openToAdoption']),
      openToMarriage: serializer.fromJson<bool>(json['openToMarriage']),
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
      openToWorkingAJob: serializer.fromJson<bool>(json['openToWorkingAJob']),
      openToBeingPregnant:
          serializer.fromJson<bool>(json['openToBeingPregnant']),
      openToHavingChildren:
          serializer.fromJson<bool>(json['openToHavingChildren']),
      openToHavingChildrenOutsideAMarriage: serializer
          .fromJson<bool>(json['openToHavingChildrenOutsideAMarriage']),
      openToHavingMultipleCoparents:
          serializer.fromJson<bool>(json['openToHavingMultipleCoparents']),
      openToCheating: serializer.fromJson<bool>(json['openToCheating']),
      openToGayPeople: serializer.fromJson<bool>(json['openToGayPeople']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'personId': serializer.toJson<int>(personId),
      'openToAdoption': serializer.toJson<bool>(openToAdoption),
      'openToMarriage': serializer.toJson<bool>(openToMarriage),
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
      'openToWorkingAJob': serializer.toJson<bool>(openToWorkingAJob),
      'openToBeingPregnant': serializer.toJson<bool>(openToBeingPregnant),
      'openToHavingChildren': serializer.toJson<bool>(openToHavingChildren),
      'openToHavingChildrenOutsideAMarriage':
          serializer.toJson<bool>(openToHavingChildrenOutsideAMarriage),
      'openToHavingMultipleCoparents':
          serializer.toJson<bool>(openToHavingMultipleCoparents),
      'openToCheating': serializer.toJson<bool>(openToCheating),
      'openToGayPeople': serializer.toJson<bool>(openToGayPeople),
    };
  }

  Stance copyWith(
          {int? id,
          int? personId,
          bool? openToAdoption,
          bool? openToMarriage,
          bool? openToSexWorkerPartner,
          bool? openToAbortion,
          bool? openToSurrogacy,
          bool? openToAlternativeFertilityMethods,
          bool? openToSigningPrenup,
          bool? wantsPartnerToSignPrenup,
          bool? openToCrimes,
          bool? openToStayAtHomeParenting,
          bool? openToPremaritalSex,
          bool? openToWorkingAJob,
          bool? openToBeingPregnant,
          bool? openToHavingChildren,
          bool? openToHavingChildrenOutsideAMarriage,
          bool? openToHavingMultipleCoparents,
          bool? openToCheating,
          bool? openToGayPeople}) =>
      Stance(
        id: id ?? this.id,
        personId: personId ?? this.personId,
        openToAdoption: openToAdoption ?? this.openToAdoption,
        openToMarriage: openToMarriage ?? this.openToMarriage,
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
        openToWorkingAJob: openToWorkingAJob ?? this.openToWorkingAJob,
        openToBeingPregnant: openToBeingPregnant ?? this.openToBeingPregnant,
        openToHavingChildren: openToHavingChildren ?? this.openToHavingChildren,
        openToHavingChildrenOutsideAMarriage:
            openToHavingChildrenOutsideAMarriage ??
                this.openToHavingChildrenOutsideAMarriage,
        openToHavingMultipleCoparents:
            openToHavingMultipleCoparents ?? this.openToHavingMultipleCoparents,
        openToCheating: openToCheating ?? this.openToCheating,
        openToGayPeople: openToGayPeople ?? this.openToGayPeople,
      );
  @override
  String toString() {
    return (StringBuffer('Stance(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('openToAdoption: $openToAdoption, ')
          ..write('openToMarriage: $openToMarriage, ')
          ..write('openToSexWorkerPartner: $openToSexWorkerPartner, ')
          ..write('openToAbortion: $openToAbortion, ')
          ..write('openToSurrogacy: $openToSurrogacy, ')
          ..write(
              'openToAlternativeFertilityMethods: $openToAlternativeFertilityMethods, ')
          ..write('openToSigningPrenup: $openToSigningPrenup, ')
          ..write('wantsPartnerToSignPrenup: $wantsPartnerToSignPrenup, ')
          ..write('openToCrimes: $openToCrimes, ')
          ..write('openToStayAtHomeParenting: $openToStayAtHomeParenting, ')
          ..write('openToPremaritalSex: $openToPremaritalSex, ')
          ..write('openToWorkingAJob: $openToWorkingAJob, ')
          ..write('openToBeingPregnant: $openToBeingPregnant, ')
          ..write('openToHavingChildren: $openToHavingChildren, ')
          ..write(
              'openToHavingChildrenOutsideAMarriage: $openToHavingChildrenOutsideAMarriage, ')
          ..write(
              'openToHavingMultipleCoparents: $openToHavingMultipleCoparents, ')
          ..write('openToCheating: $openToCheating, ')
          ..write('openToGayPeople: $openToGayPeople')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      personId,
      openToAdoption,
      openToMarriage,
      openToSexWorkerPartner,
      openToAbortion,
      openToSurrogacy,
      openToAlternativeFertilityMethods,
      openToSigningPrenup,
      wantsPartnerToSignPrenup,
      openToCrimes,
      openToStayAtHomeParenting,
      openToPremaritalSex,
      openToWorkingAJob,
      openToBeingPregnant,
      openToHavingChildren,
      openToHavingChildrenOutsideAMarriage,
      openToHavingMultipleCoparents,
      openToCheating,
      openToGayPeople);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Stance &&
          other.id == this.id &&
          other.personId == this.personId &&
          other.openToAdoption == this.openToAdoption &&
          other.openToMarriage == this.openToMarriage &&
          other.openToSexWorkerPartner == this.openToSexWorkerPartner &&
          other.openToAbortion == this.openToAbortion &&
          other.openToSurrogacy == this.openToSurrogacy &&
          other.openToAlternativeFertilityMethods ==
              this.openToAlternativeFertilityMethods &&
          other.openToSigningPrenup == this.openToSigningPrenup &&
          other.wantsPartnerToSignPrenup == this.wantsPartnerToSignPrenup &&
          other.openToCrimes == this.openToCrimes &&
          other.openToStayAtHomeParenting == this.openToStayAtHomeParenting &&
          other.openToPremaritalSex == this.openToPremaritalSex &&
          other.openToWorkingAJob == this.openToWorkingAJob &&
          other.openToBeingPregnant == this.openToBeingPregnant &&
          other.openToHavingChildren == this.openToHavingChildren &&
          other.openToHavingChildrenOutsideAMarriage ==
              this.openToHavingChildrenOutsideAMarriage &&
          other.openToHavingMultipleCoparents ==
              this.openToHavingMultipleCoparents &&
          other.openToCheating == this.openToCheating &&
          other.openToGayPeople == this.openToGayPeople);
}

class StanceTableCompanion extends UpdateCompanion<Stance> {
  final Value<int> id;
  final Value<int> personId;
  final Value<bool> openToAdoption;
  final Value<bool> openToMarriage;
  final Value<bool> openToSexWorkerPartner;
  final Value<bool> openToAbortion;
  final Value<bool> openToSurrogacy;
  final Value<bool> openToAlternativeFertilityMethods;
  final Value<bool> openToSigningPrenup;
  final Value<bool> wantsPartnerToSignPrenup;
  final Value<bool> openToCrimes;
  final Value<bool> openToStayAtHomeParenting;
  final Value<bool> openToPremaritalSex;
  final Value<bool> openToWorkingAJob;
  final Value<bool> openToBeingPregnant;
  final Value<bool> openToHavingChildren;
  final Value<bool> openToHavingChildrenOutsideAMarriage;
  final Value<bool> openToHavingMultipleCoparents;
  final Value<bool> openToCheating;
  final Value<bool> openToGayPeople;
  const StanceTableCompanion({
    this.id = const Value.absent(),
    this.personId = const Value.absent(),
    this.openToAdoption = const Value.absent(),
    this.openToMarriage = const Value.absent(),
    this.openToSexWorkerPartner = const Value.absent(),
    this.openToAbortion = const Value.absent(),
    this.openToSurrogacy = const Value.absent(),
    this.openToAlternativeFertilityMethods = const Value.absent(),
    this.openToSigningPrenup = const Value.absent(),
    this.wantsPartnerToSignPrenup = const Value.absent(),
    this.openToCrimes = const Value.absent(),
    this.openToStayAtHomeParenting = const Value.absent(),
    this.openToPremaritalSex = const Value.absent(),
    this.openToWorkingAJob = const Value.absent(),
    this.openToBeingPregnant = const Value.absent(),
    this.openToHavingChildren = const Value.absent(),
    this.openToHavingChildrenOutsideAMarriage = const Value.absent(),
    this.openToHavingMultipleCoparents = const Value.absent(),
    this.openToCheating = const Value.absent(),
    this.openToGayPeople = const Value.absent(),
  });
  StanceTableCompanion.insert({
    this.id = const Value.absent(),
    required int personId,
    required bool openToAdoption,
    required bool openToMarriage,
    required bool openToSexWorkerPartner,
    required bool openToAbortion,
    required bool openToSurrogacy,
    required bool openToAlternativeFertilityMethods,
    required bool openToSigningPrenup,
    required bool wantsPartnerToSignPrenup,
    required bool openToCrimes,
    required bool openToStayAtHomeParenting,
    required bool openToPremaritalSex,
    required bool openToWorkingAJob,
    required bool openToBeingPregnant,
    required bool openToHavingChildren,
    required bool openToHavingChildrenOutsideAMarriage,
    required bool openToHavingMultipleCoparents,
    required bool openToCheating,
    required bool openToGayPeople,
  })  : personId = Value(personId),
        openToAdoption = Value(openToAdoption),
        openToMarriage = Value(openToMarriage),
        openToSexWorkerPartner = Value(openToSexWorkerPartner),
        openToAbortion = Value(openToAbortion),
        openToSurrogacy = Value(openToSurrogacy),
        openToAlternativeFertilityMethods =
            Value(openToAlternativeFertilityMethods),
        openToSigningPrenup = Value(openToSigningPrenup),
        wantsPartnerToSignPrenup = Value(wantsPartnerToSignPrenup),
        openToCrimes = Value(openToCrimes),
        openToStayAtHomeParenting = Value(openToStayAtHomeParenting),
        openToPremaritalSex = Value(openToPremaritalSex),
        openToWorkingAJob = Value(openToWorkingAJob),
        openToBeingPregnant = Value(openToBeingPregnant),
        openToHavingChildren = Value(openToHavingChildren),
        openToHavingChildrenOutsideAMarriage =
            Value(openToHavingChildrenOutsideAMarriage),
        openToHavingMultipleCoparents = Value(openToHavingMultipleCoparents),
        openToCheating = Value(openToCheating),
        openToGayPeople = Value(openToGayPeople);
  static Insertable<Stance> custom({
    Expression<int>? id,
    Expression<int>? personId,
    Expression<bool>? openToAdoption,
    Expression<bool>? openToMarriage,
    Expression<bool>? openToSexWorkerPartner,
    Expression<bool>? openToAbortion,
    Expression<bool>? openToSurrogacy,
    Expression<bool>? openToAlternativeFertilityMethods,
    Expression<bool>? openToSigningPrenup,
    Expression<bool>? wantsPartnerToSignPrenup,
    Expression<bool>? openToCrimes,
    Expression<bool>? openToStayAtHomeParenting,
    Expression<bool>? openToPremaritalSex,
    Expression<bool>? openToWorkingAJob,
    Expression<bool>? openToBeingPregnant,
    Expression<bool>? openToHavingChildren,
    Expression<bool>? openToHavingChildrenOutsideAMarriage,
    Expression<bool>? openToHavingMultipleCoparents,
    Expression<bool>? openToCheating,
    Expression<bool>? openToGayPeople,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (personId != null) 'person_id': personId,
      if (openToAdoption != null) 'open_to_adoption': openToAdoption,
      if (openToMarriage != null) 'open_to_marriage': openToMarriage,
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
      if (openToWorkingAJob != null) 'open_to_working_a_job': openToWorkingAJob,
      if (openToBeingPregnant != null)
        'open_to_being_pregnant': openToBeingPregnant,
      if (openToHavingChildren != null)
        'open_to_having_children': openToHavingChildren,
      if (openToHavingChildrenOutsideAMarriage != null)
        'open_to_having_children_outside_a_marriage':
            openToHavingChildrenOutsideAMarriage,
      if (openToHavingMultipleCoparents != null)
        'open_to_having_multiple_coparents': openToHavingMultipleCoparents,
      if (openToCheating != null) 'open_to_cheating': openToCheating,
      if (openToGayPeople != null) 'open_to_gay_people': openToGayPeople,
    });
  }

  StanceTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? personId,
      Value<bool>? openToAdoption,
      Value<bool>? openToMarriage,
      Value<bool>? openToSexWorkerPartner,
      Value<bool>? openToAbortion,
      Value<bool>? openToSurrogacy,
      Value<bool>? openToAlternativeFertilityMethods,
      Value<bool>? openToSigningPrenup,
      Value<bool>? wantsPartnerToSignPrenup,
      Value<bool>? openToCrimes,
      Value<bool>? openToStayAtHomeParenting,
      Value<bool>? openToPremaritalSex,
      Value<bool>? openToWorkingAJob,
      Value<bool>? openToBeingPregnant,
      Value<bool>? openToHavingChildren,
      Value<bool>? openToHavingChildrenOutsideAMarriage,
      Value<bool>? openToHavingMultipleCoparents,
      Value<bool>? openToCheating,
      Value<bool>? openToGayPeople}) {
    return StanceTableCompanion(
      id: id ?? this.id,
      personId: personId ?? this.personId,
      openToAdoption: openToAdoption ?? this.openToAdoption,
      openToMarriage: openToMarriage ?? this.openToMarriage,
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
      openToWorkingAJob: openToWorkingAJob ?? this.openToWorkingAJob,
      openToBeingPregnant: openToBeingPregnant ?? this.openToBeingPregnant,
      openToHavingChildren: openToHavingChildren ?? this.openToHavingChildren,
      openToHavingChildrenOutsideAMarriage:
          openToHavingChildrenOutsideAMarriage ??
              this.openToHavingChildrenOutsideAMarriage,
      openToHavingMultipleCoparents:
          openToHavingMultipleCoparents ?? this.openToHavingMultipleCoparents,
      openToCheating: openToCheating ?? this.openToCheating,
      openToGayPeople: openToGayPeople ?? this.openToGayPeople,
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
    if (openToMarriage.present) {
      map['open_to_marriage'] = Variable<bool>(openToMarriage.value);
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
    if (openToWorkingAJob.present) {
      map['open_to_working_a_job'] = Variable<bool>(openToWorkingAJob.value);
    }
    if (openToBeingPregnant.present) {
      map['open_to_being_pregnant'] = Variable<bool>(openToBeingPregnant.value);
    }
    if (openToHavingChildren.present) {
      map['open_to_having_children'] =
          Variable<bool>(openToHavingChildren.value);
    }
    if (openToHavingChildrenOutsideAMarriage.present) {
      map['open_to_having_children_outside_a_marriage'] =
          Variable<bool>(openToHavingChildrenOutsideAMarriage.value);
    }
    if (openToHavingMultipleCoparents.present) {
      map['open_to_having_multiple_coparents'] =
          Variable<bool>(openToHavingMultipleCoparents.value);
    }
    if (openToCheating.present) {
      map['open_to_cheating'] = Variable<bool>(openToCheating.value);
    }
    if (openToGayPeople.present) {
      map['open_to_gay_people'] = Variable<bool>(openToGayPeople.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StanceTableCompanion(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('openToAdoption: $openToAdoption, ')
          ..write('openToMarriage: $openToMarriage, ')
          ..write('openToSexWorkerPartner: $openToSexWorkerPartner, ')
          ..write('openToAbortion: $openToAbortion, ')
          ..write('openToSurrogacy: $openToSurrogacy, ')
          ..write(
              'openToAlternativeFertilityMethods: $openToAlternativeFertilityMethods, ')
          ..write('openToSigningPrenup: $openToSigningPrenup, ')
          ..write('wantsPartnerToSignPrenup: $wantsPartnerToSignPrenup, ')
          ..write('openToCrimes: $openToCrimes, ')
          ..write('openToStayAtHomeParenting: $openToStayAtHomeParenting, ')
          ..write('openToPremaritalSex: $openToPremaritalSex, ')
          ..write('openToWorkingAJob: $openToWorkingAJob, ')
          ..write('openToBeingPregnant: $openToBeingPregnant, ')
          ..write('openToHavingChildren: $openToHavingChildren, ')
          ..write(
              'openToHavingChildrenOutsideAMarriage: $openToHavingChildrenOutsideAMarriage, ')
          ..write(
              'openToHavingMultipleCoparents: $openToHavingMultipleCoparents, ')
          ..write('openToCheating: $openToCheating, ')
          ..write('openToGayPeople: $openToGayPeople')
          ..write(')'))
        .toString();
  }
}

class $TattooTableTable extends TattooTable
    with TableInfo<$TattooTableTable, Tattoo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TattooTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<String> size = GeneratedColumn<String>(
      'size', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dayObtainedMeta =
      const VerificationMeta('dayObtained');
  @override
  late final GeneratedColumn<int> dayObtained = GeneratedColumn<int>(
      'day_obtained', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _qualityMeta =
      const VerificationMeta('quality');
  @override
  late final GeneratedColumn<String> quality = GeneratedColumn<String>(
      'quality', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, personId, description, location, size, dayObtained, quality];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tattoo';
  @override
  VerificationContext validateIntegrity(Insertable<Tattoo> instance,
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
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size']!, _sizeMeta));
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('day_obtained')) {
      context.handle(
          _dayObtainedMeta,
          dayObtained.isAcceptableOrUnknown(
              data['day_obtained']!, _dayObtainedMeta));
    } else if (isInserting) {
      context.missing(_dayObtainedMeta);
    }
    if (data.containsKey('quality')) {
      context.handle(_qualityMeta,
          quality.isAcceptableOrUnknown(data['quality']!, _qualityMeta));
    } else if (isInserting) {
      context.missing(_qualityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tattoo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tattoo(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])!,
      size: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}size'])!,
      dayObtained: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_obtained'])!,
      quality: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}quality'])!,
    );
  }

  @override
  $TattooTableTable createAlias(String alias) {
    return $TattooTableTable(attachedDatabase, alias);
  }
}

class Tattoo extends DataClass implements Insertable<Tattoo> {
  final int id;
  final int personId;
  final String description;
  final String location;
  final String size;
  final int dayObtained;
  final String quality;
  const Tattoo(
      {required this.id,
      required this.personId,
      required this.description,
      required this.location,
      required this.size,
      required this.dayObtained,
      required this.quality});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['person_id'] = Variable<int>(personId);
    map['description'] = Variable<String>(description);
    map['location'] = Variable<String>(location);
    map['size'] = Variable<String>(size);
    map['day_obtained'] = Variable<int>(dayObtained);
    map['quality'] = Variable<String>(quality);
    return map;
  }

  TattooTableCompanion toCompanion(bool nullToAbsent) {
    return TattooTableCompanion(
      id: Value(id),
      personId: Value(personId),
      description: Value(description),
      location: Value(location),
      size: Value(size),
      dayObtained: Value(dayObtained),
      quality: Value(quality),
    );
  }

  factory Tattoo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tattoo(
      id: serializer.fromJson<int>(json['id']),
      personId: serializer.fromJson<int>(json['personId']),
      description: serializer.fromJson<String>(json['description']),
      location: serializer.fromJson<String>(json['location']),
      size: serializer.fromJson<String>(json['size']),
      dayObtained: serializer.fromJson<int>(json['dayObtained']),
      quality: serializer.fromJson<String>(json['quality']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'personId': serializer.toJson<int>(personId),
      'description': serializer.toJson<String>(description),
      'location': serializer.toJson<String>(location),
      'size': serializer.toJson<String>(size),
      'dayObtained': serializer.toJson<int>(dayObtained),
      'quality': serializer.toJson<String>(quality),
    };
  }

  Tattoo copyWith(
          {int? id,
          int? personId,
          String? description,
          String? location,
          String? size,
          int? dayObtained,
          String? quality}) =>
      Tattoo(
        id: id ?? this.id,
        personId: personId ?? this.personId,
        description: description ?? this.description,
        location: location ?? this.location,
        size: size ?? this.size,
        dayObtained: dayObtained ?? this.dayObtained,
        quality: quality ?? this.quality,
      );
  @override
  String toString() {
    return (StringBuffer('Tattoo(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('description: $description, ')
          ..write('location: $location, ')
          ..write('size: $size, ')
          ..write('dayObtained: $dayObtained, ')
          ..write('quality: $quality')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, personId, description, location, size, dayObtained, quality);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tattoo &&
          other.id == this.id &&
          other.personId == this.personId &&
          other.description == this.description &&
          other.location == this.location &&
          other.size == this.size &&
          other.dayObtained == this.dayObtained &&
          other.quality == this.quality);
}

class TattooTableCompanion extends UpdateCompanion<Tattoo> {
  final Value<int> id;
  final Value<int> personId;
  final Value<String> description;
  final Value<String> location;
  final Value<String> size;
  final Value<int> dayObtained;
  final Value<String> quality;
  const TattooTableCompanion({
    this.id = const Value.absent(),
    this.personId = const Value.absent(),
    this.description = const Value.absent(),
    this.location = const Value.absent(),
    this.size = const Value.absent(),
    this.dayObtained = const Value.absent(),
    this.quality = const Value.absent(),
  });
  TattooTableCompanion.insert({
    this.id = const Value.absent(),
    required int personId,
    required String description,
    required String location,
    required String size,
    required int dayObtained,
    required String quality,
  })  : personId = Value(personId),
        description = Value(description),
        location = Value(location),
        size = Value(size),
        dayObtained = Value(dayObtained),
        quality = Value(quality);
  static Insertable<Tattoo> custom({
    Expression<int>? id,
    Expression<int>? personId,
    Expression<String>? description,
    Expression<String>? location,
    Expression<String>? size,
    Expression<int>? dayObtained,
    Expression<String>? quality,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (personId != null) 'person_id': personId,
      if (description != null) 'description': description,
      if (location != null) 'location': location,
      if (size != null) 'size': size,
      if (dayObtained != null) 'day_obtained': dayObtained,
      if (quality != null) 'quality': quality,
    });
  }

  TattooTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? personId,
      Value<String>? description,
      Value<String>? location,
      Value<String>? size,
      Value<int>? dayObtained,
      Value<String>? quality}) {
    return TattooTableCompanion(
      id: id ?? this.id,
      personId: personId ?? this.personId,
      description: description ?? this.description,
      location: location ?? this.location,
      size: size ?? this.size,
      dayObtained: dayObtained ?? this.dayObtained,
      quality: quality ?? this.quality,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (size.present) {
      map['size'] = Variable<String>(size.value);
    }
    if (dayObtained.present) {
      map['day_obtained'] = Variable<int>(dayObtained.value);
    }
    if (quality.present) {
      map['quality'] = Variable<String>(quality.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TattooTableCompanion(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('description: $description, ')
          ..write('location: $location, ')
          ..write('size: $size, ')
          ..write('dayObtained: $dayObtained, ')
          ..write('quality: $quality')
          ..write(')'))
        .toString();
  }
}

class $PiercingTableTable extends PiercingTable
    with TableInfo<$PiercingTableTable, Piercing> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PiercingTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dayObtainedMeta =
      const VerificationMeta('dayObtained');
  @override
  late final GeneratedColumn<int> dayObtained = GeneratedColumn<int>(
      'day_obtained', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, personId, location, dayObtained];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'piercing';
  @override
  VerificationContext validateIntegrity(Insertable<Piercing> instance,
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
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('day_obtained')) {
      context.handle(
          _dayObtainedMeta,
          dayObtained.isAcceptableOrUnknown(
              data['day_obtained']!, _dayObtainedMeta));
    } else if (isInserting) {
      context.missing(_dayObtainedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Piercing map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Piercing(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])!,
      dayObtained: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_obtained'])!,
    );
  }

  @override
  $PiercingTableTable createAlias(String alias) {
    return $PiercingTableTable(attachedDatabase, alias);
  }
}

class Piercing extends DataClass implements Insertable<Piercing> {
  final int id;
  final int personId;
  final String location;
  final int dayObtained;
  const Piercing(
      {required this.id,
      required this.personId,
      required this.location,
      required this.dayObtained});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['person_id'] = Variable<int>(personId);
    map['location'] = Variable<String>(location);
    map['day_obtained'] = Variable<int>(dayObtained);
    return map;
  }

  PiercingTableCompanion toCompanion(bool nullToAbsent) {
    return PiercingTableCompanion(
      id: Value(id),
      personId: Value(personId),
      location: Value(location),
      dayObtained: Value(dayObtained),
    );
  }

  factory Piercing.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Piercing(
      id: serializer.fromJson<int>(json['id']),
      personId: serializer.fromJson<int>(json['personId']),
      location: serializer.fromJson<String>(json['location']),
      dayObtained: serializer.fromJson<int>(json['dayObtained']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'personId': serializer.toJson<int>(personId),
      'location': serializer.toJson<String>(location),
      'dayObtained': serializer.toJson<int>(dayObtained),
    };
  }

  Piercing copyWith(
          {int? id, int? personId, String? location, int? dayObtained}) =>
      Piercing(
        id: id ?? this.id,
        personId: personId ?? this.personId,
        location: location ?? this.location,
        dayObtained: dayObtained ?? this.dayObtained,
      );
  @override
  String toString() {
    return (StringBuffer('Piercing(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('location: $location, ')
          ..write('dayObtained: $dayObtained')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, personId, location, dayObtained);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Piercing &&
          other.id == this.id &&
          other.personId == this.personId &&
          other.location == this.location &&
          other.dayObtained == this.dayObtained);
}

class PiercingTableCompanion extends UpdateCompanion<Piercing> {
  final Value<int> id;
  final Value<int> personId;
  final Value<String> location;
  final Value<int> dayObtained;
  const PiercingTableCompanion({
    this.id = const Value.absent(),
    this.personId = const Value.absent(),
    this.location = const Value.absent(),
    this.dayObtained = const Value.absent(),
  });
  PiercingTableCompanion.insert({
    this.id = const Value.absent(),
    required int personId,
    required String location,
    required int dayObtained,
  })  : personId = Value(personId),
        location = Value(location),
        dayObtained = Value(dayObtained);
  static Insertable<Piercing> custom({
    Expression<int>? id,
    Expression<int>? personId,
    Expression<String>? location,
    Expression<int>? dayObtained,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (personId != null) 'person_id': personId,
      if (location != null) 'location': location,
      if (dayObtained != null) 'day_obtained': dayObtained,
    });
  }

  PiercingTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? personId,
      Value<String>? location,
      Value<int>? dayObtained}) {
    return PiercingTableCompanion(
      id: id ?? this.id,
      personId: personId ?? this.personId,
      location: location ?? this.location,
      dayObtained: dayObtained ?? this.dayObtained,
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
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (dayObtained.present) {
      map['day_obtained'] = Variable<int>(dayObtained.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PiercingTableCompanion(')
          ..write('id: $id, ')
          ..write('personId: $personId, ')
          ..write('location: $location, ')
          ..write('dayObtained: $dayObtained')
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
  late final GeneratedColumn<bool> needsChanging = GeneratedColumn<bool>(
      'needs_changing', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("needs_changing" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, personId, fussiness, appetite, needsChanging];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'baby_traits';
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

class $DeathRecordTableTable extends DeathRecordTable
    with TableInfo<$DeathRecordTableTable, DeathRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DeathRecordTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _gameIdMeta = const VerificationMeta('gameId');
  @override
  late final GeneratedColumn<int> gameId = GeneratedColumn<int>(
      'game_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES game (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _personIdMeta =
      const VerificationMeta('personId');
  @override
  late final GeneratedColumn<int> personId = GeneratedColumn<int>(
      'person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _dayOfDeathMeta =
      const VerificationMeta('dayOfDeath');
  @override
  late final GeneratedColumn<int> dayOfDeath = GeneratedColumn<int>(
      'day_of_death', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _causeOfDeathMeta =
      const VerificationMeta('causeOfDeath');
  @override
  late final GeneratedColumn<String> causeOfDeath = GeneratedColumn<String>(
      'cause_of_death', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [gameId, personId, dayOfDeath, state, country, causeOfDeath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'death_record';
  @override
  VerificationContext validateIntegrity(Insertable<DeathRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('game_id')) {
      context.handle(_gameIdMeta,
          gameId.isAcceptableOrUnknown(data['game_id']!, _gameIdMeta));
    } else if (isInserting) {
      context.missing(_gameIdMeta);
    }
    if (data.containsKey('person_id')) {
      context.handle(_personIdMeta,
          personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta));
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('day_of_death')) {
      context.handle(
          _dayOfDeathMeta,
          dayOfDeath.isAcceptableOrUnknown(
              data['day_of_death']!, _dayOfDeathMeta));
    } else if (isInserting) {
      context.missing(_dayOfDeathMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('cause_of_death')) {
      context.handle(
          _causeOfDeathMeta,
          causeOfDeath.isAcceptableOrUnknown(
              data['cause_of_death']!, _causeOfDeathMeta));
    } else if (isInserting) {
      context.missing(_causeOfDeathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {gameId, personId};
  @override
  DeathRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeathRecord(
      gameId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}game_id'])!,
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id'])!,
      dayOfDeath: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_of_death'])!,
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state'])!,
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country'])!,
      causeOfDeath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cause_of_death'])!,
    );
  }

  @override
  $DeathRecordTableTable createAlias(String alias) {
    return $DeathRecordTableTable(attachedDatabase, alias);
  }
}

class DeathRecord extends DataClass implements Insertable<DeathRecord> {
  final int gameId;
  final int personId;
  final int dayOfDeath;
  final String state;
  final String country;
  final String causeOfDeath;
  const DeathRecord(
      {required this.gameId,
      required this.personId,
      required this.dayOfDeath,
      required this.state,
      required this.country,
      required this.causeOfDeath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['game_id'] = Variable<int>(gameId);
    map['person_id'] = Variable<int>(personId);
    map['day_of_death'] = Variable<int>(dayOfDeath);
    map['state'] = Variable<String>(state);
    map['country'] = Variable<String>(country);
    map['cause_of_death'] = Variable<String>(causeOfDeath);
    return map;
  }

  DeathRecordTableCompanion toCompanion(bool nullToAbsent) {
    return DeathRecordTableCompanion(
      gameId: Value(gameId),
      personId: Value(personId),
      dayOfDeath: Value(dayOfDeath),
      state: Value(state),
      country: Value(country),
      causeOfDeath: Value(causeOfDeath),
    );
  }

  factory DeathRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeathRecord(
      gameId: serializer.fromJson<int>(json['gameId']),
      personId: serializer.fromJson<int>(json['personId']),
      dayOfDeath: serializer.fromJson<int>(json['dayOfDeath']),
      state: serializer.fromJson<String>(json['state']),
      country: serializer.fromJson<String>(json['country']),
      causeOfDeath: serializer.fromJson<String>(json['causeOfDeath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'gameId': serializer.toJson<int>(gameId),
      'personId': serializer.toJson<int>(personId),
      'dayOfDeath': serializer.toJson<int>(dayOfDeath),
      'state': serializer.toJson<String>(state),
      'country': serializer.toJson<String>(country),
      'causeOfDeath': serializer.toJson<String>(causeOfDeath),
    };
  }

  DeathRecord copyWith(
          {int? gameId,
          int? personId,
          int? dayOfDeath,
          String? state,
          String? country,
          String? causeOfDeath}) =>
      DeathRecord(
        gameId: gameId ?? this.gameId,
        personId: personId ?? this.personId,
        dayOfDeath: dayOfDeath ?? this.dayOfDeath,
        state: state ?? this.state,
        country: country ?? this.country,
        causeOfDeath: causeOfDeath ?? this.causeOfDeath,
      );
  @override
  String toString() {
    return (StringBuffer('DeathRecord(')
          ..write('gameId: $gameId, ')
          ..write('personId: $personId, ')
          ..write('dayOfDeath: $dayOfDeath, ')
          ..write('state: $state, ')
          ..write('country: $country, ')
          ..write('causeOfDeath: $causeOfDeath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(gameId, personId, dayOfDeath, state, country, causeOfDeath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeathRecord &&
          other.gameId == this.gameId &&
          other.personId == this.personId &&
          other.dayOfDeath == this.dayOfDeath &&
          other.state == this.state &&
          other.country == this.country &&
          other.causeOfDeath == this.causeOfDeath);
}

class DeathRecordTableCompanion extends UpdateCompanion<DeathRecord> {
  final Value<int> gameId;
  final Value<int> personId;
  final Value<int> dayOfDeath;
  final Value<String> state;
  final Value<String> country;
  final Value<String> causeOfDeath;
  final Value<int> rowid;
  const DeathRecordTableCompanion({
    this.gameId = const Value.absent(),
    this.personId = const Value.absent(),
    this.dayOfDeath = const Value.absent(),
    this.state = const Value.absent(),
    this.country = const Value.absent(),
    this.causeOfDeath = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DeathRecordTableCompanion.insert({
    required int gameId,
    required int personId,
    required int dayOfDeath,
    required String state,
    required String country,
    required String causeOfDeath,
    this.rowid = const Value.absent(),
  })  : gameId = Value(gameId),
        personId = Value(personId),
        dayOfDeath = Value(dayOfDeath),
        state = Value(state),
        country = Value(country),
        causeOfDeath = Value(causeOfDeath);
  static Insertable<DeathRecord> custom({
    Expression<int>? gameId,
    Expression<int>? personId,
    Expression<int>? dayOfDeath,
    Expression<String>? state,
    Expression<String>? country,
    Expression<String>? causeOfDeath,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (gameId != null) 'game_id': gameId,
      if (personId != null) 'person_id': personId,
      if (dayOfDeath != null) 'day_of_death': dayOfDeath,
      if (state != null) 'state': state,
      if (country != null) 'country': country,
      if (causeOfDeath != null) 'cause_of_death': causeOfDeath,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DeathRecordTableCompanion copyWith(
      {Value<int>? gameId,
      Value<int>? personId,
      Value<int>? dayOfDeath,
      Value<String>? state,
      Value<String>? country,
      Value<String>? causeOfDeath,
      Value<int>? rowid}) {
    return DeathRecordTableCompanion(
      gameId: gameId ?? this.gameId,
      personId: personId ?? this.personId,
      dayOfDeath: dayOfDeath ?? this.dayOfDeath,
      state: state ?? this.state,
      country: country ?? this.country,
      causeOfDeath: causeOfDeath ?? this.causeOfDeath,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (gameId.present) {
      map['game_id'] = Variable<int>(gameId.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<int>(personId.value);
    }
    if (dayOfDeath.present) {
      map['day_of_death'] = Variable<int>(dayOfDeath.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (causeOfDeath.present) {
      map['cause_of_death'] = Variable<String>(causeOfDeath.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeathRecordTableCompanion(')
          ..write('gameId: $gameId, ')
          ..write('personId: $personId, ')
          ..write('dayOfDeath: $dayOfDeath, ')
          ..write('state: $state, ')
          ..write('country: $country, ')
          ..write('causeOfDeath: $causeOfDeath, ')
          ..write('rowid: $rowid')
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
  static const VerificationMeta _interestedInRelationshipMeta =
      const VerificationMeta('interestedInRelationship');
  @override
  late final GeneratedColumn<bool> interestedInRelationship =
      GeneratedColumn<bool>(
          'interested_in_relationship', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("interested_in_relationship" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        mainPersonId,
        acquaintanceId,
        metAt,
        relationship,
        interestedInRelationship
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'acquaintance';
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
    if (data.containsKey('interested_in_relationship')) {
      context.handle(
          _interestedInRelationshipMeta,
          interestedInRelationship.isAcceptableOrUnknown(
              data['interested_in_relationship']!,
              _interestedInRelationshipMeta));
    } else if (isInserting) {
      context.missing(_interestedInRelationshipMeta);
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
      interestedInRelationship: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}interested_in_relationship'])!,
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
  final bool interestedInRelationship;
  const Acquaintance(
      {required this.mainPersonId,
      required this.acquaintanceId,
      required this.metAt,
      required this.relationship,
      required this.interestedInRelationship});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['main_person_id'] = Variable<int>(mainPersonId);
    map['acquaintance_id'] = Variable<int>(acquaintanceId);
    map['met_at'] = Variable<String>(metAt);
    map['relationship'] = Variable<int>(relationship);
    map['interested_in_relationship'] =
        Variable<bool>(interestedInRelationship);
    return map;
  }

  AcquaintanceTableCompanion toCompanion(bool nullToAbsent) {
    return AcquaintanceTableCompanion(
      mainPersonId: Value(mainPersonId),
      acquaintanceId: Value(acquaintanceId),
      metAt: Value(metAt),
      relationship: Value(relationship),
      interestedInRelationship: Value(interestedInRelationship),
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
      interestedInRelationship:
          serializer.fromJson<bool>(json['interestedInRelationship']),
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
      'interestedInRelationship':
          serializer.toJson<bool>(interestedInRelationship),
    };
  }

  Acquaintance copyWith(
          {int? mainPersonId,
          int? acquaintanceId,
          String? metAt,
          int? relationship,
          bool? interestedInRelationship}) =>
      Acquaintance(
        mainPersonId: mainPersonId ?? this.mainPersonId,
        acquaintanceId: acquaintanceId ?? this.acquaintanceId,
        metAt: metAt ?? this.metAt,
        relationship: relationship ?? this.relationship,
        interestedInRelationship:
            interestedInRelationship ?? this.interestedInRelationship,
      );
  @override
  String toString() {
    return (StringBuffer('Acquaintance(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('acquaintanceId: $acquaintanceId, ')
          ..write('metAt: $metAt, ')
          ..write('relationship: $relationship, ')
          ..write('interestedInRelationship: $interestedInRelationship')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mainPersonId, acquaintanceId, metAt,
      relationship, interestedInRelationship);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Acquaintance &&
          other.mainPersonId == this.mainPersonId &&
          other.acquaintanceId == this.acquaintanceId &&
          other.metAt == this.metAt &&
          other.relationship == this.relationship &&
          other.interestedInRelationship == this.interestedInRelationship);
}

class AcquaintanceTableCompanion extends UpdateCompanion<Acquaintance> {
  final Value<int> mainPersonId;
  final Value<int> acquaintanceId;
  final Value<String> metAt;
  final Value<int> relationship;
  final Value<bool> interestedInRelationship;
  final Value<int> rowid;
  const AcquaintanceTableCompanion({
    this.mainPersonId = const Value.absent(),
    this.acquaintanceId = const Value.absent(),
    this.metAt = const Value.absent(),
    this.relationship = const Value.absent(),
    this.interestedInRelationship = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AcquaintanceTableCompanion.insert({
    required int mainPersonId,
    required int acquaintanceId,
    required String metAt,
    required int relationship,
    required bool interestedInRelationship,
    this.rowid = const Value.absent(),
  })  : mainPersonId = Value(mainPersonId),
        acquaintanceId = Value(acquaintanceId),
        metAt = Value(metAt),
        relationship = Value(relationship),
        interestedInRelationship = Value(interestedInRelationship);
  static Insertable<Acquaintance> custom({
    Expression<int>? mainPersonId,
    Expression<int>? acquaintanceId,
    Expression<String>? metAt,
    Expression<int>? relationship,
    Expression<bool>? interestedInRelationship,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (acquaintanceId != null) 'acquaintance_id': acquaintanceId,
      if (metAt != null) 'met_at': metAt,
      if (relationship != null) 'relationship': relationship,
      if (interestedInRelationship != null)
        'interested_in_relationship': interestedInRelationship,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AcquaintanceTableCompanion copyWith(
      {Value<int>? mainPersonId,
      Value<int>? acquaintanceId,
      Value<String>? metAt,
      Value<int>? relationship,
      Value<bool>? interestedInRelationship,
      Value<int>? rowid}) {
    return AcquaintanceTableCompanion(
      mainPersonId: mainPersonId ?? this.mainPersonId,
      acquaintanceId: acquaintanceId ?? this.acquaintanceId,
      metAt: metAt ?? this.metAt,
      relationship: relationship ?? this.relationship,
      interestedInRelationship:
          interestedInRelationship ?? this.interestedInRelationship,
      rowid: rowid ?? this.rowid,
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
    if (interestedInRelationship.present) {
      map['interested_in_relationship'] =
          Variable<bool>(interestedInRelationship.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
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
          ..write('interestedInRelationship: $interestedInRelationship, ')
          ..write('rowid: $rowid')
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
  static const VerificationMeta _inYourCustodyMeta =
      const VerificationMeta('inYourCustody');
  @override
  late final GeneratedColumn<bool> inYourCustody = GeneratedColumn<bool>(
      'in_your_custody', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("in_your_custody" IN (0, 1))'));
  static const VerificationMeta _childRelationshipTypeMeta =
      const VerificationMeta('childRelationshipType');
  @override
  late final GeneratedColumn<String> childRelationshipType =
      GeneratedColumn<String>('child_relationship_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hiddenMeta = const VerificationMeta('hidden');
  @override
  late final GeneratedColumn<bool> hidden = GeneratedColumn<bool>(
      'hidden', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("hidden" IN (0, 1))'));
  static const VerificationMeta _paternityFraudMeta =
      const VerificationMeta('paternityFraud');
  @override
  late final GeneratedColumn<bool> paternityFraud = GeneratedColumn<bool>(
      'paternity_fraud', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("paternity_fraud" IN (0, 1))'));
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
  static const VerificationMeta _interestedInRelationshipMeta =
      const VerificationMeta('interestedInRelationship');
  @override
  late final GeneratedColumn<bool> interestedInRelationship =
      GeneratedColumn<bool>(
          'interested_in_relationship', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("interested_in_relationship" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        mainPersonId,
        childId,
        inYourCustody,
        childRelationshipType,
        hidden,
        paternityFraud,
        assumedRelationshipType,
        relationship,
        interestedInRelationship
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'child';
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
    if (data.containsKey('in_your_custody')) {
      context.handle(
          _inYourCustodyMeta,
          inYourCustody.isAcceptableOrUnknown(
              data['in_your_custody']!, _inYourCustodyMeta));
    } else if (isInserting) {
      context.missing(_inYourCustodyMeta);
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
    if (data.containsKey('interested_in_relationship')) {
      context.handle(
          _interestedInRelationshipMeta,
          interestedInRelationship.isAcceptableOrUnknown(
              data['interested_in_relationship']!,
              _interestedInRelationshipMeta));
    } else if (isInserting) {
      context.missing(_interestedInRelationshipMeta);
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
      inYourCustody: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}in_your_custody'])!,
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
      interestedInRelationship: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}interested_in_relationship'])!,
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
  final bool inYourCustody;
  final String childRelationshipType;
  final bool hidden;
  final bool paternityFraud;
  final String assumedRelationshipType;
  final int relationship;
  final bool interestedInRelationship;
  const Child(
      {required this.mainPersonId,
      required this.childId,
      required this.inYourCustody,
      required this.childRelationshipType,
      required this.hidden,
      required this.paternityFraud,
      required this.assumedRelationshipType,
      required this.relationship,
      required this.interestedInRelationship});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['main_person_id'] = Variable<int>(mainPersonId);
    map['child_id'] = Variable<int>(childId);
    map['in_your_custody'] = Variable<bool>(inYourCustody);
    map['child_relationship_type'] = Variable<String>(childRelationshipType);
    map['hidden'] = Variable<bool>(hidden);
    map['paternity_fraud'] = Variable<bool>(paternityFraud);
    map['assumed_relationship_type'] =
        Variable<String>(assumedRelationshipType);
    map['relationship'] = Variable<int>(relationship);
    map['interested_in_relationship'] =
        Variable<bool>(interestedInRelationship);
    return map;
  }

  ChildTableCompanion toCompanion(bool nullToAbsent) {
    return ChildTableCompanion(
      mainPersonId: Value(mainPersonId),
      childId: Value(childId),
      inYourCustody: Value(inYourCustody),
      childRelationshipType: Value(childRelationshipType),
      hidden: Value(hidden),
      paternityFraud: Value(paternityFraud),
      assumedRelationshipType: Value(assumedRelationshipType),
      relationship: Value(relationship),
      interestedInRelationship: Value(interestedInRelationship),
    );
  }

  factory Child.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Child(
      mainPersonId: serializer.fromJson<int>(json['mainPersonId']),
      childId: serializer.fromJson<int>(json['childId']),
      inYourCustody: serializer.fromJson<bool>(json['inYourCustody']),
      childRelationshipType:
          serializer.fromJson<String>(json['childRelationshipType']),
      hidden: serializer.fromJson<bool>(json['hidden']),
      paternityFraud: serializer.fromJson<bool>(json['paternityFraud']),
      assumedRelationshipType:
          serializer.fromJson<String>(json['assumedRelationshipType']),
      relationship: serializer.fromJson<int>(json['relationship']),
      interestedInRelationship:
          serializer.fromJson<bool>(json['interestedInRelationship']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mainPersonId': serializer.toJson<int>(mainPersonId),
      'childId': serializer.toJson<int>(childId),
      'inYourCustody': serializer.toJson<bool>(inYourCustody),
      'childRelationshipType': serializer.toJson<String>(childRelationshipType),
      'hidden': serializer.toJson<bool>(hidden),
      'paternityFraud': serializer.toJson<bool>(paternityFraud),
      'assumedRelationshipType':
          serializer.toJson<String>(assumedRelationshipType),
      'relationship': serializer.toJson<int>(relationship),
      'interestedInRelationship':
          serializer.toJson<bool>(interestedInRelationship),
    };
  }

  Child copyWith(
          {int? mainPersonId,
          int? childId,
          bool? inYourCustody,
          String? childRelationshipType,
          bool? hidden,
          bool? paternityFraud,
          String? assumedRelationshipType,
          int? relationship,
          bool? interestedInRelationship}) =>
      Child(
        mainPersonId: mainPersonId ?? this.mainPersonId,
        childId: childId ?? this.childId,
        inYourCustody: inYourCustody ?? this.inYourCustody,
        childRelationshipType:
            childRelationshipType ?? this.childRelationshipType,
        hidden: hidden ?? this.hidden,
        paternityFraud: paternityFraud ?? this.paternityFraud,
        assumedRelationshipType:
            assumedRelationshipType ?? this.assumedRelationshipType,
        relationship: relationship ?? this.relationship,
        interestedInRelationship:
            interestedInRelationship ?? this.interestedInRelationship,
      );
  @override
  String toString() {
    return (StringBuffer('Child(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('childId: $childId, ')
          ..write('inYourCustody: $inYourCustody, ')
          ..write('childRelationshipType: $childRelationshipType, ')
          ..write('hidden: $hidden, ')
          ..write('paternityFraud: $paternityFraud, ')
          ..write('assumedRelationshipType: $assumedRelationshipType, ')
          ..write('relationship: $relationship, ')
          ..write('interestedInRelationship: $interestedInRelationship')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      mainPersonId,
      childId,
      inYourCustody,
      childRelationshipType,
      hidden,
      paternityFraud,
      assumedRelationshipType,
      relationship,
      interestedInRelationship);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Child &&
          other.mainPersonId == this.mainPersonId &&
          other.childId == this.childId &&
          other.inYourCustody == this.inYourCustody &&
          other.childRelationshipType == this.childRelationshipType &&
          other.hidden == this.hidden &&
          other.paternityFraud == this.paternityFraud &&
          other.assumedRelationshipType == this.assumedRelationshipType &&
          other.relationship == this.relationship &&
          other.interestedInRelationship == this.interestedInRelationship);
}

class ChildTableCompanion extends UpdateCompanion<Child> {
  final Value<int> mainPersonId;
  final Value<int> childId;
  final Value<bool> inYourCustody;
  final Value<String> childRelationshipType;
  final Value<bool> hidden;
  final Value<bool> paternityFraud;
  final Value<String> assumedRelationshipType;
  final Value<int> relationship;
  final Value<bool> interestedInRelationship;
  final Value<int> rowid;
  const ChildTableCompanion({
    this.mainPersonId = const Value.absent(),
    this.childId = const Value.absent(),
    this.inYourCustody = const Value.absent(),
    this.childRelationshipType = const Value.absent(),
    this.hidden = const Value.absent(),
    this.paternityFraud = const Value.absent(),
    this.assumedRelationshipType = const Value.absent(),
    this.relationship = const Value.absent(),
    this.interestedInRelationship = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChildTableCompanion.insert({
    required int mainPersonId,
    required int childId,
    required bool inYourCustody,
    required String childRelationshipType,
    required bool hidden,
    required bool paternityFraud,
    required String assumedRelationshipType,
    required int relationship,
    required bool interestedInRelationship,
    this.rowid = const Value.absent(),
  })  : mainPersonId = Value(mainPersonId),
        childId = Value(childId),
        inYourCustody = Value(inYourCustody),
        childRelationshipType = Value(childRelationshipType),
        hidden = Value(hidden),
        paternityFraud = Value(paternityFraud),
        assumedRelationshipType = Value(assumedRelationshipType),
        relationship = Value(relationship),
        interestedInRelationship = Value(interestedInRelationship);
  static Insertable<Child> custom({
    Expression<int>? mainPersonId,
    Expression<int>? childId,
    Expression<bool>? inYourCustody,
    Expression<String>? childRelationshipType,
    Expression<bool>? hidden,
    Expression<bool>? paternityFraud,
    Expression<String>? assumedRelationshipType,
    Expression<int>? relationship,
    Expression<bool>? interestedInRelationship,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (childId != null) 'child_id': childId,
      if (inYourCustody != null) 'in_your_custody': inYourCustody,
      if (childRelationshipType != null)
        'child_relationship_type': childRelationshipType,
      if (hidden != null) 'hidden': hidden,
      if (paternityFraud != null) 'paternity_fraud': paternityFraud,
      if (assumedRelationshipType != null)
        'assumed_relationship_type': assumedRelationshipType,
      if (relationship != null) 'relationship': relationship,
      if (interestedInRelationship != null)
        'interested_in_relationship': interestedInRelationship,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChildTableCompanion copyWith(
      {Value<int>? mainPersonId,
      Value<int>? childId,
      Value<bool>? inYourCustody,
      Value<String>? childRelationshipType,
      Value<bool>? hidden,
      Value<bool>? paternityFraud,
      Value<String>? assumedRelationshipType,
      Value<int>? relationship,
      Value<bool>? interestedInRelationship,
      Value<int>? rowid}) {
    return ChildTableCompanion(
      mainPersonId: mainPersonId ?? this.mainPersonId,
      childId: childId ?? this.childId,
      inYourCustody: inYourCustody ?? this.inYourCustody,
      childRelationshipType:
          childRelationshipType ?? this.childRelationshipType,
      hidden: hidden ?? this.hidden,
      paternityFraud: paternityFraud ?? this.paternityFraud,
      assumedRelationshipType:
          assumedRelationshipType ?? this.assumedRelationshipType,
      relationship: relationship ?? this.relationship,
      interestedInRelationship:
          interestedInRelationship ?? this.interestedInRelationship,
      rowid: rowid ?? this.rowid,
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
    if (inYourCustody.present) {
      map['in_your_custody'] = Variable<bool>(inYourCustody.value);
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
    if (interestedInRelationship.present) {
      map['interested_in_relationship'] =
          Variable<bool>(interestedInRelationship.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChildTableCompanion(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('childId: $childId, ')
          ..write('inYourCustody: $inYourCustody, ')
          ..write('childRelationshipType: $childRelationshipType, ')
          ..write('hidden: $hidden, ')
          ..write('paternityFraud: $paternityFraud, ')
          ..write('assumedRelationshipType: $assumedRelationshipType, ')
          ..write('relationship: $relationship, ')
          ..write('interestedInRelationship: $interestedInRelationship, ')
          ..write('rowid: $rowid')
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
      GeneratedColumn<bool>(
          'have_romantic_relationship', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("have_romantic_relationship" IN (0, 1))'));
  static const VerificationMeta _relationshipMeta =
      const VerificationMeta('relationship');
  @override
  late final GeneratedColumn<int> relationship = GeneratedColumn<int>(
      'relationship', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _interestedInRelationshipMeta =
      const VerificationMeta('interestedInRelationship');
  @override
  late final GeneratedColumn<bool> interestedInRelationship =
      GeneratedColumn<bool>(
          'interested_in_relationship', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("interested_in_relationship" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        mainPersonId,
        friendId,
        metAt,
        haveRomanticRelationship,
        relationship,
        interestedInRelationship
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'friend';
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
    if (data.containsKey('interested_in_relationship')) {
      context.handle(
          _interestedInRelationshipMeta,
          interestedInRelationship.isAcceptableOrUnknown(
              data['interested_in_relationship']!,
              _interestedInRelationshipMeta));
    } else if (isInserting) {
      context.missing(_interestedInRelationshipMeta);
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
      interestedInRelationship: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}interested_in_relationship'])!,
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
  final bool interestedInRelationship;
  const Friend(
      {required this.mainPersonId,
      required this.friendId,
      required this.metAt,
      required this.haveRomanticRelationship,
      required this.relationship,
      required this.interestedInRelationship});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['main_person_id'] = Variable<int>(mainPersonId);
    map['friend_id'] = Variable<int>(friendId);
    map['met_at'] = Variable<String>(metAt);
    map['have_romantic_relationship'] =
        Variable<bool>(haveRomanticRelationship);
    map['relationship'] = Variable<int>(relationship);
    map['interested_in_relationship'] =
        Variable<bool>(interestedInRelationship);
    return map;
  }

  FriendTableCompanion toCompanion(bool nullToAbsent) {
    return FriendTableCompanion(
      mainPersonId: Value(mainPersonId),
      friendId: Value(friendId),
      metAt: Value(metAt),
      haveRomanticRelationship: Value(haveRomanticRelationship),
      relationship: Value(relationship),
      interestedInRelationship: Value(interestedInRelationship),
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
      interestedInRelationship:
          serializer.fromJson<bool>(json['interestedInRelationship']),
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
      'interestedInRelationship':
          serializer.toJson<bool>(interestedInRelationship),
    };
  }

  Friend copyWith(
          {int? mainPersonId,
          int? friendId,
          String? metAt,
          bool? haveRomanticRelationship,
          int? relationship,
          bool? interestedInRelationship}) =>
      Friend(
        mainPersonId: mainPersonId ?? this.mainPersonId,
        friendId: friendId ?? this.friendId,
        metAt: metAt ?? this.metAt,
        haveRomanticRelationship:
            haveRomanticRelationship ?? this.haveRomanticRelationship,
        relationship: relationship ?? this.relationship,
        interestedInRelationship:
            interestedInRelationship ?? this.interestedInRelationship,
      );
  @override
  String toString() {
    return (StringBuffer('Friend(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('friendId: $friendId, ')
          ..write('metAt: $metAt, ')
          ..write('haveRomanticRelationship: $haveRomanticRelationship, ')
          ..write('relationship: $relationship, ')
          ..write('interestedInRelationship: $interestedInRelationship')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mainPersonId, friendId, metAt,
      haveRomanticRelationship, relationship, interestedInRelationship);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Friend &&
          other.mainPersonId == this.mainPersonId &&
          other.friendId == this.friendId &&
          other.metAt == this.metAt &&
          other.haveRomanticRelationship == this.haveRomanticRelationship &&
          other.relationship == this.relationship &&
          other.interestedInRelationship == this.interestedInRelationship);
}

class FriendTableCompanion extends UpdateCompanion<Friend> {
  final Value<int> mainPersonId;
  final Value<int> friendId;
  final Value<String> metAt;
  final Value<bool> haveRomanticRelationship;
  final Value<int> relationship;
  final Value<bool> interestedInRelationship;
  final Value<int> rowid;
  const FriendTableCompanion({
    this.mainPersonId = const Value.absent(),
    this.friendId = const Value.absent(),
    this.metAt = const Value.absent(),
    this.haveRomanticRelationship = const Value.absent(),
    this.relationship = const Value.absent(),
    this.interestedInRelationship = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FriendTableCompanion.insert({
    required int mainPersonId,
    required int friendId,
    required String metAt,
    required bool haveRomanticRelationship,
    required int relationship,
    required bool interestedInRelationship,
    this.rowid = const Value.absent(),
  })  : mainPersonId = Value(mainPersonId),
        friendId = Value(friendId),
        metAt = Value(metAt),
        haveRomanticRelationship = Value(haveRomanticRelationship),
        relationship = Value(relationship),
        interestedInRelationship = Value(interestedInRelationship);
  static Insertable<Friend> custom({
    Expression<int>? mainPersonId,
    Expression<int>? friendId,
    Expression<String>? metAt,
    Expression<bool>? haveRomanticRelationship,
    Expression<int>? relationship,
    Expression<bool>? interestedInRelationship,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (friendId != null) 'friend_id': friendId,
      if (metAt != null) 'met_at': metAt,
      if (haveRomanticRelationship != null)
        'have_romantic_relationship': haveRomanticRelationship,
      if (relationship != null) 'relationship': relationship,
      if (interestedInRelationship != null)
        'interested_in_relationship': interestedInRelationship,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FriendTableCompanion copyWith(
      {Value<int>? mainPersonId,
      Value<int>? friendId,
      Value<String>? metAt,
      Value<bool>? haveRomanticRelationship,
      Value<int>? relationship,
      Value<bool>? interestedInRelationship,
      Value<int>? rowid}) {
    return FriendTableCompanion(
      mainPersonId: mainPersonId ?? this.mainPersonId,
      friendId: friendId ?? this.friendId,
      metAt: metAt ?? this.metAt,
      haveRomanticRelationship:
          haveRomanticRelationship ?? this.haveRomanticRelationship,
      relationship: relationship ?? this.relationship,
      interestedInRelationship:
          interestedInRelationship ?? this.interestedInRelationship,
      rowid: rowid ?? this.rowid,
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
    if (interestedInRelationship.present) {
      map['interested_in_relationship'] =
          Variable<bool>(interestedInRelationship.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
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
          ..write('interestedInRelationship: $interestedInRelationship, ')
          ..write('rowid: $rowid')
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
  static const VerificationMeta _relationshipLabelMeta =
      const VerificationMeta('relationshipLabel');
  @override
  late final GeneratedColumn<String> relationshipLabel =
      GeneratedColumn<String>('relationship_label', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _relationshipLevelMeta =
      const VerificationMeta('relationshipLevel');
  @override
  late final GeneratedColumn<int> relationshipLevel = GeneratedColumn<int>(
      'relationship_level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [mainPersonId, deadPersonId, relationshipLabel, relationshipLevel];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'grave';
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
    if (data.containsKey('relationship_label')) {
      context.handle(
          _relationshipLabelMeta,
          relationshipLabel.isAcceptableOrUnknown(
              data['relationship_label']!, _relationshipLabelMeta));
    } else if (isInserting) {
      context.missing(_relationshipLabelMeta);
    }
    if (data.containsKey('relationship_level')) {
      context.handle(
          _relationshipLevelMeta,
          relationshipLevel.isAcceptableOrUnknown(
              data['relationship_level']!, _relationshipLevelMeta));
    } else if (isInserting) {
      context.missing(_relationshipLevelMeta);
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
      relationshipLabel: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}relationship_label'])!,
      relationshipLevel: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}relationship_level'])!,
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
  final String relationshipLabel;
  final int relationshipLevel;
  const Grave(
      {required this.mainPersonId,
      required this.deadPersonId,
      required this.relationshipLabel,
      required this.relationshipLevel});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['main_person_id'] = Variable<int>(mainPersonId);
    map['dead_person_id'] = Variable<int>(deadPersonId);
    map['relationship_label'] = Variable<String>(relationshipLabel);
    map['relationship_level'] = Variable<int>(relationshipLevel);
    return map;
  }

  GraveTableCompanion toCompanion(bool nullToAbsent) {
    return GraveTableCompanion(
      mainPersonId: Value(mainPersonId),
      deadPersonId: Value(deadPersonId),
      relationshipLabel: Value(relationshipLabel),
      relationshipLevel: Value(relationshipLevel),
    );
  }

  factory Grave.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Grave(
      mainPersonId: serializer.fromJson<int>(json['mainPersonId']),
      deadPersonId: serializer.fromJson<int>(json['deadPersonId']),
      relationshipLabel: serializer.fromJson<String>(json['relationshipLabel']),
      relationshipLevel: serializer.fromJson<int>(json['relationshipLevel']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mainPersonId': serializer.toJson<int>(mainPersonId),
      'deadPersonId': serializer.toJson<int>(deadPersonId),
      'relationshipLabel': serializer.toJson<String>(relationshipLabel),
      'relationshipLevel': serializer.toJson<int>(relationshipLevel),
    };
  }

  Grave copyWith(
          {int? mainPersonId,
          int? deadPersonId,
          String? relationshipLabel,
          int? relationshipLevel}) =>
      Grave(
        mainPersonId: mainPersonId ?? this.mainPersonId,
        deadPersonId: deadPersonId ?? this.deadPersonId,
        relationshipLabel: relationshipLabel ?? this.relationshipLabel,
        relationshipLevel: relationshipLevel ?? this.relationshipLevel,
      );
  @override
  String toString() {
    return (StringBuffer('Grave(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('deadPersonId: $deadPersonId, ')
          ..write('relationshipLabel: $relationshipLabel, ')
          ..write('relationshipLevel: $relationshipLevel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      mainPersonId, deadPersonId, relationshipLabel, relationshipLevel);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Grave &&
          other.mainPersonId == this.mainPersonId &&
          other.deadPersonId == this.deadPersonId &&
          other.relationshipLabel == this.relationshipLabel &&
          other.relationshipLevel == this.relationshipLevel);
}

class GraveTableCompanion extends UpdateCompanion<Grave> {
  final Value<int> mainPersonId;
  final Value<int> deadPersonId;
  final Value<String> relationshipLabel;
  final Value<int> relationshipLevel;
  final Value<int> rowid;
  const GraveTableCompanion({
    this.mainPersonId = const Value.absent(),
    this.deadPersonId = const Value.absent(),
    this.relationshipLabel = const Value.absent(),
    this.relationshipLevel = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GraveTableCompanion.insert({
    required int mainPersonId,
    required int deadPersonId,
    required String relationshipLabel,
    required int relationshipLevel,
    this.rowid = const Value.absent(),
  })  : mainPersonId = Value(mainPersonId),
        deadPersonId = Value(deadPersonId),
        relationshipLabel = Value(relationshipLabel),
        relationshipLevel = Value(relationshipLevel);
  static Insertable<Grave> custom({
    Expression<int>? mainPersonId,
    Expression<int>? deadPersonId,
    Expression<String>? relationshipLabel,
    Expression<int>? relationshipLevel,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (deadPersonId != null) 'dead_person_id': deadPersonId,
      if (relationshipLabel != null) 'relationship_label': relationshipLabel,
      if (relationshipLevel != null) 'relationship_level': relationshipLevel,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GraveTableCompanion copyWith(
      {Value<int>? mainPersonId,
      Value<int>? deadPersonId,
      Value<String>? relationshipLabel,
      Value<int>? relationshipLevel,
      Value<int>? rowid}) {
    return GraveTableCompanion(
      mainPersonId: mainPersonId ?? this.mainPersonId,
      deadPersonId: deadPersonId ?? this.deadPersonId,
      relationshipLabel: relationshipLabel ?? this.relationshipLabel,
      relationshipLevel: relationshipLevel ?? this.relationshipLevel,
      rowid: rowid ?? this.rowid,
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
    if (relationshipLabel.present) {
      map['relationship_label'] = Variable<String>(relationshipLabel.value);
    }
    if (relationshipLevel.present) {
      map['relationship_level'] = Variable<int>(relationshipLevel.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GraveTableCompanion(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('deadPersonId: $deadPersonId, ')
          ..write('relationshipLabel: $relationshipLabel, ')
          ..write('relationshipLevel: $relationshipLevel, ')
          ..write('rowid: $rowid')
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
  late final GeneratedColumn<bool> likesMainPerson = GeneratedColumn<bool>(
      'likes_main_person', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("likes_main_person" IN (0, 1))'));
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
      GeneratedColumn<bool>(
          'have_romantic_relationship', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("have_romantic_relationship" IN (0, 1))'));
  static const VerificationMeta _relationshipMeta =
      const VerificationMeta('relationship');
  @override
  late final GeneratedColumn<int> relationship = GeneratedColumn<int>(
      'relationship', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _interestedInRelationshipMeta =
      const VerificationMeta('interestedInRelationship');
  @override
  late final GeneratedColumn<bool> interestedInRelationship =
      GeneratedColumn<bool>(
          'interested_in_relationship', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("interested_in_relationship" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        mainPersonId,
        inLawId,
        likesMainPerson,
        inLawRelationshipType,
        haveRomanticRelationship,
        relationship,
        interestedInRelationship
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inlaw';
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
    if (data.containsKey('interested_in_relationship')) {
      context.handle(
          _interestedInRelationshipMeta,
          interestedInRelationship.isAcceptableOrUnknown(
              data['interested_in_relationship']!,
              _interestedInRelationshipMeta));
    } else if (isInserting) {
      context.missing(_interestedInRelationshipMeta);
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
      interestedInRelationship: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}interested_in_relationship'])!,
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
  final bool interestedInRelationship;
  const InLaw(
      {required this.mainPersonId,
      required this.inLawId,
      required this.likesMainPerson,
      required this.inLawRelationshipType,
      required this.haveRomanticRelationship,
      required this.relationship,
      required this.interestedInRelationship});
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
    map['interested_in_relationship'] =
        Variable<bool>(interestedInRelationship);
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
      interestedInRelationship: Value(interestedInRelationship),
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
      interestedInRelationship:
          serializer.fromJson<bool>(json['interestedInRelationship']),
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
      'interestedInRelationship':
          serializer.toJson<bool>(interestedInRelationship),
    };
  }

  InLaw copyWith(
          {int? mainPersonId,
          int? inLawId,
          bool? likesMainPerson,
          String? inLawRelationshipType,
          bool? haveRomanticRelationship,
          int? relationship,
          bool? interestedInRelationship}) =>
      InLaw(
        mainPersonId: mainPersonId ?? this.mainPersonId,
        inLawId: inLawId ?? this.inLawId,
        likesMainPerson: likesMainPerson ?? this.likesMainPerson,
        inLawRelationshipType:
            inLawRelationshipType ?? this.inLawRelationshipType,
        haveRomanticRelationship:
            haveRomanticRelationship ?? this.haveRomanticRelationship,
        relationship: relationship ?? this.relationship,
        interestedInRelationship:
            interestedInRelationship ?? this.interestedInRelationship,
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
          ..write('interestedInRelationship: $interestedInRelationship')
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
      interestedInRelationship);
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
          other.interestedInRelationship == this.interestedInRelationship);
}

class InLawTableCompanion extends UpdateCompanion<InLaw> {
  final Value<int> mainPersonId;
  final Value<int> inLawId;
  final Value<bool> likesMainPerson;
  final Value<String> inLawRelationshipType;
  final Value<bool> haveRomanticRelationship;
  final Value<int> relationship;
  final Value<bool> interestedInRelationship;
  final Value<int> rowid;
  const InLawTableCompanion({
    this.mainPersonId = const Value.absent(),
    this.inLawId = const Value.absent(),
    this.likesMainPerson = const Value.absent(),
    this.inLawRelationshipType = const Value.absent(),
    this.haveRomanticRelationship = const Value.absent(),
    this.relationship = const Value.absent(),
    this.interestedInRelationship = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InLawTableCompanion.insert({
    required int mainPersonId,
    required int inLawId,
    required bool likesMainPerson,
    required String inLawRelationshipType,
    required bool haveRomanticRelationship,
    required int relationship,
    required bool interestedInRelationship,
    this.rowid = const Value.absent(),
  })  : mainPersonId = Value(mainPersonId),
        inLawId = Value(inLawId),
        likesMainPerson = Value(likesMainPerson),
        inLawRelationshipType = Value(inLawRelationshipType),
        haveRomanticRelationship = Value(haveRomanticRelationship),
        relationship = Value(relationship),
        interestedInRelationship = Value(interestedInRelationship);
  static Insertable<InLaw> custom({
    Expression<int>? mainPersonId,
    Expression<int>? inLawId,
    Expression<bool>? likesMainPerson,
    Expression<String>? inLawRelationshipType,
    Expression<bool>? haveRomanticRelationship,
    Expression<int>? relationship,
    Expression<bool>? interestedInRelationship,
    Expression<int>? rowid,
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
      if (interestedInRelationship != null)
        'interested_in_relationship': interestedInRelationship,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InLawTableCompanion copyWith(
      {Value<int>? mainPersonId,
      Value<int>? inLawId,
      Value<bool>? likesMainPerson,
      Value<String>? inLawRelationshipType,
      Value<bool>? haveRomanticRelationship,
      Value<int>? relationship,
      Value<bool>? interestedInRelationship,
      Value<int>? rowid}) {
    return InLawTableCompanion(
      mainPersonId: mainPersonId ?? this.mainPersonId,
      inLawId: inLawId ?? this.inLawId,
      likesMainPerson: likesMainPerson ?? this.likesMainPerson,
      inLawRelationshipType:
          inLawRelationshipType ?? this.inLawRelationshipType,
      haveRomanticRelationship:
          haveRomanticRelationship ?? this.haveRomanticRelationship,
      relationship: relationship ?? this.relationship,
      interestedInRelationship:
          interestedInRelationship ?? this.interestedInRelationship,
      rowid: rowid ?? this.rowid,
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
    if (interestedInRelationship.present) {
      map['interested_in_relationship'] =
          Variable<bool>(interestedInRelationship.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
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
          ..write('interestedInRelationship: $interestedInRelationship, ')
          ..write('rowid: $rowid')
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
  late final GeneratedColumn<bool> hidden = GeneratedColumn<bool>(
      'hidden', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("hidden" IN (0, 1))'));
  static const VerificationMeta _paternityFraudMeta =
      const VerificationMeta('paternityFraud');
  @override
  late final GeneratedColumn<bool> paternityFraud = GeneratedColumn<bool>(
      'paternity_fraud', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("paternity_fraud" IN (0, 1))'));
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
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'));
  static const VerificationMeta _interestedInRelationshipMeta =
      const VerificationMeta('interestedInRelationship');
  @override
  late final GeneratedColumn<bool> interestedInRelationship =
      GeneratedColumn<bool>(
          'interested_in_relationship', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("interested_in_relationship" IN (0, 1))'));
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
        interestedInRelationship
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parent';
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
    if (data.containsKey('interested_in_relationship')) {
      context.handle(
          _interestedInRelationshipMeta,
          interestedInRelationship.isAcceptableOrUnknown(
              data['interested_in_relationship']!,
              _interestedInRelationshipMeta));
    } else if (isInserting) {
      context.missing(_interestedInRelationshipMeta);
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
      interestedInRelationship: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}interested_in_relationship'])!,
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
  final bool interestedInRelationship;
  const Parent(
      {required this.mainPersonId,
      required this.parentId,
      required this.parentRelationshipType,
      required this.hidden,
      required this.paternityFraud,
      required this.assumedRelationshipType,
      required this.relationship,
      required this.isActive,
      required this.interestedInRelationship});
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
    map['interested_in_relationship'] =
        Variable<bool>(interestedInRelationship);
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
      interestedInRelationship: Value(interestedInRelationship),
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
      interestedInRelationship:
          serializer.fromJson<bool>(json['interestedInRelationship']),
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
      'interestedInRelationship':
          serializer.toJson<bool>(interestedInRelationship),
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
          bool? interestedInRelationship}) =>
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
        interestedInRelationship:
            interestedInRelationship ?? this.interestedInRelationship,
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
          ..write('interestedInRelationship: $interestedInRelationship')
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
      interestedInRelationship);
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
          other.interestedInRelationship == this.interestedInRelationship);
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
  final Value<bool> interestedInRelationship;
  final Value<int> rowid;
  const ParentTableCompanion({
    this.mainPersonId = const Value.absent(),
    this.parentId = const Value.absent(),
    this.parentRelationshipType = const Value.absent(),
    this.hidden = const Value.absent(),
    this.paternityFraud = const Value.absent(),
    this.assumedRelationshipType = const Value.absent(),
    this.relationship = const Value.absent(),
    this.isActive = const Value.absent(),
    this.interestedInRelationship = const Value.absent(),
    this.rowid = const Value.absent(),
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
    required bool interestedInRelationship,
    this.rowid = const Value.absent(),
  })  : mainPersonId = Value(mainPersonId),
        parentId = Value(parentId),
        parentRelationshipType = Value(parentRelationshipType),
        hidden = Value(hidden),
        paternityFraud = Value(paternityFraud),
        assumedRelationshipType = Value(assumedRelationshipType),
        relationship = Value(relationship),
        isActive = Value(isActive),
        interestedInRelationship = Value(interestedInRelationship);
  static Insertable<Parent> custom({
    Expression<int>? mainPersonId,
    Expression<int>? parentId,
    Expression<String>? parentRelationshipType,
    Expression<bool>? hidden,
    Expression<bool>? paternityFraud,
    Expression<String>? assumedRelationshipType,
    Expression<int>? relationship,
    Expression<bool>? isActive,
    Expression<bool>? interestedInRelationship,
    Expression<int>? rowid,
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
      if (interestedInRelationship != null)
        'interested_in_relationship': interestedInRelationship,
      if (rowid != null) 'rowid': rowid,
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
      Value<bool>? interestedInRelationship,
      Value<int>? rowid}) {
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
      interestedInRelationship:
          interestedInRelationship ?? this.interestedInRelationship,
      rowid: rowid ?? this.rowid,
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
    if (interestedInRelationship.present) {
      map['interested_in_relationship'] =
          Variable<bool>(interestedInRelationship.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
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
          ..write('interestedInRelationship: $interestedInRelationship, ')
          ..write('rowid: $rowid')
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
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'));
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
  static const VerificationMeta _daysToDateBeforeMarriageMeta =
      const VerificationMeta('daysToDateBeforeMarriage');
  @override
  late final GeneratedColumn<int> daysToDateBeforeMarriage =
      GeneratedColumn<int>('days_to_date_before_marriage', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isCoParentMeta =
      const VerificationMeta('isCoParent');
  @override
  late final GeneratedColumn<bool> isCoParent = GeneratedColumn<bool>(
      'is_co_parent', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_co_parent" IN (0, 1))'));
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
  static const VerificationMeta _interestedInRelationshipMeta =
      const VerificationMeta('interestedInRelationship');
  @override
  late final GeneratedColumn<bool> interestedInRelationship =
      GeneratedColumn<bool>(
          'interested_in_relationship', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("interested_in_relationship" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        mainPersonId,
        partnerId,
        partnerRelationshipType,
        isActive,
        jointMoney,
        startDay,
        endDay,
        daysToDateBeforeMarriage,
        isCoParent,
        metAt,
        relationship,
        interestedInRelationship
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'partner';
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
    if (data.containsKey('days_to_date_before_marriage')) {
      context.handle(
          _daysToDateBeforeMarriageMeta,
          daysToDateBeforeMarriage.isAcceptableOrUnknown(
              data['days_to_date_before_marriage']!,
              _daysToDateBeforeMarriageMeta));
    } else if (isInserting) {
      context.missing(_daysToDateBeforeMarriageMeta);
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
    if (data.containsKey('interested_in_relationship')) {
      context.handle(
          _interestedInRelationshipMeta,
          interestedInRelationship.isAcceptableOrUnknown(
              data['interested_in_relationship']!,
              _interestedInRelationshipMeta));
    } else if (isInserting) {
      context.missing(_interestedInRelationshipMeta);
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
      daysToDateBeforeMarriage: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}days_to_date_before_marriage'])!,
      isCoParent: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_co_parent'])!,
      metAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}met_at'])!,
      relationship: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}relationship'])!,
      interestedInRelationship: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}interested_in_relationship'])!,
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
  final int daysToDateBeforeMarriage;
  final bool isCoParent;
  final String metAt;
  final int relationship;
  final bool interestedInRelationship;
  const Partner(
      {required this.mainPersonId,
      required this.partnerId,
      required this.partnerRelationshipType,
      required this.isActive,
      required this.jointMoney,
      required this.startDay,
      required this.endDay,
      required this.daysToDateBeforeMarriage,
      required this.isCoParent,
      required this.metAt,
      required this.relationship,
      required this.interestedInRelationship});
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
    map['days_to_date_before_marriage'] =
        Variable<int>(daysToDateBeforeMarriage);
    map['is_co_parent'] = Variable<bool>(isCoParent);
    map['met_at'] = Variable<String>(metAt);
    map['relationship'] = Variable<int>(relationship);
    map['interested_in_relationship'] =
        Variable<bool>(interestedInRelationship);
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
      daysToDateBeforeMarriage: Value(daysToDateBeforeMarriage),
      isCoParent: Value(isCoParent),
      metAt: Value(metAt),
      relationship: Value(relationship),
      interestedInRelationship: Value(interestedInRelationship),
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
      daysToDateBeforeMarriage:
          serializer.fromJson<int>(json['daysToDateBeforeMarriage']),
      isCoParent: serializer.fromJson<bool>(json['isCoParent']),
      metAt: serializer.fromJson<String>(json['metAt']),
      relationship: serializer.fromJson<int>(json['relationship']),
      interestedInRelationship:
          serializer.fromJson<bool>(json['interestedInRelationship']),
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
      'daysToDateBeforeMarriage':
          serializer.toJson<int>(daysToDateBeforeMarriage),
      'isCoParent': serializer.toJson<bool>(isCoParent),
      'metAt': serializer.toJson<String>(metAt),
      'relationship': serializer.toJson<int>(relationship),
      'interestedInRelationship':
          serializer.toJson<bool>(interestedInRelationship),
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
          int? daysToDateBeforeMarriage,
          bool? isCoParent,
          String? metAt,
          int? relationship,
          bool? interestedInRelationship}) =>
      Partner(
        mainPersonId: mainPersonId ?? this.mainPersonId,
        partnerId: partnerId ?? this.partnerId,
        partnerRelationshipType:
            partnerRelationshipType ?? this.partnerRelationshipType,
        isActive: isActive ?? this.isActive,
        jointMoney: jointMoney ?? this.jointMoney,
        startDay: startDay ?? this.startDay,
        endDay: endDay ?? this.endDay,
        daysToDateBeforeMarriage:
            daysToDateBeforeMarriage ?? this.daysToDateBeforeMarriage,
        isCoParent: isCoParent ?? this.isCoParent,
        metAt: metAt ?? this.metAt,
        relationship: relationship ?? this.relationship,
        interestedInRelationship:
            interestedInRelationship ?? this.interestedInRelationship,
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
          ..write('daysToDateBeforeMarriage: $daysToDateBeforeMarriage, ')
          ..write('isCoParent: $isCoParent, ')
          ..write('metAt: $metAt, ')
          ..write('relationship: $relationship, ')
          ..write('interestedInRelationship: $interestedInRelationship')
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
      daysToDateBeforeMarriage,
      isCoParent,
      metAt,
      relationship,
      interestedInRelationship);
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
          other.daysToDateBeforeMarriage == this.daysToDateBeforeMarriage &&
          other.isCoParent == this.isCoParent &&
          other.metAt == this.metAt &&
          other.relationship == this.relationship &&
          other.interestedInRelationship == this.interestedInRelationship);
}

class PartnerTableCompanion extends UpdateCompanion<Partner> {
  final Value<int> mainPersonId;
  final Value<int> partnerId;
  final Value<String> partnerRelationshipType;
  final Value<bool> isActive;
  final Value<int> jointMoney;
  final Value<int> startDay;
  final Value<int> endDay;
  final Value<int> daysToDateBeforeMarriage;
  final Value<bool> isCoParent;
  final Value<String> metAt;
  final Value<int> relationship;
  final Value<bool> interestedInRelationship;
  final Value<int> rowid;
  const PartnerTableCompanion({
    this.mainPersonId = const Value.absent(),
    this.partnerId = const Value.absent(),
    this.partnerRelationshipType = const Value.absent(),
    this.isActive = const Value.absent(),
    this.jointMoney = const Value.absent(),
    this.startDay = const Value.absent(),
    this.endDay = const Value.absent(),
    this.daysToDateBeforeMarriage = const Value.absent(),
    this.isCoParent = const Value.absent(),
    this.metAt = const Value.absent(),
    this.relationship = const Value.absent(),
    this.interestedInRelationship = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PartnerTableCompanion.insert({
    required int mainPersonId,
    required int partnerId,
    required String partnerRelationshipType,
    required bool isActive,
    required int jointMoney,
    required int startDay,
    required int endDay,
    required int daysToDateBeforeMarriage,
    required bool isCoParent,
    required String metAt,
    required int relationship,
    required bool interestedInRelationship,
    this.rowid = const Value.absent(),
  })  : mainPersonId = Value(mainPersonId),
        partnerId = Value(partnerId),
        partnerRelationshipType = Value(partnerRelationshipType),
        isActive = Value(isActive),
        jointMoney = Value(jointMoney),
        startDay = Value(startDay),
        endDay = Value(endDay),
        daysToDateBeforeMarriage = Value(daysToDateBeforeMarriage),
        isCoParent = Value(isCoParent),
        metAt = Value(metAt),
        relationship = Value(relationship),
        interestedInRelationship = Value(interestedInRelationship);
  static Insertable<Partner> custom({
    Expression<int>? mainPersonId,
    Expression<int>? partnerId,
    Expression<String>? partnerRelationshipType,
    Expression<bool>? isActive,
    Expression<int>? jointMoney,
    Expression<int>? startDay,
    Expression<int>? endDay,
    Expression<int>? daysToDateBeforeMarriage,
    Expression<bool>? isCoParent,
    Expression<String>? metAt,
    Expression<int>? relationship,
    Expression<bool>? interestedInRelationship,
    Expression<int>? rowid,
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
      if (daysToDateBeforeMarriage != null)
        'days_to_date_before_marriage': daysToDateBeforeMarriage,
      if (isCoParent != null) 'is_co_parent': isCoParent,
      if (metAt != null) 'met_at': metAt,
      if (relationship != null) 'relationship': relationship,
      if (interestedInRelationship != null)
        'interested_in_relationship': interestedInRelationship,
      if (rowid != null) 'rowid': rowid,
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
      Value<int>? daysToDateBeforeMarriage,
      Value<bool>? isCoParent,
      Value<String>? metAt,
      Value<int>? relationship,
      Value<bool>? interestedInRelationship,
      Value<int>? rowid}) {
    return PartnerTableCompanion(
      mainPersonId: mainPersonId ?? this.mainPersonId,
      partnerId: partnerId ?? this.partnerId,
      partnerRelationshipType:
          partnerRelationshipType ?? this.partnerRelationshipType,
      isActive: isActive ?? this.isActive,
      jointMoney: jointMoney ?? this.jointMoney,
      startDay: startDay ?? this.startDay,
      endDay: endDay ?? this.endDay,
      daysToDateBeforeMarriage:
          daysToDateBeforeMarriage ?? this.daysToDateBeforeMarriage,
      isCoParent: isCoParent ?? this.isCoParent,
      metAt: metAt ?? this.metAt,
      relationship: relationship ?? this.relationship,
      interestedInRelationship:
          interestedInRelationship ?? this.interestedInRelationship,
      rowid: rowid ?? this.rowid,
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
    if (daysToDateBeforeMarriage.present) {
      map['days_to_date_before_marriage'] =
          Variable<int>(daysToDateBeforeMarriage.value);
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
    if (interestedInRelationship.present) {
      map['interested_in_relationship'] =
          Variable<bool>(interestedInRelationship.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
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
          ..write('daysToDateBeforeMarriage: $daysToDateBeforeMarriage, ')
          ..write('isCoParent: $isCoParent, ')
          ..write('metAt: $metAt, ')
          ..write('relationship: $relationship, ')
          ..write('interestedInRelationship: $interestedInRelationship, ')
          ..write('rowid: $rowid')
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
  static const VerificationMeta _inYourCustodyMeta =
      const VerificationMeta('inYourCustody');
  @override
  late final GeneratedColumn<bool> inYourCustody = GeneratedColumn<bool>(
      'in_your_custody', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("in_your_custody" IN (0, 1))'));
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
  static const VerificationMeta _interestedInRelationshipMeta =
      const VerificationMeta('interestedInRelationship');
  @override
  late final GeneratedColumn<bool> interestedInRelationship =
      GeneratedColumn<bool>(
          'interested_in_relationship', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("interested_in_relationship" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        mainPersonId,
        relativeId,
        inYourCustody,
        relativeRelationshipType,
        relationship,
        interestedInRelationship
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'relative';
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
    if (data.containsKey('in_your_custody')) {
      context.handle(
          _inYourCustodyMeta,
          inYourCustody.isAcceptableOrUnknown(
              data['in_your_custody']!, _inYourCustodyMeta));
    } else if (isInserting) {
      context.missing(_inYourCustodyMeta);
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
    if (data.containsKey('interested_in_relationship')) {
      context.handle(
          _interestedInRelationshipMeta,
          interestedInRelationship.isAcceptableOrUnknown(
              data['interested_in_relationship']!,
              _interestedInRelationshipMeta));
    } else if (isInserting) {
      context.missing(_interestedInRelationshipMeta);
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
      inYourCustody: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}in_your_custody'])!,
      relativeRelationshipType: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}relative_relationship_type'])!,
      relationship: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}relationship'])!,
      interestedInRelationship: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}interested_in_relationship'])!,
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
  final bool inYourCustody;
  final String relativeRelationshipType;
  final int relationship;
  final bool interestedInRelationship;
  const Relative(
      {required this.mainPersonId,
      required this.relativeId,
      required this.inYourCustody,
      required this.relativeRelationshipType,
      required this.relationship,
      required this.interestedInRelationship});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['main_person_id'] = Variable<int>(mainPersonId);
    map['relative_id'] = Variable<int>(relativeId);
    map['in_your_custody'] = Variable<bool>(inYourCustody);
    map['relative_relationship_type'] =
        Variable<String>(relativeRelationshipType);
    map['relationship'] = Variable<int>(relationship);
    map['interested_in_relationship'] =
        Variable<bool>(interestedInRelationship);
    return map;
  }

  RelativeTableCompanion toCompanion(bool nullToAbsent) {
    return RelativeTableCompanion(
      mainPersonId: Value(mainPersonId),
      relativeId: Value(relativeId),
      inYourCustody: Value(inYourCustody),
      relativeRelationshipType: Value(relativeRelationshipType),
      relationship: Value(relationship),
      interestedInRelationship: Value(interestedInRelationship),
    );
  }

  factory Relative.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Relative(
      mainPersonId: serializer.fromJson<int>(json['mainPersonId']),
      relativeId: serializer.fromJson<int>(json['relativeId']),
      inYourCustody: serializer.fromJson<bool>(json['inYourCustody']),
      relativeRelationshipType:
          serializer.fromJson<String>(json['relativeRelationshipType']),
      relationship: serializer.fromJson<int>(json['relationship']),
      interestedInRelationship:
          serializer.fromJson<bool>(json['interestedInRelationship']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mainPersonId': serializer.toJson<int>(mainPersonId),
      'relativeId': serializer.toJson<int>(relativeId),
      'inYourCustody': serializer.toJson<bool>(inYourCustody),
      'relativeRelationshipType':
          serializer.toJson<String>(relativeRelationshipType),
      'relationship': serializer.toJson<int>(relationship),
      'interestedInRelationship':
          serializer.toJson<bool>(interestedInRelationship),
    };
  }

  Relative copyWith(
          {int? mainPersonId,
          int? relativeId,
          bool? inYourCustody,
          String? relativeRelationshipType,
          int? relationship,
          bool? interestedInRelationship}) =>
      Relative(
        mainPersonId: mainPersonId ?? this.mainPersonId,
        relativeId: relativeId ?? this.relativeId,
        inYourCustody: inYourCustody ?? this.inYourCustody,
        relativeRelationshipType:
            relativeRelationshipType ?? this.relativeRelationshipType,
        relationship: relationship ?? this.relationship,
        interestedInRelationship:
            interestedInRelationship ?? this.interestedInRelationship,
      );
  @override
  String toString() {
    return (StringBuffer('Relative(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('relativeId: $relativeId, ')
          ..write('inYourCustody: $inYourCustody, ')
          ..write('relativeRelationshipType: $relativeRelationshipType, ')
          ..write('relationship: $relationship, ')
          ..write('interestedInRelationship: $interestedInRelationship')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mainPersonId, relativeId, inYourCustody,
      relativeRelationshipType, relationship, interestedInRelationship);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Relative &&
          other.mainPersonId == this.mainPersonId &&
          other.relativeId == this.relativeId &&
          other.inYourCustody == this.inYourCustody &&
          other.relativeRelationshipType == this.relativeRelationshipType &&
          other.relationship == this.relationship &&
          other.interestedInRelationship == this.interestedInRelationship);
}

class RelativeTableCompanion extends UpdateCompanion<Relative> {
  final Value<int> mainPersonId;
  final Value<int> relativeId;
  final Value<bool> inYourCustody;
  final Value<String> relativeRelationshipType;
  final Value<int> relationship;
  final Value<bool> interestedInRelationship;
  final Value<int> rowid;
  const RelativeTableCompanion({
    this.mainPersonId = const Value.absent(),
    this.relativeId = const Value.absent(),
    this.inYourCustody = const Value.absent(),
    this.relativeRelationshipType = const Value.absent(),
    this.relationship = const Value.absent(),
    this.interestedInRelationship = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RelativeTableCompanion.insert({
    required int mainPersonId,
    required int relativeId,
    required bool inYourCustody,
    required String relativeRelationshipType,
    required int relationship,
    required bool interestedInRelationship,
    this.rowid = const Value.absent(),
  })  : mainPersonId = Value(mainPersonId),
        relativeId = Value(relativeId),
        inYourCustody = Value(inYourCustody),
        relativeRelationshipType = Value(relativeRelationshipType),
        relationship = Value(relationship),
        interestedInRelationship = Value(interestedInRelationship);
  static Insertable<Relative> custom({
    Expression<int>? mainPersonId,
    Expression<int>? relativeId,
    Expression<bool>? inYourCustody,
    Expression<String>? relativeRelationshipType,
    Expression<int>? relationship,
    Expression<bool>? interestedInRelationship,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (relativeId != null) 'relative_id': relativeId,
      if (inYourCustody != null) 'in_your_custody': inYourCustody,
      if (relativeRelationshipType != null)
        'relative_relationship_type': relativeRelationshipType,
      if (relationship != null) 'relationship': relationship,
      if (interestedInRelationship != null)
        'interested_in_relationship': interestedInRelationship,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RelativeTableCompanion copyWith(
      {Value<int>? mainPersonId,
      Value<int>? relativeId,
      Value<bool>? inYourCustody,
      Value<String>? relativeRelationshipType,
      Value<int>? relationship,
      Value<bool>? interestedInRelationship,
      Value<int>? rowid}) {
    return RelativeTableCompanion(
      mainPersonId: mainPersonId ?? this.mainPersonId,
      relativeId: relativeId ?? this.relativeId,
      inYourCustody: inYourCustody ?? this.inYourCustody,
      relativeRelationshipType:
          relativeRelationshipType ?? this.relativeRelationshipType,
      relationship: relationship ?? this.relationship,
      interestedInRelationship:
          interestedInRelationship ?? this.interestedInRelationship,
      rowid: rowid ?? this.rowid,
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
    if (inYourCustody.present) {
      map['in_your_custody'] = Variable<bool>(inYourCustody.value);
    }
    if (relativeRelationshipType.present) {
      map['relative_relationship_type'] =
          Variable<String>(relativeRelationshipType.value);
    }
    if (relationship.present) {
      map['relationship'] = Variable<int>(relationship.value);
    }
    if (interestedInRelationship.present) {
      map['interested_in_relationship'] =
          Variable<bool>(interestedInRelationship.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelativeTableCompanion(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('relativeId: $relativeId, ')
          ..write('inYourCustody: $inYourCustody, ')
          ..write('relativeRelationshipType: $relativeRelationshipType, ')
          ..write('relationship: $relationship, ')
          ..write('interestedInRelationship: $interestedInRelationship, ')
          ..write('rowid: $rowid')
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
  static const VerificationMeta _inYourCustodyMeta =
      const VerificationMeta('inYourCustody');
  @override
  late final GeneratedColumn<bool> inYourCustody = GeneratedColumn<bool>(
      'in_your_custody', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("in_your_custody" IN (0, 1))'));
  static const VerificationMeta _interestedInRelationshipMeta =
      const VerificationMeta('interestedInRelationship');
  @override
  late final GeneratedColumn<bool> interestedInRelationship =
      GeneratedColumn<bool>(
          'interested_in_relationship', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("interested_in_relationship" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        mainPersonId,
        siblingId,
        siblingRelationshipType,
        relationship,
        inYourCustody,
        interestedInRelationship
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sibling';
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
    if (data.containsKey('in_your_custody')) {
      context.handle(
          _inYourCustodyMeta,
          inYourCustody.isAcceptableOrUnknown(
              data['in_your_custody']!, _inYourCustodyMeta));
    } else if (isInserting) {
      context.missing(_inYourCustodyMeta);
    }
    if (data.containsKey('interested_in_relationship')) {
      context.handle(
          _interestedInRelationshipMeta,
          interestedInRelationship.isAcceptableOrUnknown(
              data['interested_in_relationship']!,
              _interestedInRelationshipMeta));
    } else if (isInserting) {
      context.missing(_interestedInRelationshipMeta);
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
      inYourCustody: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}in_your_custody'])!,
      interestedInRelationship: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}interested_in_relationship'])!,
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
  final bool inYourCustody;
  final bool interestedInRelationship;
  const Sibling(
      {required this.mainPersonId,
      required this.siblingId,
      required this.siblingRelationshipType,
      required this.relationship,
      required this.inYourCustody,
      required this.interestedInRelationship});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['main_person_id'] = Variable<int>(mainPersonId);
    map['sibling_id'] = Variable<int>(siblingId);
    map['sibling_relationship_type'] =
        Variable<String>(siblingRelationshipType);
    map['relationship'] = Variable<int>(relationship);
    map['in_your_custody'] = Variable<bool>(inYourCustody);
    map['interested_in_relationship'] =
        Variable<bool>(interestedInRelationship);
    return map;
  }

  SiblingTableCompanion toCompanion(bool nullToAbsent) {
    return SiblingTableCompanion(
      mainPersonId: Value(mainPersonId),
      siblingId: Value(siblingId),
      siblingRelationshipType: Value(siblingRelationshipType),
      relationship: Value(relationship),
      inYourCustody: Value(inYourCustody),
      interestedInRelationship: Value(interestedInRelationship),
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
      inYourCustody: serializer.fromJson<bool>(json['inYourCustody']),
      interestedInRelationship:
          serializer.fromJson<bool>(json['interestedInRelationship']),
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
      'inYourCustody': serializer.toJson<bool>(inYourCustody),
      'interestedInRelationship':
          serializer.toJson<bool>(interestedInRelationship),
    };
  }

  Sibling copyWith(
          {int? mainPersonId,
          int? siblingId,
          String? siblingRelationshipType,
          int? relationship,
          bool? inYourCustody,
          bool? interestedInRelationship}) =>
      Sibling(
        mainPersonId: mainPersonId ?? this.mainPersonId,
        siblingId: siblingId ?? this.siblingId,
        siblingRelationshipType:
            siblingRelationshipType ?? this.siblingRelationshipType,
        relationship: relationship ?? this.relationship,
        inYourCustody: inYourCustody ?? this.inYourCustody,
        interestedInRelationship:
            interestedInRelationship ?? this.interestedInRelationship,
      );
  @override
  String toString() {
    return (StringBuffer('Sibling(')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('siblingId: $siblingId, ')
          ..write('siblingRelationshipType: $siblingRelationshipType, ')
          ..write('relationship: $relationship, ')
          ..write('inYourCustody: $inYourCustody, ')
          ..write('interestedInRelationship: $interestedInRelationship')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      mainPersonId,
      siblingId,
      siblingRelationshipType,
      relationship,
      inYourCustody,
      interestedInRelationship);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Sibling &&
          other.mainPersonId == this.mainPersonId &&
          other.siblingId == this.siblingId &&
          other.siblingRelationshipType == this.siblingRelationshipType &&
          other.relationship == this.relationship &&
          other.inYourCustody == this.inYourCustody &&
          other.interestedInRelationship == this.interestedInRelationship);
}

class SiblingTableCompanion extends UpdateCompanion<Sibling> {
  final Value<int> mainPersonId;
  final Value<int> siblingId;
  final Value<String> siblingRelationshipType;
  final Value<int> relationship;
  final Value<bool> inYourCustody;
  final Value<bool> interestedInRelationship;
  final Value<int> rowid;
  const SiblingTableCompanion({
    this.mainPersonId = const Value.absent(),
    this.siblingId = const Value.absent(),
    this.siblingRelationshipType = const Value.absent(),
    this.relationship = const Value.absent(),
    this.inYourCustody = const Value.absent(),
    this.interestedInRelationship = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SiblingTableCompanion.insert({
    required int mainPersonId,
    required int siblingId,
    required String siblingRelationshipType,
    required int relationship,
    required bool inYourCustody,
    required bool interestedInRelationship,
    this.rowid = const Value.absent(),
  })  : mainPersonId = Value(mainPersonId),
        siblingId = Value(siblingId),
        siblingRelationshipType = Value(siblingRelationshipType),
        relationship = Value(relationship),
        inYourCustody = Value(inYourCustody),
        interestedInRelationship = Value(interestedInRelationship);
  static Insertable<Sibling> custom({
    Expression<int>? mainPersonId,
    Expression<int>? siblingId,
    Expression<String>? siblingRelationshipType,
    Expression<int>? relationship,
    Expression<bool>? inYourCustody,
    Expression<bool>? interestedInRelationship,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (siblingId != null) 'sibling_id': siblingId,
      if (siblingRelationshipType != null)
        'sibling_relationship_type': siblingRelationshipType,
      if (relationship != null) 'relationship': relationship,
      if (inYourCustody != null) 'in_your_custody': inYourCustody,
      if (interestedInRelationship != null)
        'interested_in_relationship': interestedInRelationship,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SiblingTableCompanion copyWith(
      {Value<int>? mainPersonId,
      Value<int>? siblingId,
      Value<String>? siblingRelationshipType,
      Value<int>? relationship,
      Value<bool>? inYourCustody,
      Value<bool>? interestedInRelationship,
      Value<int>? rowid}) {
    return SiblingTableCompanion(
      mainPersonId: mainPersonId ?? this.mainPersonId,
      siblingId: siblingId ?? this.siblingId,
      siblingRelationshipType:
          siblingRelationshipType ?? this.siblingRelationshipType,
      relationship: relationship ?? this.relationship,
      inYourCustody: inYourCustody ?? this.inYourCustody,
      interestedInRelationship:
          interestedInRelationship ?? this.interestedInRelationship,
      rowid: rowid ?? this.rowid,
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
    if (inYourCustody.present) {
      map['in_your_custody'] = Variable<bool>(inYourCustody.value);
    }
    if (interestedInRelationship.present) {
      map['interested_in_relationship'] =
          Variable<bool>(interestedInRelationship.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
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
          ..write('inYourCustody: $inYourCustody, ')
          ..write('interestedInRelationship: $interestedInRelationship, ')
          ..write('rowid: $rowid')
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
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES game (id) ON UPDATE CASCADE ON DELETE CASCADE'));
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
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _otherPersonIdMeta =
      const VerificationMeta('otherPersonId');
  @override
  late final GeneratedColumn<int> otherPersonId = GeneratedColumn<int>(
      'other_person_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
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
  late final GeneratedColumn<bool> journalEntryOnly = GeneratedColumn<bool>(
      'journal_entry_only', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("journal_entry_only" IN (0, 1))'));
  static const VerificationMeta _performedMeta =
      const VerificationMeta('performed');
  @override
  late final GeneratedColumn<bool> performed = GeneratedColumn<bool>(
      'performed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("performed" IN (0, 1))'));
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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event';
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
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
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
  static const VerificationMeta _maxConditionAtPurchaseMeta =
      const VerificationMeta('maxConditionAtPurchase');
  @override
  late final GeneratedColumn<int> maxConditionAtPurchase = GeneratedColumn<int>(
      'max_condition_at_purchase', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _depreciationFluctuatorMeta =
      const VerificationMeta('depreciationFluctuator');
  @override
  late final GeneratedColumn<int> depreciationFluctuator = GeneratedColumn<int>(
      'depreciation_fluctuator', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastKnownConditionMeta =
      const VerificationMeta('lastKnownCondition');
  @override
  late final GeneratedColumn<int> lastKnownCondition = GeneratedColumn<int>(
      'last_known_condition', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastMaintenanceDayMeta =
      const VerificationMeta('lastMaintenanceDay');
  @override
  late final GeneratedColumn<int> lastMaintenanceDay = GeneratedColumn<int>(
      'last_maintenance_day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fullyPaidForMeta =
      const VerificationMeta('fullyPaidFor');
  @override
  late final GeneratedColumn<bool> fullyPaidFor = GeneratedColumn<bool>(
      'fully_paid_for', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("fully_paid_for" IN (0, 1))'));
  static const VerificationMeta _currentlyDrivingMeta =
      const VerificationMeta('currentlyDriving');
  @override
  late final GeneratedColumn<bool> currentlyDriving = GeneratedColumn<bool>(
      'currently_driving', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("currently_driving" IN (0, 1))'));
  static const VerificationMeta _isInsuredMeta =
      const VerificationMeta('isInsured');
  @override
  late final GeneratedColumn<bool> isInsured = GeneratedColumn<bool>(
      'is_insured', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_insured" IN (0, 1))'));
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
        maxConditionAtPurchase,
        depreciationFluctuator,
        lastKnownCondition,
        lastMaintenanceDay,
        fullyPaidFor,
        currentlyDriving,
        isInsured,
        insuranceCost,
        insuranceType
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'car';
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
    if (data.containsKey('max_condition_at_purchase')) {
      context.handle(
          _maxConditionAtPurchaseMeta,
          maxConditionAtPurchase.isAcceptableOrUnknown(
              data['max_condition_at_purchase']!, _maxConditionAtPurchaseMeta));
    } else if (isInserting) {
      context.missing(_maxConditionAtPurchaseMeta);
    }
    if (data.containsKey('depreciation_fluctuator')) {
      context.handle(
          _depreciationFluctuatorMeta,
          depreciationFluctuator.isAcceptableOrUnknown(
              data['depreciation_fluctuator']!, _depreciationFluctuatorMeta));
    } else if (isInserting) {
      context.missing(_depreciationFluctuatorMeta);
    }
    if (data.containsKey('last_known_condition')) {
      context.handle(
          _lastKnownConditionMeta,
          lastKnownCondition.isAcceptableOrUnknown(
              data['last_known_condition']!, _lastKnownConditionMeta));
    } else if (isInserting) {
      context.missing(_lastKnownConditionMeta);
    }
    if (data.containsKey('last_maintenance_day')) {
      context.handle(
          _lastMaintenanceDayMeta,
          lastMaintenanceDay.isAcceptableOrUnknown(
              data['last_maintenance_day']!, _lastMaintenanceDayMeta));
    } else if (isInserting) {
      context.missing(_lastMaintenanceDayMeta);
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
      maxConditionAtPurchase: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}max_condition_at_purchase'])!,
      depreciationFluctuator: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}depreciation_fluctuator'])!,
      lastKnownCondition: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}last_known_condition'])!,
      lastMaintenanceDay: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}last_maintenance_day'])!,
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
  final int maxConditionAtPurchase;
  final int depreciationFluctuator;
  final int lastKnownCondition;
  final int lastMaintenanceDay;
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
      required this.maxConditionAtPurchase,
      required this.depreciationFluctuator,
      required this.lastKnownCondition,
      required this.lastMaintenanceDay,
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
    map['max_condition_at_purchase'] = Variable<int>(maxConditionAtPurchase);
    map['depreciation_fluctuator'] = Variable<int>(depreciationFluctuator);
    map['last_known_condition'] = Variable<int>(lastKnownCondition);
    map['last_maintenance_day'] = Variable<int>(lastMaintenanceDay);
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
      maxConditionAtPurchase: Value(maxConditionAtPurchase),
      depreciationFluctuator: Value(depreciationFluctuator),
      lastKnownCondition: Value(lastKnownCondition),
      lastMaintenanceDay: Value(lastMaintenanceDay),
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
      maxConditionAtPurchase:
          serializer.fromJson<int>(json['maxConditionAtPurchase']),
      depreciationFluctuator:
          serializer.fromJson<int>(json['depreciationFluctuator']),
      lastKnownCondition: serializer.fromJson<int>(json['lastKnownCondition']),
      lastMaintenanceDay: serializer.fromJson<int>(json['lastMaintenanceDay']),
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
      'maxConditionAtPurchase': serializer.toJson<int>(maxConditionAtPurchase),
      'depreciationFluctuator': serializer.toJson<int>(depreciationFluctuator),
      'lastKnownCondition': serializer.toJson<int>(lastKnownCondition),
      'lastMaintenanceDay': serializer.toJson<int>(lastMaintenanceDay),
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
          int? maxConditionAtPurchase,
          int? depreciationFluctuator,
          int? lastKnownCondition,
          int? lastMaintenanceDay,
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
        maxConditionAtPurchase:
            maxConditionAtPurchase ?? this.maxConditionAtPurchase,
        depreciationFluctuator:
            depreciationFluctuator ?? this.depreciationFluctuator,
        lastKnownCondition: lastKnownCondition ?? this.lastKnownCondition,
        lastMaintenanceDay: lastMaintenanceDay ?? this.lastMaintenanceDay,
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
          ..write('maxConditionAtPurchase: $maxConditionAtPurchase, ')
          ..write('depreciationFluctuator: $depreciationFluctuator, ')
          ..write('lastKnownCondition: $lastKnownCondition, ')
          ..write('lastMaintenanceDay: $lastMaintenanceDay, ')
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
      maxConditionAtPurchase,
      depreciationFluctuator,
      lastKnownCondition,
      lastMaintenanceDay,
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
          other.maxConditionAtPurchase == this.maxConditionAtPurchase &&
          other.depreciationFluctuator == this.depreciationFluctuator &&
          other.lastKnownCondition == this.lastKnownCondition &&
          other.lastMaintenanceDay == this.lastMaintenanceDay &&
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
  final Value<int> maxConditionAtPurchase;
  final Value<int> depreciationFluctuator;
  final Value<int> lastKnownCondition;
  final Value<int> lastMaintenanceDay;
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
    this.maxConditionAtPurchase = const Value.absent(),
    this.depreciationFluctuator = const Value.absent(),
    this.lastKnownCondition = const Value.absent(),
    this.lastMaintenanceDay = const Value.absent(),
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
    required int maxConditionAtPurchase,
    required int depreciationFluctuator,
    required int lastKnownCondition,
    required int lastMaintenanceDay,
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
        maxConditionAtPurchase = Value(maxConditionAtPurchase),
        depreciationFluctuator = Value(depreciationFluctuator),
        lastKnownCondition = Value(lastKnownCondition),
        lastMaintenanceDay = Value(lastMaintenanceDay),
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
    Expression<int>? maxConditionAtPurchase,
    Expression<int>? depreciationFluctuator,
    Expression<int>? lastKnownCondition,
    Expression<int>? lastMaintenanceDay,
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
      if (maxConditionAtPurchase != null)
        'max_condition_at_purchase': maxConditionAtPurchase,
      if (depreciationFluctuator != null)
        'depreciation_fluctuator': depreciationFluctuator,
      if (lastKnownCondition != null)
        'last_known_condition': lastKnownCondition,
      if (lastMaintenanceDay != null)
        'last_maintenance_day': lastMaintenanceDay,
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
      Value<int>? maxConditionAtPurchase,
      Value<int>? depreciationFluctuator,
      Value<int>? lastKnownCondition,
      Value<int>? lastMaintenanceDay,
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
      maxConditionAtPurchase:
          maxConditionAtPurchase ?? this.maxConditionAtPurchase,
      depreciationFluctuator:
          depreciationFluctuator ?? this.depreciationFluctuator,
      lastKnownCondition: lastKnownCondition ?? this.lastKnownCondition,
      lastMaintenanceDay: lastMaintenanceDay ?? this.lastMaintenanceDay,
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
    if (maxConditionAtPurchase.present) {
      map['max_condition_at_purchase'] =
          Variable<int>(maxConditionAtPurchase.value);
    }
    if (depreciationFluctuator.present) {
      map['depreciation_fluctuator'] =
          Variable<int>(depreciationFluctuator.value);
    }
    if (lastKnownCondition.present) {
      map['last_known_condition'] = Variable<int>(lastKnownCondition.value);
    }
    if (lastMaintenanceDay.present) {
      map['last_maintenance_day'] = Variable<int>(lastMaintenanceDay.value);
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
          ..write('maxConditionAtPurchase: $maxConditionAtPurchase, ')
          ..write('depreciationFluctuator: $depreciationFluctuator, ')
          ..write('lastKnownCondition: $lastKnownCondition, ')
          ..write('lastMaintenanceDay: $lastMaintenanceDay, ')
          ..write('fullyPaidFor: $fullyPaidFor, ')
          ..write('currentlyDriving: $currentlyDriving, ')
          ..write('isInsured: $isInsured, ')
          ..write('insuranceCost: $insuranceCost, ')
          ..write('insuranceType: $insuranceType')
          ..write(')'))
        .toString();
  }
}

class $CarProblemTableTable extends CarProblemTable
    with TableInfo<$CarProblemTableTable, CarProblem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CarProblemTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _carIdMeta = const VerificationMeta('carId');
  @override
  late final GeneratedColumn<int> carId = GeneratedColumn<int>(
      'car_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES car (id) ON UPDATE CASCADE ON DELETE CASCADE'));
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
  static const VerificationMeta _originDayMeta =
      const VerificationMeta('originDay');
  @override
  late final GeneratedColumn<int> originDay = GeneratedColumn<int>(
      'origin_day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fixDayMeta = const VerificationMeta('fixDay');
  @override
  late final GeneratedColumn<int> fixDay = GeneratedColumn<int>(
      'fix_day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isRevealedMeta =
      const VerificationMeta('isRevealed');
  @override
  late final GeneratedColumn<bool> isRevealed = GeneratedColumn<bool>(
      'is_revealed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_revealed" IN (0, 1))'));
  static const VerificationMeta _isResolvedMeta =
      const VerificationMeta('isResolved');
  @override
  late final GeneratedColumn<bool> isResolved = GeneratedColumn<bool>(
      'is_resolved', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_resolved" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [carId, type, basePrice, originDay, fixDay, isRevealed, isResolved];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'car_problem';
  @override
  VerificationContext validateIntegrity(Insertable<CarProblem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('car_id')) {
      context.handle(
          _carIdMeta, carId.isAcceptableOrUnknown(data['car_id']!, _carIdMeta));
    } else if (isInserting) {
      context.missing(_carIdMeta);
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
    if (data.containsKey('origin_day')) {
      context.handle(_originDayMeta,
          originDay.isAcceptableOrUnknown(data['origin_day']!, _originDayMeta));
    } else if (isInserting) {
      context.missing(_originDayMeta);
    }
    if (data.containsKey('fix_day')) {
      context.handle(_fixDayMeta,
          fixDay.isAcceptableOrUnknown(data['fix_day']!, _fixDayMeta));
    } else if (isInserting) {
      context.missing(_fixDayMeta);
    }
    if (data.containsKey('is_revealed')) {
      context.handle(
          _isRevealedMeta,
          isRevealed.isAcceptableOrUnknown(
              data['is_revealed']!, _isRevealedMeta));
    } else if (isInserting) {
      context.missing(_isRevealedMeta);
    }
    if (data.containsKey('is_resolved')) {
      context.handle(
          _isResolvedMeta,
          isResolved.isAcceptableOrUnknown(
              data['is_resolved']!, _isResolvedMeta));
    } else if (isInserting) {
      context.missing(_isResolvedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {carId, type};
  @override
  CarProblem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CarProblem(
      carId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}car_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      basePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}base_price'])!,
      originDay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}origin_day'])!,
      fixDay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fix_day'])!,
      isRevealed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_revealed'])!,
      isResolved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_resolved'])!,
    );
  }

  @override
  $CarProblemTableTable createAlias(String alias) {
    return $CarProblemTableTable(attachedDatabase, alias);
  }
}

class CarProblem extends DataClass implements Insertable<CarProblem> {
  final int carId;
  final String type;
  final int basePrice;
  final int originDay;
  final int fixDay;
  final bool isRevealed;
  final bool isResolved;
  const CarProblem(
      {required this.carId,
      required this.type,
      required this.basePrice,
      required this.originDay,
      required this.fixDay,
      required this.isRevealed,
      required this.isResolved});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['car_id'] = Variable<int>(carId);
    map['type'] = Variable<String>(type);
    map['base_price'] = Variable<int>(basePrice);
    map['origin_day'] = Variable<int>(originDay);
    map['fix_day'] = Variable<int>(fixDay);
    map['is_revealed'] = Variable<bool>(isRevealed);
    map['is_resolved'] = Variable<bool>(isResolved);
    return map;
  }

  CarProblemTableCompanion toCompanion(bool nullToAbsent) {
    return CarProblemTableCompanion(
      carId: Value(carId),
      type: Value(type),
      basePrice: Value(basePrice),
      originDay: Value(originDay),
      fixDay: Value(fixDay),
      isRevealed: Value(isRevealed),
      isResolved: Value(isResolved),
    );
  }

  factory CarProblem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CarProblem(
      carId: serializer.fromJson<int>(json['carId']),
      type: serializer.fromJson<String>(json['type']),
      basePrice: serializer.fromJson<int>(json['basePrice']),
      originDay: serializer.fromJson<int>(json['originDay']),
      fixDay: serializer.fromJson<int>(json['fixDay']),
      isRevealed: serializer.fromJson<bool>(json['isRevealed']),
      isResolved: serializer.fromJson<bool>(json['isResolved']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'carId': serializer.toJson<int>(carId),
      'type': serializer.toJson<String>(type),
      'basePrice': serializer.toJson<int>(basePrice),
      'originDay': serializer.toJson<int>(originDay),
      'fixDay': serializer.toJson<int>(fixDay),
      'isRevealed': serializer.toJson<bool>(isRevealed),
      'isResolved': serializer.toJson<bool>(isResolved),
    };
  }

  CarProblem copyWith(
          {int? carId,
          String? type,
          int? basePrice,
          int? originDay,
          int? fixDay,
          bool? isRevealed,
          bool? isResolved}) =>
      CarProblem(
        carId: carId ?? this.carId,
        type: type ?? this.type,
        basePrice: basePrice ?? this.basePrice,
        originDay: originDay ?? this.originDay,
        fixDay: fixDay ?? this.fixDay,
        isRevealed: isRevealed ?? this.isRevealed,
        isResolved: isResolved ?? this.isResolved,
      );
  @override
  String toString() {
    return (StringBuffer('CarProblem(')
          ..write('carId: $carId, ')
          ..write('type: $type, ')
          ..write('basePrice: $basePrice, ')
          ..write('originDay: $originDay, ')
          ..write('fixDay: $fixDay, ')
          ..write('isRevealed: $isRevealed, ')
          ..write('isResolved: $isResolved')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      carId, type, basePrice, originDay, fixDay, isRevealed, isResolved);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CarProblem &&
          other.carId == this.carId &&
          other.type == this.type &&
          other.basePrice == this.basePrice &&
          other.originDay == this.originDay &&
          other.fixDay == this.fixDay &&
          other.isRevealed == this.isRevealed &&
          other.isResolved == this.isResolved);
}

class CarProblemTableCompanion extends UpdateCompanion<CarProblem> {
  final Value<int> carId;
  final Value<String> type;
  final Value<int> basePrice;
  final Value<int> originDay;
  final Value<int> fixDay;
  final Value<bool> isRevealed;
  final Value<bool> isResolved;
  final Value<int> rowid;
  const CarProblemTableCompanion({
    this.carId = const Value.absent(),
    this.type = const Value.absent(),
    this.basePrice = const Value.absent(),
    this.originDay = const Value.absent(),
    this.fixDay = const Value.absent(),
    this.isRevealed = const Value.absent(),
    this.isResolved = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CarProblemTableCompanion.insert({
    required int carId,
    required String type,
    required int basePrice,
    required int originDay,
    required int fixDay,
    required bool isRevealed,
    required bool isResolved,
    this.rowid = const Value.absent(),
  })  : carId = Value(carId),
        type = Value(type),
        basePrice = Value(basePrice),
        originDay = Value(originDay),
        fixDay = Value(fixDay),
        isRevealed = Value(isRevealed),
        isResolved = Value(isResolved);
  static Insertable<CarProblem> custom({
    Expression<int>? carId,
    Expression<String>? type,
    Expression<int>? basePrice,
    Expression<int>? originDay,
    Expression<int>? fixDay,
    Expression<bool>? isRevealed,
    Expression<bool>? isResolved,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (carId != null) 'car_id': carId,
      if (type != null) 'type': type,
      if (basePrice != null) 'base_price': basePrice,
      if (originDay != null) 'origin_day': originDay,
      if (fixDay != null) 'fix_day': fixDay,
      if (isRevealed != null) 'is_revealed': isRevealed,
      if (isResolved != null) 'is_resolved': isResolved,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CarProblemTableCompanion copyWith(
      {Value<int>? carId,
      Value<String>? type,
      Value<int>? basePrice,
      Value<int>? originDay,
      Value<int>? fixDay,
      Value<bool>? isRevealed,
      Value<bool>? isResolved,
      Value<int>? rowid}) {
    return CarProblemTableCompanion(
      carId: carId ?? this.carId,
      type: type ?? this.type,
      basePrice: basePrice ?? this.basePrice,
      originDay: originDay ?? this.originDay,
      fixDay: fixDay ?? this.fixDay,
      isRevealed: isRevealed ?? this.isRevealed,
      isResolved: isResolved ?? this.isResolved,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (carId.present) {
      map['car_id'] = Variable<int>(carId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (basePrice.present) {
      map['base_price'] = Variable<int>(basePrice.value);
    }
    if (originDay.present) {
      map['origin_day'] = Variable<int>(originDay.value);
    }
    if (fixDay.present) {
      map['fix_day'] = Variable<int>(fixDay.value);
    }
    if (isRevealed.present) {
      map['is_revealed'] = Variable<bool>(isRevealed.value);
    }
    if (isResolved.present) {
      map['is_resolved'] = Variable<bool>(isResolved.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CarProblemTableCompanion(')
          ..write('carId: $carId, ')
          ..write('type: $type, ')
          ..write('basePrice: $basePrice, ')
          ..write('originDay: $originDay, ')
          ..write('fixDay: $fixDay, ')
          ..write('isRevealed: $isRevealed, ')
          ..write('isResolved: $isResolved, ')
          ..write('rowid: $rowid')
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
  late final GeneratedColumn<bool> isOrganic = GeneratedColumn<bool>(
      'is_organic', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_organic" IN (0, 1))'));
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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'food';
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
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _foodIdMeta = const VerificationMeta('foodId');
  @override
  late final GeneratedColumn<int> foodId = GeneratedColumn<int>(
      'food_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES food (id) ON UPDATE CASCADE ON DELETE CASCADE'));
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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fridge_food';
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
  static const VerificationMeta _ownerPersonIdMeta =
      const VerificationMeta('ownerPersonId');
  @override
  late final GeneratedColumn<int> ownerPersonId = GeneratedColumn<int>(
      'owner_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
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
  late final GeneratedColumn<bool> isForRent = GeneratedColumn<bool>(
      'is_for_rent', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_for_rent" IN (0, 1))'));
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
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, false,
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
  late final GeneratedColumn<bool> fullyPaidFor = GeneratedColumn<bool>(
      'fully_paid_for', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("fully_paid_for" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        ownerPersonId,
        bedrooms,
        bathrooms,
        storage,
        address,
        isForRent,
        buildingType,
        settlement,
        state,
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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'house';
  @override
  VerificationContext validateIntegrity(Insertable<House> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('owner_person_id')) {
      context.handle(
          _ownerPersonIdMeta,
          ownerPersonId.isAcceptableOrUnknown(
              data['owner_person_id']!, _ownerPersonIdMeta));
    } else if (isInserting) {
      context.missing(_ownerPersonIdMeta);
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
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    } else if (isInserting) {
      context.missing(_stateMeta);
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
      ownerPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}owner_person_id'])!,
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
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state'])!,
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
  final int ownerPersonId;
  final int bedrooms;
  final int bathrooms;
  final int storage;
  final String address;
  final bool isForRent;
  final String buildingType;
  final String settlement;
  final String state;
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
      required this.ownerPersonId,
      required this.bedrooms,
      required this.bathrooms,
      required this.storage,
      required this.address,
      required this.isForRent,
      required this.buildingType,
      required this.settlement,
      required this.state,
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
    map['owner_person_id'] = Variable<int>(ownerPersonId);
    map['bedrooms'] = Variable<int>(bedrooms);
    map['bathrooms'] = Variable<int>(bathrooms);
    map['storage'] = Variable<int>(storage);
    map['address'] = Variable<String>(address);
    map['is_for_rent'] = Variable<bool>(isForRent);
    map['building_type'] = Variable<String>(buildingType);
    map['settlement'] = Variable<String>(settlement);
    map['state'] = Variable<String>(state);
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
      ownerPersonId: Value(ownerPersonId),
      bedrooms: Value(bedrooms),
      bathrooms: Value(bathrooms),
      storage: Value(storage),
      address: Value(address),
      isForRent: Value(isForRent),
      buildingType: Value(buildingType),
      settlement: Value(settlement),
      state: Value(state),
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
      ownerPersonId: serializer.fromJson<int>(json['ownerPersonId']),
      bedrooms: serializer.fromJson<int>(json['bedrooms']),
      bathrooms: serializer.fromJson<int>(json['bathrooms']),
      storage: serializer.fromJson<int>(json['storage']),
      address: serializer.fromJson<String>(json['address']),
      isForRent: serializer.fromJson<bool>(json['isForRent']),
      buildingType: serializer.fromJson<String>(json['buildingType']),
      settlement: serializer.fromJson<String>(json['settlement']),
      state: serializer.fromJson<String>(json['state']),
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
      'ownerPersonId': serializer.toJson<int>(ownerPersonId),
      'bedrooms': serializer.toJson<int>(bedrooms),
      'bathrooms': serializer.toJson<int>(bathrooms),
      'storage': serializer.toJson<int>(storage),
      'address': serializer.toJson<String>(address),
      'isForRent': serializer.toJson<bool>(isForRent),
      'buildingType': serializer.toJson<String>(buildingType),
      'settlement': serializer.toJson<String>(settlement),
      'state': serializer.toJson<String>(state),
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
          int? ownerPersonId,
          int? bedrooms,
          int? bathrooms,
          int? storage,
          String? address,
          bool? isForRent,
          String? buildingType,
          String? settlement,
          String? state,
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
        ownerPersonId: ownerPersonId ?? this.ownerPersonId,
        bedrooms: bedrooms ?? this.bedrooms,
        bathrooms: bathrooms ?? this.bathrooms,
        storage: storage ?? this.storage,
        address: address ?? this.address,
        isForRent: isForRent ?? this.isForRent,
        buildingType: buildingType ?? this.buildingType,
        settlement: settlement ?? this.settlement,
        state: state ?? this.state,
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
          ..write('ownerPersonId: $ownerPersonId, ')
          ..write('bedrooms: $bedrooms, ')
          ..write('bathrooms: $bathrooms, ')
          ..write('storage: $storage, ')
          ..write('address: $address, ')
          ..write('isForRent: $isForRent, ')
          ..write('buildingType: $buildingType, ')
          ..write('settlement: $settlement, ')
          ..write('state: $state, ')
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
      ownerPersonId,
      bedrooms,
      bathrooms,
      storage,
      address,
      isForRent,
      buildingType,
      settlement,
      state,
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
          other.ownerPersonId == this.ownerPersonId &&
          other.bedrooms == this.bedrooms &&
          other.bathrooms == this.bathrooms &&
          other.storage == this.storage &&
          other.address == this.address &&
          other.isForRent == this.isForRent &&
          other.buildingType == this.buildingType &&
          other.settlement == this.settlement &&
          other.state == this.state &&
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
  final Value<int> ownerPersonId;
  final Value<int> bedrooms;
  final Value<int> bathrooms;
  final Value<int> storage;
  final Value<String> address;
  final Value<bool> isForRent;
  final Value<String> buildingType;
  final Value<String> settlement;
  final Value<String> state;
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
    this.ownerPersonId = const Value.absent(),
    this.bedrooms = const Value.absent(),
    this.bathrooms = const Value.absent(),
    this.storage = const Value.absent(),
    this.address = const Value.absent(),
    this.isForRent = const Value.absent(),
    this.buildingType = const Value.absent(),
    this.settlement = const Value.absent(),
    this.state = const Value.absent(),
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
    required int ownerPersonId,
    required int bedrooms,
    required int bathrooms,
    required int storage,
    required String address,
    required bool isForRent,
    required String buildingType,
    required String settlement,
    required String state,
    required String country,
    required String style,
    required int lastMaintainedDay,
    required int basePrice,
    required int dayOfPurchase,
    required int endOfLeaseDay,
    required int condition,
    required int purchasePrice,
    required bool fullyPaidFor,
  })  : ownerPersonId = Value(ownerPersonId),
        bedrooms = Value(bedrooms),
        bathrooms = Value(bathrooms),
        storage = Value(storage),
        address = Value(address),
        isForRent = Value(isForRent),
        buildingType = Value(buildingType),
        settlement = Value(settlement),
        state = Value(state),
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
    Expression<int>? ownerPersonId,
    Expression<int>? bedrooms,
    Expression<int>? bathrooms,
    Expression<int>? storage,
    Expression<String>? address,
    Expression<bool>? isForRent,
    Expression<String>? buildingType,
    Expression<String>? settlement,
    Expression<String>? state,
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
      if (ownerPersonId != null) 'owner_person_id': ownerPersonId,
      if (bedrooms != null) 'bedrooms': bedrooms,
      if (bathrooms != null) 'bathrooms': bathrooms,
      if (storage != null) 'storage': storage,
      if (address != null) 'address': address,
      if (isForRent != null) 'is_for_rent': isForRent,
      if (buildingType != null) 'building_type': buildingType,
      if (settlement != null) 'settlement': settlement,
      if (state != null) 'state': state,
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
      Value<int>? ownerPersonId,
      Value<int>? bedrooms,
      Value<int>? bathrooms,
      Value<int>? storage,
      Value<String>? address,
      Value<bool>? isForRent,
      Value<String>? buildingType,
      Value<String>? settlement,
      Value<String>? state,
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
      ownerPersonId: ownerPersonId ?? this.ownerPersonId,
      bedrooms: bedrooms ?? this.bedrooms,
      bathrooms: bathrooms ?? this.bathrooms,
      storage: storage ?? this.storage,
      address: address ?? this.address,
      isForRent: isForRent ?? this.isForRent,
      buildingType: buildingType ?? this.buildingType,
      settlement: settlement ?? this.settlement,
      state: state ?? this.state,
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
    if (ownerPersonId.present) {
      map['owner_person_id'] = Variable<int>(ownerPersonId.value);
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
    if (state.present) {
      map['state'] = Variable<String>(state.value);
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
          ..write('ownerPersonId: $ownerPersonId, ')
          ..write('bedrooms: $bedrooms, ')
          ..write('bathrooms: $bathrooms, ')
          ..write('storage: $storage, ')
          ..write('address: $address, ')
          ..write('isForRent: $isForRent, ')
          ..write('buildingType: $buildingType, ')
          ..write('settlement: $settlement, ')
          ..write('state: $state, ')
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

class $CurrentHomeTableTable extends CurrentHomeTable
    with TableInfo<$CurrentHomeTableTable, CurrentHome> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CurrentHomeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _personIdMeta =
      const VerificationMeta('personId');
  @override
  late final GeneratedColumn<int> personId = GeneratedColumn<int>(
      'person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'UNIQUE REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _houseIdMeta =
      const VerificationMeta('houseId');
  @override
  late final GeneratedColumn<int> houseId = GeneratedColumn<int>(
      'house_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES house (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _hasManagementRightsMeta =
      const VerificationMeta('hasManagementRights');
  @override
  late final GeneratedColumn<bool> hasManagementRights = GeneratedColumn<bool>(
      'has_management_rights', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_management_rights" IN (0, 1))'));
  static const VerificationMeta _isAtHomeMeta =
      const VerificationMeta('isAtHome');
  @override
  late final GeneratedColumn<bool> isAtHome = GeneratedColumn<bool>(
      'is_at_home', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_at_home" IN (0, 1))'));
  static const VerificationMeta _stayTypeMeta =
      const VerificationMeta('stayType');
  @override
  late final GeneratedColumn<String> stayType = GeneratedColumn<String>(
      'stay_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _exitDayMeta =
      const VerificationMeta('exitDay');
  @override
  late final GeneratedColumn<int> exitDay = GeneratedColumn<int>(
      'exit_day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [personId, houseId, hasManagementRights, isAtHome, stayType, exitDay];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'current_home';
  @override
  VerificationContext validateIntegrity(Insertable<CurrentHome> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('person_id')) {
      context.handle(_personIdMeta,
          personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta));
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('house_id')) {
      context.handle(_houseIdMeta,
          houseId.isAcceptableOrUnknown(data['house_id']!, _houseIdMeta));
    } else if (isInserting) {
      context.missing(_houseIdMeta);
    }
    if (data.containsKey('has_management_rights')) {
      context.handle(
          _hasManagementRightsMeta,
          hasManagementRights.isAcceptableOrUnknown(
              data['has_management_rights']!, _hasManagementRightsMeta));
    } else if (isInserting) {
      context.missing(_hasManagementRightsMeta);
    }
    if (data.containsKey('is_at_home')) {
      context.handle(_isAtHomeMeta,
          isAtHome.isAcceptableOrUnknown(data['is_at_home']!, _isAtHomeMeta));
    } else if (isInserting) {
      context.missing(_isAtHomeMeta);
    }
    if (data.containsKey('stay_type')) {
      context.handle(_stayTypeMeta,
          stayType.isAcceptableOrUnknown(data['stay_type']!, _stayTypeMeta));
    } else if (isInserting) {
      context.missing(_stayTypeMeta);
    }
    if (data.containsKey('exit_day')) {
      context.handle(_exitDayMeta,
          exitDay.isAcceptableOrUnknown(data['exit_day']!, _exitDayMeta));
    } else if (isInserting) {
      context.missing(_exitDayMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CurrentHome map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CurrentHome(
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id'])!,
      houseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}house_id'])!,
      hasManagementRights: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}has_management_rights'])!,
      isAtHome: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_at_home'])!,
      stayType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stay_type'])!,
      exitDay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exit_day'])!,
    );
  }

  @override
  $CurrentHomeTableTable createAlias(String alias) {
    return $CurrentHomeTableTable(attachedDatabase, alias);
  }
}

class CurrentHome extends DataClass implements Insertable<CurrentHome> {
  final int personId;
  final int houseId;
  final bool hasManagementRights;
  final bool isAtHome;
  final String stayType;
  final int exitDay;
  const CurrentHome(
      {required this.personId,
      required this.houseId,
      required this.hasManagementRights,
      required this.isAtHome,
      required this.stayType,
      required this.exitDay});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['person_id'] = Variable<int>(personId);
    map['house_id'] = Variable<int>(houseId);
    map['has_management_rights'] = Variable<bool>(hasManagementRights);
    map['is_at_home'] = Variable<bool>(isAtHome);
    map['stay_type'] = Variable<String>(stayType);
    map['exit_day'] = Variable<int>(exitDay);
    return map;
  }

  CurrentHomeTableCompanion toCompanion(bool nullToAbsent) {
    return CurrentHomeTableCompanion(
      personId: Value(personId),
      houseId: Value(houseId),
      hasManagementRights: Value(hasManagementRights),
      isAtHome: Value(isAtHome),
      stayType: Value(stayType),
      exitDay: Value(exitDay),
    );
  }

  factory CurrentHome.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CurrentHome(
      personId: serializer.fromJson<int>(json['personId']),
      houseId: serializer.fromJson<int>(json['houseId']),
      hasManagementRights:
          serializer.fromJson<bool>(json['hasManagementRights']),
      isAtHome: serializer.fromJson<bool>(json['isAtHome']),
      stayType: serializer.fromJson<String>(json['stayType']),
      exitDay: serializer.fromJson<int>(json['exitDay']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'personId': serializer.toJson<int>(personId),
      'houseId': serializer.toJson<int>(houseId),
      'hasManagementRights': serializer.toJson<bool>(hasManagementRights),
      'isAtHome': serializer.toJson<bool>(isAtHome),
      'stayType': serializer.toJson<String>(stayType),
      'exitDay': serializer.toJson<int>(exitDay),
    };
  }

  CurrentHome copyWith(
          {int? personId,
          int? houseId,
          bool? hasManagementRights,
          bool? isAtHome,
          String? stayType,
          int? exitDay}) =>
      CurrentHome(
        personId: personId ?? this.personId,
        houseId: houseId ?? this.houseId,
        hasManagementRights: hasManagementRights ?? this.hasManagementRights,
        isAtHome: isAtHome ?? this.isAtHome,
        stayType: stayType ?? this.stayType,
        exitDay: exitDay ?? this.exitDay,
      );
  @override
  String toString() {
    return (StringBuffer('CurrentHome(')
          ..write('personId: $personId, ')
          ..write('houseId: $houseId, ')
          ..write('hasManagementRights: $hasManagementRights, ')
          ..write('isAtHome: $isAtHome, ')
          ..write('stayType: $stayType, ')
          ..write('exitDay: $exitDay')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      personId, houseId, hasManagementRights, isAtHome, stayType, exitDay);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrentHome &&
          other.personId == this.personId &&
          other.houseId == this.houseId &&
          other.hasManagementRights == this.hasManagementRights &&
          other.isAtHome == this.isAtHome &&
          other.stayType == this.stayType &&
          other.exitDay == this.exitDay);
}

class CurrentHomeTableCompanion extends UpdateCompanion<CurrentHome> {
  final Value<int> personId;
  final Value<int> houseId;
  final Value<bool> hasManagementRights;
  final Value<bool> isAtHome;
  final Value<String> stayType;
  final Value<int> exitDay;
  final Value<int> rowid;
  const CurrentHomeTableCompanion({
    this.personId = const Value.absent(),
    this.houseId = const Value.absent(),
    this.hasManagementRights = const Value.absent(),
    this.isAtHome = const Value.absent(),
    this.stayType = const Value.absent(),
    this.exitDay = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CurrentHomeTableCompanion.insert({
    required int personId,
    required int houseId,
    required bool hasManagementRights,
    required bool isAtHome,
    required String stayType,
    required int exitDay,
    this.rowid = const Value.absent(),
  })  : personId = Value(personId),
        houseId = Value(houseId),
        hasManagementRights = Value(hasManagementRights),
        isAtHome = Value(isAtHome),
        stayType = Value(stayType),
        exitDay = Value(exitDay);
  static Insertable<CurrentHome> custom({
    Expression<int>? personId,
    Expression<int>? houseId,
    Expression<bool>? hasManagementRights,
    Expression<bool>? isAtHome,
    Expression<String>? stayType,
    Expression<int>? exitDay,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (personId != null) 'person_id': personId,
      if (houseId != null) 'house_id': houseId,
      if (hasManagementRights != null)
        'has_management_rights': hasManagementRights,
      if (isAtHome != null) 'is_at_home': isAtHome,
      if (stayType != null) 'stay_type': stayType,
      if (exitDay != null) 'exit_day': exitDay,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CurrentHomeTableCompanion copyWith(
      {Value<int>? personId,
      Value<int>? houseId,
      Value<bool>? hasManagementRights,
      Value<bool>? isAtHome,
      Value<String>? stayType,
      Value<int>? exitDay,
      Value<int>? rowid}) {
    return CurrentHomeTableCompanion(
      personId: personId ?? this.personId,
      houseId: houseId ?? this.houseId,
      hasManagementRights: hasManagementRights ?? this.hasManagementRights,
      isAtHome: isAtHome ?? this.isAtHome,
      stayType: stayType ?? this.stayType,
      exitDay: exitDay ?? this.exitDay,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (personId.present) {
      map['person_id'] = Variable<int>(personId.value);
    }
    if (houseId.present) {
      map['house_id'] = Variable<int>(houseId.value);
    }
    if (hasManagementRights.present) {
      map['has_management_rights'] = Variable<bool>(hasManagementRights.value);
    }
    if (isAtHome.present) {
      map['is_at_home'] = Variable<bool>(isAtHome.value);
    }
    if (stayType.present) {
      map['stay_type'] = Variable<String>(stayType.value);
    }
    if (exitDay.present) {
      map['exit_day'] = Variable<int>(exitDay.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrentHomeTableCompanion(')
          ..write('personId: $personId, ')
          ..write('houseId: $houseId, ')
          ..write('hasManagementRights: $hasManagementRights, ')
          ..write('isAtHome: $isAtHome, ')
          ..write('stayType: $stayType, ')
          ..write('exitDay: $exitDay, ')
          ..write('rowid: $rowid')
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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item';
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
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'jewelry';
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
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES item (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _countsLeftMeta =
      const VerificationMeta('countsLeft');
  @override
  late final GeneratedColumn<int> countsLeft = GeneratedColumn<int>(
      'counts_left', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, personId, itemId, countsLeft];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'storeroom_item';
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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal';
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
  final Value<int> rowid;
  const JournalTableCompanion({
    this.gameId = const Value.absent(),
    this.day = const Value.absent(),
    this.mainPlayerId = const Value.absent(),
    this.entry = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JournalTableCompanion.insert({
    required int gameId,
    required int day,
    required int mainPlayerId,
    required String entry,
    this.rowid = const Value.absent(),
  })  : gameId = Value(gameId),
        day = Value(day),
        mainPlayerId = Value(mainPlayerId),
        entry = Value(entry);
  static Insertable<Journal> custom({
    Expression<int>? gameId,
    Expression<int>? day,
    Expression<int>? mainPlayerId,
    Expression<String>? entry,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (gameId != null) 'game_id': gameId,
      if (day != null) 'day': day,
      if (mainPlayerId != null) 'main_player_id': mainPlayerId,
      if (entry != null) 'entry': entry,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JournalTableCompanion copyWith(
      {Value<int>? gameId,
      Value<int>? day,
      Value<int>? mainPlayerId,
      Value<String>? entry,
      Value<int>? rowid}) {
    return JournalTableCompanion(
      gameId: gameId ?? this.gameId,
      day: day ?? this.day,
      mainPlayerId: mainPlayerId ?? this.mainPlayerId,
      entry: entry ?? this.entry,
      rowid: rowid ?? this.rowid,
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalTableCompanion(')
          ..write('gameId: $gameId, ')
          ..write('day: $day, ')
          ..write('mainPlayerId: $mainPlayerId, ')
          ..write('entry: $entry, ')
          ..write('rowid: $rowid')
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
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
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
  late final GeneratedColumn<bool> isUrgent = GeneratedColumn<bool>(
      'is_urgent', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_urgent" IN (0, 1))'));
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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recurring_bill';
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

class $DegreeTableTable extends DegreeTable
    with TableInfo<$DegreeTableTable, Degree> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DegreeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _disciplineMeta =
      const VerificationMeta('discipline');
  @override
  late final GeneratedColumn<String> discipline = GeneratedColumn<String>(
      'discipline', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _branchMeta = const VerificationMeta('branch');
  @override
  late final GeneratedColumn<String> branch = GeneratedColumn<String>(
      'branch', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isSpecialDegreeMeta =
      const VerificationMeta('isSpecialDegree');
  @override
  late final GeneratedColumn<bool> isSpecialDegree = GeneratedColumn<bool>(
      'is_special_degree', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_special_degree" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, discipline, branch, isSpecialDegree];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'degree';
  @override
  VerificationContext validateIntegrity(Insertable<Degree> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('discipline')) {
      context.handle(
          _disciplineMeta,
          discipline.isAcceptableOrUnknown(
              data['discipline']!, _disciplineMeta));
    } else if (isInserting) {
      context.missing(_disciplineMeta);
    }
    if (data.containsKey('branch')) {
      context.handle(_branchMeta,
          branch.isAcceptableOrUnknown(data['branch']!, _branchMeta));
    } else if (isInserting) {
      context.missing(_branchMeta);
    }
    if (data.containsKey('is_special_degree')) {
      context.handle(
          _isSpecialDegreeMeta,
          isSpecialDegree.isAcceptableOrUnknown(
              data['is_special_degree']!, _isSpecialDegreeMeta));
    } else if (isInserting) {
      context.missing(_isSpecialDegreeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Degree map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Degree(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      discipline: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}discipline'])!,
      branch: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}branch'])!,
      isSpecialDegree: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_special_degree'])!,
    );
  }

  @override
  $DegreeTableTable createAlias(String alias) {
    return $DegreeTableTable(attachedDatabase, alias);
  }
}

class Degree extends DataClass implements Insertable<Degree> {
  final int id;
  final String discipline;
  final String branch;
  final bool isSpecialDegree;
  const Degree(
      {required this.id,
      required this.discipline,
      required this.branch,
      required this.isSpecialDegree});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['discipline'] = Variable<String>(discipline);
    map['branch'] = Variable<String>(branch);
    map['is_special_degree'] = Variable<bool>(isSpecialDegree);
    return map;
  }

  DegreeTableCompanion toCompanion(bool nullToAbsent) {
    return DegreeTableCompanion(
      id: Value(id),
      discipline: Value(discipline),
      branch: Value(branch),
      isSpecialDegree: Value(isSpecialDegree),
    );
  }

  factory Degree.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Degree(
      id: serializer.fromJson<int>(json['id']),
      discipline: serializer.fromJson<String>(json['discipline']),
      branch: serializer.fromJson<String>(json['branch']),
      isSpecialDegree: serializer.fromJson<bool>(json['isSpecialDegree']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'discipline': serializer.toJson<String>(discipline),
      'branch': serializer.toJson<String>(branch),
      'isSpecialDegree': serializer.toJson<bool>(isSpecialDegree),
    };
  }

  Degree copyWith(
          {int? id,
          String? discipline,
          String? branch,
          bool? isSpecialDegree}) =>
      Degree(
        id: id ?? this.id,
        discipline: discipline ?? this.discipline,
        branch: branch ?? this.branch,
        isSpecialDegree: isSpecialDegree ?? this.isSpecialDegree,
      );
  @override
  String toString() {
    return (StringBuffer('Degree(')
          ..write('id: $id, ')
          ..write('discipline: $discipline, ')
          ..write('branch: $branch, ')
          ..write('isSpecialDegree: $isSpecialDegree')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, discipline, branch, isSpecialDegree);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Degree &&
          other.id == this.id &&
          other.discipline == this.discipline &&
          other.branch == this.branch &&
          other.isSpecialDegree == this.isSpecialDegree);
}

class DegreeTableCompanion extends UpdateCompanion<Degree> {
  final Value<int> id;
  final Value<String> discipline;
  final Value<String> branch;
  final Value<bool> isSpecialDegree;
  const DegreeTableCompanion({
    this.id = const Value.absent(),
    this.discipline = const Value.absent(),
    this.branch = const Value.absent(),
    this.isSpecialDegree = const Value.absent(),
  });
  DegreeTableCompanion.insert({
    this.id = const Value.absent(),
    required String discipline,
    required String branch,
    required bool isSpecialDegree,
  })  : discipline = Value(discipline),
        branch = Value(branch),
        isSpecialDegree = Value(isSpecialDegree);
  static Insertable<Degree> custom({
    Expression<int>? id,
    Expression<String>? discipline,
    Expression<String>? branch,
    Expression<bool>? isSpecialDegree,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (discipline != null) 'discipline': discipline,
      if (branch != null) 'branch': branch,
      if (isSpecialDegree != null) 'is_special_degree': isSpecialDegree,
    });
  }

  DegreeTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? discipline,
      Value<String>? branch,
      Value<bool>? isSpecialDegree}) {
    return DegreeTableCompanion(
      id: id ?? this.id,
      discipline: discipline ?? this.discipline,
      branch: branch ?? this.branch,
      isSpecialDegree: isSpecialDegree ?? this.isSpecialDegree,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (discipline.present) {
      map['discipline'] = Variable<String>(discipline.value);
    }
    if (branch.present) {
      map['branch'] = Variable<String>(branch.value);
    }
    if (isSpecialDegree.present) {
      map['is_special_degree'] = Variable<bool>(isSpecialDegree.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DegreeTableCompanion(')
          ..write('id: $id, ')
          ..write('discipline: $discipline, ')
          ..write('branch: $branch, ')
          ..write('isSpecialDegree: $isSpecialDegree')
          ..write(')'))
        .toString();
  }
}

class $SchoolTableTable extends SchoolTable
    with TableInfo<$SchoolTableTable, School> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchoolTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _mainPersonIdMeta =
      const VerificationMeta('mainPersonId');
  @override
  late final GeneratedColumn<int> mainPersonId = GeneratedColumn<int>(
      'main_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _degreeIdMeta =
      const VerificationMeta('degreeId');
  @override
  late final GeneratedColumn<int> degreeId = GeneratedColumn<int>(
      'degree_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES degree (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _gradesMeta = const VerificationMeta('grades');
  @override
  late final GeneratedColumn<int> grades = GeneratedColumn<int>(
      'grades', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _attendanceMeta =
      const VerificationMeta('attendance');
  @override
  late final GeneratedColumn<int> attendance = GeneratedColumn<int>(
      'attendance', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _projectMeta =
      const VerificationMeta('project');
  @override
  late final GeneratedColumn<int> project = GeneratedColumn<int>(
      'project', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _examMeta = const VerificationMeta('exam');
  @override
  late final GeneratedColumn<int> exam = GeneratedColumn<int>(
      'exam', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _classStartTimeMeta =
      const VerificationMeta('classStartTime');
  @override
  late final GeneratedColumn<int> classStartTime = GeneratedColumn<int>(
      'class_start_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _classEndTimeMeta =
      const VerificationMeta('classEndTime');
  @override
  late final GeneratedColumn<int> classEndTime = GeneratedColumn<int>(
      'class_end_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalSemesterNumberMeta =
      const VerificationMeta('totalSemesterNumber');
  @override
  late final GeneratedColumn<int> totalSemesterNumber = GeneratedColumn<int>(
      'total_semester_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentSemesterNumberMeta =
      const VerificationMeta('currentSemesterNumber');
  @override
  late final GeneratedColumn<int> currentSemesterNumber = GeneratedColumn<int>(
      'current_semester_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _schoolTypeMeta =
      const VerificationMeta('schoolType');
  @override
  late final GeneratedColumn<String> schoolType = GeneratedColumn<String>(
      'school_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _semesterStartDayMeta =
      const VerificationMeta('semesterStartDay');
  @override
  late final GeneratedColumn<int> semesterStartDay = GeneratedColumn<int>(
      'semester_start_day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentDayInSemesterMeta =
      const VerificationMeta('currentDayInSemester');
  @override
  late final GeneratedColumn<int> currentDayInSemester = GeneratedColumn<int>(
      'current_day_in_semester', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _degreeLevelMeta =
      const VerificationMeta('degreeLevel');
  @override
  late final GeneratedColumn<String> degreeLevel = GeneratedColumn<String>(
      'degree_level', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _schoolFeesPerSemesterMeta =
      const VerificationMeta('schoolFeesPerSemester');
  @override
  late final GeneratedColumn<int> schoolFeesPerSemester = GeneratedColumn<int>(
      'school_fees_per_semester', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _scholarshipPercentageMeta =
      const VerificationMeta('scholarshipPercentage');
  @override
  late final GeneratedColumn<int> scholarshipPercentage = GeneratedColumn<int>(
      'scholarship_percentage', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalLoanAmountMeta =
      const VerificationMeta('totalLoanAmount');
  @override
  late final GeneratedColumn<int> totalLoanAmount = GeneratedColumn<int>(
      'total_loan_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _loanProcessedMeta =
      const VerificationMeta('loanProcessed');
  @override
  late final GeneratedColumn<bool> loanProcessed = GeneratedColumn<bool>(
      'loan_processed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("loan_processed" IN (0, 1))'));
  static const VerificationMeta _hasTakenLeaveMeta =
      const VerificationMeta('hasTakenLeave');
  @override
  late final GeneratedColumn<bool> hasTakenLeave = GeneratedColumn<bool>(
      'has_taken_leave', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_taken_leave" IN (0, 1))'));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'));
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'));
  static const VerificationMeta _wasExpelledMeta =
      const VerificationMeta('wasExpelled');
  @override
  late final GeneratedColumn<bool> wasExpelled = GeneratedColumn<bool>(
      'was_expelled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("was_expelled" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        mainPersonId,
        degreeId,
        name,
        grades,
        attendance,
        project,
        exam,
        classStartTime,
        classEndTime,
        totalSemesterNumber,
        currentSemesterNumber,
        schoolType,
        semesterStartDay,
        currentDayInSemester,
        degreeLevel,
        schoolFeesPerSemester,
        scholarshipPercentage,
        totalLoanAmount,
        loanProcessed,
        hasTakenLeave,
        isActive,
        isCompleted,
        wasExpelled
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'school';
  @override
  VerificationContext validateIntegrity(Insertable<School> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('main_person_id')) {
      context.handle(
          _mainPersonIdMeta,
          mainPersonId.isAcceptableOrUnknown(
              data['main_person_id']!, _mainPersonIdMeta));
    } else if (isInserting) {
      context.missing(_mainPersonIdMeta);
    }
    if (data.containsKey('degree_id')) {
      context.handle(_degreeIdMeta,
          degreeId.isAcceptableOrUnknown(data['degree_id']!, _degreeIdMeta));
    } else if (isInserting) {
      context.missing(_degreeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('grades')) {
      context.handle(_gradesMeta,
          grades.isAcceptableOrUnknown(data['grades']!, _gradesMeta));
    } else if (isInserting) {
      context.missing(_gradesMeta);
    }
    if (data.containsKey('attendance')) {
      context.handle(
          _attendanceMeta,
          attendance.isAcceptableOrUnknown(
              data['attendance']!, _attendanceMeta));
    } else if (isInserting) {
      context.missing(_attendanceMeta);
    }
    if (data.containsKey('project')) {
      context.handle(_projectMeta,
          project.isAcceptableOrUnknown(data['project']!, _projectMeta));
    } else if (isInserting) {
      context.missing(_projectMeta);
    }
    if (data.containsKey('exam')) {
      context.handle(
          _examMeta, exam.isAcceptableOrUnknown(data['exam']!, _examMeta));
    } else if (isInserting) {
      context.missing(_examMeta);
    }
    if (data.containsKey('class_start_time')) {
      context.handle(
          _classStartTimeMeta,
          classStartTime.isAcceptableOrUnknown(
              data['class_start_time']!, _classStartTimeMeta));
    } else if (isInserting) {
      context.missing(_classStartTimeMeta);
    }
    if (data.containsKey('class_end_time')) {
      context.handle(
          _classEndTimeMeta,
          classEndTime.isAcceptableOrUnknown(
              data['class_end_time']!, _classEndTimeMeta));
    } else if (isInserting) {
      context.missing(_classEndTimeMeta);
    }
    if (data.containsKey('total_semester_number')) {
      context.handle(
          _totalSemesterNumberMeta,
          totalSemesterNumber.isAcceptableOrUnknown(
              data['total_semester_number']!, _totalSemesterNumberMeta));
    } else if (isInserting) {
      context.missing(_totalSemesterNumberMeta);
    }
    if (data.containsKey('current_semester_number')) {
      context.handle(
          _currentSemesterNumberMeta,
          currentSemesterNumber.isAcceptableOrUnknown(
              data['current_semester_number']!, _currentSemesterNumberMeta));
    } else if (isInserting) {
      context.missing(_currentSemesterNumberMeta);
    }
    if (data.containsKey('school_type')) {
      context.handle(
          _schoolTypeMeta,
          schoolType.isAcceptableOrUnknown(
              data['school_type']!, _schoolTypeMeta));
    } else if (isInserting) {
      context.missing(_schoolTypeMeta);
    }
    if (data.containsKey('semester_start_day')) {
      context.handle(
          _semesterStartDayMeta,
          semesterStartDay.isAcceptableOrUnknown(
              data['semester_start_day']!, _semesterStartDayMeta));
    } else if (isInserting) {
      context.missing(_semesterStartDayMeta);
    }
    if (data.containsKey('current_day_in_semester')) {
      context.handle(
          _currentDayInSemesterMeta,
          currentDayInSemester.isAcceptableOrUnknown(
              data['current_day_in_semester']!, _currentDayInSemesterMeta));
    } else if (isInserting) {
      context.missing(_currentDayInSemesterMeta);
    }
    if (data.containsKey('degree_level')) {
      context.handle(
          _degreeLevelMeta,
          degreeLevel.isAcceptableOrUnknown(
              data['degree_level']!, _degreeLevelMeta));
    } else if (isInserting) {
      context.missing(_degreeLevelMeta);
    }
    if (data.containsKey('school_fees_per_semester')) {
      context.handle(
          _schoolFeesPerSemesterMeta,
          schoolFeesPerSemester.isAcceptableOrUnknown(
              data['school_fees_per_semester']!, _schoolFeesPerSemesterMeta));
    } else if (isInserting) {
      context.missing(_schoolFeesPerSemesterMeta);
    }
    if (data.containsKey('scholarship_percentage')) {
      context.handle(
          _scholarshipPercentageMeta,
          scholarshipPercentage.isAcceptableOrUnknown(
              data['scholarship_percentage']!, _scholarshipPercentageMeta));
    } else if (isInserting) {
      context.missing(_scholarshipPercentageMeta);
    }
    if (data.containsKey('total_loan_amount')) {
      context.handle(
          _totalLoanAmountMeta,
          totalLoanAmount.isAcceptableOrUnknown(
              data['total_loan_amount']!, _totalLoanAmountMeta));
    } else if (isInserting) {
      context.missing(_totalLoanAmountMeta);
    }
    if (data.containsKey('loan_processed')) {
      context.handle(
          _loanProcessedMeta,
          loanProcessed.isAcceptableOrUnknown(
              data['loan_processed']!, _loanProcessedMeta));
    } else if (isInserting) {
      context.missing(_loanProcessedMeta);
    }
    if (data.containsKey('has_taken_leave')) {
      context.handle(
          _hasTakenLeaveMeta,
          hasTakenLeave.isAcceptableOrUnknown(
              data['has_taken_leave']!, _hasTakenLeaveMeta));
    } else if (isInserting) {
      context.missing(_hasTakenLeaveMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    } else if (isInserting) {
      context.missing(_isCompletedMeta);
    }
    if (data.containsKey('was_expelled')) {
      context.handle(
          _wasExpelledMeta,
          wasExpelled.isAcceptableOrUnknown(
              data['was_expelled']!, _wasExpelledMeta));
    } else if (isInserting) {
      context.missing(_wasExpelledMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  School map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return School(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      mainPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}main_person_id'])!,
      degreeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}degree_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      grades: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grades'])!,
      attendance: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attendance'])!,
      project: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}project'])!,
      exam: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exam'])!,
      classStartTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}class_start_time'])!,
      classEndTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}class_end_time'])!,
      totalSemesterNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}total_semester_number'])!,
      currentSemesterNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}current_semester_number'])!,
      schoolType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}school_type'])!,
      semesterStartDay: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}semester_start_day'])!,
      currentDayInSemester: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}current_day_in_semester'])!,
      degreeLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}degree_level'])!,
      schoolFeesPerSemester: attachedDatabase.typeMapping.read(DriftSqlType.int,
          data['${effectivePrefix}school_fees_per_semester'])!,
      scholarshipPercentage: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}scholarship_percentage'])!,
      totalLoanAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_loan_amount'])!,
      loanProcessed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}loan_processed'])!,
      hasTakenLeave: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_taken_leave'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      wasExpelled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}was_expelled'])!,
    );
  }

  @override
  $SchoolTableTable createAlias(String alias) {
    return $SchoolTableTable(attachedDatabase, alias);
  }
}

class School extends DataClass implements Insertable<School> {
  final int id;
  final int mainPersonId;
  final int degreeId;
  final String name;
  final int grades;
  final int attendance;
  final int project;
  final int exam;
  final int classStartTime;
  final int classEndTime;
  final int totalSemesterNumber;
  final int currentSemesterNumber;
  final String schoolType;
  final int semesterStartDay;
  final int currentDayInSemester;
  final String degreeLevel;
  final int schoolFeesPerSemester;
  final int scholarshipPercentage;
  final int totalLoanAmount;
  final bool loanProcessed;
  final bool hasTakenLeave;
  final bool isActive;
  final bool isCompleted;
  final bool wasExpelled;
  const School(
      {required this.id,
      required this.mainPersonId,
      required this.degreeId,
      required this.name,
      required this.grades,
      required this.attendance,
      required this.project,
      required this.exam,
      required this.classStartTime,
      required this.classEndTime,
      required this.totalSemesterNumber,
      required this.currentSemesterNumber,
      required this.schoolType,
      required this.semesterStartDay,
      required this.currentDayInSemester,
      required this.degreeLevel,
      required this.schoolFeesPerSemester,
      required this.scholarshipPercentage,
      required this.totalLoanAmount,
      required this.loanProcessed,
      required this.hasTakenLeave,
      required this.isActive,
      required this.isCompleted,
      required this.wasExpelled});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['main_person_id'] = Variable<int>(mainPersonId);
    map['degree_id'] = Variable<int>(degreeId);
    map['name'] = Variable<String>(name);
    map['grades'] = Variable<int>(grades);
    map['attendance'] = Variable<int>(attendance);
    map['project'] = Variable<int>(project);
    map['exam'] = Variable<int>(exam);
    map['class_start_time'] = Variable<int>(classStartTime);
    map['class_end_time'] = Variable<int>(classEndTime);
    map['total_semester_number'] = Variable<int>(totalSemesterNumber);
    map['current_semester_number'] = Variable<int>(currentSemesterNumber);
    map['school_type'] = Variable<String>(schoolType);
    map['semester_start_day'] = Variable<int>(semesterStartDay);
    map['current_day_in_semester'] = Variable<int>(currentDayInSemester);
    map['degree_level'] = Variable<String>(degreeLevel);
    map['school_fees_per_semester'] = Variable<int>(schoolFeesPerSemester);
    map['scholarship_percentage'] = Variable<int>(scholarshipPercentage);
    map['total_loan_amount'] = Variable<int>(totalLoanAmount);
    map['loan_processed'] = Variable<bool>(loanProcessed);
    map['has_taken_leave'] = Variable<bool>(hasTakenLeave);
    map['is_active'] = Variable<bool>(isActive);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['was_expelled'] = Variable<bool>(wasExpelled);
    return map;
  }

  SchoolTableCompanion toCompanion(bool nullToAbsent) {
    return SchoolTableCompanion(
      id: Value(id),
      mainPersonId: Value(mainPersonId),
      degreeId: Value(degreeId),
      name: Value(name),
      grades: Value(grades),
      attendance: Value(attendance),
      project: Value(project),
      exam: Value(exam),
      classStartTime: Value(classStartTime),
      classEndTime: Value(classEndTime),
      totalSemesterNumber: Value(totalSemesterNumber),
      currentSemesterNumber: Value(currentSemesterNumber),
      schoolType: Value(schoolType),
      semesterStartDay: Value(semesterStartDay),
      currentDayInSemester: Value(currentDayInSemester),
      degreeLevel: Value(degreeLevel),
      schoolFeesPerSemester: Value(schoolFeesPerSemester),
      scholarshipPercentage: Value(scholarshipPercentage),
      totalLoanAmount: Value(totalLoanAmount),
      loanProcessed: Value(loanProcessed),
      hasTakenLeave: Value(hasTakenLeave),
      isActive: Value(isActive),
      isCompleted: Value(isCompleted),
      wasExpelled: Value(wasExpelled),
    );
  }

  factory School.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return School(
      id: serializer.fromJson<int>(json['id']),
      mainPersonId: serializer.fromJson<int>(json['mainPersonId']),
      degreeId: serializer.fromJson<int>(json['degreeId']),
      name: serializer.fromJson<String>(json['name']),
      grades: serializer.fromJson<int>(json['grades']),
      attendance: serializer.fromJson<int>(json['attendance']),
      project: serializer.fromJson<int>(json['project']),
      exam: serializer.fromJson<int>(json['exam']),
      classStartTime: serializer.fromJson<int>(json['classStartTime']),
      classEndTime: serializer.fromJson<int>(json['classEndTime']),
      totalSemesterNumber:
          serializer.fromJson<int>(json['totalSemesterNumber']),
      currentSemesterNumber:
          serializer.fromJson<int>(json['currentSemesterNumber']),
      schoolType: serializer.fromJson<String>(json['schoolType']),
      semesterStartDay: serializer.fromJson<int>(json['semesterStartDay']),
      currentDayInSemester:
          serializer.fromJson<int>(json['currentDayInSemester']),
      degreeLevel: serializer.fromJson<String>(json['degreeLevel']),
      schoolFeesPerSemester:
          serializer.fromJson<int>(json['schoolFeesPerSemester']),
      scholarshipPercentage:
          serializer.fromJson<int>(json['scholarshipPercentage']),
      totalLoanAmount: serializer.fromJson<int>(json['totalLoanAmount']),
      loanProcessed: serializer.fromJson<bool>(json['loanProcessed']),
      hasTakenLeave: serializer.fromJson<bool>(json['hasTakenLeave']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      wasExpelled: serializer.fromJson<bool>(json['wasExpelled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'mainPersonId': serializer.toJson<int>(mainPersonId),
      'degreeId': serializer.toJson<int>(degreeId),
      'name': serializer.toJson<String>(name),
      'grades': serializer.toJson<int>(grades),
      'attendance': serializer.toJson<int>(attendance),
      'project': serializer.toJson<int>(project),
      'exam': serializer.toJson<int>(exam),
      'classStartTime': serializer.toJson<int>(classStartTime),
      'classEndTime': serializer.toJson<int>(classEndTime),
      'totalSemesterNumber': serializer.toJson<int>(totalSemesterNumber),
      'currentSemesterNumber': serializer.toJson<int>(currentSemesterNumber),
      'schoolType': serializer.toJson<String>(schoolType),
      'semesterStartDay': serializer.toJson<int>(semesterStartDay),
      'currentDayInSemester': serializer.toJson<int>(currentDayInSemester),
      'degreeLevel': serializer.toJson<String>(degreeLevel),
      'schoolFeesPerSemester': serializer.toJson<int>(schoolFeesPerSemester),
      'scholarshipPercentage': serializer.toJson<int>(scholarshipPercentage),
      'totalLoanAmount': serializer.toJson<int>(totalLoanAmount),
      'loanProcessed': serializer.toJson<bool>(loanProcessed),
      'hasTakenLeave': serializer.toJson<bool>(hasTakenLeave),
      'isActive': serializer.toJson<bool>(isActive),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'wasExpelled': serializer.toJson<bool>(wasExpelled),
    };
  }

  School copyWith(
          {int? id,
          int? mainPersonId,
          int? degreeId,
          String? name,
          int? grades,
          int? attendance,
          int? project,
          int? exam,
          int? classStartTime,
          int? classEndTime,
          int? totalSemesterNumber,
          int? currentSemesterNumber,
          String? schoolType,
          int? semesterStartDay,
          int? currentDayInSemester,
          String? degreeLevel,
          int? schoolFeesPerSemester,
          int? scholarshipPercentage,
          int? totalLoanAmount,
          bool? loanProcessed,
          bool? hasTakenLeave,
          bool? isActive,
          bool? isCompleted,
          bool? wasExpelled}) =>
      School(
        id: id ?? this.id,
        mainPersonId: mainPersonId ?? this.mainPersonId,
        degreeId: degreeId ?? this.degreeId,
        name: name ?? this.name,
        grades: grades ?? this.grades,
        attendance: attendance ?? this.attendance,
        project: project ?? this.project,
        exam: exam ?? this.exam,
        classStartTime: classStartTime ?? this.classStartTime,
        classEndTime: classEndTime ?? this.classEndTime,
        totalSemesterNumber: totalSemesterNumber ?? this.totalSemesterNumber,
        currentSemesterNumber:
            currentSemesterNumber ?? this.currentSemesterNumber,
        schoolType: schoolType ?? this.schoolType,
        semesterStartDay: semesterStartDay ?? this.semesterStartDay,
        currentDayInSemester: currentDayInSemester ?? this.currentDayInSemester,
        degreeLevel: degreeLevel ?? this.degreeLevel,
        schoolFeesPerSemester:
            schoolFeesPerSemester ?? this.schoolFeesPerSemester,
        scholarshipPercentage:
            scholarshipPercentage ?? this.scholarshipPercentage,
        totalLoanAmount: totalLoanAmount ?? this.totalLoanAmount,
        loanProcessed: loanProcessed ?? this.loanProcessed,
        hasTakenLeave: hasTakenLeave ?? this.hasTakenLeave,
        isActive: isActive ?? this.isActive,
        isCompleted: isCompleted ?? this.isCompleted,
        wasExpelled: wasExpelled ?? this.wasExpelled,
      );
  @override
  String toString() {
    return (StringBuffer('School(')
          ..write('id: $id, ')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('degreeId: $degreeId, ')
          ..write('name: $name, ')
          ..write('grades: $grades, ')
          ..write('attendance: $attendance, ')
          ..write('project: $project, ')
          ..write('exam: $exam, ')
          ..write('classStartTime: $classStartTime, ')
          ..write('classEndTime: $classEndTime, ')
          ..write('totalSemesterNumber: $totalSemesterNumber, ')
          ..write('currentSemesterNumber: $currentSemesterNumber, ')
          ..write('schoolType: $schoolType, ')
          ..write('semesterStartDay: $semesterStartDay, ')
          ..write('currentDayInSemester: $currentDayInSemester, ')
          ..write('degreeLevel: $degreeLevel, ')
          ..write('schoolFeesPerSemester: $schoolFeesPerSemester, ')
          ..write('scholarshipPercentage: $scholarshipPercentage, ')
          ..write('totalLoanAmount: $totalLoanAmount, ')
          ..write('loanProcessed: $loanProcessed, ')
          ..write('hasTakenLeave: $hasTakenLeave, ')
          ..write('isActive: $isActive, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('wasExpelled: $wasExpelled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        mainPersonId,
        degreeId,
        name,
        grades,
        attendance,
        project,
        exam,
        classStartTime,
        classEndTime,
        totalSemesterNumber,
        currentSemesterNumber,
        schoolType,
        semesterStartDay,
        currentDayInSemester,
        degreeLevel,
        schoolFeesPerSemester,
        scholarshipPercentage,
        totalLoanAmount,
        loanProcessed,
        hasTakenLeave,
        isActive,
        isCompleted,
        wasExpelled
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is School &&
          other.id == this.id &&
          other.mainPersonId == this.mainPersonId &&
          other.degreeId == this.degreeId &&
          other.name == this.name &&
          other.grades == this.grades &&
          other.attendance == this.attendance &&
          other.project == this.project &&
          other.exam == this.exam &&
          other.classStartTime == this.classStartTime &&
          other.classEndTime == this.classEndTime &&
          other.totalSemesterNumber == this.totalSemesterNumber &&
          other.currentSemesterNumber == this.currentSemesterNumber &&
          other.schoolType == this.schoolType &&
          other.semesterStartDay == this.semesterStartDay &&
          other.currentDayInSemester == this.currentDayInSemester &&
          other.degreeLevel == this.degreeLevel &&
          other.schoolFeesPerSemester == this.schoolFeesPerSemester &&
          other.scholarshipPercentage == this.scholarshipPercentage &&
          other.totalLoanAmount == this.totalLoanAmount &&
          other.loanProcessed == this.loanProcessed &&
          other.hasTakenLeave == this.hasTakenLeave &&
          other.isActive == this.isActive &&
          other.isCompleted == this.isCompleted &&
          other.wasExpelled == this.wasExpelled);
}

class SchoolTableCompanion extends UpdateCompanion<School> {
  final Value<int> id;
  final Value<int> mainPersonId;
  final Value<int> degreeId;
  final Value<String> name;
  final Value<int> grades;
  final Value<int> attendance;
  final Value<int> project;
  final Value<int> exam;
  final Value<int> classStartTime;
  final Value<int> classEndTime;
  final Value<int> totalSemesterNumber;
  final Value<int> currentSemesterNumber;
  final Value<String> schoolType;
  final Value<int> semesterStartDay;
  final Value<int> currentDayInSemester;
  final Value<String> degreeLevel;
  final Value<int> schoolFeesPerSemester;
  final Value<int> scholarshipPercentage;
  final Value<int> totalLoanAmount;
  final Value<bool> loanProcessed;
  final Value<bool> hasTakenLeave;
  final Value<bool> isActive;
  final Value<bool> isCompleted;
  final Value<bool> wasExpelled;
  const SchoolTableCompanion({
    this.id = const Value.absent(),
    this.mainPersonId = const Value.absent(),
    this.degreeId = const Value.absent(),
    this.name = const Value.absent(),
    this.grades = const Value.absent(),
    this.attendance = const Value.absent(),
    this.project = const Value.absent(),
    this.exam = const Value.absent(),
    this.classStartTime = const Value.absent(),
    this.classEndTime = const Value.absent(),
    this.totalSemesterNumber = const Value.absent(),
    this.currentSemesterNumber = const Value.absent(),
    this.schoolType = const Value.absent(),
    this.semesterStartDay = const Value.absent(),
    this.currentDayInSemester = const Value.absent(),
    this.degreeLevel = const Value.absent(),
    this.schoolFeesPerSemester = const Value.absent(),
    this.scholarshipPercentage = const Value.absent(),
    this.totalLoanAmount = const Value.absent(),
    this.loanProcessed = const Value.absent(),
    this.hasTakenLeave = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.wasExpelled = const Value.absent(),
  });
  SchoolTableCompanion.insert({
    this.id = const Value.absent(),
    required int mainPersonId,
    required int degreeId,
    required String name,
    required int grades,
    required int attendance,
    required int project,
    required int exam,
    required int classStartTime,
    required int classEndTime,
    required int totalSemesterNumber,
    required int currentSemesterNumber,
    required String schoolType,
    required int semesterStartDay,
    required int currentDayInSemester,
    required String degreeLevel,
    required int schoolFeesPerSemester,
    required int scholarshipPercentage,
    required int totalLoanAmount,
    required bool loanProcessed,
    required bool hasTakenLeave,
    required bool isActive,
    required bool isCompleted,
    required bool wasExpelled,
  })  : mainPersonId = Value(mainPersonId),
        degreeId = Value(degreeId),
        name = Value(name),
        grades = Value(grades),
        attendance = Value(attendance),
        project = Value(project),
        exam = Value(exam),
        classStartTime = Value(classStartTime),
        classEndTime = Value(classEndTime),
        totalSemesterNumber = Value(totalSemesterNumber),
        currentSemesterNumber = Value(currentSemesterNumber),
        schoolType = Value(schoolType),
        semesterStartDay = Value(semesterStartDay),
        currentDayInSemester = Value(currentDayInSemester),
        degreeLevel = Value(degreeLevel),
        schoolFeesPerSemester = Value(schoolFeesPerSemester),
        scholarshipPercentage = Value(scholarshipPercentage),
        totalLoanAmount = Value(totalLoanAmount),
        loanProcessed = Value(loanProcessed),
        hasTakenLeave = Value(hasTakenLeave),
        isActive = Value(isActive),
        isCompleted = Value(isCompleted),
        wasExpelled = Value(wasExpelled);
  static Insertable<School> custom({
    Expression<int>? id,
    Expression<int>? mainPersonId,
    Expression<int>? degreeId,
    Expression<String>? name,
    Expression<int>? grades,
    Expression<int>? attendance,
    Expression<int>? project,
    Expression<int>? exam,
    Expression<int>? classStartTime,
    Expression<int>? classEndTime,
    Expression<int>? totalSemesterNumber,
    Expression<int>? currentSemesterNumber,
    Expression<String>? schoolType,
    Expression<int>? semesterStartDay,
    Expression<int>? currentDayInSemester,
    Expression<String>? degreeLevel,
    Expression<int>? schoolFeesPerSemester,
    Expression<int>? scholarshipPercentage,
    Expression<int>? totalLoanAmount,
    Expression<bool>? loanProcessed,
    Expression<bool>? hasTakenLeave,
    Expression<bool>? isActive,
    Expression<bool>? isCompleted,
    Expression<bool>? wasExpelled,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (degreeId != null) 'degree_id': degreeId,
      if (name != null) 'name': name,
      if (grades != null) 'grades': grades,
      if (attendance != null) 'attendance': attendance,
      if (project != null) 'project': project,
      if (exam != null) 'exam': exam,
      if (classStartTime != null) 'class_start_time': classStartTime,
      if (classEndTime != null) 'class_end_time': classEndTime,
      if (totalSemesterNumber != null)
        'total_semester_number': totalSemesterNumber,
      if (currentSemesterNumber != null)
        'current_semester_number': currentSemesterNumber,
      if (schoolType != null) 'school_type': schoolType,
      if (semesterStartDay != null) 'semester_start_day': semesterStartDay,
      if (currentDayInSemester != null)
        'current_day_in_semester': currentDayInSemester,
      if (degreeLevel != null) 'degree_level': degreeLevel,
      if (schoolFeesPerSemester != null)
        'school_fees_per_semester': schoolFeesPerSemester,
      if (scholarshipPercentage != null)
        'scholarship_percentage': scholarshipPercentage,
      if (totalLoanAmount != null) 'total_loan_amount': totalLoanAmount,
      if (loanProcessed != null) 'loan_processed': loanProcessed,
      if (hasTakenLeave != null) 'has_taken_leave': hasTakenLeave,
      if (isActive != null) 'is_active': isActive,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (wasExpelled != null) 'was_expelled': wasExpelled,
    });
  }

  SchoolTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? mainPersonId,
      Value<int>? degreeId,
      Value<String>? name,
      Value<int>? grades,
      Value<int>? attendance,
      Value<int>? project,
      Value<int>? exam,
      Value<int>? classStartTime,
      Value<int>? classEndTime,
      Value<int>? totalSemesterNumber,
      Value<int>? currentSemesterNumber,
      Value<String>? schoolType,
      Value<int>? semesterStartDay,
      Value<int>? currentDayInSemester,
      Value<String>? degreeLevel,
      Value<int>? schoolFeesPerSemester,
      Value<int>? scholarshipPercentage,
      Value<int>? totalLoanAmount,
      Value<bool>? loanProcessed,
      Value<bool>? hasTakenLeave,
      Value<bool>? isActive,
      Value<bool>? isCompleted,
      Value<bool>? wasExpelled}) {
    return SchoolTableCompanion(
      id: id ?? this.id,
      mainPersonId: mainPersonId ?? this.mainPersonId,
      degreeId: degreeId ?? this.degreeId,
      name: name ?? this.name,
      grades: grades ?? this.grades,
      attendance: attendance ?? this.attendance,
      project: project ?? this.project,
      exam: exam ?? this.exam,
      classStartTime: classStartTime ?? this.classStartTime,
      classEndTime: classEndTime ?? this.classEndTime,
      totalSemesterNumber: totalSemesterNumber ?? this.totalSemesterNumber,
      currentSemesterNumber:
          currentSemesterNumber ?? this.currentSemesterNumber,
      schoolType: schoolType ?? this.schoolType,
      semesterStartDay: semesterStartDay ?? this.semesterStartDay,
      currentDayInSemester: currentDayInSemester ?? this.currentDayInSemester,
      degreeLevel: degreeLevel ?? this.degreeLevel,
      schoolFeesPerSemester:
          schoolFeesPerSemester ?? this.schoolFeesPerSemester,
      scholarshipPercentage:
          scholarshipPercentage ?? this.scholarshipPercentage,
      totalLoanAmount: totalLoanAmount ?? this.totalLoanAmount,
      loanProcessed: loanProcessed ?? this.loanProcessed,
      hasTakenLeave: hasTakenLeave ?? this.hasTakenLeave,
      isActive: isActive ?? this.isActive,
      isCompleted: isCompleted ?? this.isCompleted,
      wasExpelled: wasExpelled ?? this.wasExpelled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mainPersonId.present) {
      map['main_person_id'] = Variable<int>(mainPersonId.value);
    }
    if (degreeId.present) {
      map['degree_id'] = Variable<int>(degreeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (grades.present) {
      map['grades'] = Variable<int>(grades.value);
    }
    if (attendance.present) {
      map['attendance'] = Variable<int>(attendance.value);
    }
    if (project.present) {
      map['project'] = Variable<int>(project.value);
    }
    if (exam.present) {
      map['exam'] = Variable<int>(exam.value);
    }
    if (classStartTime.present) {
      map['class_start_time'] = Variable<int>(classStartTime.value);
    }
    if (classEndTime.present) {
      map['class_end_time'] = Variable<int>(classEndTime.value);
    }
    if (totalSemesterNumber.present) {
      map['total_semester_number'] = Variable<int>(totalSemesterNumber.value);
    }
    if (currentSemesterNumber.present) {
      map['current_semester_number'] =
          Variable<int>(currentSemesterNumber.value);
    }
    if (schoolType.present) {
      map['school_type'] = Variable<String>(schoolType.value);
    }
    if (semesterStartDay.present) {
      map['semester_start_day'] = Variable<int>(semesterStartDay.value);
    }
    if (currentDayInSemester.present) {
      map['current_day_in_semester'] =
          Variable<int>(currentDayInSemester.value);
    }
    if (degreeLevel.present) {
      map['degree_level'] = Variable<String>(degreeLevel.value);
    }
    if (schoolFeesPerSemester.present) {
      map['school_fees_per_semester'] =
          Variable<int>(schoolFeesPerSemester.value);
    }
    if (scholarshipPercentage.present) {
      map['scholarship_percentage'] =
          Variable<int>(scholarshipPercentage.value);
    }
    if (totalLoanAmount.present) {
      map['total_loan_amount'] = Variable<int>(totalLoanAmount.value);
    }
    if (loanProcessed.present) {
      map['loan_processed'] = Variable<bool>(loanProcessed.value);
    }
    if (hasTakenLeave.present) {
      map['has_taken_leave'] = Variable<bool>(hasTakenLeave.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (wasExpelled.present) {
      map['was_expelled'] = Variable<bool>(wasExpelled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchoolTableCompanion(')
          ..write('id: $id, ')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('degreeId: $degreeId, ')
          ..write('name: $name, ')
          ..write('grades: $grades, ')
          ..write('attendance: $attendance, ')
          ..write('project: $project, ')
          ..write('exam: $exam, ')
          ..write('classStartTime: $classStartTime, ')
          ..write('classEndTime: $classEndTime, ')
          ..write('totalSemesterNumber: $totalSemesterNumber, ')
          ..write('currentSemesterNumber: $currentSemesterNumber, ')
          ..write('schoolType: $schoolType, ')
          ..write('semesterStartDay: $semesterStartDay, ')
          ..write('currentDayInSemester: $currentDayInSemester, ')
          ..write('degreeLevel: $degreeLevel, ')
          ..write('schoolFeesPerSemester: $schoolFeesPerSemester, ')
          ..write('scholarshipPercentage: $scholarshipPercentage, ')
          ..write('totalLoanAmount: $totalLoanAmount, ')
          ..write('loanProcessed: $loanProcessed, ')
          ..write('hasTakenLeave: $hasTakenLeave, ')
          ..write('isActive: $isActive, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('wasExpelled: $wasExpelled')
          ..write(')'))
        .toString();
  }
}

class $SchoolProjectTableTable extends SchoolProjectTable
    with TableInfo<$SchoolProjectTableTable, SchoolProject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchoolProjectTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _schoolIdMeta =
      const VerificationMeta('schoolId');
  @override
  late final GeneratedColumn<int> schoolId = GeneratedColumn<int>(
      'school_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES school (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _mainPersonIdMeta =
      const VerificationMeta('mainPersonId');
  @override
  late final GeneratedColumn<int> mainPersonId = GeneratedColumn<int>(
      'main_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _projectPartnerSchoolRelationshipIdMeta =
      const VerificationMeta('projectPartnerSchoolRelationshipId');
  @override
  late final GeneratedColumn<int> projectPartnerSchoolRelationshipId =
      GeneratedColumn<int>(
          'project_partner_school_relationship_id', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _semesterNumberMeta =
      const VerificationMeta('semesterNumber');
  @override
  late final GeneratedColumn<int> semesterNumber = GeneratedColumn<int>(
      'semester_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _mainPersonContributionMeta =
      const VerificationMeta('mainPersonContribution');
  @override
  late final GeneratedColumn<int> mainPersonContribution = GeneratedColumn<int>(
      'main_person_contribution', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _projectPartnerContributionMeta =
      const VerificationMeta('projectPartnerContribution');
  @override
  late final GeneratedColumn<int> projectPartnerContribution =
      GeneratedColumn<int>('project_partner_contribution', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _projectPartnerWillContributeMeta =
      const VerificationMeta('projectPartnerWillContribute');
  @override
  late final GeneratedColumn<bool> projectPartnerWillContribute =
      GeneratedColumn<bool>(
          'project_partner_will_contribute', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("project_partner_will_contribute" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        schoolId,
        mainPersonId,
        projectPartnerSchoolRelationshipId,
        semesterNumber,
        mainPersonContribution,
        projectPartnerContribution,
        projectPartnerWillContribute
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'school_project';
  @override
  VerificationContext validateIntegrity(Insertable<SchoolProject> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('school_id')) {
      context.handle(_schoolIdMeta,
          schoolId.isAcceptableOrUnknown(data['school_id']!, _schoolIdMeta));
    } else if (isInserting) {
      context.missing(_schoolIdMeta);
    }
    if (data.containsKey('main_person_id')) {
      context.handle(
          _mainPersonIdMeta,
          mainPersonId.isAcceptableOrUnknown(
              data['main_person_id']!, _mainPersonIdMeta));
    } else if (isInserting) {
      context.missing(_mainPersonIdMeta);
    }
    if (data.containsKey('project_partner_school_relationship_id')) {
      context.handle(
          _projectPartnerSchoolRelationshipIdMeta,
          projectPartnerSchoolRelationshipId.isAcceptableOrUnknown(
              data['project_partner_school_relationship_id']!,
              _projectPartnerSchoolRelationshipIdMeta));
    } else if (isInserting) {
      context.missing(_projectPartnerSchoolRelationshipIdMeta);
    }
    if (data.containsKey('semester_number')) {
      context.handle(
          _semesterNumberMeta,
          semesterNumber.isAcceptableOrUnknown(
              data['semester_number']!, _semesterNumberMeta));
    } else if (isInserting) {
      context.missing(_semesterNumberMeta);
    }
    if (data.containsKey('main_person_contribution')) {
      context.handle(
          _mainPersonContributionMeta,
          mainPersonContribution.isAcceptableOrUnknown(
              data['main_person_contribution']!, _mainPersonContributionMeta));
    } else if (isInserting) {
      context.missing(_mainPersonContributionMeta);
    }
    if (data.containsKey('project_partner_contribution')) {
      context.handle(
          _projectPartnerContributionMeta,
          projectPartnerContribution.isAcceptableOrUnknown(
              data['project_partner_contribution']!,
              _projectPartnerContributionMeta));
    } else if (isInserting) {
      context.missing(_projectPartnerContributionMeta);
    }
    if (data.containsKey('project_partner_will_contribute')) {
      context.handle(
          _projectPartnerWillContributeMeta,
          projectPartnerWillContribute.isAcceptableOrUnknown(
              data['project_partner_will_contribute']!,
              _projectPartnerWillContributeMeta));
    } else if (isInserting) {
      context.missing(_projectPartnerWillContributeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SchoolProject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SchoolProject(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      schoolId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}school_id'])!,
      mainPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}main_person_id'])!,
      projectPartnerSchoolRelationshipId: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}project_partner_school_relationship_id'])!,
      semesterNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}semester_number'])!,
      mainPersonContribution: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}main_person_contribution'])!,
      projectPartnerContribution: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}project_partner_contribution'])!,
      projectPartnerWillContribute: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}project_partner_will_contribute'])!,
    );
  }

  @override
  $SchoolProjectTableTable createAlias(String alias) {
    return $SchoolProjectTableTable(attachedDatabase, alias);
  }
}

class SchoolProject extends DataClass implements Insertable<SchoolProject> {
  final int id;
  final int schoolId;
  final int mainPersonId;
  final int projectPartnerSchoolRelationshipId;
  final int semesterNumber;
  final int mainPersonContribution;
  final int projectPartnerContribution;
  final bool projectPartnerWillContribute;
  const SchoolProject(
      {required this.id,
      required this.schoolId,
      required this.mainPersonId,
      required this.projectPartnerSchoolRelationshipId,
      required this.semesterNumber,
      required this.mainPersonContribution,
      required this.projectPartnerContribution,
      required this.projectPartnerWillContribute});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['school_id'] = Variable<int>(schoolId);
    map['main_person_id'] = Variable<int>(mainPersonId);
    map['project_partner_school_relationship_id'] =
        Variable<int>(projectPartnerSchoolRelationshipId);
    map['semester_number'] = Variable<int>(semesterNumber);
    map['main_person_contribution'] = Variable<int>(mainPersonContribution);
    map['project_partner_contribution'] =
        Variable<int>(projectPartnerContribution);
    map['project_partner_will_contribute'] =
        Variable<bool>(projectPartnerWillContribute);
    return map;
  }

  SchoolProjectTableCompanion toCompanion(bool nullToAbsent) {
    return SchoolProjectTableCompanion(
      id: Value(id),
      schoolId: Value(schoolId),
      mainPersonId: Value(mainPersonId),
      projectPartnerSchoolRelationshipId:
          Value(projectPartnerSchoolRelationshipId),
      semesterNumber: Value(semesterNumber),
      mainPersonContribution: Value(mainPersonContribution),
      projectPartnerContribution: Value(projectPartnerContribution),
      projectPartnerWillContribute: Value(projectPartnerWillContribute),
    );
  }

  factory SchoolProject.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SchoolProject(
      id: serializer.fromJson<int>(json['id']),
      schoolId: serializer.fromJson<int>(json['schoolId']),
      mainPersonId: serializer.fromJson<int>(json['mainPersonId']),
      projectPartnerSchoolRelationshipId:
          serializer.fromJson<int>(json['projectPartnerSchoolRelationshipId']),
      semesterNumber: serializer.fromJson<int>(json['semesterNumber']),
      mainPersonContribution:
          serializer.fromJson<int>(json['mainPersonContribution']),
      projectPartnerContribution:
          serializer.fromJson<int>(json['projectPartnerContribution']),
      projectPartnerWillContribute:
          serializer.fromJson<bool>(json['projectPartnerWillContribute']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'schoolId': serializer.toJson<int>(schoolId),
      'mainPersonId': serializer.toJson<int>(mainPersonId),
      'projectPartnerSchoolRelationshipId':
          serializer.toJson<int>(projectPartnerSchoolRelationshipId),
      'semesterNumber': serializer.toJson<int>(semesterNumber),
      'mainPersonContribution': serializer.toJson<int>(mainPersonContribution),
      'projectPartnerContribution':
          serializer.toJson<int>(projectPartnerContribution),
      'projectPartnerWillContribute':
          serializer.toJson<bool>(projectPartnerWillContribute),
    };
  }

  SchoolProject copyWith(
          {int? id,
          int? schoolId,
          int? mainPersonId,
          int? projectPartnerSchoolRelationshipId,
          int? semesterNumber,
          int? mainPersonContribution,
          int? projectPartnerContribution,
          bool? projectPartnerWillContribute}) =>
      SchoolProject(
        id: id ?? this.id,
        schoolId: schoolId ?? this.schoolId,
        mainPersonId: mainPersonId ?? this.mainPersonId,
        projectPartnerSchoolRelationshipId:
            projectPartnerSchoolRelationshipId ??
                this.projectPartnerSchoolRelationshipId,
        semesterNumber: semesterNumber ?? this.semesterNumber,
        mainPersonContribution:
            mainPersonContribution ?? this.mainPersonContribution,
        projectPartnerContribution:
            projectPartnerContribution ?? this.projectPartnerContribution,
        projectPartnerWillContribute:
            projectPartnerWillContribute ?? this.projectPartnerWillContribute,
      );
  @override
  String toString() {
    return (StringBuffer('SchoolProject(')
          ..write('id: $id, ')
          ..write('schoolId: $schoolId, ')
          ..write('mainPersonId: $mainPersonId, ')
          ..write(
              'projectPartnerSchoolRelationshipId: $projectPartnerSchoolRelationshipId, ')
          ..write('semesterNumber: $semesterNumber, ')
          ..write('mainPersonContribution: $mainPersonContribution, ')
          ..write('projectPartnerContribution: $projectPartnerContribution, ')
          ..write('projectPartnerWillContribute: $projectPartnerWillContribute')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      schoolId,
      mainPersonId,
      projectPartnerSchoolRelationshipId,
      semesterNumber,
      mainPersonContribution,
      projectPartnerContribution,
      projectPartnerWillContribute);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SchoolProject &&
          other.id == this.id &&
          other.schoolId == this.schoolId &&
          other.mainPersonId == this.mainPersonId &&
          other.projectPartnerSchoolRelationshipId ==
              this.projectPartnerSchoolRelationshipId &&
          other.semesterNumber == this.semesterNumber &&
          other.mainPersonContribution == this.mainPersonContribution &&
          other.projectPartnerContribution == this.projectPartnerContribution &&
          other.projectPartnerWillContribute ==
              this.projectPartnerWillContribute);
}

class SchoolProjectTableCompanion extends UpdateCompanion<SchoolProject> {
  final Value<int> id;
  final Value<int> schoolId;
  final Value<int> mainPersonId;
  final Value<int> projectPartnerSchoolRelationshipId;
  final Value<int> semesterNumber;
  final Value<int> mainPersonContribution;
  final Value<int> projectPartnerContribution;
  final Value<bool> projectPartnerWillContribute;
  const SchoolProjectTableCompanion({
    this.id = const Value.absent(),
    this.schoolId = const Value.absent(),
    this.mainPersonId = const Value.absent(),
    this.projectPartnerSchoolRelationshipId = const Value.absent(),
    this.semesterNumber = const Value.absent(),
    this.mainPersonContribution = const Value.absent(),
    this.projectPartnerContribution = const Value.absent(),
    this.projectPartnerWillContribute = const Value.absent(),
  });
  SchoolProjectTableCompanion.insert({
    this.id = const Value.absent(),
    required int schoolId,
    required int mainPersonId,
    required int projectPartnerSchoolRelationshipId,
    required int semesterNumber,
    required int mainPersonContribution,
    required int projectPartnerContribution,
    required bool projectPartnerWillContribute,
  })  : schoolId = Value(schoolId),
        mainPersonId = Value(mainPersonId),
        projectPartnerSchoolRelationshipId =
            Value(projectPartnerSchoolRelationshipId),
        semesterNumber = Value(semesterNumber),
        mainPersonContribution = Value(mainPersonContribution),
        projectPartnerContribution = Value(projectPartnerContribution),
        projectPartnerWillContribute = Value(projectPartnerWillContribute);
  static Insertable<SchoolProject> custom({
    Expression<int>? id,
    Expression<int>? schoolId,
    Expression<int>? mainPersonId,
    Expression<int>? projectPartnerSchoolRelationshipId,
    Expression<int>? semesterNumber,
    Expression<int>? mainPersonContribution,
    Expression<int>? projectPartnerContribution,
    Expression<bool>? projectPartnerWillContribute,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (schoolId != null) 'school_id': schoolId,
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (projectPartnerSchoolRelationshipId != null)
        'project_partner_school_relationship_id':
            projectPartnerSchoolRelationshipId,
      if (semesterNumber != null) 'semester_number': semesterNumber,
      if (mainPersonContribution != null)
        'main_person_contribution': mainPersonContribution,
      if (projectPartnerContribution != null)
        'project_partner_contribution': projectPartnerContribution,
      if (projectPartnerWillContribute != null)
        'project_partner_will_contribute': projectPartnerWillContribute,
    });
  }

  SchoolProjectTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? schoolId,
      Value<int>? mainPersonId,
      Value<int>? projectPartnerSchoolRelationshipId,
      Value<int>? semesterNumber,
      Value<int>? mainPersonContribution,
      Value<int>? projectPartnerContribution,
      Value<bool>? projectPartnerWillContribute}) {
    return SchoolProjectTableCompanion(
      id: id ?? this.id,
      schoolId: schoolId ?? this.schoolId,
      mainPersonId: mainPersonId ?? this.mainPersonId,
      projectPartnerSchoolRelationshipId: projectPartnerSchoolRelationshipId ??
          this.projectPartnerSchoolRelationshipId,
      semesterNumber: semesterNumber ?? this.semesterNumber,
      mainPersonContribution:
          mainPersonContribution ?? this.mainPersonContribution,
      projectPartnerContribution:
          projectPartnerContribution ?? this.projectPartnerContribution,
      projectPartnerWillContribute:
          projectPartnerWillContribute ?? this.projectPartnerWillContribute,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (schoolId.present) {
      map['school_id'] = Variable<int>(schoolId.value);
    }
    if (mainPersonId.present) {
      map['main_person_id'] = Variable<int>(mainPersonId.value);
    }
    if (projectPartnerSchoolRelationshipId.present) {
      map['project_partner_school_relationship_id'] =
          Variable<int>(projectPartnerSchoolRelationshipId.value);
    }
    if (semesterNumber.present) {
      map['semester_number'] = Variable<int>(semesterNumber.value);
    }
    if (mainPersonContribution.present) {
      map['main_person_contribution'] =
          Variable<int>(mainPersonContribution.value);
    }
    if (projectPartnerContribution.present) {
      map['project_partner_contribution'] =
          Variable<int>(projectPartnerContribution.value);
    }
    if (projectPartnerWillContribute.present) {
      map['project_partner_will_contribute'] =
          Variable<bool>(projectPartnerWillContribute.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchoolProjectTableCompanion(')
          ..write('id: $id, ')
          ..write('schoolId: $schoolId, ')
          ..write('mainPersonId: $mainPersonId, ')
          ..write(
              'projectPartnerSchoolRelationshipId: $projectPartnerSchoolRelationshipId, ')
          ..write('semesterNumber: $semesterNumber, ')
          ..write('mainPersonContribution: $mainPersonContribution, ')
          ..write('projectPartnerContribution: $projectPartnerContribution, ')
          ..write('projectPartnerWillContribute: $projectPartnerWillContribute')
          ..write(')'))
        .toString();
  }
}

class $SchoolRelationshipTableTable extends SchoolRelationshipTable
    with TableInfo<$SchoolRelationshipTableTable, SchoolRelationship> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchoolRelationshipTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _schoolIdMeta =
      const VerificationMeta('schoolId');
  @override
  late final GeneratedColumn<int> schoolId = GeneratedColumn<int>(
      'school_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES school (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _mainPersonIdMeta =
      const VerificationMeta('mainPersonId');
  @override
  late final GeneratedColumn<int> mainPersonId = GeneratedColumn<int>(
      'main_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _otherPersonIdMeta =
      const VerificationMeta('otherPersonId');
  @override
  late final GeneratedColumn<int> otherPersonId = GeneratedColumn<int>(
      'other_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _schoolRelationshipTypeMeta =
      const VerificationMeta('schoolRelationshipType');
  @override
  late final GeneratedColumn<String> schoolRelationshipType =
      GeneratedColumn<String>('school_relationship_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _informalRelationshipTypeMeta =
      const VerificationMeta('informalRelationshipType');
  @override
  late final GeneratedColumn<String> informalRelationshipType =
      GeneratedColumn<String>('informal_relationship_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _gradesMeta = const VerificationMeta('grades');
  @override
  late final GeneratedColumn<int> grades = GeneratedColumn<int>(
      'grades', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _professionalMeta =
      const VerificationMeta('professional');
  @override
  late final GeneratedColumn<bool> professional = GeneratedColumn<bool>(
      'professional', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("professional" IN (0, 1))'));
  static const VerificationMeta _helpfulMeta =
      const VerificationMeta('helpful');
  @override
  late final GeneratedColumn<bool> helpful = GeneratedColumn<bool>(
      'helpful', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("helpful" IN (0, 1))'));
  static const VerificationMeta _personalityTypeMeta =
      const VerificationMeta('personalityType');
  @override
  late final GeneratedColumn<String> personalityType = GeneratedColumn<String>(
      'personality_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        schoolId,
        mainPersonId,
        otherPersonId,
        schoolRelationshipType,
        informalRelationshipType,
        grades,
        professional,
        helpful,
        personalityType
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'school_relationship';
  @override
  VerificationContext validateIntegrity(Insertable<SchoolRelationship> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('school_id')) {
      context.handle(_schoolIdMeta,
          schoolId.isAcceptableOrUnknown(data['school_id']!, _schoolIdMeta));
    } else if (isInserting) {
      context.missing(_schoolIdMeta);
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
    } else if (isInserting) {
      context.missing(_otherPersonIdMeta);
    }
    if (data.containsKey('school_relationship_type')) {
      context.handle(
          _schoolRelationshipTypeMeta,
          schoolRelationshipType.isAcceptableOrUnknown(
              data['school_relationship_type']!, _schoolRelationshipTypeMeta));
    } else if (isInserting) {
      context.missing(_schoolRelationshipTypeMeta);
    }
    if (data.containsKey('informal_relationship_type')) {
      context.handle(
          _informalRelationshipTypeMeta,
          informalRelationshipType.isAcceptableOrUnknown(
              data['informal_relationship_type']!,
              _informalRelationshipTypeMeta));
    } else if (isInserting) {
      context.missing(_informalRelationshipTypeMeta);
    }
    if (data.containsKey('grades')) {
      context.handle(_gradesMeta,
          grades.isAcceptableOrUnknown(data['grades']!, _gradesMeta));
    } else if (isInserting) {
      context.missing(_gradesMeta);
    }
    if (data.containsKey('professional')) {
      context.handle(
          _professionalMeta,
          professional.isAcceptableOrUnknown(
              data['professional']!, _professionalMeta));
    } else if (isInserting) {
      context.missing(_professionalMeta);
    }
    if (data.containsKey('helpful')) {
      context.handle(_helpfulMeta,
          helpful.isAcceptableOrUnknown(data['helpful']!, _helpfulMeta));
    } else if (isInserting) {
      context.missing(_helpfulMeta);
    }
    if (data.containsKey('personality_type')) {
      context.handle(
          _personalityTypeMeta,
          personalityType.isAcceptableOrUnknown(
              data['personality_type']!, _personalityTypeMeta));
    } else if (isInserting) {
      context.missing(_personalityTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SchoolRelationship map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SchoolRelationship(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      schoolId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}school_id'])!,
      mainPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}main_person_id'])!,
      otherPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}other_person_id'])!,
      schoolRelationshipType: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}school_relationship_type'])!,
      informalRelationshipType: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}informal_relationship_type'])!,
      grades: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grades'])!,
      professional: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}professional'])!,
      helpful: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}helpful'])!,
      personalityType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}personality_type'])!,
    );
  }

  @override
  $SchoolRelationshipTableTable createAlias(String alias) {
    return $SchoolRelationshipTableTable(attachedDatabase, alias);
  }
}

class SchoolRelationship extends DataClass
    implements Insertable<SchoolRelationship> {
  final int id;
  final int schoolId;
  final int mainPersonId;
  final int otherPersonId;
  final String schoolRelationshipType;
  final String informalRelationshipType;
  final int grades;
  final bool professional;
  final bool helpful;
  final String personalityType;
  const SchoolRelationship(
      {required this.id,
      required this.schoolId,
      required this.mainPersonId,
      required this.otherPersonId,
      required this.schoolRelationshipType,
      required this.informalRelationshipType,
      required this.grades,
      required this.professional,
      required this.helpful,
      required this.personalityType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['school_id'] = Variable<int>(schoolId);
    map['main_person_id'] = Variable<int>(mainPersonId);
    map['other_person_id'] = Variable<int>(otherPersonId);
    map['school_relationship_type'] = Variable<String>(schoolRelationshipType);
    map['informal_relationship_type'] =
        Variable<String>(informalRelationshipType);
    map['grades'] = Variable<int>(grades);
    map['professional'] = Variable<bool>(professional);
    map['helpful'] = Variable<bool>(helpful);
    map['personality_type'] = Variable<String>(personalityType);
    return map;
  }

  SchoolRelationshipTableCompanion toCompanion(bool nullToAbsent) {
    return SchoolRelationshipTableCompanion(
      id: Value(id),
      schoolId: Value(schoolId),
      mainPersonId: Value(mainPersonId),
      otherPersonId: Value(otherPersonId),
      schoolRelationshipType: Value(schoolRelationshipType),
      informalRelationshipType: Value(informalRelationshipType),
      grades: Value(grades),
      professional: Value(professional),
      helpful: Value(helpful),
      personalityType: Value(personalityType),
    );
  }

  factory SchoolRelationship.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SchoolRelationship(
      id: serializer.fromJson<int>(json['id']),
      schoolId: serializer.fromJson<int>(json['schoolId']),
      mainPersonId: serializer.fromJson<int>(json['mainPersonId']),
      otherPersonId: serializer.fromJson<int>(json['otherPersonId']),
      schoolRelationshipType:
          serializer.fromJson<String>(json['schoolRelationshipType']),
      informalRelationshipType:
          serializer.fromJson<String>(json['informalRelationshipType']),
      grades: serializer.fromJson<int>(json['grades']),
      professional: serializer.fromJson<bool>(json['professional']),
      helpful: serializer.fromJson<bool>(json['helpful']),
      personalityType: serializer.fromJson<String>(json['personalityType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'schoolId': serializer.toJson<int>(schoolId),
      'mainPersonId': serializer.toJson<int>(mainPersonId),
      'otherPersonId': serializer.toJson<int>(otherPersonId),
      'schoolRelationshipType':
          serializer.toJson<String>(schoolRelationshipType),
      'informalRelationshipType':
          serializer.toJson<String>(informalRelationshipType),
      'grades': serializer.toJson<int>(grades),
      'professional': serializer.toJson<bool>(professional),
      'helpful': serializer.toJson<bool>(helpful),
      'personalityType': serializer.toJson<String>(personalityType),
    };
  }

  SchoolRelationship copyWith(
          {int? id,
          int? schoolId,
          int? mainPersonId,
          int? otherPersonId,
          String? schoolRelationshipType,
          String? informalRelationshipType,
          int? grades,
          bool? professional,
          bool? helpful,
          String? personalityType}) =>
      SchoolRelationship(
        id: id ?? this.id,
        schoolId: schoolId ?? this.schoolId,
        mainPersonId: mainPersonId ?? this.mainPersonId,
        otherPersonId: otherPersonId ?? this.otherPersonId,
        schoolRelationshipType:
            schoolRelationshipType ?? this.schoolRelationshipType,
        informalRelationshipType:
            informalRelationshipType ?? this.informalRelationshipType,
        grades: grades ?? this.grades,
        professional: professional ?? this.professional,
        helpful: helpful ?? this.helpful,
        personalityType: personalityType ?? this.personalityType,
      );
  @override
  String toString() {
    return (StringBuffer('SchoolRelationship(')
          ..write('id: $id, ')
          ..write('schoolId: $schoolId, ')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('otherPersonId: $otherPersonId, ')
          ..write('schoolRelationshipType: $schoolRelationshipType, ')
          ..write('informalRelationshipType: $informalRelationshipType, ')
          ..write('grades: $grades, ')
          ..write('professional: $professional, ')
          ..write('helpful: $helpful, ')
          ..write('personalityType: $personalityType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      schoolId,
      mainPersonId,
      otherPersonId,
      schoolRelationshipType,
      informalRelationshipType,
      grades,
      professional,
      helpful,
      personalityType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SchoolRelationship &&
          other.id == this.id &&
          other.schoolId == this.schoolId &&
          other.mainPersonId == this.mainPersonId &&
          other.otherPersonId == this.otherPersonId &&
          other.schoolRelationshipType == this.schoolRelationshipType &&
          other.informalRelationshipType == this.informalRelationshipType &&
          other.grades == this.grades &&
          other.professional == this.professional &&
          other.helpful == this.helpful &&
          other.personalityType == this.personalityType);
}

class SchoolRelationshipTableCompanion
    extends UpdateCompanion<SchoolRelationship> {
  final Value<int> id;
  final Value<int> schoolId;
  final Value<int> mainPersonId;
  final Value<int> otherPersonId;
  final Value<String> schoolRelationshipType;
  final Value<String> informalRelationshipType;
  final Value<int> grades;
  final Value<bool> professional;
  final Value<bool> helpful;
  final Value<String> personalityType;
  const SchoolRelationshipTableCompanion({
    this.id = const Value.absent(),
    this.schoolId = const Value.absent(),
    this.mainPersonId = const Value.absent(),
    this.otherPersonId = const Value.absent(),
    this.schoolRelationshipType = const Value.absent(),
    this.informalRelationshipType = const Value.absent(),
    this.grades = const Value.absent(),
    this.professional = const Value.absent(),
    this.helpful = const Value.absent(),
    this.personalityType = const Value.absent(),
  });
  SchoolRelationshipTableCompanion.insert({
    this.id = const Value.absent(),
    required int schoolId,
    required int mainPersonId,
    required int otherPersonId,
    required String schoolRelationshipType,
    required String informalRelationshipType,
    required int grades,
    required bool professional,
    required bool helpful,
    required String personalityType,
  })  : schoolId = Value(schoolId),
        mainPersonId = Value(mainPersonId),
        otherPersonId = Value(otherPersonId),
        schoolRelationshipType = Value(schoolRelationshipType),
        informalRelationshipType = Value(informalRelationshipType),
        grades = Value(grades),
        professional = Value(professional),
        helpful = Value(helpful),
        personalityType = Value(personalityType);
  static Insertable<SchoolRelationship> custom({
    Expression<int>? id,
    Expression<int>? schoolId,
    Expression<int>? mainPersonId,
    Expression<int>? otherPersonId,
    Expression<String>? schoolRelationshipType,
    Expression<String>? informalRelationshipType,
    Expression<int>? grades,
    Expression<bool>? professional,
    Expression<bool>? helpful,
    Expression<String>? personalityType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (schoolId != null) 'school_id': schoolId,
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (otherPersonId != null) 'other_person_id': otherPersonId,
      if (schoolRelationshipType != null)
        'school_relationship_type': schoolRelationshipType,
      if (informalRelationshipType != null)
        'informal_relationship_type': informalRelationshipType,
      if (grades != null) 'grades': grades,
      if (professional != null) 'professional': professional,
      if (helpful != null) 'helpful': helpful,
      if (personalityType != null) 'personality_type': personalityType,
    });
  }

  SchoolRelationshipTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? schoolId,
      Value<int>? mainPersonId,
      Value<int>? otherPersonId,
      Value<String>? schoolRelationshipType,
      Value<String>? informalRelationshipType,
      Value<int>? grades,
      Value<bool>? professional,
      Value<bool>? helpful,
      Value<String>? personalityType}) {
    return SchoolRelationshipTableCompanion(
      id: id ?? this.id,
      schoolId: schoolId ?? this.schoolId,
      mainPersonId: mainPersonId ?? this.mainPersonId,
      otherPersonId: otherPersonId ?? this.otherPersonId,
      schoolRelationshipType:
          schoolRelationshipType ?? this.schoolRelationshipType,
      informalRelationshipType:
          informalRelationshipType ?? this.informalRelationshipType,
      grades: grades ?? this.grades,
      professional: professional ?? this.professional,
      helpful: helpful ?? this.helpful,
      personalityType: personalityType ?? this.personalityType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (schoolId.present) {
      map['school_id'] = Variable<int>(schoolId.value);
    }
    if (mainPersonId.present) {
      map['main_person_id'] = Variable<int>(mainPersonId.value);
    }
    if (otherPersonId.present) {
      map['other_person_id'] = Variable<int>(otherPersonId.value);
    }
    if (schoolRelationshipType.present) {
      map['school_relationship_type'] =
          Variable<String>(schoolRelationshipType.value);
    }
    if (informalRelationshipType.present) {
      map['informal_relationship_type'] =
          Variable<String>(informalRelationshipType.value);
    }
    if (grades.present) {
      map['grades'] = Variable<int>(grades.value);
    }
    if (professional.present) {
      map['professional'] = Variable<bool>(professional.value);
    }
    if (helpful.present) {
      map['helpful'] = Variable<bool>(helpful.value);
    }
    if (personalityType.present) {
      map['personality_type'] = Variable<String>(personalityType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchoolRelationshipTableCompanion(')
          ..write('id: $id, ')
          ..write('schoolId: $schoolId, ')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('otherPersonId: $otherPersonId, ')
          ..write('schoolRelationshipType: $schoolRelationshipType, ')
          ..write('informalRelationshipType: $informalRelationshipType, ')
          ..write('grades: $grades, ')
          ..write('professional: $professional, ')
          ..write('helpful: $helpful, ')
          ..write('personalityType: $personalityType')
          ..write(')'))
        .toString();
  }
}

class $JobTableTable extends JobTable with TableInfo<$JobTableTable, Job> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _jobTitleMeta =
      const VerificationMeta('jobTitle');
  @override
  late final GeneratedColumn<String> jobTitle = GeneratedColumn<String>(
      'job_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _jobTypeMeta =
      const VerificationMeta('jobType');
  @override
  late final GeneratedColumn<String> jobType = GeneratedColumn<String>(
      'job_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _companySuffixMeta =
      const VerificationMeta('companySuffix');
  @override
  late final GeneratedColumn<String> companySuffix = GeneratedColumn<String>(
      'company_suffix', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _employmentTypeMeta =
      const VerificationMeta('employmentType');
  @override
  late final GeneratedColumn<String> employmentType = GeneratedColumn<String>(
      'employment_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _getsTipsMeta =
      const VerificationMeta('getsTips');
  @override
  late final GeneratedColumn<bool> getsTips = GeneratedColumn<bool>(
      'gets_tips', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("gets_tips" IN (0, 1))'));
  static const VerificationMeta _levelOneTitleMeta =
      const VerificationMeta('levelOneTitle');
  @override
  late final GeneratedColumn<String> levelOneTitle = GeneratedColumn<String>(
      'level_one_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _levelOneBasePayMeta =
      const VerificationMeta('levelOneBasePay');
  @override
  late final GeneratedColumn<int> levelOneBasePay = GeneratedColumn<int>(
      'level_one_base_pay', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _levelTwoTitleMeta =
      const VerificationMeta('levelTwoTitle');
  @override
  late final GeneratedColumn<String> levelTwoTitle = GeneratedColumn<String>(
      'level_two_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _levelTwoBasePayMeta =
      const VerificationMeta('levelTwoBasePay');
  @override
  late final GeneratedColumn<int> levelTwoBasePay = GeneratedColumn<int>(
      'level_two_base_pay', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _levelThreeTitleMeta =
      const VerificationMeta('levelThreeTitle');
  @override
  late final GeneratedColumn<String> levelThreeTitle = GeneratedColumn<String>(
      'level_three_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _levelThreeBasePayMeta =
      const VerificationMeta('levelThreeBasePay');
  @override
  late final GeneratedColumn<int> levelThreeBasePay = GeneratedColumn<int>(
      'level_three_base_pay', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _qualifiedDisciplinesMeta =
      const VerificationMeta('qualifiedDisciplines');
  @override
  late final GeneratedColumn<String> qualifiedDisciplines =
      GeneratedColumn<String>('qualified_disciplines', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _qualifiedBranchesMeta =
      const VerificationMeta('qualifiedBranches');
  @override
  late final GeneratedColumn<String> qualifiedBranches =
      GeneratedColumn<String>('qualified_branches', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _healthInsuranceCoverageMeta =
      const VerificationMeta('healthInsuranceCoverage');
  @override
  late final GeneratedColumn<int> healthInsuranceCoverage =
      GeneratedColumn<int>('health_insurance_coverage', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        jobTitle,
        jobType,
        companySuffix,
        employmentType,
        getsTips,
        levelOneTitle,
        levelOneBasePay,
        levelTwoTitle,
        levelTwoBasePay,
        levelThreeTitle,
        levelThreeBasePay,
        qualifiedDisciplines,
        qualifiedBranches,
        healthInsuranceCoverage
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'job';
  @override
  VerificationContext validateIntegrity(Insertable<Job> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('job_title')) {
      context.handle(_jobTitleMeta,
          jobTitle.isAcceptableOrUnknown(data['job_title']!, _jobTitleMeta));
    } else if (isInserting) {
      context.missing(_jobTitleMeta);
    }
    if (data.containsKey('job_type')) {
      context.handle(_jobTypeMeta,
          jobType.isAcceptableOrUnknown(data['job_type']!, _jobTypeMeta));
    } else if (isInserting) {
      context.missing(_jobTypeMeta);
    }
    if (data.containsKey('company_suffix')) {
      context.handle(
          _companySuffixMeta,
          companySuffix.isAcceptableOrUnknown(
              data['company_suffix']!, _companySuffixMeta));
    } else if (isInserting) {
      context.missing(_companySuffixMeta);
    }
    if (data.containsKey('employment_type')) {
      context.handle(
          _employmentTypeMeta,
          employmentType.isAcceptableOrUnknown(
              data['employment_type']!, _employmentTypeMeta));
    } else if (isInserting) {
      context.missing(_employmentTypeMeta);
    }
    if (data.containsKey('gets_tips')) {
      context.handle(_getsTipsMeta,
          getsTips.isAcceptableOrUnknown(data['gets_tips']!, _getsTipsMeta));
    } else if (isInserting) {
      context.missing(_getsTipsMeta);
    }
    if (data.containsKey('level_one_title')) {
      context.handle(
          _levelOneTitleMeta,
          levelOneTitle.isAcceptableOrUnknown(
              data['level_one_title']!, _levelOneTitleMeta));
    } else if (isInserting) {
      context.missing(_levelOneTitleMeta);
    }
    if (data.containsKey('level_one_base_pay')) {
      context.handle(
          _levelOneBasePayMeta,
          levelOneBasePay.isAcceptableOrUnknown(
              data['level_one_base_pay']!, _levelOneBasePayMeta));
    } else if (isInserting) {
      context.missing(_levelOneBasePayMeta);
    }
    if (data.containsKey('level_two_title')) {
      context.handle(
          _levelTwoTitleMeta,
          levelTwoTitle.isAcceptableOrUnknown(
              data['level_two_title']!, _levelTwoTitleMeta));
    } else if (isInserting) {
      context.missing(_levelTwoTitleMeta);
    }
    if (data.containsKey('level_two_base_pay')) {
      context.handle(
          _levelTwoBasePayMeta,
          levelTwoBasePay.isAcceptableOrUnknown(
              data['level_two_base_pay']!, _levelTwoBasePayMeta));
    } else if (isInserting) {
      context.missing(_levelTwoBasePayMeta);
    }
    if (data.containsKey('level_three_title')) {
      context.handle(
          _levelThreeTitleMeta,
          levelThreeTitle.isAcceptableOrUnknown(
              data['level_three_title']!, _levelThreeTitleMeta));
    } else if (isInserting) {
      context.missing(_levelThreeTitleMeta);
    }
    if (data.containsKey('level_three_base_pay')) {
      context.handle(
          _levelThreeBasePayMeta,
          levelThreeBasePay.isAcceptableOrUnknown(
              data['level_three_base_pay']!, _levelThreeBasePayMeta));
    } else if (isInserting) {
      context.missing(_levelThreeBasePayMeta);
    }
    if (data.containsKey('qualified_disciplines')) {
      context.handle(
          _qualifiedDisciplinesMeta,
          qualifiedDisciplines.isAcceptableOrUnknown(
              data['qualified_disciplines']!, _qualifiedDisciplinesMeta));
    } else if (isInserting) {
      context.missing(_qualifiedDisciplinesMeta);
    }
    if (data.containsKey('qualified_branches')) {
      context.handle(
          _qualifiedBranchesMeta,
          qualifiedBranches.isAcceptableOrUnknown(
              data['qualified_branches']!, _qualifiedBranchesMeta));
    } else if (isInserting) {
      context.missing(_qualifiedBranchesMeta);
    }
    if (data.containsKey('health_insurance_coverage')) {
      context.handle(
          _healthInsuranceCoverageMeta,
          healthInsuranceCoverage.isAcceptableOrUnknown(
              data['health_insurance_coverage']!,
              _healthInsuranceCoverageMeta));
    } else if (isInserting) {
      context.missing(_healthInsuranceCoverageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Job map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Job(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      jobTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}job_title'])!,
      jobType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}job_type'])!,
      companySuffix: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company_suffix'])!,
      employmentType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}employment_type'])!,
      getsTips: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}gets_tips'])!,
      levelOneTitle: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}level_one_title'])!,
      levelOneBasePay: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}level_one_base_pay'])!,
      levelTwoTitle: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}level_two_title'])!,
      levelTwoBasePay: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}level_two_base_pay'])!,
      levelThreeTitle: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}level_three_title'])!,
      levelThreeBasePay: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}level_three_base_pay'])!,
      qualifiedDisciplines: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}qualified_disciplines'])!,
      qualifiedBranches: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}qualified_branches'])!,
      healthInsuranceCoverage: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}health_insurance_coverage'])!,
    );
  }

  @override
  $JobTableTable createAlias(String alias) {
    return $JobTableTable(attachedDatabase, alias);
  }
}

class Job extends DataClass implements Insertable<Job> {
  final int id;
  final String jobTitle;
  final String jobType;
  final String companySuffix;
  final String employmentType;
  final bool getsTips;
  final String levelOneTitle;
  final int levelOneBasePay;
  final String levelTwoTitle;
  final int levelTwoBasePay;
  final String levelThreeTitle;
  final int levelThreeBasePay;
  final String qualifiedDisciplines;
  final String qualifiedBranches;
  final int healthInsuranceCoverage;
  const Job(
      {required this.id,
      required this.jobTitle,
      required this.jobType,
      required this.companySuffix,
      required this.employmentType,
      required this.getsTips,
      required this.levelOneTitle,
      required this.levelOneBasePay,
      required this.levelTwoTitle,
      required this.levelTwoBasePay,
      required this.levelThreeTitle,
      required this.levelThreeBasePay,
      required this.qualifiedDisciplines,
      required this.qualifiedBranches,
      required this.healthInsuranceCoverage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['job_title'] = Variable<String>(jobTitle);
    map['job_type'] = Variable<String>(jobType);
    map['company_suffix'] = Variable<String>(companySuffix);
    map['employment_type'] = Variable<String>(employmentType);
    map['gets_tips'] = Variable<bool>(getsTips);
    map['level_one_title'] = Variable<String>(levelOneTitle);
    map['level_one_base_pay'] = Variable<int>(levelOneBasePay);
    map['level_two_title'] = Variable<String>(levelTwoTitle);
    map['level_two_base_pay'] = Variable<int>(levelTwoBasePay);
    map['level_three_title'] = Variable<String>(levelThreeTitle);
    map['level_three_base_pay'] = Variable<int>(levelThreeBasePay);
    map['qualified_disciplines'] = Variable<String>(qualifiedDisciplines);
    map['qualified_branches'] = Variable<String>(qualifiedBranches);
    map['health_insurance_coverage'] = Variable<int>(healthInsuranceCoverage);
    return map;
  }

  JobTableCompanion toCompanion(bool nullToAbsent) {
    return JobTableCompanion(
      id: Value(id),
      jobTitle: Value(jobTitle),
      jobType: Value(jobType),
      companySuffix: Value(companySuffix),
      employmentType: Value(employmentType),
      getsTips: Value(getsTips),
      levelOneTitle: Value(levelOneTitle),
      levelOneBasePay: Value(levelOneBasePay),
      levelTwoTitle: Value(levelTwoTitle),
      levelTwoBasePay: Value(levelTwoBasePay),
      levelThreeTitle: Value(levelThreeTitle),
      levelThreeBasePay: Value(levelThreeBasePay),
      qualifiedDisciplines: Value(qualifiedDisciplines),
      qualifiedBranches: Value(qualifiedBranches),
      healthInsuranceCoverage: Value(healthInsuranceCoverage),
    );
  }

  factory Job.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Job(
      id: serializer.fromJson<int>(json['id']),
      jobTitle: serializer.fromJson<String>(json['jobTitle']),
      jobType: serializer.fromJson<String>(json['jobType']),
      companySuffix: serializer.fromJson<String>(json['companySuffix']),
      employmentType: serializer.fromJson<String>(json['employmentType']),
      getsTips: serializer.fromJson<bool>(json['getsTips']),
      levelOneTitle: serializer.fromJson<String>(json['levelOneTitle']),
      levelOneBasePay: serializer.fromJson<int>(json['levelOneBasePay']),
      levelTwoTitle: serializer.fromJson<String>(json['levelTwoTitle']),
      levelTwoBasePay: serializer.fromJson<int>(json['levelTwoBasePay']),
      levelThreeTitle: serializer.fromJson<String>(json['levelThreeTitle']),
      levelThreeBasePay: serializer.fromJson<int>(json['levelThreeBasePay']),
      qualifiedDisciplines:
          serializer.fromJson<String>(json['qualifiedDisciplines']),
      qualifiedBranches: serializer.fromJson<String>(json['qualifiedBranches']),
      healthInsuranceCoverage:
          serializer.fromJson<int>(json['healthInsuranceCoverage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'jobTitle': serializer.toJson<String>(jobTitle),
      'jobType': serializer.toJson<String>(jobType),
      'companySuffix': serializer.toJson<String>(companySuffix),
      'employmentType': serializer.toJson<String>(employmentType),
      'getsTips': serializer.toJson<bool>(getsTips),
      'levelOneTitle': serializer.toJson<String>(levelOneTitle),
      'levelOneBasePay': serializer.toJson<int>(levelOneBasePay),
      'levelTwoTitle': serializer.toJson<String>(levelTwoTitle),
      'levelTwoBasePay': serializer.toJson<int>(levelTwoBasePay),
      'levelThreeTitle': serializer.toJson<String>(levelThreeTitle),
      'levelThreeBasePay': serializer.toJson<int>(levelThreeBasePay),
      'qualifiedDisciplines': serializer.toJson<String>(qualifiedDisciplines),
      'qualifiedBranches': serializer.toJson<String>(qualifiedBranches),
      'healthInsuranceCoverage':
          serializer.toJson<int>(healthInsuranceCoverage),
    };
  }

  Job copyWith(
          {int? id,
          String? jobTitle,
          String? jobType,
          String? companySuffix,
          String? employmentType,
          bool? getsTips,
          String? levelOneTitle,
          int? levelOneBasePay,
          String? levelTwoTitle,
          int? levelTwoBasePay,
          String? levelThreeTitle,
          int? levelThreeBasePay,
          String? qualifiedDisciplines,
          String? qualifiedBranches,
          int? healthInsuranceCoverage}) =>
      Job(
        id: id ?? this.id,
        jobTitle: jobTitle ?? this.jobTitle,
        jobType: jobType ?? this.jobType,
        companySuffix: companySuffix ?? this.companySuffix,
        employmentType: employmentType ?? this.employmentType,
        getsTips: getsTips ?? this.getsTips,
        levelOneTitle: levelOneTitle ?? this.levelOneTitle,
        levelOneBasePay: levelOneBasePay ?? this.levelOneBasePay,
        levelTwoTitle: levelTwoTitle ?? this.levelTwoTitle,
        levelTwoBasePay: levelTwoBasePay ?? this.levelTwoBasePay,
        levelThreeTitle: levelThreeTitle ?? this.levelThreeTitle,
        levelThreeBasePay: levelThreeBasePay ?? this.levelThreeBasePay,
        qualifiedDisciplines: qualifiedDisciplines ?? this.qualifiedDisciplines,
        qualifiedBranches: qualifiedBranches ?? this.qualifiedBranches,
        healthInsuranceCoverage:
            healthInsuranceCoverage ?? this.healthInsuranceCoverage,
      );
  @override
  String toString() {
    return (StringBuffer('Job(')
          ..write('id: $id, ')
          ..write('jobTitle: $jobTitle, ')
          ..write('jobType: $jobType, ')
          ..write('companySuffix: $companySuffix, ')
          ..write('employmentType: $employmentType, ')
          ..write('getsTips: $getsTips, ')
          ..write('levelOneTitle: $levelOneTitle, ')
          ..write('levelOneBasePay: $levelOneBasePay, ')
          ..write('levelTwoTitle: $levelTwoTitle, ')
          ..write('levelTwoBasePay: $levelTwoBasePay, ')
          ..write('levelThreeTitle: $levelThreeTitle, ')
          ..write('levelThreeBasePay: $levelThreeBasePay, ')
          ..write('qualifiedDisciplines: $qualifiedDisciplines, ')
          ..write('qualifiedBranches: $qualifiedBranches, ')
          ..write('healthInsuranceCoverage: $healthInsuranceCoverage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      jobTitle,
      jobType,
      companySuffix,
      employmentType,
      getsTips,
      levelOneTitle,
      levelOneBasePay,
      levelTwoTitle,
      levelTwoBasePay,
      levelThreeTitle,
      levelThreeBasePay,
      qualifiedDisciplines,
      qualifiedBranches,
      healthInsuranceCoverage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Job &&
          other.id == this.id &&
          other.jobTitle == this.jobTitle &&
          other.jobType == this.jobType &&
          other.companySuffix == this.companySuffix &&
          other.employmentType == this.employmentType &&
          other.getsTips == this.getsTips &&
          other.levelOneTitle == this.levelOneTitle &&
          other.levelOneBasePay == this.levelOneBasePay &&
          other.levelTwoTitle == this.levelTwoTitle &&
          other.levelTwoBasePay == this.levelTwoBasePay &&
          other.levelThreeTitle == this.levelThreeTitle &&
          other.levelThreeBasePay == this.levelThreeBasePay &&
          other.qualifiedDisciplines == this.qualifiedDisciplines &&
          other.qualifiedBranches == this.qualifiedBranches &&
          other.healthInsuranceCoverage == this.healthInsuranceCoverage);
}

class JobTableCompanion extends UpdateCompanion<Job> {
  final Value<int> id;
  final Value<String> jobTitle;
  final Value<String> jobType;
  final Value<String> companySuffix;
  final Value<String> employmentType;
  final Value<bool> getsTips;
  final Value<String> levelOneTitle;
  final Value<int> levelOneBasePay;
  final Value<String> levelTwoTitle;
  final Value<int> levelTwoBasePay;
  final Value<String> levelThreeTitle;
  final Value<int> levelThreeBasePay;
  final Value<String> qualifiedDisciplines;
  final Value<String> qualifiedBranches;
  final Value<int> healthInsuranceCoverage;
  const JobTableCompanion({
    this.id = const Value.absent(),
    this.jobTitle = const Value.absent(),
    this.jobType = const Value.absent(),
    this.companySuffix = const Value.absent(),
    this.employmentType = const Value.absent(),
    this.getsTips = const Value.absent(),
    this.levelOneTitle = const Value.absent(),
    this.levelOneBasePay = const Value.absent(),
    this.levelTwoTitle = const Value.absent(),
    this.levelTwoBasePay = const Value.absent(),
    this.levelThreeTitle = const Value.absent(),
    this.levelThreeBasePay = const Value.absent(),
    this.qualifiedDisciplines = const Value.absent(),
    this.qualifiedBranches = const Value.absent(),
    this.healthInsuranceCoverage = const Value.absent(),
  });
  JobTableCompanion.insert({
    this.id = const Value.absent(),
    required String jobTitle,
    required String jobType,
    required String companySuffix,
    required String employmentType,
    required bool getsTips,
    required String levelOneTitle,
    required int levelOneBasePay,
    required String levelTwoTitle,
    required int levelTwoBasePay,
    required String levelThreeTitle,
    required int levelThreeBasePay,
    required String qualifiedDisciplines,
    required String qualifiedBranches,
    required int healthInsuranceCoverage,
  })  : jobTitle = Value(jobTitle),
        jobType = Value(jobType),
        companySuffix = Value(companySuffix),
        employmentType = Value(employmentType),
        getsTips = Value(getsTips),
        levelOneTitle = Value(levelOneTitle),
        levelOneBasePay = Value(levelOneBasePay),
        levelTwoTitle = Value(levelTwoTitle),
        levelTwoBasePay = Value(levelTwoBasePay),
        levelThreeTitle = Value(levelThreeTitle),
        levelThreeBasePay = Value(levelThreeBasePay),
        qualifiedDisciplines = Value(qualifiedDisciplines),
        qualifiedBranches = Value(qualifiedBranches),
        healthInsuranceCoverage = Value(healthInsuranceCoverage);
  static Insertable<Job> custom({
    Expression<int>? id,
    Expression<String>? jobTitle,
    Expression<String>? jobType,
    Expression<String>? companySuffix,
    Expression<String>? employmentType,
    Expression<bool>? getsTips,
    Expression<String>? levelOneTitle,
    Expression<int>? levelOneBasePay,
    Expression<String>? levelTwoTitle,
    Expression<int>? levelTwoBasePay,
    Expression<String>? levelThreeTitle,
    Expression<int>? levelThreeBasePay,
    Expression<String>? qualifiedDisciplines,
    Expression<String>? qualifiedBranches,
    Expression<int>? healthInsuranceCoverage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (jobTitle != null) 'job_title': jobTitle,
      if (jobType != null) 'job_type': jobType,
      if (companySuffix != null) 'company_suffix': companySuffix,
      if (employmentType != null) 'employment_type': employmentType,
      if (getsTips != null) 'gets_tips': getsTips,
      if (levelOneTitle != null) 'level_one_title': levelOneTitle,
      if (levelOneBasePay != null) 'level_one_base_pay': levelOneBasePay,
      if (levelTwoTitle != null) 'level_two_title': levelTwoTitle,
      if (levelTwoBasePay != null) 'level_two_base_pay': levelTwoBasePay,
      if (levelThreeTitle != null) 'level_three_title': levelThreeTitle,
      if (levelThreeBasePay != null) 'level_three_base_pay': levelThreeBasePay,
      if (qualifiedDisciplines != null)
        'qualified_disciplines': qualifiedDisciplines,
      if (qualifiedBranches != null) 'qualified_branches': qualifiedBranches,
      if (healthInsuranceCoverage != null)
        'health_insurance_coverage': healthInsuranceCoverage,
    });
  }

  JobTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? jobTitle,
      Value<String>? jobType,
      Value<String>? companySuffix,
      Value<String>? employmentType,
      Value<bool>? getsTips,
      Value<String>? levelOneTitle,
      Value<int>? levelOneBasePay,
      Value<String>? levelTwoTitle,
      Value<int>? levelTwoBasePay,
      Value<String>? levelThreeTitle,
      Value<int>? levelThreeBasePay,
      Value<String>? qualifiedDisciplines,
      Value<String>? qualifiedBranches,
      Value<int>? healthInsuranceCoverage}) {
    return JobTableCompanion(
      id: id ?? this.id,
      jobTitle: jobTitle ?? this.jobTitle,
      jobType: jobType ?? this.jobType,
      companySuffix: companySuffix ?? this.companySuffix,
      employmentType: employmentType ?? this.employmentType,
      getsTips: getsTips ?? this.getsTips,
      levelOneTitle: levelOneTitle ?? this.levelOneTitle,
      levelOneBasePay: levelOneBasePay ?? this.levelOneBasePay,
      levelTwoTitle: levelTwoTitle ?? this.levelTwoTitle,
      levelTwoBasePay: levelTwoBasePay ?? this.levelTwoBasePay,
      levelThreeTitle: levelThreeTitle ?? this.levelThreeTitle,
      levelThreeBasePay: levelThreeBasePay ?? this.levelThreeBasePay,
      qualifiedDisciplines: qualifiedDisciplines ?? this.qualifiedDisciplines,
      qualifiedBranches: qualifiedBranches ?? this.qualifiedBranches,
      healthInsuranceCoverage:
          healthInsuranceCoverage ?? this.healthInsuranceCoverage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (jobTitle.present) {
      map['job_title'] = Variable<String>(jobTitle.value);
    }
    if (jobType.present) {
      map['job_type'] = Variable<String>(jobType.value);
    }
    if (companySuffix.present) {
      map['company_suffix'] = Variable<String>(companySuffix.value);
    }
    if (employmentType.present) {
      map['employment_type'] = Variable<String>(employmentType.value);
    }
    if (getsTips.present) {
      map['gets_tips'] = Variable<bool>(getsTips.value);
    }
    if (levelOneTitle.present) {
      map['level_one_title'] = Variable<String>(levelOneTitle.value);
    }
    if (levelOneBasePay.present) {
      map['level_one_base_pay'] = Variable<int>(levelOneBasePay.value);
    }
    if (levelTwoTitle.present) {
      map['level_two_title'] = Variable<String>(levelTwoTitle.value);
    }
    if (levelTwoBasePay.present) {
      map['level_two_base_pay'] = Variable<int>(levelTwoBasePay.value);
    }
    if (levelThreeTitle.present) {
      map['level_three_title'] = Variable<String>(levelThreeTitle.value);
    }
    if (levelThreeBasePay.present) {
      map['level_three_base_pay'] = Variable<int>(levelThreeBasePay.value);
    }
    if (qualifiedDisciplines.present) {
      map['qualified_disciplines'] =
          Variable<String>(qualifiedDisciplines.value);
    }
    if (qualifiedBranches.present) {
      map['qualified_branches'] = Variable<String>(qualifiedBranches.value);
    }
    if (healthInsuranceCoverage.present) {
      map['health_insurance_coverage'] =
          Variable<int>(healthInsuranceCoverage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobTableCompanion(')
          ..write('id: $id, ')
          ..write('jobTitle: $jobTitle, ')
          ..write('jobType: $jobType, ')
          ..write('companySuffix: $companySuffix, ')
          ..write('employmentType: $employmentType, ')
          ..write('getsTips: $getsTips, ')
          ..write('levelOneTitle: $levelOneTitle, ')
          ..write('levelOneBasePay: $levelOneBasePay, ')
          ..write('levelTwoTitle: $levelTwoTitle, ')
          ..write('levelTwoBasePay: $levelTwoBasePay, ')
          ..write('levelThreeTitle: $levelThreeTitle, ')
          ..write('levelThreeBasePay: $levelThreeBasePay, ')
          ..write('qualifiedDisciplines: $qualifiedDisciplines, ')
          ..write('qualifiedBranches: $qualifiedBranches, ')
          ..write('healthInsuranceCoverage: $healthInsuranceCoverage')
          ..write(')'))
        .toString();
  }
}

class $EmploymentTableTable extends EmploymentTable
    with TableInfo<$EmploymentTableTable, Employment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmploymentTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _jobIdMeta = const VerificationMeta('jobId');
  @override
  late final GeneratedColumn<int> jobId = GeneratedColumn<int>(
      'job_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES job (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _mainPersonIdMeta =
      const VerificationMeta('mainPersonId');
  @override
  late final GeneratedColumn<int> mainPersonId = GeneratedColumn<int>(
      'main_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _companyNameMeta =
      const VerificationMeta('companyName');
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
      'company_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _companyCountryMeta =
      const VerificationMeta('companyCountry');
  @override
  late final GeneratedColumn<String> companyCountry = GeneratedColumn<String>(
      'company_country', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _companyStateMeta =
      const VerificationMeta('companyState');
  @override
  late final GeneratedColumn<String> companyState = GeneratedColumn<String>(
      'company_state', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _companySettlementMeta =
      const VerificationMeta('companySettlement');
  @override
  late final GeneratedColumn<String> companySettlement =
      GeneratedColumn<String>('company_settlement', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<int> startTime = GeneratedColumn<int>(
      'start_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _shiftLengthMeta =
      const VerificationMeta('shiftLength');
  @override
  late final GeneratedColumn<int> shiftLength = GeneratedColumn<int>(
      'shift_length', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dayOffMeta = const VerificationMeta('dayOff');
  @override
  late final GeneratedColumn<int> dayOff = GeneratedColumn<int>(
      'day_off', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isDayShiftMeta =
      const VerificationMeta('isDayShift');
  @override
  late final GeneratedColumn<bool> isDayShift = GeneratedColumn<bool>(
      'is_day_shift', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_day_shift" IN (0, 1))'));
  static const VerificationMeta _currentLevelMeta =
      const VerificationMeta('currentLevel');
  @override
  late final GeneratedColumn<int> currentLevel = GeneratedColumn<int>(
      'current_level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentPayMeta =
      const VerificationMeta('currentPay');
  @override
  late final GeneratedColumn<int> currentPay = GeneratedColumn<int>(
      'current_pay', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _raisesGivenMeta =
      const VerificationMeta('raisesGiven');
  @override
  late final GeneratedColumn<int> raisesGiven = GeneratedColumn<int>(
      'raises_given', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _jobPerformanceMeta =
      const VerificationMeta('jobPerformance');
  @override
  late final GeneratedColumn<int> jobPerformance = GeneratedColumn<int>(
      'job_performance', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _daysOfConsistentGoodPerformanceMeta =
      const VerificationMeta('daysOfConsistentGoodPerformance');
  @override
  late final GeneratedColumn<int> daysOfConsistentGoodPerformance =
      GeneratedColumn<int>(
          'days_of_consistent_good_performance', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _vacationDaysLeftMeta =
      const VerificationMeta('vacationDaysLeft');
  @override
  late final GeneratedColumn<int> vacationDaysLeft = GeneratedColumn<int>(
      'vacation_days_left', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _onLeaveMeta =
      const VerificationMeta('onLeave');
  @override
  late final GeneratedColumn<bool> onLeave = GeneratedColumn<bool>(
      'on_leave', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("on_leave" IN (0, 1))'));
  static const VerificationMeta _firstDayMeta =
      const VerificationMeta('firstDay');
  @override
  late final GeneratedColumn<int> firstDay = GeneratedColumn<int>(
      'first_day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastDayMeta =
      const VerificationMeta('lastDay');
  @override
  late final GeneratedColumn<int> lastDay = GeneratedColumn<int>(
      'last_day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _wasFiredMeta =
      const VerificationMeta('wasFired');
  @override
  late final GeneratedColumn<bool> wasFired = GeneratedColumn<bool>(
      'was_fired', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("was_fired" IN (0, 1))'));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        jobId,
        mainPersonId,
        companyName,
        companyCountry,
        companyState,
        companySettlement,
        startTime,
        shiftLength,
        dayOff,
        isDayShift,
        currentLevel,
        currentPay,
        raisesGiven,
        jobPerformance,
        daysOfConsistentGoodPerformance,
        vacationDaysLeft,
        onLeave,
        firstDay,
        lastDay,
        wasFired,
        isActive
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'employment';
  @override
  VerificationContext validateIntegrity(Insertable<Employment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('job_id')) {
      context.handle(
          _jobIdMeta, jobId.isAcceptableOrUnknown(data['job_id']!, _jobIdMeta));
    } else if (isInserting) {
      context.missing(_jobIdMeta);
    }
    if (data.containsKey('main_person_id')) {
      context.handle(
          _mainPersonIdMeta,
          mainPersonId.isAcceptableOrUnknown(
              data['main_person_id']!, _mainPersonIdMeta));
    } else if (isInserting) {
      context.missing(_mainPersonIdMeta);
    }
    if (data.containsKey('company_name')) {
      context.handle(
          _companyNameMeta,
          companyName.isAcceptableOrUnknown(
              data['company_name']!, _companyNameMeta));
    } else if (isInserting) {
      context.missing(_companyNameMeta);
    }
    if (data.containsKey('company_country')) {
      context.handle(
          _companyCountryMeta,
          companyCountry.isAcceptableOrUnknown(
              data['company_country']!, _companyCountryMeta));
    } else if (isInserting) {
      context.missing(_companyCountryMeta);
    }
    if (data.containsKey('company_state')) {
      context.handle(
          _companyStateMeta,
          companyState.isAcceptableOrUnknown(
              data['company_state']!, _companyStateMeta));
    } else if (isInserting) {
      context.missing(_companyStateMeta);
    }
    if (data.containsKey('company_settlement')) {
      context.handle(
          _companySettlementMeta,
          companySettlement.isAcceptableOrUnknown(
              data['company_settlement']!, _companySettlementMeta));
    } else if (isInserting) {
      context.missing(_companySettlementMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('shift_length')) {
      context.handle(
          _shiftLengthMeta,
          shiftLength.isAcceptableOrUnknown(
              data['shift_length']!, _shiftLengthMeta));
    } else if (isInserting) {
      context.missing(_shiftLengthMeta);
    }
    if (data.containsKey('day_off')) {
      context.handle(_dayOffMeta,
          dayOff.isAcceptableOrUnknown(data['day_off']!, _dayOffMeta));
    } else if (isInserting) {
      context.missing(_dayOffMeta);
    }
    if (data.containsKey('is_day_shift')) {
      context.handle(
          _isDayShiftMeta,
          isDayShift.isAcceptableOrUnknown(
              data['is_day_shift']!, _isDayShiftMeta));
    } else if (isInserting) {
      context.missing(_isDayShiftMeta);
    }
    if (data.containsKey('current_level')) {
      context.handle(
          _currentLevelMeta,
          currentLevel.isAcceptableOrUnknown(
              data['current_level']!, _currentLevelMeta));
    } else if (isInserting) {
      context.missing(_currentLevelMeta);
    }
    if (data.containsKey('current_pay')) {
      context.handle(
          _currentPayMeta,
          currentPay.isAcceptableOrUnknown(
              data['current_pay']!, _currentPayMeta));
    } else if (isInserting) {
      context.missing(_currentPayMeta);
    }
    if (data.containsKey('raises_given')) {
      context.handle(
          _raisesGivenMeta,
          raisesGiven.isAcceptableOrUnknown(
              data['raises_given']!, _raisesGivenMeta));
    } else if (isInserting) {
      context.missing(_raisesGivenMeta);
    }
    if (data.containsKey('job_performance')) {
      context.handle(
          _jobPerformanceMeta,
          jobPerformance.isAcceptableOrUnknown(
              data['job_performance']!, _jobPerformanceMeta));
    } else if (isInserting) {
      context.missing(_jobPerformanceMeta);
    }
    if (data.containsKey('days_of_consistent_good_performance')) {
      context.handle(
          _daysOfConsistentGoodPerformanceMeta,
          daysOfConsistentGoodPerformance.isAcceptableOrUnknown(
              data['days_of_consistent_good_performance']!,
              _daysOfConsistentGoodPerformanceMeta));
    } else if (isInserting) {
      context.missing(_daysOfConsistentGoodPerformanceMeta);
    }
    if (data.containsKey('vacation_days_left')) {
      context.handle(
          _vacationDaysLeftMeta,
          vacationDaysLeft.isAcceptableOrUnknown(
              data['vacation_days_left']!, _vacationDaysLeftMeta));
    } else if (isInserting) {
      context.missing(_vacationDaysLeftMeta);
    }
    if (data.containsKey('on_leave')) {
      context.handle(_onLeaveMeta,
          onLeave.isAcceptableOrUnknown(data['on_leave']!, _onLeaveMeta));
    } else if (isInserting) {
      context.missing(_onLeaveMeta);
    }
    if (data.containsKey('first_day')) {
      context.handle(_firstDayMeta,
          firstDay.isAcceptableOrUnknown(data['first_day']!, _firstDayMeta));
    } else if (isInserting) {
      context.missing(_firstDayMeta);
    }
    if (data.containsKey('last_day')) {
      context.handle(_lastDayMeta,
          lastDay.isAcceptableOrUnknown(data['last_day']!, _lastDayMeta));
    } else if (isInserting) {
      context.missing(_lastDayMeta);
    }
    if (data.containsKey('was_fired')) {
      context.handle(_wasFiredMeta,
          wasFired.isAcceptableOrUnknown(data['was_fired']!, _wasFiredMeta));
    } else if (isInserting) {
      context.missing(_wasFiredMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Employment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Employment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      jobId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}job_id'])!,
      mainPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}main_person_id'])!,
      companyName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company_name'])!,
      companyCountry: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}company_country'])!,
      companyState: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company_state'])!,
      companySettlement: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}company_settlement'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}start_time'])!,
      shiftLength: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}shift_length'])!,
      dayOff: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_off'])!,
      isDayShift: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_day_shift'])!,
      currentLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_level'])!,
      currentPay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_pay'])!,
      raisesGiven: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}raises_given'])!,
      jobPerformance: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}job_performance'])!,
      daysOfConsistentGoodPerformance: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}days_of_consistent_good_performance'])!,
      vacationDaysLeft: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}vacation_days_left'])!,
      onLeave: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}on_leave'])!,
      firstDay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}first_day'])!,
      lastDay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_day'])!,
      wasFired: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}was_fired'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  $EmploymentTableTable createAlias(String alias) {
    return $EmploymentTableTable(attachedDatabase, alias);
  }
}

class Employment extends DataClass implements Insertable<Employment> {
  final int id;
  final int jobId;
  final int mainPersonId;
  final String companyName;
  final String companyCountry;
  final String companyState;
  final String companySettlement;
  final int startTime;
  final int shiftLength;
  final int dayOff;
  final bool isDayShift;
  final int currentLevel;
  final int currentPay;
  final int raisesGiven;
  final int jobPerformance;
  final int daysOfConsistentGoodPerformance;
  final int vacationDaysLeft;
  final bool onLeave;
  final int firstDay;
  final int lastDay;
  final bool wasFired;
  final bool isActive;
  const Employment(
      {required this.id,
      required this.jobId,
      required this.mainPersonId,
      required this.companyName,
      required this.companyCountry,
      required this.companyState,
      required this.companySettlement,
      required this.startTime,
      required this.shiftLength,
      required this.dayOff,
      required this.isDayShift,
      required this.currentLevel,
      required this.currentPay,
      required this.raisesGiven,
      required this.jobPerformance,
      required this.daysOfConsistentGoodPerformance,
      required this.vacationDaysLeft,
      required this.onLeave,
      required this.firstDay,
      required this.lastDay,
      required this.wasFired,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['job_id'] = Variable<int>(jobId);
    map['main_person_id'] = Variable<int>(mainPersonId);
    map['company_name'] = Variable<String>(companyName);
    map['company_country'] = Variable<String>(companyCountry);
    map['company_state'] = Variable<String>(companyState);
    map['company_settlement'] = Variable<String>(companySettlement);
    map['start_time'] = Variable<int>(startTime);
    map['shift_length'] = Variable<int>(shiftLength);
    map['day_off'] = Variable<int>(dayOff);
    map['is_day_shift'] = Variable<bool>(isDayShift);
    map['current_level'] = Variable<int>(currentLevel);
    map['current_pay'] = Variable<int>(currentPay);
    map['raises_given'] = Variable<int>(raisesGiven);
    map['job_performance'] = Variable<int>(jobPerformance);
    map['days_of_consistent_good_performance'] =
        Variable<int>(daysOfConsistentGoodPerformance);
    map['vacation_days_left'] = Variable<int>(vacationDaysLeft);
    map['on_leave'] = Variable<bool>(onLeave);
    map['first_day'] = Variable<int>(firstDay);
    map['last_day'] = Variable<int>(lastDay);
    map['was_fired'] = Variable<bool>(wasFired);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  EmploymentTableCompanion toCompanion(bool nullToAbsent) {
    return EmploymentTableCompanion(
      id: Value(id),
      jobId: Value(jobId),
      mainPersonId: Value(mainPersonId),
      companyName: Value(companyName),
      companyCountry: Value(companyCountry),
      companyState: Value(companyState),
      companySettlement: Value(companySettlement),
      startTime: Value(startTime),
      shiftLength: Value(shiftLength),
      dayOff: Value(dayOff),
      isDayShift: Value(isDayShift),
      currentLevel: Value(currentLevel),
      currentPay: Value(currentPay),
      raisesGiven: Value(raisesGiven),
      jobPerformance: Value(jobPerformance),
      daysOfConsistentGoodPerformance: Value(daysOfConsistentGoodPerformance),
      vacationDaysLeft: Value(vacationDaysLeft),
      onLeave: Value(onLeave),
      firstDay: Value(firstDay),
      lastDay: Value(lastDay),
      wasFired: Value(wasFired),
      isActive: Value(isActive),
    );
  }

  factory Employment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Employment(
      id: serializer.fromJson<int>(json['id']),
      jobId: serializer.fromJson<int>(json['jobId']),
      mainPersonId: serializer.fromJson<int>(json['mainPersonId']),
      companyName: serializer.fromJson<String>(json['companyName']),
      companyCountry: serializer.fromJson<String>(json['companyCountry']),
      companyState: serializer.fromJson<String>(json['companyState']),
      companySettlement: serializer.fromJson<String>(json['companySettlement']),
      startTime: serializer.fromJson<int>(json['startTime']),
      shiftLength: serializer.fromJson<int>(json['shiftLength']),
      dayOff: serializer.fromJson<int>(json['dayOff']),
      isDayShift: serializer.fromJson<bool>(json['isDayShift']),
      currentLevel: serializer.fromJson<int>(json['currentLevel']),
      currentPay: serializer.fromJson<int>(json['currentPay']),
      raisesGiven: serializer.fromJson<int>(json['raisesGiven']),
      jobPerformance: serializer.fromJson<int>(json['jobPerformance']),
      daysOfConsistentGoodPerformance:
          serializer.fromJson<int>(json['daysOfConsistentGoodPerformance']),
      vacationDaysLeft: serializer.fromJson<int>(json['vacationDaysLeft']),
      onLeave: serializer.fromJson<bool>(json['onLeave']),
      firstDay: serializer.fromJson<int>(json['firstDay']),
      lastDay: serializer.fromJson<int>(json['lastDay']),
      wasFired: serializer.fromJson<bool>(json['wasFired']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'jobId': serializer.toJson<int>(jobId),
      'mainPersonId': serializer.toJson<int>(mainPersonId),
      'companyName': serializer.toJson<String>(companyName),
      'companyCountry': serializer.toJson<String>(companyCountry),
      'companyState': serializer.toJson<String>(companyState),
      'companySettlement': serializer.toJson<String>(companySettlement),
      'startTime': serializer.toJson<int>(startTime),
      'shiftLength': serializer.toJson<int>(shiftLength),
      'dayOff': serializer.toJson<int>(dayOff),
      'isDayShift': serializer.toJson<bool>(isDayShift),
      'currentLevel': serializer.toJson<int>(currentLevel),
      'currentPay': serializer.toJson<int>(currentPay),
      'raisesGiven': serializer.toJson<int>(raisesGiven),
      'jobPerformance': serializer.toJson<int>(jobPerformance),
      'daysOfConsistentGoodPerformance':
          serializer.toJson<int>(daysOfConsistentGoodPerformance),
      'vacationDaysLeft': serializer.toJson<int>(vacationDaysLeft),
      'onLeave': serializer.toJson<bool>(onLeave),
      'firstDay': serializer.toJson<int>(firstDay),
      'lastDay': serializer.toJson<int>(lastDay),
      'wasFired': serializer.toJson<bool>(wasFired),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  Employment copyWith(
          {int? id,
          int? jobId,
          int? mainPersonId,
          String? companyName,
          String? companyCountry,
          String? companyState,
          String? companySettlement,
          int? startTime,
          int? shiftLength,
          int? dayOff,
          bool? isDayShift,
          int? currentLevel,
          int? currentPay,
          int? raisesGiven,
          int? jobPerformance,
          int? daysOfConsistentGoodPerformance,
          int? vacationDaysLeft,
          bool? onLeave,
          int? firstDay,
          int? lastDay,
          bool? wasFired,
          bool? isActive}) =>
      Employment(
        id: id ?? this.id,
        jobId: jobId ?? this.jobId,
        mainPersonId: mainPersonId ?? this.mainPersonId,
        companyName: companyName ?? this.companyName,
        companyCountry: companyCountry ?? this.companyCountry,
        companyState: companyState ?? this.companyState,
        companySettlement: companySettlement ?? this.companySettlement,
        startTime: startTime ?? this.startTime,
        shiftLength: shiftLength ?? this.shiftLength,
        dayOff: dayOff ?? this.dayOff,
        isDayShift: isDayShift ?? this.isDayShift,
        currentLevel: currentLevel ?? this.currentLevel,
        currentPay: currentPay ?? this.currentPay,
        raisesGiven: raisesGiven ?? this.raisesGiven,
        jobPerformance: jobPerformance ?? this.jobPerformance,
        daysOfConsistentGoodPerformance: daysOfConsistentGoodPerformance ??
            this.daysOfConsistentGoodPerformance,
        vacationDaysLeft: vacationDaysLeft ?? this.vacationDaysLeft,
        onLeave: onLeave ?? this.onLeave,
        firstDay: firstDay ?? this.firstDay,
        lastDay: lastDay ?? this.lastDay,
        wasFired: wasFired ?? this.wasFired,
        isActive: isActive ?? this.isActive,
      );
  @override
  String toString() {
    return (StringBuffer('Employment(')
          ..write('id: $id, ')
          ..write('jobId: $jobId, ')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('companyName: $companyName, ')
          ..write('companyCountry: $companyCountry, ')
          ..write('companyState: $companyState, ')
          ..write('companySettlement: $companySettlement, ')
          ..write('startTime: $startTime, ')
          ..write('shiftLength: $shiftLength, ')
          ..write('dayOff: $dayOff, ')
          ..write('isDayShift: $isDayShift, ')
          ..write('currentLevel: $currentLevel, ')
          ..write('currentPay: $currentPay, ')
          ..write('raisesGiven: $raisesGiven, ')
          ..write('jobPerformance: $jobPerformance, ')
          ..write(
              'daysOfConsistentGoodPerformance: $daysOfConsistentGoodPerformance, ')
          ..write('vacationDaysLeft: $vacationDaysLeft, ')
          ..write('onLeave: $onLeave, ')
          ..write('firstDay: $firstDay, ')
          ..write('lastDay: $lastDay, ')
          ..write('wasFired: $wasFired, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        jobId,
        mainPersonId,
        companyName,
        companyCountry,
        companyState,
        companySettlement,
        startTime,
        shiftLength,
        dayOff,
        isDayShift,
        currentLevel,
        currentPay,
        raisesGiven,
        jobPerformance,
        daysOfConsistentGoodPerformance,
        vacationDaysLeft,
        onLeave,
        firstDay,
        lastDay,
        wasFired,
        isActive
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Employment &&
          other.id == this.id &&
          other.jobId == this.jobId &&
          other.mainPersonId == this.mainPersonId &&
          other.companyName == this.companyName &&
          other.companyCountry == this.companyCountry &&
          other.companyState == this.companyState &&
          other.companySettlement == this.companySettlement &&
          other.startTime == this.startTime &&
          other.shiftLength == this.shiftLength &&
          other.dayOff == this.dayOff &&
          other.isDayShift == this.isDayShift &&
          other.currentLevel == this.currentLevel &&
          other.currentPay == this.currentPay &&
          other.raisesGiven == this.raisesGiven &&
          other.jobPerformance == this.jobPerformance &&
          other.daysOfConsistentGoodPerformance ==
              this.daysOfConsistentGoodPerformance &&
          other.vacationDaysLeft == this.vacationDaysLeft &&
          other.onLeave == this.onLeave &&
          other.firstDay == this.firstDay &&
          other.lastDay == this.lastDay &&
          other.wasFired == this.wasFired &&
          other.isActive == this.isActive);
}

class EmploymentTableCompanion extends UpdateCompanion<Employment> {
  final Value<int> id;
  final Value<int> jobId;
  final Value<int> mainPersonId;
  final Value<String> companyName;
  final Value<String> companyCountry;
  final Value<String> companyState;
  final Value<String> companySettlement;
  final Value<int> startTime;
  final Value<int> shiftLength;
  final Value<int> dayOff;
  final Value<bool> isDayShift;
  final Value<int> currentLevel;
  final Value<int> currentPay;
  final Value<int> raisesGiven;
  final Value<int> jobPerformance;
  final Value<int> daysOfConsistentGoodPerformance;
  final Value<int> vacationDaysLeft;
  final Value<bool> onLeave;
  final Value<int> firstDay;
  final Value<int> lastDay;
  final Value<bool> wasFired;
  final Value<bool> isActive;
  const EmploymentTableCompanion({
    this.id = const Value.absent(),
    this.jobId = const Value.absent(),
    this.mainPersonId = const Value.absent(),
    this.companyName = const Value.absent(),
    this.companyCountry = const Value.absent(),
    this.companyState = const Value.absent(),
    this.companySettlement = const Value.absent(),
    this.startTime = const Value.absent(),
    this.shiftLength = const Value.absent(),
    this.dayOff = const Value.absent(),
    this.isDayShift = const Value.absent(),
    this.currentLevel = const Value.absent(),
    this.currentPay = const Value.absent(),
    this.raisesGiven = const Value.absent(),
    this.jobPerformance = const Value.absent(),
    this.daysOfConsistentGoodPerformance = const Value.absent(),
    this.vacationDaysLeft = const Value.absent(),
    this.onLeave = const Value.absent(),
    this.firstDay = const Value.absent(),
    this.lastDay = const Value.absent(),
    this.wasFired = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  EmploymentTableCompanion.insert({
    this.id = const Value.absent(),
    required int jobId,
    required int mainPersonId,
    required String companyName,
    required String companyCountry,
    required String companyState,
    required String companySettlement,
    required int startTime,
    required int shiftLength,
    required int dayOff,
    required bool isDayShift,
    required int currentLevel,
    required int currentPay,
    required int raisesGiven,
    required int jobPerformance,
    required int daysOfConsistentGoodPerformance,
    required int vacationDaysLeft,
    required bool onLeave,
    required int firstDay,
    required int lastDay,
    required bool wasFired,
    required bool isActive,
  })  : jobId = Value(jobId),
        mainPersonId = Value(mainPersonId),
        companyName = Value(companyName),
        companyCountry = Value(companyCountry),
        companyState = Value(companyState),
        companySettlement = Value(companySettlement),
        startTime = Value(startTime),
        shiftLength = Value(shiftLength),
        dayOff = Value(dayOff),
        isDayShift = Value(isDayShift),
        currentLevel = Value(currentLevel),
        currentPay = Value(currentPay),
        raisesGiven = Value(raisesGiven),
        jobPerformance = Value(jobPerformance),
        daysOfConsistentGoodPerformance =
            Value(daysOfConsistentGoodPerformance),
        vacationDaysLeft = Value(vacationDaysLeft),
        onLeave = Value(onLeave),
        firstDay = Value(firstDay),
        lastDay = Value(lastDay),
        wasFired = Value(wasFired),
        isActive = Value(isActive);
  static Insertable<Employment> custom({
    Expression<int>? id,
    Expression<int>? jobId,
    Expression<int>? mainPersonId,
    Expression<String>? companyName,
    Expression<String>? companyCountry,
    Expression<String>? companyState,
    Expression<String>? companySettlement,
    Expression<int>? startTime,
    Expression<int>? shiftLength,
    Expression<int>? dayOff,
    Expression<bool>? isDayShift,
    Expression<int>? currentLevel,
    Expression<int>? currentPay,
    Expression<int>? raisesGiven,
    Expression<int>? jobPerformance,
    Expression<int>? daysOfConsistentGoodPerformance,
    Expression<int>? vacationDaysLeft,
    Expression<bool>? onLeave,
    Expression<int>? firstDay,
    Expression<int>? lastDay,
    Expression<bool>? wasFired,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (jobId != null) 'job_id': jobId,
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (companyName != null) 'company_name': companyName,
      if (companyCountry != null) 'company_country': companyCountry,
      if (companyState != null) 'company_state': companyState,
      if (companySettlement != null) 'company_settlement': companySettlement,
      if (startTime != null) 'start_time': startTime,
      if (shiftLength != null) 'shift_length': shiftLength,
      if (dayOff != null) 'day_off': dayOff,
      if (isDayShift != null) 'is_day_shift': isDayShift,
      if (currentLevel != null) 'current_level': currentLevel,
      if (currentPay != null) 'current_pay': currentPay,
      if (raisesGiven != null) 'raises_given': raisesGiven,
      if (jobPerformance != null) 'job_performance': jobPerformance,
      if (daysOfConsistentGoodPerformance != null)
        'days_of_consistent_good_performance': daysOfConsistentGoodPerformance,
      if (vacationDaysLeft != null) 'vacation_days_left': vacationDaysLeft,
      if (onLeave != null) 'on_leave': onLeave,
      if (firstDay != null) 'first_day': firstDay,
      if (lastDay != null) 'last_day': lastDay,
      if (wasFired != null) 'was_fired': wasFired,
      if (isActive != null) 'is_active': isActive,
    });
  }

  EmploymentTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? jobId,
      Value<int>? mainPersonId,
      Value<String>? companyName,
      Value<String>? companyCountry,
      Value<String>? companyState,
      Value<String>? companySettlement,
      Value<int>? startTime,
      Value<int>? shiftLength,
      Value<int>? dayOff,
      Value<bool>? isDayShift,
      Value<int>? currentLevel,
      Value<int>? currentPay,
      Value<int>? raisesGiven,
      Value<int>? jobPerformance,
      Value<int>? daysOfConsistentGoodPerformance,
      Value<int>? vacationDaysLeft,
      Value<bool>? onLeave,
      Value<int>? firstDay,
      Value<int>? lastDay,
      Value<bool>? wasFired,
      Value<bool>? isActive}) {
    return EmploymentTableCompanion(
      id: id ?? this.id,
      jobId: jobId ?? this.jobId,
      mainPersonId: mainPersonId ?? this.mainPersonId,
      companyName: companyName ?? this.companyName,
      companyCountry: companyCountry ?? this.companyCountry,
      companyState: companyState ?? this.companyState,
      companySettlement: companySettlement ?? this.companySettlement,
      startTime: startTime ?? this.startTime,
      shiftLength: shiftLength ?? this.shiftLength,
      dayOff: dayOff ?? this.dayOff,
      isDayShift: isDayShift ?? this.isDayShift,
      currentLevel: currentLevel ?? this.currentLevel,
      currentPay: currentPay ?? this.currentPay,
      raisesGiven: raisesGiven ?? this.raisesGiven,
      jobPerformance: jobPerformance ?? this.jobPerformance,
      daysOfConsistentGoodPerformance: daysOfConsistentGoodPerformance ??
          this.daysOfConsistentGoodPerformance,
      vacationDaysLeft: vacationDaysLeft ?? this.vacationDaysLeft,
      onLeave: onLeave ?? this.onLeave,
      firstDay: firstDay ?? this.firstDay,
      lastDay: lastDay ?? this.lastDay,
      wasFired: wasFired ?? this.wasFired,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (jobId.present) {
      map['job_id'] = Variable<int>(jobId.value);
    }
    if (mainPersonId.present) {
      map['main_person_id'] = Variable<int>(mainPersonId.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (companyCountry.present) {
      map['company_country'] = Variable<String>(companyCountry.value);
    }
    if (companyState.present) {
      map['company_state'] = Variable<String>(companyState.value);
    }
    if (companySettlement.present) {
      map['company_settlement'] = Variable<String>(companySettlement.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<int>(startTime.value);
    }
    if (shiftLength.present) {
      map['shift_length'] = Variable<int>(shiftLength.value);
    }
    if (dayOff.present) {
      map['day_off'] = Variable<int>(dayOff.value);
    }
    if (isDayShift.present) {
      map['is_day_shift'] = Variable<bool>(isDayShift.value);
    }
    if (currentLevel.present) {
      map['current_level'] = Variable<int>(currentLevel.value);
    }
    if (currentPay.present) {
      map['current_pay'] = Variable<int>(currentPay.value);
    }
    if (raisesGiven.present) {
      map['raises_given'] = Variable<int>(raisesGiven.value);
    }
    if (jobPerformance.present) {
      map['job_performance'] = Variable<int>(jobPerformance.value);
    }
    if (daysOfConsistentGoodPerformance.present) {
      map['days_of_consistent_good_performance'] =
          Variable<int>(daysOfConsistentGoodPerformance.value);
    }
    if (vacationDaysLeft.present) {
      map['vacation_days_left'] = Variable<int>(vacationDaysLeft.value);
    }
    if (onLeave.present) {
      map['on_leave'] = Variable<bool>(onLeave.value);
    }
    if (firstDay.present) {
      map['first_day'] = Variable<int>(firstDay.value);
    }
    if (lastDay.present) {
      map['last_day'] = Variable<int>(lastDay.value);
    }
    if (wasFired.present) {
      map['was_fired'] = Variable<bool>(wasFired.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmploymentTableCompanion(')
          ..write('id: $id, ')
          ..write('jobId: $jobId, ')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('companyName: $companyName, ')
          ..write('companyCountry: $companyCountry, ')
          ..write('companyState: $companyState, ')
          ..write('companySettlement: $companySettlement, ')
          ..write('startTime: $startTime, ')
          ..write('shiftLength: $shiftLength, ')
          ..write('dayOff: $dayOff, ')
          ..write('isDayShift: $isDayShift, ')
          ..write('currentLevel: $currentLevel, ')
          ..write('currentPay: $currentPay, ')
          ..write('raisesGiven: $raisesGiven, ')
          ..write('jobPerformance: $jobPerformance, ')
          ..write(
              'daysOfConsistentGoodPerformance: $daysOfConsistentGoodPerformance, ')
          ..write('vacationDaysLeft: $vacationDaysLeft, ')
          ..write('onLeave: $onLeave, ')
          ..write('firstDay: $firstDay, ')
          ..write('lastDay: $lastDay, ')
          ..write('wasFired: $wasFired, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $JobRelationshipTableTable extends JobRelationshipTable
    with TableInfo<$JobRelationshipTableTable, JobRelationship> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobRelationshipTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _employmentIdMeta =
      const VerificationMeta('employmentId');
  @override
  late final GeneratedColumn<int> employmentId = GeneratedColumn<int>(
      'employment_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES employment (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _mainPersonIdMeta =
      const VerificationMeta('mainPersonId');
  @override
  late final GeneratedColumn<int> mainPersonId = GeneratedColumn<int>(
      'main_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _otherPersonIdMeta =
      const VerificationMeta('otherPersonId');
  @override
  late final GeneratedColumn<int> otherPersonId = GeneratedColumn<int>(
      'other_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _jobRelationshipTypeMeta =
      const VerificationMeta('jobRelationshipType');
  @override
  late final GeneratedColumn<String> jobRelationshipType =
      GeneratedColumn<String>('job_relationship_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _informalRelationshipTypeMeta =
      const VerificationMeta('informalRelationshipType');
  @override
  late final GeneratedColumn<String> informalRelationshipType =
      GeneratedColumn<String>('informal_relationship_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _jobLevelMeta =
      const VerificationMeta('jobLevel');
  @override
  late final GeneratedColumn<int> jobLevel = GeneratedColumn<int>(
      'job_level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        employmentId,
        mainPersonId,
        otherPersonId,
        jobRelationshipType,
        informalRelationshipType,
        jobLevel
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'job_relationship';
  @override
  VerificationContext validateIntegrity(Insertable<JobRelationship> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('employment_id')) {
      context.handle(
          _employmentIdMeta,
          employmentId.isAcceptableOrUnknown(
              data['employment_id']!, _employmentIdMeta));
    } else if (isInserting) {
      context.missing(_employmentIdMeta);
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
    } else if (isInserting) {
      context.missing(_otherPersonIdMeta);
    }
    if (data.containsKey('job_relationship_type')) {
      context.handle(
          _jobRelationshipTypeMeta,
          jobRelationshipType.isAcceptableOrUnknown(
              data['job_relationship_type']!, _jobRelationshipTypeMeta));
    } else if (isInserting) {
      context.missing(_jobRelationshipTypeMeta);
    }
    if (data.containsKey('informal_relationship_type')) {
      context.handle(
          _informalRelationshipTypeMeta,
          informalRelationshipType.isAcceptableOrUnknown(
              data['informal_relationship_type']!,
              _informalRelationshipTypeMeta));
    } else if (isInserting) {
      context.missing(_informalRelationshipTypeMeta);
    }
    if (data.containsKey('job_level')) {
      context.handle(_jobLevelMeta,
          jobLevel.isAcceptableOrUnknown(data['job_level']!, _jobLevelMeta));
    } else if (isInserting) {
      context.missing(_jobLevelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JobRelationship map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JobRelationship(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      employmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}employment_id'])!,
      mainPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}main_person_id'])!,
      otherPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}other_person_id'])!,
      jobRelationshipType: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}job_relationship_type'])!,
      informalRelationshipType: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}informal_relationship_type'])!,
      jobLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}job_level'])!,
    );
  }

  @override
  $JobRelationshipTableTable createAlias(String alias) {
    return $JobRelationshipTableTable(attachedDatabase, alias);
  }
}

class JobRelationship extends DataClass implements Insertable<JobRelationship> {
  final int id;
  final int employmentId;
  final int mainPersonId;
  final int otherPersonId;
  final String jobRelationshipType;
  final String informalRelationshipType;
  final int jobLevel;
  const JobRelationship(
      {required this.id,
      required this.employmentId,
      required this.mainPersonId,
      required this.otherPersonId,
      required this.jobRelationshipType,
      required this.informalRelationshipType,
      required this.jobLevel});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['employment_id'] = Variable<int>(employmentId);
    map['main_person_id'] = Variable<int>(mainPersonId);
    map['other_person_id'] = Variable<int>(otherPersonId);
    map['job_relationship_type'] = Variable<String>(jobRelationshipType);
    map['informal_relationship_type'] =
        Variable<String>(informalRelationshipType);
    map['job_level'] = Variable<int>(jobLevel);
    return map;
  }

  JobRelationshipTableCompanion toCompanion(bool nullToAbsent) {
    return JobRelationshipTableCompanion(
      id: Value(id),
      employmentId: Value(employmentId),
      mainPersonId: Value(mainPersonId),
      otherPersonId: Value(otherPersonId),
      jobRelationshipType: Value(jobRelationshipType),
      informalRelationshipType: Value(informalRelationshipType),
      jobLevel: Value(jobLevel),
    );
  }

  factory JobRelationship.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JobRelationship(
      id: serializer.fromJson<int>(json['id']),
      employmentId: serializer.fromJson<int>(json['employmentId']),
      mainPersonId: serializer.fromJson<int>(json['mainPersonId']),
      otherPersonId: serializer.fromJson<int>(json['otherPersonId']),
      jobRelationshipType:
          serializer.fromJson<String>(json['jobRelationshipType']),
      informalRelationshipType:
          serializer.fromJson<String>(json['informalRelationshipType']),
      jobLevel: serializer.fromJson<int>(json['jobLevel']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'employmentId': serializer.toJson<int>(employmentId),
      'mainPersonId': serializer.toJson<int>(mainPersonId),
      'otherPersonId': serializer.toJson<int>(otherPersonId),
      'jobRelationshipType': serializer.toJson<String>(jobRelationshipType),
      'informalRelationshipType':
          serializer.toJson<String>(informalRelationshipType),
      'jobLevel': serializer.toJson<int>(jobLevel),
    };
  }

  JobRelationship copyWith(
          {int? id,
          int? employmentId,
          int? mainPersonId,
          int? otherPersonId,
          String? jobRelationshipType,
          String? informalRelationshipType,
          int? jobLevel}) =>
      JobRelationship(
        id: id ?? this.id,
        employmentId: employmentId ?? this.employmentId,
        mainPersonId: mainPersonId ?? this.mainPersonId,
        otherPersonId: otherPersonId ?? this.otherPersonId,
        jobRelationshipType: jobRelationshipType ?? this.jobRelationshipType,
        informalRelationshipType:
            informalRelationshipType ?? this.informalRelationshipType,
        jobLevel: jobLevel ?? this.jobLevel,
      );
  @override
  String toString() {
    return (StringBuffer('JobRelationship(')
          ..write('id: $id, ')
          ..write('employmentId: $employmentId, ')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('otherPersonId: $otherPersonId, ')
          ..write('jobRelationshipType: $jobRelationshipType, ')
          ..write('informalRelationshipType: $informalRelationshipType, ')
          ..write('jobLevel: $jobLevel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, employmentId, mainPersonId, otherPersonId,
      jobRelationshipType, informalRelationshipType, jobLevel);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JobRelationship &&
          other.id == this.id &&
          other.employmentId == this.employmentId &&
          other.mainPersonId == this.mainPersonId &&
          other.otherPersonId == this.otherPersonId &&
          other.jobRelationshipType == this.jobRelationshipType &&
          other.informalRelationshipType == this.informalRelationshipType &&
          other.jobLevel == this.jobLevel);
}

class JobRelationshipTableCompanion extends UpdateCompanion<JobRelationship> {
  final Value<int> id;
  final Value<int> employmentId;
  final Value<int> mainPersonId;
  final Value<int> otherPersonId;
  final Value<String> jobRelationshipType;
  final Value<String> informalRelationshipType;
  final Value<int> jobLevel;
  const JobRelationshipTableCompanion({
    this.id = const Value.absent(),
    this.employmentId = const Value.absent(),
    this.mainPersonId = const Value.absent(),
    this.otherPersonId = const Value.absent(),
    this.jobRelationshipType = const Value.absent(),
    this.informalRelationshipType = const Value.absent(),
    this.jobLevel = const Value.absent(),
  });
  JobRelationshipTableCompanion.insert({
    this.id = const Value.absent(),
    required int employmentId,
    required int mainPersonId,
    required int otherPersonId,
    required String jobRelationshipType,
    required String informalRelationshipType,
    required int jobLevel,
  })  : employmentId = Value(employmentId),
        mainPersonId = Value(mainPersonId),
        otherPersonId = Value(otherPersonId),
        jobRelationshipType = Value(jobRelationshipType),
        informalRelationshipType = Value(informalRelationshipType),
        jobLevel = Value(jobLevel);
  static Insertable<JobRelationship> custom({
    Expression<int>? id,
    Expression<int>? employmentId,
    Expression<int>? mainPersonId,
    Expression<int>? otherPersonId,
    Expression<String>? jobRelationshipType,
    Expression<String>? informalRelationshipType,
    Expression<int>? jobLevel,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (employmentId != null) 'employment_id': employmentId,
      if (mainPersonId != null) 'main_person_id': mainPersonId,
      if (otherPersonId != null) 'other_person_id': otherPersonId,
      if (jobRelationshipType != null)
        'job_relationship_type': jobRelationshipType,
      if (informalRelationshipType != null)
        'informal_relationship_type': informalRelationshipType,
      if (jobLevel != null) 'job_level': jobLevel,
    });
  }

  JobRelationshipTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? employmentId,
      Value<int>? mainPersonId,
      Value<int>? otherPersonId,
      Value<String>? jobRelationshipType,
      Value<String>? informalRelationshipType,
      Value<int>? jobLevel}) {
    return JobRelationshipTableCompanion(
      id: id ?? this.id,
      employmentId: employmentId ?? this.employmentId,
      mainPersonId: mainPersonId ?? this.mainPersonId,
      otherPersonId: otherPersonId ?? this.otherPersonId,
      jobRelationshipType: jobRelationshipType ?? this.jobRelationshipType,
      informalRelationshipType:
          informalRelationshipType ?? this.informalRelationshipType,
      jobLevel: jobLevel ?? this.jobLevel,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (employmentId.present) {
      map['employment_id'] = Variable<int>(employmentId.value);
    }
    if (mainPersonId.present) {
      map['main_person_id'] = Variable<int>(mainPersonId.value);
    }
    if (otherPersonId.present) {
      map['other_person_id'] = Variable<int>(otherPersonId.value);
    }
    if (jobRelationshipType.present) {
      map['job_relationship_type'] =
          Variable<String>(jobRelationshipType.value);
    }
    if (informalRelationshipType.present) {
      map['informal_relationship_type'] =
          Variable<String>(informalRelationshipType.value);
    }
    if (jobLevel.present) {
      map['job_level'] = Variable<int>(jobLevel.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobRelationshipTableCompanion(')
          ..write('id: $id, ')
          ..write('employmentId: $employmentId, ')
          ..write('mainPersonId: $mainPersonId, ')
          ..write('otherPersonId: $otherPersonId, ')
          ..write('jobRelationshipType: $jobRelationshipType, ')
          ..write('informalRelationshipType: $informalRelationshipType, ')
          ..write('jobLevel: $jobLevel')
          ..write(')'))
        .toString();
  }
}

class $ParentChildLinkTableTable extends ParentChildLinkTable
    with TableInfo<$ParentChildLinkTableTable, ParentChildLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParentChildLinkTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
      'parent_id', aliasedName, false,
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
  static const VerificationMeta _isBirthRelationshipTypeMeta =
      const VerificationMeta('isBirthRelationshipType');
  @override
  late final GeneratedColumn<bool> isBirthRelationshipType =
      GeneratedColumn<bool>('is_birth_relationship_type', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("is_birth_relationship_type" IN (0, 1))'));
  static const VerificationMeta _relatedToPlayerFamilyMeta =
      const VerificationMeta('relatedToPlayerFamily');
  @override
  late final GeneratedColumn<bool> relatedToPlayerFamily =
      GeneratedColumn<bool>('related_to_player_family', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("related_to_player_family" IN (0, 1))'));
  static const VerificationMeta _isHiddenMeta =
      const VerificationMeta('isHidden');
  @override
  late final GeneratedColumn<bool> isHidden = GeneratedColumn<bool>(
      'is_hidden', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_hidden" IN (0, 1))'));
  static const VerificationMeta _isPaternityFraudMeta =
      const VerificationMeta('isPaternityFraud');
  @override
  late final GeneratedColumn<bool> isPaternityFraud = GeneratedColumn<bool>(
      'is_paternity_fraud', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_paternity_fraud" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        parentId,
        childId,
        isBirthRelationshipType,
        relatedToPlayerFamily,
        isHidden,
        isPaternityFraud
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parent_child_link';
  @override
  VerificationContext validateIntegrity(Insertable<ParentChildLink> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(_childIdMeta,
          childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta));
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('is_birth_relationship_type')) {
      context.handle(
          _isBirthRelationshipTypeMeta,
          isBirthRelationshipType.isAcceptableOrUnknown(
              data['is_birth_relationship_type']!,
              _isBirthRelationshipTypeMeta));
    } else if (isInserting) {
      context.missing(_isBirthRelationshipTypeMeta);
    }
    if (data.containsKey('related_to_player_family')) {
      context.handle(
          _relatedToPlayerFamilyMeta,
          relatedToPlayerFamily.isAcceptableOrUnknown(
              data['related_to_player_family']!, _relatedToPlayerFamilyMeta));
    } else if (isInserting) {
      context.missing(_relatedToPlayerFamilyMeta);
    }
    if (data.containsKey('is_hidden')) {
      context.handle(_isHiddenMeta,
          isHidden.isAcceptableOrUnknown(data['is_hidden']!, _isHiddenMeta));
    } else if (isInserting) {
      context.missing(_isHiddenMeta);
    }
    if (data.containsKey('is_paternity_fraud')) {
      context.handle(
          _isPaternityFraudMeta,
          isPaternityFraud.isAcceptableOrUnknown(
              data['is_paternity_fraud']!, _isPaternityFraudMeta));
    } else if (isInserting) {
      context.missing(_isPaternityFraudMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {parentId, childId};
  @override
  ParentChildLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ParentChildLink(
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_id'])!,
      childId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}child_id'])!,
      isBirthRelationshipType: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}is_birth_relationship_type'])!,
      relatedToPlayerFamily: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}related_to_player_family'])!,
      isHidden: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_hidden'])!,
      isPaternityFraud: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_paternity_fraud'])!,
    );
  }

  @override
  $ParentChildLinkTableTable createAlias(String alias) {
    return $ParentChildLinkTableTable(attachedDatabase, alias);
  }
}

class ParentChildLink extends DataClass implements Insertable<ParentChildLink> {
  final int parentId;
  final int childId;
  final bool isBirthRelationshipType;
  final bool relatedToPlayerFamily;
  final bool isHidden;
  final bool isPaternityFraud;
  const ParentChildLink(
      {required this.parentId,
      required this.childId,
      required this.isBirthRelationshipType,
      required this.relatedToPlayerFamily,
      required this.isHidden,
      required this.isPaternityFraud});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['parent_id'] = Variable<int>(parentId);
    map['child_id'] = Variable<int>(childId);
    map['is_birth_relationship_type'] = Variable<bool>(isBirthRelationshipType);
    map['related_to_player_family'] = Variable<bool>(relatedToPlayerFamily);
    map['is_hidden'] = Variable<bool>(isHidden);
    map['is_paternity_fraud'] = Variable<bool>(isPaternityFraud);
    return map;
  }

  ParentChildLinkTableCompanion toCompanion(bool nullToAbsent) {
    return ParentChildLinkTableCompanion(
      parentId: Value(parentId),
      childId: Value(childId),
      isBirthRelationshipType: Value(isBirthRelationshipType),
      relatedToPlayerFamily: Value(relatedToPlayerFamily),
      isHidden: Value(isHidden),
      isPaternityFraud: Value(isPaternityFraud),
    );
  }

  factory ParentChildLink.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ParentChildLink(
      parentId: serializer.fromJson<int>(json['parentId']),
      childId: serializer.fromJson<int>(json['childId']),
      isBirthRelationshipType:
          serializer.fromJson<bool>(json['isBirthRelationshipType']),
      relatedToPlayerFamily:
          serializer.fromJson<bool>(json['relatedToPlayerFamily']),
      isHidden: serializer.fromJson<bool>(json['isHidden']),
      isPaternityFraud: serializer.fromJson<bool>(json['isPaternityFraud']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'parentId': serializer.toJson<int>(parentId),
      'childId': serializer.toJson<int>(childId),
      'isBirthRelationshipType':
          serializer.toJson<bool>(isBirthRelationshipType),
      'relatedToPlayerFamily': serializer.toJson<bool>(relatedToPlayerFamily),
      'isHidden': serializer.toJson<bool>(isHidden),
      'isPaternityFraud': serializer.toJson<bool>(isPaternityFraud),
    };
  }

  ParentChildLink copyWith(
          {int? parentId,
          int? childId,
          bool? isBirthRelationshipType,
          bool? relatedToPlayerFamily,
          bool? isHidden,
          bool? isPaternityFraud}) =>
      ParentChildLink(
        parentId: parentId ?? this.parentId,
        childId: childId ?? this.childId,
        isBirthRelationshipType:
            isBirthRelationshipType ?? this.isBirthRelationshipType,
        relatedToPlayerFamily:
            relatedToPlayerFamily ?? this.relatedToPlayerFamily,
        isHidden: isHidden ?? this.isHidden,
        isPaternityFraud: isPaternityFraud ?? this.isPaternityFraud,
      );
  @override
  String toString() {
    return (StringBuffer('ParentChildLink(')
          ..write('parentId: $parentId, ')
          ..write('childId: $childId, ')
          ..write('isBirthRelationshipType: $isBirthRelationshipType, ')
          ..write('relatedToPlayerFamily: $relatedToPlayerFamily, ')
          ..write('isHidden: $isHidden, ')
          ..write('isPaternityFraud: $isPaternityFraud')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(parentId, childId, isBirthRelationshipType,
      relatedToPlayerFamily, isHidden, isPaternityFraud);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParentChildLink &&
          other.parentId == this.parentId &&
          other.childId == this.childId &&
          other.isBirthRelationshipType == this.isBirthRelationshipType &&
          other.relatedToPlayerFamily == this.relatedToPlayerFamily &&
          other.isHidden == this.isHidden &&
          other.isPaternityFraud == this.isPaternityFraud);
}

class ParentChildLinkTableCompanion extends UpdateCompanion<ParentChildLink> {
  final Value<int> parentId;
  final Value<int> childId;
  final Value<bool> isBirthRelationshipType;
  final Value<bool> relatedToPlayerFamily;
  final Value<bool> isHidden;
  final Value<bool> isPaternityFraud;
  final Value<int> rowid;
  const ParentChildLinkTableCompanion({
    this.parentId = const Value.absent(),
    this.childId = const Value.absent(),
    this.isBirthRelationshipType = const Value.absent(),
    this.relatedToPlayerFamily = const Value.absent(),
    this.isHidden = const Value.absent(),
    this.isPaternityFraud = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ParentChildLinkTableCompanion.insert({
    required int parentId,
    required int childId,
    required bool isBirthRelationshipType,
    required bool relatedToPlayerFamily,
    required bool isHidden,
    required bool isPaternityFraud,
    this.rowid = const Value.absent(),
  })  : parentId = Value(parentId),
        childId = Value(childId),
        isBirthRelationshipType = Value(isBirthRelationshipType),
        relatedToPlayerFamily = Value(relatedToPlayerFamily),
        isHidden = Value(isHidden),
        isPaternityFraud = Value(isPaternityFraud);
  static Insertable<ParentChildLink> custom({
    Expression<int>? parentId,
    Expression<int>? childId,
    Expression<bool>? isBirthRelationshipType,
    Expression<bool>? relatedToPlayerFamily,
    Expression<bool>? isHidden,
    Expression<bool>? isPaternityFraud,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (parentId != null) 'parent_id': parentId,
      if (childId != null) 'child_id': childId,
      if (isBirthRelationshipType != null)
        'is_birth_relationship_type': isBirthRelationshipType,
      if (relatedToPlayerFamily != null)
        'related_to_player_family': relatedToPlayerFamily,
      if (isHidden != null) 'is_hidden': isHidden,
      if (isPaternityFraud != null) 'is_paternity_fraud': isPaternityFraud,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ParentChildLinkTableCompanion copyWith(
      {Value<int>? parentId,
      Value<int>? childId,
      Value<bool>? isBirthRelationshipType,
      Value<bool>? relatedToPlayerFamily,
      Value<bool>? isHidden,
      Value<bool>? isPaternityFraud,
      Value<int>? rowid}) {
    return ParentChildLinkTableCompanion(
      parentId: parentId ?? this.parentId,
      childId: childId ?? this.childId,
      isBirthRelationshipType:
          isBirthRelationshipType ?? this.isBirthRelationshipType,
      relatedToPlayerFamily:
          relatedToPlayerFamily ?? this.relatedToPlayerFamily,
      isHidden: isHidden ?? this.isHidden,
      isPaternityFraud: isPaternityFraud ?? this.isPaternityFraud,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<int>(childId.value);
    }
    if (isBirthRelationshipType.present) {
      map['is_birth_relationship_type'] =
          Variable<bool>(isBirthRelationshipType.value);
    }
    if (relatedToPlayerFamily.present) {
      map['related_to_player_family'] =
          Variable<bool>(relatedToPlayerFamily.value);
    }
    if (isHidden.present) {
      map['is_hidden'] = Variable<bool>(isHidden.value);
    }
    if (isPaternityFraud.present) {
      map['is_paternity_fraud'] = Variable<bool>(isPaternityFraud.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParentChildLinkTableCompanion(')
          ..write('parentId: $parentId, ')
          ..write('childId: $childId, ')
          ..write('isBirthRelationshipType: $isBirthRelationshipType, ')
          ..write('relatedToPlayerFamily: $relatedToPlayerFamily, ')
          ..write('isHidden: $isHidden, ')
          ..write('isPaternityFraud: $isPaternityFraud, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RomanticRelationshipInfoTableTable extends RomanticRelationshipInfoTable
    with
        TableInfo<$RomanticRelationshipInfoTableTable,
            RomanticRelationshipInfo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RomanticRelationshipInfoTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _cumulativeDurationMeta =
      const VerificationMeta('cumulativeDuration');
  @override
  late final GeneratedColumn<int> cumulativeDuration = GeneratedColumn<int>(
      'cumulative_duration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _daysToDateBeforeMarriageMeta =
      const VerificationMeta('daysToDateBeforeMarriage');
  @override
  late final GeneratedColumn<int> daysToDateBeforeMarriage =
      GeneratedColumn<int>('days_to_date_before_marriage', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _jointMoneyMeta =
      const VerificationMeta('jointMoney');
  @override
  late final GeneratedColumn<int> jointMoney = GeneratedColumn<int>(
      'joint_money', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        gameId,
        startDay,
        endDay,
        cumulativeDuration,
        daysToDateBeforeMarriage,
        jointMoney
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'romantic_relationship_info';
  @override
  VerificationContext validateIntegrity(
      Insertable<RomanticRelationshipInfo> instance,
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
    if (data.containsKey('cumulative_duration')) {
      context.handle(
          _cumulativeDurationMeta,
          cumulativeDuration.isAcceptableOrUnknown(
              data['cumulative_duration']!, _cumulativeDurationMeta));
    } else if (isInserting) {
      context.missing(_cumulativeDurationMeta);
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
    if (data.containsKey('joint_money')) {
      context.handle(
          _jointMoneyMeta,
          jointMoney.isAcceptableOrUnknown(
              data['joint_money']!, _jointMoneyMeta));
    } else if (isInserting) {
      context.missing(_jointMoneyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RomanticRelationshipInfo map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RomanticRelationshipInfo(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      gameId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}game_id'])!,
      startDay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}start_day'])!,
      endDay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}end_day'])!,
      cumulativeDuration: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}cumulative_duration'])!,
      daysToDateBeforeMarriage: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}days_to_date_before_marriage'])!,
      jointMoney: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}joint_money'])!,
    );
  }

  @override
  $RomanticRelationshipInfoTableTable createAlias(String alias) {
    return $RomanticRelationshipInfoTableTable(attachedDatabase, alias);
  }
}

class RomanticRelationshipInfo extends DataClass
    implements Insertable<RomanticRelationshipInfo> {
  final int id;
  final int gameId;
  final int startDay;
  final int endDay;
  final int cumulativeDuration;
  final int daysToDateBeforeMarriage;
  final int jointMoney;
  const RomanticRelationshipInfo(
      {required this.id,
      required this.gameId,
      required this.startDay,
      required this.endDay,
      required this.cumulativeDuration,
      required this.daysToDateBeforeMarriage,
      required this.jointMoney});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['game_id'] = Variable<int>(gameId);
    map['start_day'] = Variable<int>(startDay);
    map['end_day'] = Variable<int>(endDay);
    map['cumulative_duration'] = Variable<int>(cumulativeDuration);
    map['days_to_date_before_marriage'] =
        Variable<int>(daysToDateBeforeMarriage);
    map['joint_money'] = Variable<int>(jointMoney);
    return map;
  }

  RomanticRelationshipInfoTableCompanion toCompanion(bool nullToAbsent) {
    return RomanticRelationshipInfoTableCompanion(
      id: Value(id),
      gameId: Value(gameId),
      startDay: Value(startDay),
      endDay: Value(endDay),
      cumulativeDuration: Value(cumulativeDuration),
      daysToDateBeforeMarriage: Value(daysToDateBeforeMarriage),
      jointMoney: Value(jointMoney),
    );
  }

  factory RomanticRelationshipInfo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RomanticRelationshipInfo(
      id: serializer.fromJson<int>(json['id']),
      gameId: serializer.fromJson<int>(json['gameId']),
      startDay: serializer.fromJson<int>(json['startDay']),
      endDay: serializer.fromJson<int>(json['endDay']),
      cumulativeDuration: serializer.fromJson<int>(json['cumulativeDuration']),
      daysToDateBeforeMarriage:
          serializer.fromJson<int>(json['daysToDateBeforeMarriage']),
      jointMoney: serializer.fromJson<int>(json['jointMoney']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameId': serializer.toJson<int>(gameId),
      'startDay': serializer.toJson<int>(startDay),
      'endDay': serializer.toJson<int>(endDay),
      'cumulativeDuration': serializer.toJson<int>(cumulativeDuration),
      'daysToDateBeforeMarriage':
          serializer.toJson<int>(daysToDateBeforeMarriage),
      'jointMoney': serializer.toJson<int>(jointMoney),
    };
  }

  RomanticRelationshipInfo copyWith(
          {int? id,
          int? gameId,
          int? startDay,
          int? endDay,
          int? cumulativeDuration,
          int? daysToDateBeforeMarriage,
          int? jointMoney}) =>
      RomanticRelationshipInfo(
        id: id ?? this.id,
        gameId: gameId ?? this.gameId,
        startDay: startDay ?? this.startDay,
        endDay: endDay ?? this.endDay,
        cumulativeDuration: cumulativeDuration ?? this.cumulativeDuration,
        daysToDateBeforeMarriage:
            daysToDateBeforeMarriage ?? this.daysToDateBeforeMarriage,
        jointMoney: jointMoney ?? this.jointMoney,
      );
  @override
  String toString() {
    return (StringBuffer('RomanticRelationshipInfo(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('startDay: $startDay, ')
          ..write('endDay: $endDay, ')
          ..write('cumulativeDuration: $cumulativeDuration, ')
          ..write('daysToDateBeforeMarriage: $daysToDateBeforeMarriage, ')
          ..write('jointMoney: $jointMoney')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, gameId, startDay, endDay,
      cumulativeDuration, daysToDateBeforeMarriage, jointMoney);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RomanticRelationshipInfo &&
          other.id == this.id &&
          other.gameId == this.gameId &&
          other.startDay == this.startDay &&
          other.endDay == this.endDay &&
          other.cumulativeDuration == this.cumulativeDuration &&
          other.daysToDateBeforeMarriage == this.daysToDateBeforeMarriage &&
          other.jointMoney == this.jointMoney);
}

class RomanticRelationshipInfoTableCompanion
    extends UpdateCompanion<RomanticRelationshipInfo> {
  final Value<int> id;
  final Value<int> gameId;
  final Value<int> startDay;
  final Value<int> endDay;
  final Value<int> cumulativeDuration;
  final Value<int> daysToDateBeforeMarriage;
  final Value<int> jointMoney;
  const RomanticRelationshipInfoTableCompanion({
    this.id = const Value.absent(),
    this.gameId = const Value.absent(),
    this.startDay = const Value.absent(),
    this.endDay = const Value.absent(),
    this.cumulativeDuration = const Value.absent(),
    this.daysToDateBeforeMarriage = const Value.absent(),
    this.jointMoney = const Value.absent(),
  });
  RomanticRelationshipInfoTableCompanion.insert({
    this.id = const Value.absent(),
    required int gameId,
    required int startDay,
    required int endDay,
    required int cumulativeDuration,
    required int daysToDateBeforeMarriage,
    required int jointMoney,
  })  : gameId = Value(gameId),
        startDay = Value(startDay),
        endDay = Value(endDay),
        cumulativeDuration = Value(cumulativeDuration),
        daysToDateBeforeMarriage = Value(daysToDateBeforeMarriage),
        jointMoney = Value(jointMoney);
  static Insertable<RomanticRelationshipInfo> custom({
    Expression<int>? id,
    Expression<int>? gameId,
    Expression<int>? startDay,
    Expression<int>? endDay,
    Expression<int>? cumulativeDuration,
    Expression<int>? daysToDateBeforeMarriage,
    Expression<int>? jointMoney,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameId != null) 'game_id': gameId,
      if (startDay != null) 'start_day': startDay,
      if (endDay != null) 'end_day': endDay,
      if (cumulativeDuration != null) 'cumulative_duration': cumulativeDuration,
      if (daysToDateBeforeMarriage != null)
        'days_to_date_before_marriage': daysToDateBeforeMarriage,
      if (jointMoney != null) 'joint_money': jointMoney,
    });
  }

  RomanticRelationshipInfoTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? gameId,
      Value<int>? startDay,
      Value<int>? endDay,
      Value<int>? cumulativeDuration,
      Value<int>? daysToDateBeforeMarriage,
      Value<int>? jointMoney}) {
    return RomanticRelationshipInfoTableCompanion(
      id: id ?? this.id,
      gameId: gameId ?? this.gameId,
      startDay: startDay ?? this.startDay,
      endDay: endDay ?? this.endDay,
      cumulativeDuration: cumulativeDuration ?? this.cumulativeDuration,
      daysToDateBeforeMarriage:
          daysToDateBeforeMarriage ?? this.daysToDateBeforeMarriage,
      jointMoney: jointMoney ?? this.jointMoney,
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
    if (startDay.present) {
      map['start_day'] = Variable<int>(startDay.value);
    }
    if (endDay.present) {
      map['end_day'] = Variable<int>(endDay.value);
    }
    if (cumulativeDuration.present) {
      map['cumulative_duration'] = Variable<int>(cumulativeDuration.value);
    }
    if (daysToDateBeforeMarriage.present) {
      map['days_to_date_before_marriage'] =
          Variable<int>(daysToDateBeforeMarriage.value);
    }
    if (jointMoney.present) {
      map['joint_money'] = Variable<int>(jointMoney.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RomanticRelationshipInfoTableCompanion(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('startDay: $startDay, ')
          ..write('endDay: $endDay, ')
          ..write('cumulativeDuration: $cumulativeDuration, ')
          ..write('daysToDateBeforeMarriage: $daysToDateBeforeMarriage, ')
          ..write('jointMoney: $jointMoney')
          ..write(')'))
        .toString();
  }
}

class $RelationshipTableTable extends RelationshipTable
    with TableInfo<$RelationshipTableTable, Relationship> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelationshipTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _firstPersonIdMeta =
      const VerificationMeta('firstPersonId');
  @override
  late final GeneratedColumn<int> firstPersonId = GeneratedColumn<int>(
      'first_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _secondPersonIdMeta =
      const VerificationMeta('secondPersonId');
  @override
  late final GeneratedColumn<int> secondPersonId = GeneratedColumn<int>(
      'second_person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES person (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _platonicRelationshipTypeMeta =
      const VerificationMeta('platonicRelationshipType');
  @override
  late final GeneratedColumn<String> platonicRelationshipType =
      GeneratedColumn<String>('platonic_relationship_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _romanticRelationshipTypeMeta =
      const VerificationMeta('romanticRelationshipType');
  @override
  late final GeneratedColumn<String> romanticRelationshipType =
      GeneratedColumn<String>('romantic_relationship_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _previousFamilialRelationshipMeta =
      const VerificationMeta('previousFamilialRelationship');
  @override
  late final GeneratedColumn<String> previousFamilialRelationship =
      GeneratedColumn<String>(
          'previous_familial_relationship', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _interestedInRelationshipMeta =
      const VerificationMeta('interestedInRelationship');
  @override
  late final GeneratedColumn<bool> interestedInRelationship =
      GeneratedColumn<bool>(
          'interested_in_relationship', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("interested_in_relationship" IN (0, 1))'));
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
      'level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _romanticRelationshipInfoIdMeta =
      const VerificationMeta('romanticRelationshipInfoId');
  @override
  late final GeneratedColumn<int> romanticRelationshipInfoId = GeneratedColumn<
          int>('romantic_relationship_info_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES romantic_relationship_info (id) ON UPDATE CASCADE ON DELETE SET NULL'));
  static const VerificationMeta _activeRomanceMeta =
      const VerificationMeta('activeRomance');
  @override
  late final GeneratedColumn<bool> activeRomance = GeneratedColumn<bool>(
      'active_romance', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("active_romance" IN (0, 1))'));
  static const VerificationMeta _isCoParentMeta =
      const VerificationMeta('isCoParent');
  @override
  late final GeneratedColumn<bool> isCoParent = GeneratedColumn<bool>(
      'is_co_parent', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_co_parent" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        firstPersonId,
        secondPersonId,
        platonicRelationshipType,
        romanticRelationshipType,
        previousFamilialRelationship,
        interestedInRelationship,
        level,
        romanticRelationshipInfoId,
        activeRomance,
        isCoParent
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'relationship';
  @override
  VerificationContext validateIntegrity(Insertable<Relationship> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('first_person_id')) {
      context.handle(
          _firstPersonIdMeta,
          firstPersonId.isAcceptableOrUnknown(
              data['first_person_id']!, _firstPersonIdMeta));
    } else if (isInserting) {
      context.missing(_firstPersonIdMeta);
    }
    if (data.containsKey('second_person_id')) {
      context.handle(
          _secondPersonIdMeta,
          secondPersonId.isAcceptableOrUnknown(
              data['second_person_id']!, _secondPersonIdMeta));
    } else if (isInserting) {
      context.missing(_secondPersonIdMeta);
    }
    if (data.containsKey('platonic_relationship_type')) {
      context.handle(
          _platonicRelationshipTypeMeta,
          platonicRelationshipType.isAcceptableOrUnknown(
              data['platonic_relationship_type']!,
              _platonicRelationshipTypeMeta));
    } else if (isInserting) {
      context.missing(_platonicRelationshipTypeMeta);
    }
    if (data.containsKey('romantic_relationship_type')) {
      context.handle(
          _romanticRelationshipTypeMeta,
          romanticRelationshipType.isAcceptableOrUnknown(
              data['romantic_relationship_type']!,
              _romanticRelationshipTypeMeta));
    } else if (isInserting) {
      context.missing(_romanticRelationshipTypeMeta);
    }
    if (data.containsKey('previous_familial_relationship')) {
      context.handle(
          _previousFamilialRelationshipMeta,
          previousFamilialRelationship.isAcceptableOrUnknown(
              data['previous_familial_relationship']!,
              _previousFamilialRelationshipMeta));
    } else if (isInserting) {
      context.missing(_previousFamilialRelationshipMeta);
    }
    if (data.containsKey('interested_in_relationship')) {
      context.handle(
          _interestedInRelationshipMeta,
          interestedInRelationship.isAcceptableOrUnknown(
              data['interested_in_relationship']!,
              _interestedInRelationshipMeta));
    } else if (isInserting) {
      context.missing(_interestedInRelationshipMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('romantic_relationship_info_id')) {
      context.handle(
          _romanticRelationshipInfoIdMeta,
          romanticRelationshipInfoId.isAcceptableOrUnknown(
              data['romantic_relationship_info_id']!,
              _romanticRelationshipInfoIdMeta));
    }
    if (data.containsKey('active_romance')) {
      context.handle(
          _activeRomanceMeta,
          activeRomance.isAcceptableOrUnknown(
              data['active_romance']!, _activeRomanceMeta));
    } else if (isInserting) {
      context.missing(_activeRomanceMeta);
    }
    if (data.containsKey('is_co_parent')) {
      context.handle(
          _isCoParentMeta,
          isCoParent.isAcceptableOrUnknown(
              data['is_co_parent']!, _isCoParentMeta));
    } else if (isInserting) {
      context.missing(_isCoParentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {firstPersonId, secondPersonId};
  @override
  Relationship map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Relationship(
      firstPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}first_person_id'])!,
      secondPersonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}second_person_id'])!,
      platonicRelationshipType: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}platonic_relationship_type'])!,
      romanticRelationshipType: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}romantic_relationship_type'])!,
      previousFamilialRelationship: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}previous_familial_relationship'])!,
      interestedInRelationship: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}interested_in_relationship'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level'])!,
      romanticRelationshipInfoId: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}romantic_relationship_info_id']),
      activeRomance: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active_romance'])!,
      isCoParent: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_co_parent'])!,
    );
  }

  @override
  $RelationshipTableTable createAlias(String alias) {
    return $RelationshipTableTable(attachedDatabase, alias);
  }
}

class Relationship extends DataClass implements Insertable<Relationship> {
  final int firstPersonId;
  final int secondPersonId;
  final String platonicRelationshipType;
  final String romanticRelationshipType;
  final String previousFamilialRelationship;
  final bool interestedInRelationship;
  final int level;
  final int? romanticRelationshipInfoId;
  final bool activeRomance;
  final bool isCoParent;
  const Relationship(
      {required this.firstPersonId,
      required this.secondPersonId,
      required this.platonicRelationshipType,
      required this.romanticRelationshipType,
      required this.previousFamilialRelationship,
      required this.interestedInRelationship,
      required this.level,
      this.romanticRelationshipInfoId,
      required this.activeRomance,
      required this.isCoParent});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['first_person_id'] = Variable<int>(firstPersonId);
    map['second_person_id'] = Variable<int>(secondPersonId);
    map['platonic_relationship_type'] =
        Variable<String>(platonicRelationshipType);
    map['romantic_relationship_type'] =
        Variable<String>(romanticRelationshipType);
    map['previous_familial_relationship'] =
        Variable<String>(previousFamilialRelationship);
    map['interested_in_relationship'] =
        Variable<bool>(interestedInRelationship);
    map['level'] = Variable<int>(level);
    if (!nullToAbsent || romanticRelationshipInfoId != null) {
      map['romantic_relationship_info_id'] =
          Variable<int>(romanticRelationshipInfoId);
    }
    map['active_romance'] = Variable<bool>(activeRomance);
    map['is_co_parent'] = Variable<bool>(isCoParent);
    return map;
  }

  RelationshipTableCompanion toCompanion(bool nullToAbsent) {
    return RelationshipTableCompanion(
      firstPersonId: Value(firstPersonId),
      secondPersonId: Value(secondPersonId),
      platonicRelationshipType: Value(platonicRelationshipType),
      romanticRelationshipType: Value(romanticRelationshipType),
      previousFamilialRelationship: Value(previousFamilialRelationship),
      interestedInRelationship: Value(interestedInRelationship),
      level: Value(level),
      romanticRelationshipInfoId:
          romanticRelationshipInfoId == null && nullToAbsent
              ? const Value.absent()
              : Value(romanticRelationshipInfoId),
      activeRomance: Value(activeRomance),
      isCoParent: Value(isCoParent),
    );
  }

  factory Relationship.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Relationship(
      firstPersonId: serializer.fromJson<int>(json['firstPersonId']),
      secondPersonId: serializer.fromJson<int>(json['secondPersonId']),
      platonicRelationshipType:
          serializer.fromJson<String>(json['platonicRelationshipType']),
      romanticRelationshipType:
          serializer.fromJson<String>(json['romanticRelationshipType']),
      previousFamilialRelationship:
          serializer.fromJson<String>(json['previousFamilialRelationship']),
      interestedInRelationship:
          serializer.fromJson<bool>(json['interestedInRelationship']),
      level: serializer.fromJson<int>(json['level']),
      romanticRelationshipInfoId:
          serializer.fromJson<int?>(json['romanticRelationshipInfoId']),
      activeRomance: serializer.fromJson<bool>(json['activeRomance']),
      isCoParent: serializer.fromJson<bool>(json['isCoParent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'firstPersonId': serializer.toJson<int>(firstPersonId),
      'secondPersonId': serializer.toJson<int>(secondPersonId),
      'platonicRelationshipType':
          serializer.toJson<String>(platonicRelationshipType),
      'romanticRelationshipType':
          serializer.toJson<String>(romanticRelationshipType),
      'previousFamilialRelationship':
          serializer.toJson<String>(previousFamilialRelationship),
      'interestedInRelationship':
          serializer.toJson<bool>(interestedInRelationship),
      'level': serializer.toJson<int>(level),
      'romanticRelationshipInfoId':
          serializer.toJson<int?>(romanticRelationshipInfoId),
      'activeRomance': serializer.toJson<bool>(activeRomance),
      'isCoParent': serializer.toJson<bool>(isCoParent),
    };
  }

  Relationship copyWith(
          {int? firstPersonId,
          int? secondPersonId,
          String? platonicRelationshipType,
          String? romanticRelationshipType,
          String? previousFamilialRelationship,
          bool? interestedInRelationship,
          int? level,
          Value<int?> romanticRelationshipInfoId = const Value.absent(),
          bool? activeRomance,
          bool? isCoParent}) =>
      Relationship(
        firstPersonId: firstPersonId ?? this.firstPersonId,
        secondPersonId: secondPersonId ?? this.secondPersonId,
        platonicRelationshipType:
            platonicRelationshipType ?? this.platonicRelationshipType,
        romanticRelationshipType:
            romanticRelationshipType ?? this.romanticRelationshipType,
        previousFamilialRelationship:
            previousFamilialRelationship ?? this.previousFamilialRelationship,
        interestedInRelationship:
            interestedInRelationship ?? this.interestedInRelationship,
        level: level ?? this.level,
        romanticRelationshipInfoId: romanticRelationshipInfoId.present
            ? romanticRelationshipInfoId.value
            : this.romanticRelationshipInfoId,
        activeRomance: activeRomance ?? this.activeRomance,
        isCoParent: isCoParent ?? this.isCoParent,
      );
  @override
  String toString() {
    return (StringBuffer('Relationship(')
          ..write('firstPersonId: $firstPersonId, ')
          ..write('secondPersonId: $secondPersonId, ')
          ..write('platonicRelationshipType: $platonicRelationshipType, ')
          ..write('romanticRelationshipType: $romanticRelationshipType, ')
          ..write(
              'previousFamilialRelationship: $previousFamilialRelationship, ')
          ..write('interestedInRelationship: $interestedInRelationship, ')
          ..write('level: $level, ')
          ..write('romanticRelationshipInfoId: $romanticRelationshipInfoId, ')
          ..write('activeRomance: $activeRomance, ')
          ..write('isCoParent: $isCoParent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      firstPersonId,
      secondPersonId,
      platonicRelationshipType,
      romanticRelationshipType,
      previousFamilialRelationship,
      interestedInRelationship,
      level,
      romanticRelationshipInfoId,
      activeRomance,
      isCoParent);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Relationship &&
          other.firstPersonId == this.firstPersonId &&
          other.secondPersonId == this.secondPersonId &&
          other.platonicRelationshipType == this.platonicRelationshipType &&
          other.romanticRelationshipType == this.romanticRelationshipType &&
          other.previousFamilialRelationship ==
              this.previousFamilialRelationship &&
          other.interestedInRelationship == this.interestedInRelationship &&
          other.level == this.level &&
          other.romanticRelationshipInfoId == this.romanticRelationshipInfoId &&
          other.activeRomance == this.activeRomance &&
          other.isCoParent == this.isCoParent);
}

class RelationshipTableCompanion extends UpdateCompanion<Relationship> {
  final Value<int> firstPersonId;
  final Value<int> secondPersonId;
  final Value<String> platonicRelationshipType;
  final Value<String> romanticRelationshipType;
  final Value<String> previousFamilialRelationship;
  final Value<bool> interestedInRelationship;
  final Value<int> level;
  final Value<int?> romanticRelationshipInfoId;
  final Value<bool> activeRomance;
  final Value<bool> isCoParent;
  final Value<int> rowid;
  const RelationshipTableCompanion({
    this.firstPersonId = const Value.absent(),
    this.secondPersonId = const Value.absent(),
    this.platonicRelationshipType = const Value.absent(),
    this.romanticRelationshipType = const Value.absent(),
    this.previousFamilialRelationship = const Value.absent(),
    this.interestedInRelationship = const Value.absent(),
    this.level = const Value.absent(),
    this.romanticRelationshipInfoId = const Value.absent(),
    this.activeRomance = const Value.absent(),
    this.isCoParent = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RelationshipTableCompanion.insert({
    required int firstPersonId,
    required int secondPersonId,
    required String platonicRelationshipType,
    required String romanticRelationshipType,
    required String previousFamilialRelationship,
    required bool interestedInRelationship,
    required int level,
    this.romanticRelationshipInfoId = const Value.absent(),
    required bool activeRomance,
    required bool isCoParent,
    this.rowid = const Value.absent(),
  })  : firstPersonId = Value(firstPersonId),
        secondPersonId = Value(secondPersonId),
        platonicRelationshipType = Value(platonicRelationshipType),
        romanticRelationshipType = Value(romanticRelationshipType),
        previousFamilialRelationship = Value(previousFamilialRelationship),
        interestedInRelationship = Value(interestedInRelationship),
        level = Value(level),
        activeRomance = Value(activeRomance),
        isCoParent = Value(isCoParent);
  static Insertable<Relationship> custom({
    Expression<int>? firstPersonId,
    Expression<int>? secondPersonId,
    Expression<String>? platonicRelationshipType,
    Expression<String>? romanticRelationshipType,
    Expression<String>? previousFamilialRelationship,
    Expression<bool>? interestedInRelationship,
    Expression<int>? level,
    Expression<int>? romanticRelationshipInfoId,
    Expression<bool>? activeRomance,
    Expression<bool>? isCoParent,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (firstPersonId != null) 'first_person_id': firstPersonId,
      if (secondPersonId != null) 'second_person_id': secondPersonId,
      if (platonicRelationshipType != null)
        'platonic_relationship_type': platonicRelationshipType,
      if (romanticRelationshipType != null)
        'romantic_relationship_type': romanticRelationshipType,
      if (previousFamilialRelationship != null)
        'previous_familial_relationship': previousFamilialRelationship,
      if (interestedInRelationship != null)
        'interested_in_relationship': interestedInRelationship,
      if (level != null) 'level': level,
      if (romanticRelationshipInfoId != null)
        'romantic_relationship_info_id': romanticRelationshipInfoId,
      if (activeRomance != null) 'active_romance': activeRomance,
      if (isCoParent != null) 'is_co_parent': isCoParent,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RelationshipTableCompanion copyWith(
      {Value<int>? firstPersonId,
      Value<int>? secondPersonId,
      Value<String>? platonicRelationshipType,
      Value<String>? romanticRelationshipType,
      Value<String>? previousFamilialRelationship,
      Value<bool>? interestedInRelationship,
      Value<int>? level,
      Value<int?>? romanticRelationshipInfoId,
      Value<bool>? activeRomance,
      Value<bool>? isCoParent,
      Value<int>? rowid}) {
    return RelationshipTableCompanion(
      firstPersonId: firstPersonId ?? this.firstPersonId,
      secondPersonId: secondPersonId ?? this.secondPersonId,
      platonicRelationshipType:
          platonicRelationshipType ?? this.platonicRelationshipType,
      romanticRelationshipType:
          romanticRelationshipType ?? this.romanticRelationshipType,
      previousFamilialRelationship:
          previousFamilialRelationship ?? this.previousFamilialRelationship,
      interestedInRelationship:
          interestedInRelationship ?? this.interestedInRelationship,
      level: level ?? this.level,
      romanticRelationshipInfoId:
          romanticRelationshipInfoId ?? this.romanticRelationshipInfoId,
      activeRomance: activeRomance ?? this.activeRomance,
      isCoParent: isCoParent ?? this.isCoParent,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (firstPersonId.present) {
      map['first_person_id'] = Variable<int>(firstPersonId.value);
    }
    if (secondPersonId.present) {
      map['second_person_id'] = Variable<int>(secondPersonId.value);
    }
    if (platonicRelationshipType.present) {
      map['platonic_relationship_type'] =
          Variable<String>(platonicRelationshipType.value);
    }
    if (romanticRelationshipType.present) {
      map['romantic_relationship_type'] =
          Variable<String>(romanticRelationshipType.value);
    }
    if (previousFamilialRelationship.present) {
      map['previous_familial_relationship'] =
          Variable<String>(previousFamilialRelationship.value);
    }
    if (interestedInRelationship.present) {
      map['interested_in_relationship'] =
          Variable<bool>(interestedInRelationship.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (romanticRelationshipInfoId.present) {
      map['romantic_relationship_info_id'] =
          Variable<int>(romanticRelationshipInfoId.value);
    }
    if (activeRomance.present) {
      map['active_romance'] = Variable<bool>(activeRomance.value);
    }
    if (isCoParent.present) {
      map['is_co_parent'] = Variable<bool>(isCoParent.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelationshipTableCompanion(')
          ..write('firstPersonId: $firstPersonId, ')
          ..write('secondPersonId: $secondPersonId, ')
          ..write('platonicRelationshipType: $platonicRelationshipType, ')
          ..write('romanticRelationshipType: $romanticRelationshipType, ')
          ..write(
              'previousFamilialRelationship: $previousFamilialRelationship, ')
          ..write('interestedInRelationship: $interestedInRelationship, ')
          ..write('level: $level, ')
          ..write('romanticRelationshipInfoId: $romanticRelationshipInfoId, ')
          ..write('activeRomance: $activeRomance, ')
          ..write('isCoParent: $isCoParent, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$DatabaseProvider extends GeneratedDatabase {
  _$DatabaseProvider(QueryExecutor e) : super(e);
  late final $GameTableTable gameTable = $GameTableTable(this);
  late final $PersonTableTable personTable = $PersonTableTable(this);
  late final $AppearanceTableTable appearanceTable =
      $AppearanceTableTable(this);
  late final $StatsTableTable statsTable = $StatsTableTable(this);
  late final $DepleteStatsFlagTableTable depleteStatsFlagTable =
      $DepleteStatsFlagTableTable(this);
  late final $PersonalityTableTable personalityTable =
      $PersonalityTableTable(this);
  late final $StanceTableTable stanceTable = $StanceTableTable(this);
  late final $TattooTableTable tattooTable = $TattooTableTable(this);
  late final $PiercingTableTable piercingTable = $PiercingTableTable(this);
  late final $BabyTraitsTableTable babyTraitsTable =
      $BabyTraitsTableTable(this);
  late final $DeathRecordTableTable deathRecordTable =
      $DeathRecordTableTable(this);
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
  late final $CarProblemTableTable carProblemTable =
      $CarProblemTableTable(this);
  late final $FoodTableTable foodTable = $FoodTableTable(this);
  late final $FridgeFoodTableTable fridgeFoodTable =
      $FridgeFoodTableTable(this);
  late final $HouseTableTable houseTable = $HouseTableTable(this);
  late final $CurrentHomeTableTable currentHomeTable =
      $CurrentHomeTableTable(this);
  late final $ItemTableTable itemTable = $ItemTableTable(this);
  late final $JewelryTableTable jewelryTable = $JewelryTableTable(this);
  late final $StoreroomItemTableTable storeroomItemTable =
      $StoreroomItemTableTable(this);
  late final $JournalTableTable journalTable = $JournalTableTable(this);
  late final $RecurringBillTableTable recurringBillTable =
      $RecurringBillTableTable(this);
  late final $DegreeTableTable degreeTable = $DegreeTableTable(this);
  late final $SchoolTableTable schoolTable = $SchoolTableTable(this);
  late final $SchoolProjectTableTable schoolProjectTable =
      $SchoolProjectTableTable(this);
  late final $SchoolRelationshipTableTable schoolRelationshipTable =
      $SchoolRelationshipTableTable(this);
  late final $JobTableTable jobTable = $JobTableTable(this);
  late final $EmploymentTableTable employmentTable =
      $EmploymentTableTable(this);
  late final $JobRelationshipTableTable jobRelationshipTable =
      $JobRelationshipTableTable(this);
  late final $ParentChildLinkTableTable parentChildLinkTable =
      $ParentChildLinkTableTable(this);
  late final $RomanticRelationshipInfoTableTable romanticRelationshipInfoTable =
      $RomanticRelationshipInfoTableTable(this);
  late final $RelationshipTableTable relationshipTable =
      $RelationshipTableTable(this);
  late final GameDaoImpl gameDaoImpl = GameDaoImpl(this as DatabaseProvider);
  late final PersonDaoImpl personDaoImpl =
      PersonDaoImpl(this as DatabaseProvider);
  late final AppearanceDaoImpl appearanceDaoImpl =
      AppearanceDaoImpl(this as DatabaseProvider);
  late final StatsDaoImpl statsDaoImpl = StatsDaoImpl(this as DatabaseProvider);
  late final DepleteStatsFlagDaoImpl depleteStatsFlagDaoImpl =
      DepleteStatsFlagDaoImpl(this as DatabaseProvider);
  late final StanceDaoImpl stanceDaoImpl =
      StanceDaoImpl(this as DatabaseProvider);
  late final PersonalityDaoImpl personalityDaoImpl =
      PersonalityDaoImpl(this as DatabaseProvider);
  late final TattooDaoImpl tattooDaoImpl =
      TattooDaoImpl(this as DatabaseProvider);
  late final PiercingDaoImpl piercingDaoImpl =
      PiercingDaoImpl(this as DatabaseProvider);
  late final BabyTraitsDaoImpl babyTraitsDaoImpl =
      BabyTraitsDaoImpl(this as DatabaseProvider);
  late final DeathRecordDaoImpl deathRecordDaoImpl =
      DeathRecordDaoImpl(this as DatabaseProvider);
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
  late final CarProblemDaoImpl carProblemDaoImpl =
      CarProblemDaoImpl(this as DatabaseProvider);
  late final FoodDaoImpl foodDaoImpl = FoodDaoImpl(this as DatabaseProvider);
  late final FridgeFoodDaoImpl fridgeFoodDaoImpl =
      FridgeFoodDaoImpl(this as DatabaseProvider);
  late final HouseDaoImpl houseDaoImpl = HouseDaoImpl(this as DatabaseProvider);
  late final CurrentHomeDaoImpl currentHomeDaoImpl =
      CurrentHomeDaoImpl(this as DatabaseProvider);
  late final ItemDaoImpl itemDaoImpl = ItemDaoImpl(this as DatabaseProvider);
  late final JewelryDaoImpl jewelryDaoImpl =
      JewelryDaoImpl(this as DatabaseProvider);
  late final StoreroomItemDaoImpl storeroomItemDaoImpl =
      StoreroomItemDaoImpl(this as DatabaseProvider);
  late final JournalDaoImpl journalDaoImpl =
      JournalDaoImpl(this as DatabaseProvider);
  late final RecurringBillDaoImpl recurringBillDaoImpl =
      RecurringBillDaoImpl(this as DatabaseProvider);
  late final DegreeDaoImpl degreeDaoImpl =
      DegreeDaoImpl(this as DatabaseProvider);
  late final SchoolDaoImpl schoolDaoImpl =
      SchoolDaoImpl(this as DatabaseProvider);
  late final SchoolProjectDaoImpl schoolProjectDaoImpl =
      SchoolProjectDaoImpl(this as DatabaseProvider);
  late final SchoolRelationshipDaoImpl schoolRelationshipDaoImpl =
      SchoolRelationshipDaoImpl(this as DatabaseProvider);
  late final JobDaoImpl jobDaoImpl = JobDaoImpl(this as DatabaseProvider);
  late final EmploymentDaoImpl employmentDaoImpl =
      EmploymentDaoImpl(this as DatabaseProvider);
  late final JobRelationshipDaoImpl jobRelationshipDaoImpl =
      JobRelationshipDaoImpl(this as DatabaseProvider);
  late final ParentChildLinkDaoImpl parentChildLinkDaoImpl =
      ParentChildLinkDaoImpl(this as DatabaseProvider);
  late final RelationshipDaoImpl relationshipDaoImpl =
      RelationshipDaoImpl(this as DatabaseProvider);
  late final RomanticRelationshipInfoDaoImpl romanticRelationshipInfoDaoImpl =
      RomanticRelationshipInfoDaoImpl(this as DatabaseProvider);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        gameTable,
        personTable,
        appearanceTable,
        statsTable,
        depleteStatsFlagTable,
        personalityTable,
        stanceTable,
        tattooTable,
        piercingTable,
        babyTraitsTable,
        deathRecordTable,
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
        carProblemTable,
        foodTable,
        fridgeFoodTable,
        houseTable,
        currentHomeTable,
        itemTable,
        jewelryTable,
        storeroomItemTable,
        journalTable,
        recurringBillTable,
        degreeTable,
        schoolTable,
        schoolProjectTable,
        schoolRelationshipTable,
        jobTable,
        employmentTable,
        jobRelationshipTable,
        parentChildLinkTable,
        romanticRelationshipInfoTable,
        relationshipTable
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
              TableUpdate('appearance', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('appearance', kind: UpdateKind.update),
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
              TableUpdate('deplete_stats_flag', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('deplete_stats_flag', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('personality', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('personality', kind: UpdateKind.update),
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
              TableUpdate('tattoo', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('tattoo', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('piercing', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('piercing', kind: UpdateKind.update),
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
            on: TableUpdateQuery.onTableName('game',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('death_record', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('game',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('death_record', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('death_record', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('death_record', kind: UpdateKind.update),
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
          WritePropagation(
            on: TableUpdateQuery.onTableName('game',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('event', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('game',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('event', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('event', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('event', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('event', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('event', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('car', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('car', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('car',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('car_problem', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('car',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('car_problem', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('fridge_food', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('fridge_food', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('food',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('fridge_food', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('food',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('fridge_food', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('house', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('house', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('current_home', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('current_home', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('house',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('current_home', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('house',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('current_home', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('jewelry', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('jewelry', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('storeroom_item', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('storeroom_item', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('item',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('storeroom_item', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('item',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('storeroom_item', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('recurring_bill', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('recurring_bill', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('school', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('school', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('degree',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('school', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('degree',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('school', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('school',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('school_project', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('school',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('school_project', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('school_project', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('school_project', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('school_project', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('school_project', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('school',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('school_relationship', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('school',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('school_relationship', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('school_relationship', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('school_relationship', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('school_relationship', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('school_relationship', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('job',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('employment', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('job',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('employment', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('employment', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('employment', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('employment',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('job_relationship', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('employment',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('job_relationship', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('job_relationship', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('job_relationship', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('job_relationship', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('job_relationship', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('parent_child_link', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('parent_child_link', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('parent_child_link', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('parent_child_link', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('game',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('romantic_relationship_info',
                  kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('game',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('romantic_relationship_info',
                  kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('relationship', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('relationship', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('relationship', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('person',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('relationship', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('romantic_relationship_info',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('relationship', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('romantic_relationship_info',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('relationship', kind: UpdateKind.update),
            ],
          ),
        ],
      );
}
