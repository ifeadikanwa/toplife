import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';

class Car extends Equatable {
  final int? id;
  final int? personID;
  final String name;
  final String type;
  final int percentageOfTravelTime;
  final String quality;
  final int basePrice;
  final int dayOfPurchase;
  final int useCondition;
  final int maxConditionAtPurchase;
  final bool fullyPaidFor;

  const Car({
    this.id,
    this.personID,
    required this.name,
    required this.type,
    required this.percentageOfTravelTime,
    required this.quality,
    required this.basePrice,
    required this.dayOfPurchase,
    required this.useCondition,
    required this.maxConditionAtPurchase,
    this.fullyPaidFor = true,
  });

  @override
  List<Object?> get props => [
        id,
        personID,
        name,
        type,
        percentageOfTravelTime,
        quality,
        basePrice,
        dayOfPurchase,
        useCondition,
        maxConditionAtPurchase,
        fullyPaidFor,
      ];

  @override
  bool? get stringify => true;

  //helper constants
  static const idColumn = "_id";
  static const personIDColumn = "personID";
  static const nameColumn = "name";
  static const typeColumn = "type";
  static const percentageOfTravelTimeColumn = "percentageOfTravelTime";
  static const qualityColumn = "quality";
  static const basePriceColumn = "basePrice";
  static const dayOfPurchaseColumn = "dayOfPurchase";
  static const useConditionColumn = "useCondition";
  static const maxConditionAtPurchaseColumn = "maxConditionAtPurchase";
  static const fullyPaidForColumn = "fullyPaidFor";

  static const allColumns = [
    idColumn,
    personIDColumn,
    nameColumn,
    typeColumn,
    percentageOfTravelTimeColumn,
    qualityColumn,
    basePriceColumn,
    dayOfPurchaseColumn,
    useConditionColumn,
    maxConditionAtPurchaseColumn,
    fullyPaidForColumn,
  ];

  static Car fromMap({required Map<String, Object?> carMap}) {
    return Car(
      id: carMap[idColumn] as int?,
      personID: carMap[personIDColumn] as int?,
      name: carMap[nameColumn] as String,
      type: carMap[typeColumn] as String,
      percentageOfTravelTime: carMap[percentageOfTravelTimeColumn] as int,
      quality: carMap[qualityColumn] as String,
      basePrice: carMap[basePriceColumn] as int,
      dayOfPurchase: carMap[dayOfPurchaseColumn] as int,
      useCondition: carMap[useConditionColumn] as int,
      maxConditionAtPurchase: carMap[maxConditionAtPurchaseColumn] as int,
      fullyPaidFor: carMap[fullyPaidForColumn] == databaseTrueValue,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      personIDColumn: personID,
      nameColumn: name,
      typeColumn: type,
      percentageOfTravelTimeColumn: percentageOfTravelTime,
      qualityColumn: quality,
      basePriceColumn: basePrice,
      dayOfPurchaseColumn: dayOfPurchase,
      useConditionColumn: useCondition,
      maxConditionAtPurchaseColumn: maxConditionAtPurchase,
      fullyPaidForColumn: fullyPaidFor ? databaseTrueValue : databaseFalseValue,
    };
  }

  Car copyWith({
    int? id,
    int? personID,
    String? name,
    String? type,
    int? percentageOfTravelTime,
    String? quality,
    int? basePrice,
    int? dayOfPurchase,
    int? useCondition,
    int? maxConditionAtPurchase,
    bool? fullyPaidFor,
  }) {
    return Car(
      id: id ?? this.id,
      personID: personID ?? this.personID,
      name: name ?? this.name,
      type: type ?? this.type,
      percentageOfTravelTime: crossCheckStat(percentageOfTravelTime) ?? this.percentageOfTravelTime,
      quality: quality ?? this.quality,
      basePrice: basePrice ?? this.basePrice,
      dayOfPurchase: dayOfPurchase ?? this.dayOfPurchase,
      useCondition: crossCheckStat(useCondition) ?? this.useCondition,
      maxConditionAtPurchase:
          crossCheckStat(maxConditionAtPurchase) ?? this.maxConditionAtPurchase,
      fullyPaidFor: fullyPaidFor ?? this.fullyPaidFor,
    );
  }
}
