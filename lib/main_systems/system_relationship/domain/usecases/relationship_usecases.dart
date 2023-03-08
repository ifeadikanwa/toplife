import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/family/create_child_parent_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/family/create_new_player_family_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/family/create_sibling_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_relationship_pairs/get_child_relationship_pairs_from_children_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_relationship_pairs/get_friend_relationship_pairs_from_friends_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_relationship_pairs/get_grave_relationship_pairs_from_graves_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_relationship_pairs/get_inlaw_relationship_pairs_from_inlaws_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_relationship_pairs/get_parent_relationship_pairs_from_parents_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_relationship_pairs/get_partner_relationship_pairs_from_partners_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_relationship_pairs/get_relative_relationship_pairs_from_relatives_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_relationship_pairs/get_sibling_relationship_pairs_from_siblings_usecase.dart';
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
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch_relationships/watch_all_active_parents_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch_relationships/watch_all_active_partners_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch_relationships/watch_all_children_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch_relationships/watch_all_coparents_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch_relationships/watch_all_exes_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch_relationships/watch_all_friends_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch_relationships/watch_all_graves_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch_relationships/watch_all_inlaws_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch_relationships/watch_all_relatives_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch_relationships/watch_all_siblings_usecase.dart';

class RelationshipUsecases {
  final RelationshipRepositories _relationshipRepositories;
  final PersonUsecases _personUsecases;

  const RelationshipUsecases({
    required RelationshipRepositories relationshipRepositories,
    required PersonUsecases personUsecases,
  })  : _relationshipRepositories = relationshipRepositories,
        _personUsecases = personUsecases;

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

  WatchAllActiveParentsUsecase get watchAllActiveParentsUsecase =>
      WatchAllActiveParentsUsecase(
        _relationshipRepositories.parentRepositoryImpl,
      );

  WatchAllActivePartnersUsecase get watchAllActivePartnersUsecase =>
      WatchAllActivePartnersUsecase(
        _relationshipRepositories.partnerRepositoryImpl,
      );

  WatchAllChildrenUsecase get watchAllChildrenUsecase =>
      WatchAllChildrenUsecase(
        _relationshipRepositories.childRepositoryImpl,
      );

  WatchAllCoparentsUsecase get watchAllCoparentsUsecase =>
      WatchAllCoparentsUsecase(
        _relationshipRepositories.partnerRepositoryImpl,
      );

  WatchAllExesUsecase get watchAllExesUsecase => WatchAllExesUsecase(
        _relationshipRepositories.partnerRepositoryImpl,
      );

  WatchAllFriendsUsecase get watchAllFriendsUsecase => WatchAllFriendsUsecase(
        _relationshipRepositories.friendRepositoryImpl,
      );

  WatchAllGravesUsecase get watchAllGravesUsecase =>
      WatchAllGravesUsecase(_relationshipRepositories.graveRepositoryImpl);

  WatchAllInLawsUsecase get watchAllInLawsUsecase => WatchAllInLawsUsecase(
        _relationshipRepositories.inLawRepositoryImpl,
      );

  WatchAllRelativesUsecase get watchAllRelativesUsecase =>
      WatchAllRelativesUsecase(
        _relationshipRepositories.relativeRepositoryImpl,
      );

  WatchAllSiblingsUsecase get watchAllSiblingsUsecase =>
      WatchAllSiblingsUsecase(
        _relationshipRepositories.siblingRepositoryImpl,
      );

  GetFriendRelationshipPairsFromFriendsUsecase
      get getFriendRelationshipPairsFromFriendsUsecase =>
          GetFriendRelationshipPairsFromFriendsUsecase(
            _personUsecases,
          );

  GetSiblingRelationshipPairsFromSiblingsUsecase
      get getSiblingRelationshipPairsFromSiblingsUsecase =>
          GetSiblingRelationshipPairsFromSiblingsUsecase(
            _personUsecases,
          );

  GetRelativeRelationshipPairsFromRelativesUsecase
      get getRelativeRelationshipPairsFromRelativesUsecase =>
          GetRelativeRelationshipPairsFromRelativesUsecase(
            _personUsecases,
          );

  GetParentRelationshipPairsFromParentsUsecase
      get getParentRelationshipPairsFromParentsUsecase =>
          GetParentRelationshipPairsFromParentsUsecase(
            _personUsecases,
          );

  GetPartnerRelationshipPairsFromPartnersUsecase
      get getPartnerRelationshipPairsFromPartnersUsecase =>
          GetPartnerRelationshipPairsFromPartnersUsecase(
            _personUsecases,
          );

  GetGraveRelationshipPairsFromGravesUsecase
      get getGraveRelationshipPairsFromGravesUsecase =>
          GetGraveRelationshipPairsFromGravesUsecase(
            _personUsecases,
          );

  GetInLawRelationshipPairsFromInLawsUsecase
      get getInLawRelationshipPairsFromInLawsUsecase =>
          GetInLawRelationshipPairsFromInLawsUsecase(
            _personUsecases,
          );

  GetChildRelationshipPairsFromChildrenUsecase
      get getChildRelationshipPairsFromChildrenUsecase =>
          GetChildRelationshipPairsFromChildrenUsecase(
            _personUsecases,
          );
}
