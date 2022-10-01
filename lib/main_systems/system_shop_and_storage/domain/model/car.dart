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
  final int fuelTank;
  final String problem;
  final int useCondition;
  final int maxConditionAtPurchase;
  final bool fullyPaidFor;
  final bool isInsured;
  final int insuranceCost;
  final String insuranceType;

  const Car({
    this.id,
    this.personID,
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
    this.fullyPaidFor = true,
    this.isInsured = false,
    this.insuranceCost = 0,
    this.insuranceType = "",
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
        fuelTank,
        problem,
        useCondition,
        maxConditionAtPurchase,
        fullyPaidFor,
        isInsured,
        insuranceCost,
        insuranceType,
      ];

  @override
  bool? get stringify => true;

  //helper constants
  static const maxConditionDepreciationDaysLength = 10;

  static const idColumn = "_id";
  static const personIDColumn = "personID";
  static const nameColumn = "name";
  static const typeColumn = "type";
  static const percentageOfTravelTimeColumn = "percentageOfTravelTime";
  static const qualityColumn = "quality";
  static const basePriceColumn = "basePrice";
  static const dayOfPurchaseColumn = "dayOfPurchase";
  static const fuelTankColumn = "fuelTank";
  static const problemColumn = "problem";
  static const useConditionColumn = "useCondition";
  static const maxConditionAtPurchaseColumn = "maxConditionAtPurchase";
  static const fullyPaidForColumn = "fullyPaidFor";
  static const isInsuredColumn = "isInsured";
  static const insuranceCostColumn = "insuranceCost";
  static const insuranceTypeColumn = "insuranceType";

  static const allColumns = [
    idColumn,
    personIDColumn,
    nameColumn,
    typeColumn,
    percentageOfTravelTimeColumn,
    qualityColumn,
    basePriceColumn,
    dayOfPurchaseColumn,
    fuelTankColumn,
    problemColumn,
    useConditionColumn,
    maxConditionAtPurchaseColumn,
    fullyPaidForColumn,
    isInsuredColumn,
    insuranceCostColumn,
    insuranceTypeColumn,
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
      fuelTank: carMap[fuelTankColumn] as int,
      problem: carMap[problemColumn] as String,
      useCondition: carMap[useConditionColumn] as int,
      maxConditionAtPurchase: carMap[maxConditionAtPurchaseColumn] as int,
      fullyPaidFor: carMap[fullyPaidForColumn] == databaseTrueValue,
      isInsured: carMap[isInsuredColumn] == databaseTrueValue,
      insuranceCost: carMap[insuranceCostColumn] as int,
      insuranceType: carMap[insuranceTypeColumn] as String,
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
      fuelTankColumn: fuelTank,
      problemColumn: problem,
      useConditionColumn: useCondition,
      maxConditionAtPurchaseColumn: maxConditionAtPurchase,
      fullyPaidForColumn: fullyPaidFor ? databaseTrueValue : databaseFalseValue,
      isInsuredColumn: isInsured ? databaseTrueValue : databaseFalseValue,
      insuranceCostColumn: insuranceCost,
      insuranceTypeColumn: insuranceType,
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
    int? fuelTank,
    String? problem,
    int? useCondition,
    int? maxConditionAtPurchase,
    bool? fullyPaidFor,
    bool? isInsured,
    int? insuranceCost,
    String? insuranceType,
  }) {
    return Car(
      id: id ?? this.id,
      personID: personID ?? this.personID,
      name: name ?? this.name,
      type: type ?? this.type,
      percentageOfTravelTime:
          crossCheckStat(percentageOfTravelTime) ?? this.percentageOfTravelTime,
      quality: quality ?? this.quality,
      basePrice: basePrice ?? this.basePrice,
      dayOfPurchase: dayOfPurchase ?? this.dayOfPurchase,
      fuelTank: crossCheckStat(fuelTank) ?? this.fuelTank,
      problem: problem ?? this.problem,
      useCondition: crossCheckStat(useCondition) ?? this.useCondition,
      maxConditionAtPurchase:
          crossCheckStat(maxConditionAtPurchase) ?? this.maxConditionAtPurchase,
      fullyPaidFor: fullyPaidFor ?? this.fullyPaidFor,
      isInsured: isInsured ?? this.isInsured,
      insuranceCost: insuranceCost ?? this.insuranceCost,
      insuranceType: insuranceType ?? this.insuranceType,
    );
  }
}
