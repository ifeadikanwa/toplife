import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/utils/chance.dart';

class Stance extends Equatable {
  final int? id;
  final int personID;
  final bool openToAdoption;
  final bool openToAbortion;
  final bool openToSurrogacy;
  final bool openToAlternativeFertilityMethods;
  final bool openToSigningPrenup;
  final bool wantsPartnerToSignPrenup;

  const Stance({
    this.id,
    required this.personID,
    required this.openToAdoption,
    required this.openToAbortion,
    required this.openToSurrogacy,
    required this.openToAlternativeFertilityMethods,
    required this.openToSigningPrenup,
    required this.wantsPartnerToSignPrenup,
  });

  @override
  List<Object?> get props => [
        id,
        personID,
        openToAdoption,
        openToAbortion,
        openToSurrogacy,
        openToAlternativeFertilityMethods,
        openToSigningPrenup,
        wantsPartnerToSignPrenup,
      ];

  @override
  bool? get stringify => true;

  //Helper constants

  static bool getValidStanceValue() {
    //65 percent chance the stance is true
    return Chance.getTrueOrFalseBasedOnPercentageChance(
      trueChancePercentage: 65,
    );
  }

  static const idColumn = "_id";
  static const personIDColumn = "personID";
  static const openToAdoptionColumn = "openToAdoption";
  static const openToAbortionColumn = "openToAbortion";
  static const openToSurrogacyColumn = "openToSurrogacy";
  static const openToAlternativeFertilityMethodsColumn =
      "openToAlternativeFertilityMethods";
  static const openToSigningPrenupColumn = "openToSigningPrenup";
  static const wantsPartnerToSignPrenupColumn = "wantsPartnerToSignPrenup";

  static const allColumns = [
    idColumn,
    personIDColumn,
    openToAdoptionColumn,
    openToAbortionColumn,
    openToSurrogacyColumn,
    openToAlternativeFertilityMethodsColumn,
    openToSigningPrenupColumn,
    wantsPartnerToSignPrenupColumn,
  ];

  static Stance fromMap({required Map<String, Object?> stanceMap}) {
    return Stance(
      id: stanceMap[idColumn] as int?,
      personID: stanceMap[personIDColumn] as int,
      openToAdoption: stanceMap[openToAdoptionColumn] == databaseTrueValue,
      openToAbortion: stanceMap[openToAbortionColumn] == databaseTrueValue,
      openToSurrogacy: stanceMap[openToSurrogacyColumn] == databaseTrueValue,
      openToAlternativeFertilityMethods:
          stanceMap[openToAlternativeFertilityMethodsColumn] ==
              databaseTrueValue,
      openToSigningPrenup:
          stanceMap[openToSigningPrenupColumn] == databaseTrueValue,
      wantsPartnerToSignPrenup:
          stanceMap[wantsPartnerToSignPrenupColumn] == databaseTrueValue,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      personIDColumn: personID,
      openToAdoptionColumn:
          openToAdoption ? databaseTrueValue : databaseFalseValue,
      openToAbortionColumn:
          openToAbortion ? databaseTrueValue : databaseFalseValue,
      openToSurrogacyColumn:
          openToSurrogacy ? databaseTrueValue : databaseFalseValue,
      openToAlternativeFertilityMethodsColumn: openToAlternativeFertilityMethods
          ? databaseTrueValue
          : databaseFalseValue,
      openToSigningPrenupColumn:
          openToSigningPrenup ? databaseTrueValue : databaseFalseValue,
      wantsPartnerToSignPrenupColumn:
          wantsPartnerToSignPrenup ? databaseTrueValue : databaseFalseValue,
    };
  }

  Stance copyWith({
    int? id,
    int? personID,
    bool? openToAdoption,
    bool? openToAbortion,
    bool? openToSurrogacy,
    bool? openToAlternativeFertilityMethods,
    bool? openToSigningPrenup,
    bool? wantsPartnerToSignPrenup,
  }) {
    return Stance(
      id: id ?? this.id,
      personID: personID ?? this.personID,
      openToAdoption: openToAdoption ?? this.openToAdoption,
      openToAbortion: openToAbortion ?? this.openToAbortion,
      openToSurrogacy: openToSurrogacy ?? this.openToSurrogacy,
      openToAlternativeFertilityMethods: openToAlternativeFertilityMethods ??
          this.openToAlternativeFertilityMethods,
      openToSigningPrenup: openToSigningPrenup ?? this.openToSigningPrenup,
      wantsPartnerToSignPrenup:
          wantsPartnerToSignPrenup ?? this.wantsPartnerToSignPrenup,
    );
  }
}
