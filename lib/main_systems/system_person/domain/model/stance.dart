import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/utils/chance.dart';

class Stance extends Equatable {
  final int? id;
  final int personID;
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

  const Stance({
    this.id,
    required this.personID,
    required this.openToAdoption,
    required this.openToSexWorkerPartner,
    required this.openToAbortion,
    required this.openToSurrogacy,
    required this.openToAlternativeFertilityMethods,
    required this.openToSigningPrenup,
    required this.wantsPartnerToSignPrenup,
    required this.openToCrimes,
    required this.openToStayAtHomeParenting,
    required this.openToPremaritalSex,
  });

  @override
  List<Object?> get props => [
        id,
        personID,
        openToAdoption,
        openToSexWorkerPartner,
        openToAbortion,
        openToSurrogacy,
        openToAlternativeFertilityMethods,
        openToSigningPrenup,
        wantsPartnerToSignPrenup,
        openToCrimes,
        openToStayAtHomeParenting,
        openToPremaritalSex,
      ];

  @override
  bool? get stringify => true;

  //Helper constants

  static bool getValidStanceValue() {
    //70 percent chance the stance is true
    return Chance.getTrueOrFalseBasedOnPercentageChance(
      trueChancePercentage: 70,
    );
  }

  static const idColumn = "_id";
  static const personIDColumn = "personID";
  static const openToAdoptionColumn = "openToAdoption";
  static const openToSexWorkerPartnerColumn = "openToSexWorkerPartner";
  static const openToAbortionColumn = "openToAbortion";
  static const openToSurrogacyColumn = "openToSurrogacy";
  static const openToAlternativeFertilityMethodsColumn =
      "openToAlternativeFertilityMethods";
  static const openToSigningPrenupColumn = "openToSigningPrenup";
  static const wantsPartnerToSignPrenupColumn = "wantsPartnerToSignPrenup";
  static const openToCrimesColumn = "openToCrimes";
  static const openToStayAtHomeParentingColumn = "openToStayAtHomeParenting";
  static const openToPremaritalSexColumn = "openToPremaritalSex";

  static const allColumns = [
    idColumn,
    personIDColumn,
    openToAdoptionColumn,
    openToSexWorkerPartnerColumn,
    openToAbortionColumn,
    openToSurrogacyColumn,
    openToAlternativeFertilityMethodsColumn,
    openToSigningPrenupColumn,
    wantsPartnerToSignPrenupColumn,
    openToCrimesColumn,
    openToStayAtHomeParentingColumn,
    openToPremaritalSexColumn,
  ];

  static Stance fromMap({required Map<String, Object?> stanceMap}) {
    return Stance(
      id: stanceMap[idColumn] as int?,
      personID: stanceMap[personIDColumn] as int,
      openToAdoption: stanceMap[openToAdoptionColumn] == databaseTrueValue,
      openToSexWorkerPartner:
          stanceMap[openToSexWorkerPartnerColumn] == databaseTrueValue,
      openToAbortion: stanceMap[openToAbortionColumn] == databaseTrueValue,
      openToSurrogacy: stanceMap[openToSurrogacyColumn] == databaseTrueValue,
      openToAlternativeFertilityMethods:
          stanceMap[openToAlternativeFertilityMethodsColumn] ==
              databaseTrueValue,
      openToSigningPrenup:
          stanceMap[openToSigningPrenupColumn] == databaseTrueValue,
      wantsPartnerToSignPrenup:
          stanceMap[wantsPartnerToSignPrenupColumn] == databaseTrueValue,
      openToCrimes: stanceMap[openToCrimesColumn] == databaseTrueValue,
      openToStayAtHomeParenting:
          stanceMap[openToStayAtHomeParentingColumn] == databaseTrueValue,
      openToPremaritalSex:
          stanceMap[openToPremaritalSexColumn] == databaseTrueValue,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      personIDColumn: personID,
      openToAdoptionColumn:
          openToAdoption ? databaseTrueValue : databaseFalseValue,
      openToSexWorkerPartnerColumn:
          openToSexWorkerPartner ? databaseTrueValue : databaseFalseValue,
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
      openToCrimesColumn: openToCrimes ? databaseTrueValue : databaseFalseValue,
      openToStayAtHomeParentingColumn:
          openToStayAtHomeParenting ? databaseTrueValue : databaseFalseValue,
      openToPremaritalSexColumn:
          openToPremaritalSex ? databaseTrueValue : databaseFalseValue,
    };
  }

  Stance copyWith({
    int? id,
    int? personID,
    bool? openToAdoption,
    bool? openToSexWorkerPartner,
    bool? openToAbortion,
    bool? openToSurrogacy,
    bool? openToAlternativeFertilityMethods,
    bool? openToSigningPrenup,
    bool? wantsPartnerToSignPrenup,
    bool? openToCrimes,
    bool? openToStayAtHomeParenting,
    bool? openToPremaritalSex,
  }) {
    return Stance(
      id: id ?? this.id,
      personID: personID ?? this.personID,
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
}
