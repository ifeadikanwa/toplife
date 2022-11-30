import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';

class House extends Equatable {
  final int? id;
  final int? personID;
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

  const House({
    this.id,
    this.personID,
    this.isCurrentHome = false,
    required this.bedrooms,
    required this.bathrooms,
    required this.storage,
    required this.address,
    required this.isForRent,
    required this.buildingType,
    required this.settlement,
    this.country = "",
    required this.style,
    required this.lastMaintainedDay,
    required this.basePrice,
    required this.dayOfPurchase,
    this.endOfLeaseDay = 0,
    required this.condition,
    required this.purchasePrice,
    this.fullyPaidFor = true,
  });

  @override
  List<Object?> get props => [
        id,
        personID,
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
        fullyPaidFor,
      ];

  @override
  bool? get stringify => true;

  //helper constants
  static const conditionDepreciationDaysLength = 10;
  static const conditionDepreciationAmount = 10;
  static const homelessStorageSpace = 5;
  static const minLeaseAgreementDuration = 14; //in DAYS

  static const idColumn = "_id";
  static const personIDColumn = "personID";
  static const isCurrentHomeColumn = "isCurrentHome";
  static const bedroomsColumn = "bedrooms";
  static const bathroomsColumn = "bathrooms";
  static const storageColumn = "storage";
  static const addressColumn = "address";
  static const isForRentColumn = "isForRent";
  static const buildingTypeColumn = "buildingType";
  static const settlementColumn = "settlement";
  static const countryColumn = "country";
  static const styleColumn = "style";
  static const lastMaintainedDayColumn = "lastMaintainedDay";
  static const basePriceColumn = "basePrice";
  static const dayOfPurchaseColumn = "dayOfPurchase";
  static const endOfLeaseDayColumn = "endOfLeaseDay";
  static const conditionColumn = "condition";
  static const purchasePriceColumn = "purchasePrice";
  static const fullyPaidForColumn = "fullyPaidFor";

  static const allColumns = [
    idColumn,
    personIDColumn,
    isCurrentHomeColumn,
    bedroomsColumn,
    bathroomsColumn,
    storageColumn,
    addressColumn,
    isForRentColumn,
    buildingTypeColumn,
    settlementColumn,
    countryColumn,
    styleColumn,
    lastMaintainedDayColumn,
    basePriceColumn,
    dayOfPurchaseColumn,
    endOfLeaseDayColumn,
    conditionColumn,
    purchasePriceColumn,
    fullyPaidForColumn,
  ];

  static House fromMap({required Map<String, Object?> houseMap}) {
    return House(
      id: houseMap[idColumn] as int?,
      personID: houseMap[personIDColumn] as int?,
      isCurrentHome: houseMap[isCurrentHomeColumn] == databaseTrueValue,
      bedrooms: houseMap[bedroomsColumn] as int,
      bathrooms: houseMap[bathroomsColumn] as int,
      storage: houseMap[storageColumn] as int,
      address: houseMap[addressColumn] as String,
      isForRent: houseMap[isForRentColumn] == databaseTrueValue,
      buildingType: houseMap[buildingTypeColumn] as String,
      settlement: houseMap[settlementColumn] as String,
      country: houseMap[countryColumn] as String,
      style: houseMap[styleColumn] as String,
      lastMaintainedDay: houseMap[lastMaintainedDayColumn] as int,
      basePrice: houseMap[basePriceColumn] as int,
      dayOfPurchase: houseMap[dayOfPurchaseColumn] as int,
      endOfLeaseDay: houseMap[endOfLeaseDayColumn] as int,
      condition: houseMap[conditionColumn] as int,
      purchasePrice: houseMap[purchasePriceColumn] as int,
      fullyPaidFor: houseMap[fullyPaidForColumn] == databaseTrueValue,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      personIDColumn: personID,
      isCurrentHomeColumn:
          isCurrentHome ? databaseTrueValue : databaseFalseValue,
      bedroomsColumn: bedrooms,
      bathroomsColumn: bathrooms,
      storageColumn: storage,
      addressColumn: address,
      isForRentColumn: isForRent ? databaseTrueValue : databaseFalseValue,
      buildingTypeColumn: buildingType,
      settlementColumn: settlement,
      countryColumn: country,
      styleColumn: style,
      lastMaintainedDayColumn: lastMaintainedDay,
      basePriceColumn: basePrice,
      dayOfPurchaseColumn: dayOfPurchase,
      endOfLeaseDayColumn: endOfLeaseDay,
      conditionColumn: condition,
      purchasePriceColumn: purchasePrice,
      fullyPaidForColumn: fullyPaidFor ? databaseTrueValue : databaseFalseValue,
    };
  }

  House copyWith({
    int? id,
    int? personID,
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
    String? quality,
    int? basePrice,
    int? dayOfPurchase,
    int? endOfLeaseDay,
    int? condition,
    int? purchasePrice,
    bool? fullyPaidFor,
  }) {
    return House(
      id: id ?? this.id,
      personID: personID ?? this.personID,
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
      condition: crossCheckStat(condition) ?? this.condition,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      fullyPaidFor: fullyPaidFor ?? this.fullyPaidFor,
    );
  }
}
