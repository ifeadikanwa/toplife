import 'package:equatable/equatable.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';

class Jewelry extends Equatable {
  final int? id;
  final int? personID;
  final String jewel;
  final String type;
  final double carat;
  final String quality;
  final int basePrice;
  final int dayOfPurchase;
  final int maxConditionAtPurchase;

  const Jewelry({
    this.id,
    this.personID,
    required this.jewel,
    required this.type,
    required this.carat,
    required this.quality,
    required this.basePrice,
    required this.dayOfPurchase,
    required this.maxConditionAtPurchase,
  });

  @override
  List<Object?> get props => [
        id,
        personID,
        jewel,
        type,
        carat,
        quality,
        basePrice,
        dayOfPurchase,
        maxConditionAtPurchase,
      ];

  @override
  bool? get stringify => true;

  //helper constants
  static const idColumn = "_id";
  static const personIDColumn = "personID";
  static const jewelColumn = "jewel";
  static const typeColumn = "type";
  static const caratColumn = "carat";
  static const qualityColumn = "quality";
  static const basePriceColumn = "basePrice";
  static const dayOfPurchaseColumn = "dayOfPurchase";
  static const maxConditionAtPurchaseColumn = "maxConditionAtPurchase";

  static const allColumns = [
    idColumn,
    personIDColumn,
    jewelColumn,
    typeColumn,
    caratColumn,
    qualityColumn,
    basePriceColumn,
    dayOfPurchaseColumn,
    maxConditionAtPurchaseColumn,
  ];

  static Jewelry fromMap({required Map<String, Object?> jewelryMap}) {
    return Jewelry(
      id: jewelryMap[idColumn] as int?,
      personID: jewelryMap[personIDColumn] as int?,
      jewel: jewelryMap[jewelColumn] as String,
      type: jewelryMap[typeColumn] as String,
      carat: jewelryMap[caratColumn] as double,
      quality: jewelryMap[qualityColumn] as String,
      basePrice: jewelryMap[basePriceColumn] as int,
      dayOfPurchase: jewelryMap[dayOfPurchaseColumn] as int,
      maxConditionAtPurchase: jewelryMap[maxConditionAtPurchaseColumn] as int,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      personIDColumn: personID,
      jewelColumn: jewel,
      typeColumn: type,
      caratColumn: carat,
      qualityColumn: quality,
      basePriceColumn: basePrice,
      dayOfPurchaseColumn: dayOfPurchase,
      maxConditionAtPurchaseColumn: maxConditionAtPurchase,
    };
  }

  Jewelry copyWith({
    int? id,
    int? personID,
    String? jewel,
    String? type,
    double? carat,
    String? quality,
    int? basePrice,
    int? dayOfPurchase,
    int? maxConditionAtPurchase,
  }) {
    return Jewelry(
      id: id ?? this.id,
      personID: personID ?? this.personID,
      jewel: jewel ?? this.jewel,
      type: type ?? this.type,
      carat: carat ?? this.carat,
      quality: quality ?? this.quality,
      basePrice: basePrice ?? this.basePrice,
      dayOfPurchase: dayOfPurchase ?? this.dayOfPurchase,
      maxConditionAtPurchase:
          crossCheckStat(maxConditionAtPurchase) ?? this.maxConditionAtPurchase,
    );
  }
}
