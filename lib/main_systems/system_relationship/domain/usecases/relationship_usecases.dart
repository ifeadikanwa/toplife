import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/any_relationship_pair/get_relationship_level_from_any_given_relationship_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/check/check_if_person_is_interested_in_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/family/create_child_parent_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/family/create_new_player_family_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/family/create_sibling_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_children_in_law_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_children_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_cousins_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_grandchildren_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_grandcousins_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_grandniblings_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_grandparents_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_great_grandchildren_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_great_grandparents_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_niblings_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_parent_in_laws_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_parents_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_piblings_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_sibling_in_laws_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_siblings_through_deduction_usecase.dart';
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
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_specific_relationship_pair/get_acquaintance_relationship_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/any_relationship_pair/get_any_relationship_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_specific_relationship_pair/get_child_relationship_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_specific_relationship_pair/get_friend_relationship_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_specific_relationship_pair/get_grave_relationship_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_specific_relationship_pair/get_inlaw_relationship_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_specific_relationship_pair/get_parent_relationship_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_specific_relationship_pair/get_partner_relationship_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_specific_relationship_pair/get_relative_relationship_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_specific_relationship_pair/get_sibling_relationship_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/romantic/create_exclusive_romantic_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/romantic/end_all_partner_relationship_not_involving_a_certain_person_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/romantic/end_partner_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/romantic/get_married_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_acquaintance_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/any_relationship_pair/update_any_relationship_amount_usecase.dart';
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
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch_specific_relationship/watch_acquaintance_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch_specific_relationship/watch_child_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch_specific_relationship/watch_friend_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch_specific_relationship/watch_grave_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch_specific_relationship/watch_inlaw_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch_specific_relationship/watch_parent_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch_specific_relationship/watch_partner_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch_specific_relationship/watch_relative_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch_specific_relationship/watch_sibling_usecase.dart';

class RelationshipUsecases {
  final Ref _ref;

