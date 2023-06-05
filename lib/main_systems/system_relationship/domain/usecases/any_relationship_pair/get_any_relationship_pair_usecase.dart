import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_specific_relationship_pair/get_acquaintance_relationship_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_specific_relationship_pair/get_child_relationship_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_specific_relationship_pair/get_friend_relationship_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_specific_relationship_pair/get_grave_relationship_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_specific_relationship_pair/get_inlaw_relationship_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_specific_relationship_pair/get_parent_relationship_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_specific_relationship_pair/get_partner_relationship_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_specific_relationship_pair/get_relative_relationship_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_specific_relationship_pair/get_sibling_relationship_pair_usecase.dart';

class GetAnyRelationshipPairUsecase {
  final GetAcquaintanceRelationshipPairUsecase
      _getAcquaintanceRelationshipPairUsecase;
  final GetChildRelationshipPairUsecase _getChildRelationshipPairUsecase;
  final GetFriendRelationshipPairUsecase _getFriendRelationshipPairUsecase;
  final GetInLawRelationshipPairUsecase _getInLawRelationshipPairUsecase;
  final GetParentRelationshipPairUsecase _getParentRelationshipPairUsecase;
  final GetPartnerRelationshipPairUsecase _getPartnerRelationshipPairUsecase;
  final GetRelativeRelationshipPairUsecase _getRelativeRelationshipPairUsecase;
  final GetSiblingRelationshipPairUsecase _getSiblingRelationshipPairUsecase;
  final GetGraveRelationshipPairUsecase _getGraveRelationshipPairUsecase;

  const GetAnyRelationshipPairUsecase(
    this._getAcquaintanceRelationshipPairUsecase,
    this._getChildRelationshipPairUsecase,
    this._getFriendRelationshipPairUsecase,
    this._getInLawRelationshipPairUsecase,
    this._getParentRelationshipPairUsecase,
    this._getPartnerRelationshipPairUsecase,
    this._getRelativeRelationshipPairUsecase,
    this._getSiblingRelationshipPairUsecase,
    this._getGraveRelationshipPairUsecase,
  );

  Future<RelationshipPair?> execute({
    required int mainPersonID,
    required int relationshipPersonID,
    required InformalRelationshipType informalRelationshipType,
  }) async {
    switch (informalRelationshipType) {
      case InformalRelationshipType.acquaintance:
        return _getAcquaintanceRelationshipPairUsecase.execute(
          mainPersonID: mainPersonID,
          acquaintanceID: relationshipPersonID,
        );

      case InformalRelationshipType.child:
        return _getChildRelationshipPairUsecase.execute(
          mainPersonID: mainPersonID,
          childID: relationshipPersonID,
        );

      case InformalRelationshipType.friend:
        return _getFriendRelationshipPairUsecase.execute(
          mainPersonID: mainPersonID,
          friendID: relationshipPersonID,
        );

      case InformalRelationshipType.grave:
        return _getGraveRelationshipPairUsecase.execute(
          mainPersonID: mainPersonID,
          graveID: relationshipPersonID,
        );

      case InformalRelationshipType.inLaw:
        return _getInLawRelationshipPairUsecase.execute(
          mainPersonID: mainPersonID,
          inLawID: relationshipPersonID,
        );

      case InformalRelationshipType.parent:
        return _getParentRelationshipPairUsecase.execute(
          mainPersonID: mainPersonID,
          parentID: relationshipPersonID,
        );

      case InformalRelationshipType.partner:
        return _getPartnerRelationshipPairUsecase.execute(
          mainPersonID: mainPersonID,
          partnerID: relationshipPersonID,
        );

      case InformalRelationshipType.relative:
        return _getRelativeRelationshipPairUsecase.execute(
          mainPersonID: mainPersonID,
          relativeID: relationshipPersonID,
        );

      case InformalRelationshipType.sibling:
        return _getSiblingRelationshipPairUsecase.execute(
          mainPersonID: mainPersonID,
          siblingID: relationshipPersonID,
        );
    }
  }
}
