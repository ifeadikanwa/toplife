import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/family/create_child_parent_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/family/create_new_player_family_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/family/create_sibling_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_relationships/get_children_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_relationships/get_current_partner_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_relationships/get_friends_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_relationships/get_piblings_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_relationships/get_relationship_pair_based_on_type_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_relationships/get_siblings_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/romantic/create_exclusive_romantic_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/romantic/end_all_partner_relationship_not_involving_a_certain_person_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/romantic/end_partner_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/romantic/get_married_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_acquaintance_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_any_relationship_amount_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_child_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_friend_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_inlaw_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_parent_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_partner_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_relative_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_sibling_relationship_usecase.dart';

class RelationshipUsecases {
  final RelationshipRepositories _relationshipRepositories;

  const RelationshipUsecases({
    required RelationshipRepositories relationshipRepositories,
  }) : _relationshipRepositories = relationshipRepositories;

  CreateNewPlayerFamilyUsecase get createNewPlayerFamilyUsecase =>
      CreateNewPlayerFamilyUsecase(
        getMarriedUsecase: getMarriedUsecase,
        createChildParentRelationshipUsecase:
            createChildParentRelationshipUsecase,
        createSiblingRelationshipUsecase: createSiblingRelationshipUsecase,
      );

  CreateChildParentRelationshipUsecase
      get createChildParentRelationshipUsecase =>
          CreateChildParentRelationshipUsecase(
            relationshipRepositories: _relationshipRepositories,
          );

  CreateSiblingRelationshipUsecase get createSiblingRelationshipUsecase =>
      CreateSiblingRelationshipUsecase(
        relationshipRepositories: _relationshipRepositories,
      );

  CreateExclusiveRomanticRelationshipUsecase
      get createExclusiveRomanticRelationshipUsecase =>
          CreateExclusiveRomanticRelationshipUsecase(
            relationshipRepositories: _relationshipRepositories,
            endAllPartnerRelationshipsNotInvolvingACertainPersonUsecase:
                endAllPartnerRelationshipsNotInvolvingACertainPersonUsecase,
          );

  EndAllPartnerRelationshipsNotInvolvingACertainPersonUsecase
      get endAllPartnerRelationshipsNotInvolvingACertainPersonUsecase =>
          EndAllPartnerRelationshipsNotInvolvingACertainPersonUsecase(
            relationshipRepositories: _relationshipRepositories,
            endPartnerRelationshipUsecase: endPartnerRelationshipUsecase,
          );

  EndPartnerRelationshipUsecase get endPartnerRelationshipUsecase =>
      EndPartnerRelationshipUsecase(
        relationshipRepositories: _relationshipRepositories,
      );

  GetMarriedUsecase get getMarriedUsecase => GetMarriedUsecase(
        createExclusiveRomanticRelationshipUsecase:
            createExclusiveRomanticRelationshipUsecase,
      );

  GetCurrentPartnerUsecase get getCurrentPartnerUsecase =>
      GetCurrentPartnerUsecase(
        relationshipRepositories: _relationshipRepositories,
      );

  GetFriendsUsecase get getFriendsUsecase => GetFriendsUsecase(
        relationshipRepositories: _relationshipRepositories,
      );

  GetRelationshipPairBasedOnTypeUsecase
      get getRelationshipPairBasedOnTypeUsecase =>
          GetRelationshipPairBasedOnTypeUsecase(
            relationshipRepositories: _relationshipRepositories,
          );

  UpdatePartnerRelationshipUsecase get updatePartnerRelationshipUsecase =>
      UpdatePartnerRelationshipUsecase(
        relationshipRepositories: _relationshipRepositories,
      );

  GetSiblingsUsecase get getSiblingsUsecase => GetSiblingsUsecase(
        relationshipRepositories: _relationshipRepositories,
      );

  UpdateSiblingRelationshipUsecase get updateSiblingRelationshipUsecase =>
      UpdateSiblingRelationshipUsecase(
        relationshipRepositories: _relationshipRepositories,
      );

  GetPiblingsUsecase get getPiblingsUsecase => GetPiblingsUsecase(
        relationshipRepositories: _relationshipRepositories,
      );

  UpdateRelativeRelationshipUsecase get updateRelativeRelationshipUsecase =>
      UpdateRelativeRelationshipUsecase(
        relationshipRepositories: _relationshipRepositories,
      );

  GetChildrenUsecase get getChildrenUsecase => GetChildrenUsecase(
        relationshipRepositories: _relationshipRepositories,
      );

  UpdateChildRelationshipUsecase get updateChildRelationshipUsecase =>
      UpdateChildRelationshipUsecase(
        relationshipRepositories: _relationshipRepositories,
      );

  UpdateParentRelationshipUsecase get updateParentRelationshipUsecase =>
      UpdateParentRelationshipUsecase(
        relationshipRepositories: _relationshipRepositories,
      );

  UpdateInLawRelationshipUsecase get updateInLawRelationshipUsecase =>
      UpdateInLawRelationshipUsecase(
        relationshipRepositories: _relationshipRepositories,
      );

  UpdateFriendRelationshipUsecase get updateFriendRelationshipUsecase =>
      UpdateFriendRelationshipUsecase(
        relationshipRepositories: _relationshipRepositories,
      );

  UpdateAcquaintanceRelationshipUsecase
      get updateAcquaintanceRelationshipUsecase =>
          UpdateAcquaintanceRelationshipUsecase(
            relationshipRepositories: _relationshipRepositories,
          );

  UpdateAnyRelationshipAmountUsecase get updateAnyRelationshipAmountUsecase =>
      UpdateAnyRelationshipAmountUsecase(
        getRelationshipPairBasedOnTypeUsecase:
            getRelationshipPairBasedOnTypeUsecase,
        updateParentRelationshipUsecase: updateParentRelationshipUsecase,
        updatePartnerRelationshipUsecase: updatePartnerRelationshipUsecase,
        updateSiblingRelationshipUsecase: updateSiblingRelationshipUsecase,
        updateChildRelationshipUsecase: updateChildRelationshipUsecase,
        updateInLawRelationshipUsecase: updateInLawRelationshipUsecase,
        updateFriendRelationshipUsecase: updateFriendRelationshipUsecase,
        updateRelativeRelationshipUsecase: updateRelativeRelationshipUsecase,
        updateAcquaintanceRelationshipUsecase:
            updateAcquaintanceRelationshipUsecase,
      );
}
