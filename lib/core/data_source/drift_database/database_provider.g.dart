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

abstract class _$DatabaseProvider extends GeneratedDatabase {
  _$DatabaseProvider(QueryExecutor e) : super(e);
  late final $GameTableTable gameTable = $GameTableTable(this);
  late final GameDaoImpl gameDaoImpl = GameDaoImpl(this as DatabaseProvider);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [gameTable];
}
