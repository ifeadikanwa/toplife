import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';

class Food extends Equatable {
  final int? id;
  final String name;
  final String type;
  final int basePrice;
  final int lifespanInDays;
  final int nutrition;
  final int servings;
  final bool isOrganic;

  const Food({
    this.id,
    required this.name,
    required this.type,
    required this.basePrice,
    required this.lifespanInDays,
    required this.nutrition,
    required this.servings,
    required this.isOrganic,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        basePrice,
        lifespanInDays,
        nutrition,
        servings,
        isOrganic,
      ];

  @override
  bool? get stringify => true;

  //helper constants
  static const idColumn = "_id";
  static const nameColumn = "name";
  static const typeColumn = "type";
  static const basePriceColumn = "basePrice";
  static const lifespanInDaysColumn = "lifespanInDays";
  static const nutritionColumn = "nutrition";
  static const servingsColumn = "servings";
  static const isOrganicColumn = "isOrganic";

  static const allColumns = [
    idColumn,
    nameColumn,
    typeColumn,
    basePriceColumn,
    lifespanInDaysColumn,
    nutritionColumn,
    servingsColumn,
    isOrganicColumn,
  ];

  static Food fromMap({required Map<String, Object?> foodMap}) {
    return Food(
      id: foodMap[idColumn] as int?,
      name: foodMap[nameColumn] as String,
      type: foodMap[typeColumn] as String,
      basePrice: foodMap[basePriceColumn] as int,
      lifespanInDays: foodMap[lifespanInDaysColumn] as int,
      nutrition: foodMap[nutritionColumn] as int,
      servings: foodMap[servingsColumn] as int,
      isOrganic: foodMap[isOrganicColumn] == databaseTrueValue,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      nameColumn: name,
      typeColumn: type,
      basePriceColumn: basePrice,
      lifespanInDaysColumn: lifespanInDays,
      nutritionColumn: nutrition,
      servingsColumn: servings,
      isOrganicColumn: isOrganic ? databaseTrueValue : databaseFalseValue,
    };
  }

  Food copyWith({
    int? id,
    String? name,
    String? type,
    int? basePrice,
    int? lifespanInDays,
    int? nutrition,
    int? servings,
    bool? isOrganic,
  }) {
    return Food(
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
}