  const RelationshipUsecases({required Ref ref}) : _ref = ref;

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
            relationshipRepositories:
                _ref.read(relationshipRepositoriesProvider),
          );

  CreateSiblingRelationshipUsecase get createSiblingRelationshipUsecase =>
      CreateSiblingRelationshipUsecase(
        relationshipRepositories: _ref.read(relationshipRepositoriesProvider),
      );

  CreateExclusiveRomanticRelationshipUsecase
      get createExclusiveRomanticRelationshipUsecase =>
          CreateExclusiveRomanticRelationshipUsecase(
            relationshipRepositories:
                _ref.read(relationshipRepositoriesProvider),
            endAllPartnerRelationshipsNotInvolvingACertainPersonUsecase:
                endAllPartnerRelationshipsNotInvolvingACertainPersonUsecase,
          );

  EndAllPartnerRelationshipsNotInvolvingACertainPersonUsecase
      get endAllPartnerRelationshipsNotInvolvingACertainPersonUsecase =>
          EndAllPartnerRelationshipsNotInvolvingACertainPersonUsecase(
            relationshipRepositories:
                _ref.read(relationshipRepositoriesProvider),
            endPartnerRelationshipUsecase: endPartnerRelationshipUsecase,
          );

  EndPartnerRelationshipUsecase get endPartnerRelationshipUsecase =>
      EndPartnerRelationshipUsecase(
        relationshipRepositories: _ref.read(relationshipRepositoriesProvider),
      );

  GetMarriedUsecase get getMarriedUsecase => GetMarriedUsecase(
        createExclusiveRomanticRelationshipUsecase:
            createExclusiveRomanticRelationshipUsecase,
      );

  GetCurrentPartnerUsecase get getCurrentPartnerUsecase =>
      GetCurrentPartnerUsecase(
        relationshipRepositories: _ref.read(relationshipRepositoriesProvider),
      );

  GetFriendsUsecase get getFriendsUsecase => GetFriendsUsecase(
        relationshipRepositories: _ref.read(relationshipRepositoriesProvider),
      );

  GetRelationshipPairBasedOnTypeUsecase
      get getRelationshipPairBasedOnTypeUsecase =>
          GetRelationshipPairBasedOnTypeUsecase(
            relationshipRepositories:
                _ref.read(relationshipRepositoriesProvider),
          );

  UpdatePartnerRelationshipUsecase get updatePartnerRelationshipUsecase =>
      UpdatePartnerRelationshipUsecase(
        relationshipRepositories: _ref.read(relationshipRepositoriesProvider),
      );

  GetSiblingsUsecase get getSiblingsUsecase => GetSiblingsUsecase(
        relationshipRepositories: _ref.read(relationshipRepositoriesProvider),
      );

  UpdateSiblingRelationshipUsecase get updateSiblingRelationshipUsecase =>
      UpdateSiblingRelationshipUsecase(
        relationshipRepositories: _ref.read(relationshipRepositoriesProvider),
      );

  GetPiblingsUsecase get getPiblingsUsecase => GetPiblingsUsecase(
        relationshipRepositories: _ref.read(relationshipRepositoriesProvider),
      );

  UpdateRelativeRelationshipUsecase get updateRelativeRelationshipUsecase =>
      UpdateRelativeRelationshipUsecase(
        relationshipRepositories: _ref.read(relationshipRepositoriesProvider),
      );

  GetChildrenUsecase get getChildrenUsecase => GetChildrenUsecase(
        relationshipRepositories: _ref.read(relationshipRepositoriesProvider),
      );

  UpdateChildRelationshipUsecase get updateChildRelationshipUsecase =>
      UpdateChildRelationshipUsecase(
        relationshipRepositories: _ref.read(relationshipRepositoriesProvider),
      );

  UpdateParentRelationshipUsecase get updateParentRelationshipUsecase =>
      UpdateParentRelationshipUsecase(
        relationshipRepositories: _ref.read(relationshipRepositoriesProvider),
      );

  UpdateInLawRelationshipUsecase get updateInLawRelationshipUsecase =>
      UpdateInLawRelationshipUsecase(
        relationshipRepositories: _ref.read(relationshipRepositoriesProvider),
      );

  UpdateFriendRelationshipUsecase get updateFriendRelationshipUsecase =>
      UpdateFriendRelationshipUsecase(
        relationshipRepositories: _ref.read(relationshipRepositoriesProvider),
      );

  UpdateAcquaintanceRelationshipUsecase
      get updateAcquaintanceRelationshipUsecase =>
          UpdateAcquaintanceRelationshipUsecase(
            relationshipRepositories:
                _ref.read(relationshipRepositoriesProvider),
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
        _ref.read(relationshipRepositoriesProvider).parentRepositoryImpl,
      );

  WatchAllActivePartnersUsecase get watchAllActivePartnersUsecase =>
      WatchAllActivePartnersUsecase(
        _ref.read(relationshipRepositoriesProvider).partnerRepositoryImpl,
      );

  WatchAllChildrenUsecase get watchAllChildrenUsecase =>
      WatchAllChildrenUsecase(
        _ref.read(relationshipRepositoriesProvider).childRepositoryImpl,
      );

  WatchAllCoparentsUsecase get watchAllCoparentsUsecase =>
      WatchAllCoparentsUsecase(
        _ref.read(relationshipRepositoriesProvider).partnerRepositoryImpl,
      );

  WatchAllExesUsecase get watchAllExesUsecase => WatchAllExesUsecase(
        _ref.read(relationshipRepositoriesProvider).partnerRepositoryImpl,
      );

  WatchAllFriendsUsecase get watchAllFriendsUsecase => WatchAllFriendsUsecase(
        _ref.read(relationshipRepositoriesProvider).friendRepositoryImpl,
      );

  WatchAllGravesUsecase get watchAllGravesUsecase => WatchAllGravesUsecase(
      _ref.read(relationshipRepositoriesProvider).graveRepositoryImpl);

  WatchAllInLawsUsecase get watchAllInLawsUsecase => WatchAllInLawsUsecase(
        _ref.read(relationshipRepositoriesProvider).inLawRepositoryImpl,
      );

  WatchAllRelativesUsecase get watchAllRelativesUsecase =>
      WatchAllRelativesUsecase(
        _ref.read(relationshipRepositoriesProvider).relativeRepositoryImpl,
      );

  WatchAllSiblingsUsecase get watchAllSiblingsUsecase =>
      WatchAllSiblingsUsecase(
        _ref.read(relationshipRepositoriesProvider).siblingRepositoryImpl,
      );

  GetFriendRelationshipPairsFromFriendsUsecase
      get getFriendRelationshipPairsFromFriendsUsecase =>
          GetFriendRelationshipPairsFromFriendsUsecase(
            _ref.read(personUsecasesProvider),
          );

  GetSiblingRelationshipPairsFromSiblingsUsecase
      get getSiblingRelationshipPairsFromSiblingsUsecase =>
          GetSiblingRelationshipPairsFromSiblingsUsecase(
            _ref.read(personUsecasesProvider),
          );

  GetRelativeRelationshipPairsFromRelativesUsecase
      get getRelativeRelationshipPairsFromRelativesUsecase =>
          GetRelativeRelationshipPairsFromRelativesUsecase(
            _ref.read(personUsecasesProvider),
          );

  GetParentRelationshipPairsFromParentsUsecase
      get getParentRelationshipPairsFromParentsUsecase =>
          GetParentRelationshipPairsFromParentsUsecase(
            _ref.read(personUsecasesProvider),
          );

  GetPartnerRelationshipPairsFromPartnersUsecase
      get getPartnerRelationshipPairsFromPartnersUsecase =>
          GetPartnerRelationshipPairsFromPartnersUsecase(
            _ref.read(personUsecasesProvider),
          );

  GetGraveRelationshipPairsFromGravesUsecase
      get getGraveRelationshipPairsFromGravesUsecase =>
          GetGraveRelationshipPairsFromGravesUsecase(
            _ref.read(personUsecasesProvider),
          );

  GetInLawRelationshipPairsFromInLawsUsecase
      get getInLawRelationshipPairsFromInLawsUsecase =>
          GetInLawRelationshipPairsFromInLawsUsecase(
            _ref.read(personUsecasesProvider),
          );

  GetChildRelationshipPairsFromChildrenUsecase
      get getChildRelationshipPairsFromChildrenUsecase =>
          GetChildRelationshipPairsFromChildrenUsecase(
            _ref.read(personUsecasesProvider),
          );

  CheckIfPersonIsInterestedInRelationshipUsecase
      get checkIfPersonIsInterestedInRelationshipUsecase =>
          CheckIfPersonIsInterestedInRelationshipUsecase();

  WatchAcquaintanceUsecase get watchAcquaintanceUsecase =>
      WatchAcquaintanceUsecase(
        _ref.read(relationshipRepositoriesProvider).acquaintanceRepositoryImpl,
      );

  WatchChildUsecase get watchChildUsecase => WatchChildUsecase(
        _ref.read(relationshipRepositoriesProvider).childRepositoryImpl,
      );

  WatchFriendUsecase get watchFriendUsecase => WatchFriendUsecase(
        _ref.read(relationshipRepositoriesProvider).friendRepositoryImpl,
      );

  WatchGraveUsecase get watchGraveUsecase => WatchGraveUsecase(
        _ref.read(relationshipRepositoriesProvider).graveRepositoryImpl,
      );

  WatchInLawUsecase get watchInLawUsecase => WatchInLawUsecase(
        _ref.read(relationshipRepositoriesProvider).inLawRepositoryImpl,
      );

  WatchParentUsecase get watchParentUsecase => WatchParentUsecase(
        _ref.read(relationshipRepositoriesProvider).parentRepositoryImpl,
      );

  WatchPartnerUsecase get watchPartnerUsecase => WatchPartnerUsecase(
        _ref.read(relationshipRepositoriesProvider).partnerRepositoryImpl,
      );

  WatchSiblingUsecase get watchSiblingUsecase => WatchSiblingUsecase(
        _ref.read(relationshipRepositoriesProvider).siblingRepositoryImpl,
      );

  WatchRelativeUsecase get watchRelativeUsecase => WatchRelativeUsecase(
        _ref.read(relationshipRepositoriesProvider).relativeRepositoryImpl,
      );

  GetAcquaintanceRelationshipPairUsecase
      get getAcquaintanceRelationshipPairUsecase =>
          GetAcquaintanceRelationshipPairUsecase(
            _ref.read(personUsecasesProvider),
            _ref
                .read(relationshipRepositoriesProvider)
                .acquaintanceRepositoryImpl,
          );

  GetChildRelationshipPairUsecase get getChildRelationshipPairUsecase =>
      GetChildRelationshipPairUsecase(
        _ref.read(personUsecasesProvider),
        _ref.read(relationshipRepositoriesProvider).childRepositoryImpl,
      );

  GetFriendRelationshipPairUsecase get getFriendRelationshipPairUsecase =>
      GetFriendRelationshipPairUsecase(
        _ref.read(personUsecasesProvider),
        _ref.read(relationshipRepositoriesProvider).friendRepositoryImpl,
      );

  GetGraveRelationshipPairUsecase get getGraveRelationshipPairUsecase =>
      GetGraveRelationshipPairUsecase(
        _ref.read(personUsecasesProvider),
        _ref.read(relationshipRepositoriesProvider).graveRepositoryImpl,
      );

  GetInLawRelationshipPairUsecase get getInLawRelationshipPairUsecase =>
      GetInLawRelationshipPairUsecase(
        _ref.read(personUsecasesProvider),
        _ref.read(relationshipRepositoriesProvider).inLawRepositoryImpl,
      );

  GetParentRelationshipPairUsecase get getParentRelationshipPairUsecase =>
      GetParentRelationshipPairUsecase(
        _ref.read(personUsecasesProvider),
        _ref.read(relationshipRepositoriesProvider).parentRepositoryImpl,
      );

  GetPartnerRelationshipPairUsecase get getPartnerRelationshipPairUsecase =>
      GetPartnerRelationshipPairUsecase(
        _ref.read(personUsecasesProvider),
        _ref.read(relationshipRepositoriesProvider).partnerRepositoryImpl,
      );

  GetSiblingRelationshipPairUsecase get getSiblingRelationshipPairUsecase =>
      GetSiblingRelationshipPairUsecase(
        _ref.read(personUsecasesProvider),
        _ref.read(relationshipRepositoriesProvider).siblingRepositoryImpl,
      );

  GetRelativeRelationshipPairUsecase get getRelativeRelationshipPairUsecase =>
      GetRelativeRelationshipPairUsecase(
        _ref.read(personUsecasesProvider),
        _ref.read(relationshipRepositoriesProvider).relativeRepositoryImpl,
      );

  GetAnyRelationshipPairUsecase get getAnyRelationshipPairUsecase =>
      GetAnyRelationshipPairUsecase(
        getAcquaintanceRelationshipPairUsecase,
        getChildRelationshipPairUsecase,
        getFriendRelationshipPairUsecase,
        getInLawRelationshipPairUsecase,
        getParentRelationshipPairUsecase,
        getPartnerRelationshipPairUsecase,
        getRelativeRelationshipPairUsecase,
        getSiblingRelationshipPairUsecase,
        getGraveRelationshipPairUsecase,
      );

  GetRelationshipLevelFromAnyGivenRelationshipPairUsecase
      get getRelationshipLevelFromAnyGivenRelationshipPairUsecase =>
          GetRelationshipLevelFromAnyGivenRelationshipPairUsecase();

  GetChildrenThroughDeductionUsecase get getChildrenThroughDeductionUsecase =>
      GetChildrenThroughDeductionUsecase(
        _ref
            .read(relationshipRepositoriesProvider)
            .parentChildLinkRepositoryImpl,
        _ref.read(relationshipRepositoriesProvider).relationshipRepositoryImpl,
        _ref.read(personUsecasesProvider),
      );

  GetCousinsThroughDeductionUsecase get getCousinsThroughDeductionUsecase =>
      GetCousinsThroughDeductionUsecase(
        getChildrenThroughDeductionUsecase,
        getPiblingsThroughDeductionUsecase,
      );

  GetGrandCousinsThroughDeductionUsecase
      get getGrandCousinsThroughDeductionUsecase =>
          GetGrandCousinsThroughDeductionUsecase(
            getChildrenThroughDeductionUsecase,
            getCousinsThroughDeductionUsecase,
          );

  GetGrandChildrenThroughDeductionUsecase
      get getGrandChildrenThroughDeductionUsecase =>
          GetGrandChildrenThroughDeductionUsecase(
              getChildrenThroughDeductionUsecase);

  GetGrandParentsThroughDeductionUsecase
      get getGrandParentsThroughDeductionUsecase =>
          GetGrandParentsThroughDeductionUsecase(
              getParentsThroughDeductionUsecase);

  GetGreatGrandParentsThroughDeductionUsecase
      get getGreatGrandParentsThroughDeductionUsecase =>
          GetGreatGrandParentsThroughDeductionUsecase(
            getParentsThroughDeductionUsecase,
            getGrandParentsThroughDeductionUsecase,
          );

  GetGreatGrandChildrenThroughDeductionUsecase
      get getGreatGrandChildrenThroughDeductionUsecase =>
          GetGreatGrandChildrenThroughDeductionUsecase(
            getGrandChildrenThroughDeductionUsecase,
            getChildrenThroughDeductionUsecase,
          );

  GetNiblingsThroughDeductionUsecase get getNiblingsThroughDeductionUsecase =>
      GetNiblingsThroughDeductionUsecase(
        getChildrenThroughDeductionUsecase,
        getSiblingsThroughDeductionUsecase,
      );

  GetGrandNiblingsThroughDeductionUsecase
      get getGrandNiblingsThroughDeductionUsecase =>
          GetGrandNiblingsThroughDeductionUsecase(
            getChildrenThroughDeductionUsecase,
            getNiblingsThroughDeductionUsecase,
          );

  GetParentsThroughDeductionUsecase get getParentsThroughDeductionUsecase =>
      GetParentsThroughDeductionUsecase(
        _ref
            .read(relationshipRepositoriesProvider)
            .parentChildLinkRepositoryImpl,
        _ref.read(relationshipRepositoriesProvider).relationshipRepositoryImpl,
        _ref.read(personUsecasesProvider),
      );

  GetPiblingsThroughDeductionUsecase get getPiblingsThroughDeductionUsecase =>
      GetPiblingsThroughDeductionUsecase(
        getParentsThroughDeductionUsecase,
        getSiblingsThroughDeductionUsecase,
      );

  GetSiblingsThroughDeductionUsecase get getSiblingsThroughDeductionUsecase =>
      GetSiblingsThroughDeductionUsecase(
        _ref
            .read(relationshipRepositoriesProvider)
            .parentChildLinkRepositoryImpl,
        _ref.read(relationshipRepositoriesProvider).relationshipRepositoryImpl,
        _ref.read(personUsecasesProvider),
      );

  GetParentInLawsThroughDeductionUsecase
      get getParentInLawsThroughDeductionUsecase =>
          GetParentInLawsThroughDeductionUsecase(
            getParentsThroughDeductionUsecase,
            _ref
                .watch(relationshipRepositoriesProvider)
                .relationshipRepositoryImpl,
          );

  GetSiblingInLawsThroughDeductionUsecase
      get getSiblingInLawsThroughDeductionUsecase =>
          GetSiblingInLawsThroughDeductionUsecase(
            getSiblingsThroughDeductionUsecase,
            _ref
                .read(relationshipRepositoriesProvider)
                .relationshipRepositoryImpl,
            _ref.read(personUsecasesProvider),
          );

  GetChildrenInLawThroughDeductionUsecase
      get getChildrenInLawThroughDeductionUsecase =>
          GetChildrenInLawThroughDeductionUsecase(
            getChildrenThroughDeductionUsecase,
            _ref
                .read(relationshipRepositoriesProvider)
                .relationshipRepositoryImpl,
            _ref.read(personUsecasesProvider),
          );
}
