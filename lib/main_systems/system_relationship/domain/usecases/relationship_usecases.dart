import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/journal/journal_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/add_to_family/add_child_to_npc_family_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/any_relationship_pair/get_relationship_level_from_any_given_relationship_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/check/check_if_person_is_in_player_family_lineage_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/check/check_if_person_is_interested_in_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/create/create_multiple_relationships_from_person_platonic_relationship_type_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/create/create_parent_child_link_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/create/create_platonic_relationship_or_grave_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/create/create_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/family/create_child_parent_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/family/create_new_player_family_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/family/create_sibling_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/find_relationship/find_persons_familial_relationship_to_player_through_parent_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/find_relationship/find_persons_relationship_with_family_members_spouse_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get/get_all_acquaintances_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get/get_all_active_partners_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get/get_all_children_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get/get_all_exes_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get/get_all_friemds_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get/get_all_in_laws_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get/get_all_parents_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get/get_all_partners_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get/get_all_past_family_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get/get_all_relationships_involving_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get/get_all_relatives_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get/get_all_siblings_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get/get_all_step_children_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get/get_marriage_partner_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_special_cases/get_all_children_additions_to_the_family_from_family_members_spouse_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_special_cases/get_all_parent_additions_to_the_family_from_family_members_spouse_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_special_cases/get_all_sibling_additions_along_with_their_children_from_family_members_spouse_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_special_cases/get_all_step_family_from_different_generations_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_special_cases/get_children_of_person_not_belonging_to_another_person_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_special_cases/get_players_living_extended_step_family_and_in_laws_from_union_between_two_npcs_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_special_cases/get_players_living_step_family_and_inlaws_using_their_spouse_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_children_in_law_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_children_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_cousins_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_grandchildren_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_grandcousins_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_grandniblings_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_grandparents_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_great_grandchildren_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_great_grandcousins_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_great_grandniblings_through_deduction_usecase.dart';
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
import 'package:toplife/main_systems/system_relationship/domain/usecases/process_relationship_changes/process_relationship_changes_from_npc_divorce_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/process_relationship_changes/process_relationship_changes_from_npc_marriage_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/process_relationship_changes/process_relationship_changes_from_player_divorce_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/process_relationship_changes/process_relationship_changes_from_player_marriage_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/process_relationship_changes/process_relationship_changes_from_the_addition_of_persons_child_to_the_game_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_converters/convert_temporary_familial_relationship_to_past_family_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/romantic/create_exclusive_romantic_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/romantic/end_all_partner_relationship_not_involving_a_certain_person_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/romantic/end_partner_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/romantic/get_married_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/setup_relationships/setup_new_generation_player_relationships_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_acquaintance_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/any_relationship_pair/update_any_relationship_amount_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_child_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_friend_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_inlaw_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_parent_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_partner_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_relative_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_sibling_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_all_active_partners_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_all_children_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_all_exes_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_all_friemds_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_all_in_laws_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_all_parents_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_all_partners_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_all_past_family_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_all_relationships_involving_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_all_relatives_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_all_siblings_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_marriage_partner_relationship_usecase.dart';
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

  GetGreatGrandCousinsThroughDeductionUsecase
      get getGreatGrandCousinsThroughDeductionUsecase =>
          GetGreatGrandCousinsThroughDeductionUsecase(
            getChildrenThroughDeductionUsecase,
            getGrandCousinsThroughDeductionUsecase,
          );

  GetGreatGrandNiblingsThroughDeductionUsecase
      get getGreatGrandNiblingsThroughDeductionUsecase =>
          GetGreatGrandNiblingsThroughDeductionUsecase(
            getChildrenThroughDeductionUsecase,
            getGrandNiblingsThroughDeductionUsecase,
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

  AddChildToNPCFamilyUsecase get addChildToNPCFamilyUsecase =>
      AddChildToNPCFamilyUsecase(
        _ref.read(relationshipRepositoriesProvider).relationshipRepositoryImpl,
        _ref.read(personUsecasesProvider),
        createParentChildLinkUsecase,
        processRelationshipChangesFromTheAdditionOfPersonsChildToTheGameUsecase,
        _ref.read(journalUsecasesProvider),
      );

  CheckIfPersonIsInPlayerFamilyLineageUsecase
      get checkIfPersonIsInPlayerFamilyLineageUsecase =>
          CheckIfPersonIsInPlayerFamilyLineageUsecase(
            _ref
                .read(relationshipRepositoriesProvider)
                .parentChildLinkRepositoryImpl,
          );

  CreateParentChildLinkUsecase get createParentChildLinkUsecase =>
      CreateParentChildLinkUsecase(
        _ref
            .read(relationshipRepositoriesProvider)
            .parentChildLinkRepositoryImpl,
        checkIfPersonIsInPlayerFamilyLineageUsecase,
      );

  CreateRelationshipUsecase get createRelationshipUsecase =>
      CreateRelationshipUsecase(
        _ref.read(relationshipRepositoriesProvider).relationshipRepositoryImpl,
      );

  FindPersonsFamilialRelationshipToPlayerThroughParentUsecase
      get findPersonsFamilialRelationshipToPlayerThroughParentUsecase =>
          FindPersonsFamilialRelationshipToPlayerThroughParentUsecase(
            getSiblingsThroughDeductionUsecase,
          );

  ProcessRelationshipChangesFromTheAdditionOfPersonsChildToTheGameUsecase
      get processRelationshipChangesFromTheAdditionOfPersonsChildToTheGameUsecase =>
          ProcessRelationshipChangesFromTheAdditionOfPersonsChildToTheGameUsecase(
            findPersonsFamilialRelationshipToPlayerThroughParentUsecase,
            createRelationshipUsecase,
          );

  CreateMultipleRelationshipsFromPersonPlatonicRelationshipTypePairUsecase
      get createMultipleRelationshipsFromPersonPlatonicRelationshipTypePairUsecase =>
          CreateMultipleRelationshipsFromPersonPlatonicRelationshipTypePairUsecase(
            createRelationshipUsecase,
          );

  CreatePlatonicRelationshipOrGraveUsecase
      get createPlatonicRelationshipOrGraveUsecase =>
          CreatePlatonicRelationshipOrGraveUsecase(
            _ref
                .read(relationshipRepositoriesProvider)
                .relationshipRepositoryImpl,
            createRelationshipUsecase,
            _ref.read(relationshipRepositoriesProvider).graveRepositoryImpl,
          );

  FindPersonsRelationshipWithFamilyMembersSpouseUsecase
      get findPersonsRelationshipWithFamilyMembersSpouseUsecase =>
          FindPersonsRelationshipWithFamilyMembersSpouseUsecase();

  GetAllAcquaintancesUsecase get getAllAcquaintancesUsecase =>
      GetAllAcquaintancesUsecase(_ref
          .read(relationshipRepositoriesProvider)
          .relationshipRepositoryImpl);

  GetAllActivePartnersUsecase get getAllActivePartnersUsecase =>
      GetAllActivePartnersUsecase(_ref
          .read(relationshipRepositoriesProvider)
          .relationshipRepositoryImpl);

  GetAllChildrenUsecase get getAllChildrenUsecase => GetAllChildrenUsecase(
      _ref.read(relationshipRepositoriesProvider).relationshipRepositoryImpl);

  GetAllExesUsecase get getAllExesUsecase => GetAllExesUsecase(
      _ref.read(relationshipRepositoriesProvider).relationshipRepositoryImpl);

  GetAllFriendsUsecase get getAllFriendsUsecase => GetAllFriendsUsecase(
      _ref.read(relationshipRepositoriesProvider).relationshipRepositoryImpl);

  GetAllInLawsUsecase get getAllInLawsUsecase => GetAllInLawsUsecase(
      _ref.read(relationshipRepositoriesProvider).relationshipRepositoryImpl);

  GetAllParentsUsecase get getAllParentsUsecase => GetAllParentsUsecase(
      _ref.read(relationshipRepositoriesProvider).relationshipRepositoryImpl);

  GetAllPartnersUsecase get getAllPartnersUsecase => GetAllPartnersUsecase(
      _ref.read(relationshipRepositoriesProvider).relationshipRepositoryImpl);

  GetAllPastFamilyUsecase get getAllPastFamilyUsecase =>
      GetAllPastFamilyUsecase(_ref
          .read(relationshipRepositoriesProvider)
          .relationshipRepositoryImpl);

  GetAllRelationshipsInvolvingUsecase get getAllRelationshipsInvolvingUsecase =>
      GetAllRelationshipsInvolvingUsecase(_ref
          .read(relationshipRepositoriesProvider)
          .relationshipRepositoryImpl);

  GetAllRelativesUsecase get getAllRelativesUsecase => GetAllRelativesUsecase(
      _ref.read(relationshipRepositoriesProvider).relationshipRepositoryImpl);

  GetAllSiblingsUsecase get getAllSiblingsUsecase => GetAllSiblingsUsecase(
      _ref.read(relationshipRepositoriesProvider).relationshipRepositoryImpl);

  GetAllStepChildrenUsecase get getAllStepChildrenUsecase =>
      GetAllStepChildrenUsecase(_ref
          .read(relationshipRepositoriesProvider)
          .relationshipRepositoryImpl);

  GetMarriagePartnerRelationshipUsecase
      get getMarriagePartnerRelationshipUsecase =>
          GetMarriagePartnerRelationshipUsecase(_ref
              .read(relationshipRepositoriesProvider)
              .relationshipRepositoryImpl);

  WatchAllActivePartnersUsecase get watchAllActivePartnersUsecase =>
      WatchAllActivePartnersUsecase(_ref
          .read(relationshipRepositoriesProvider)
          .relationshipRepositoryImpl);

  WatchAllChildrenUsecase get watchAllChildrenUsecase =>
      WatchAllChildrenUsecase(_ref
          .read(relationshipRepositoriesProvider)
          .relationshipRepositoryImpl);

  WatchAllExesUsecase get watchAllExesUsecase => WatchAllExesUsecase(
      _ref.read(relationshipRepositoriesProvider).relationshipRepositoryImpl);

  WatchAllFriendsUsecase get watchAllFriendsUsecase => WatchAllFriendsUsecase(
      _ref.read(relationshipRepositoriesProvider).relationshipRepositoryImpl);

  WatchAllInLawsUsecase get watchAllInLawsUsecase => WatchAllInLawsUsecase(
      _ref.read(relationshipRepositoriesProvider).relationshipRepositoryImpl);

  WatchAllParentsUsecase get watchAllParentsUsecase => WatchAllParentsUsecase(
      _ref.read(relationshipRepositoriesProvider).relationshipRepositoryImpl);

  WatchAllPartnersUsecase get watchAllPartnersUsecase =>
      WatchAllPartnersUsecase(_ref
          .read(relationshipRepositoriesProvider)
          .relationshipRepositoryImpl);

  WatchAllPastFamilyUsecase get watchAllPastFamilyUsecase =>
      WatchAllPastFamilyUsecase(_ref
          .read(relationshipRepositoriesProvider)
          .relationshipRepositoryImpl);

  WatchAllRelationshipsInvolvingUsecase
      get watchAllRelationshipsInvolvingUsecase =>
          WatchAllRelationshipsInvolvingUsecase(_ref
              .read(relationshipRepositoriesProvider)
              .relationshipRepositoryImpl);

  WatchAllRelativesUsecase get watchAllRelativesUsecase =>
      WatchAllRelativesUsecase(_ref
          .read(relationshipRepositoriesProvider)
          .relationshipRepositoryImpl);

  WatchAllSiblingsUsecase get watchAllSiblingsUsecase =>
      WatchAllSiblingsUsecase(_ref
          .read(relationshipRepositoriesProvider)
          .relationshipRepositoryImpl);

  WatchMarriagePartnerRelationshipUsecase
      get watchMarriagePartnerRelationshipUsecase =>
          WatchMarriagePartnerRelationshipUsecase(_ref
              .read(relationshipRepositoriesProvider)
              .relationshipRepositoryImpl);

  GetAllChildrenAdditionsToTheFamilyFromFamilyMembersSpouseUsecase
      get getAllChildrenAdditionsToTheFamilyFromFamilyMembersSpouseUsecase =>
          GetAllChildrenAdditionsToTheFamilyFromFamilyMembersSpouseUsecase(
            getChildrenOfPersonNotBelongingToAnotherPersonUsecase,
            getAllStepFamilyFromDifferentGenerationsUsecase,
          );

  GetAllParentAdditionsToTheFamilyFromFamilyMembersSpouseUsecase
      get getAllParentAdditionsToTheFamilyFromFamilyMembersSpouseUsecase =>
          GetAllParentAdditionsToTheFamilyFromFamilyMembersSpouseUsecase(
              getParentsThroughDeductionUsecase);

  GetAllSiblingAdditionsAlongWithTheirChildrenFromFamilyMembersSpouseUsecase
      get getAllSiblingAdditionsAlongWithTheirChildrenFromFamilyMembersSpouseUsecase =>
          GetAllSiblingAdditionsAlongWithTheirChildrenFromFamilyMembersSpouseUsecase(
            getSiblingsThroughDeductionUsecase,
            getChildrenThroughDeductionUsecase,
            getAllStepFamilyFromDifferentGenerationsUsecase,
          );

  GetAllStepFamilyFromDifferentGenerationsUsecase
      get getAllStepFamilyFromDifferentGenerationsUsecase =>
          GetAllStepFamilyFromDifferentGenerationsUsecase(
            findPersonsFamilialRelationshipToPlayerThroughParentUsecase,
            getChildrenOfPersonNotBelongingToAnotherPersonUsecase,
          );

  GetChildrenOfPersonNotBelongingToAnotherPersonUsecase
      get getChildrenOfPersonNotBelongingToAnotherPersonUsecase =>
          GetChildrenOfPersonNotBelongingToAnotherPersonUsecase(
            _ref
                .read(relationshipRepositoriesProvider)
                .parentChildLinkRepositoryImpl,
            _ref.read(personUsecasesProvider),
            getChildrenThroughDeductionUsecase,
          );

  GetPlayersLivingExtendedStepFamilyAndInLawsFromUnionBetweenTwoNpcsUsecase
      get getPlayersLivingExtendedStepFamilyAndInLawsFromUnionBetweenTwoNpcsUsecase =>
          GetPlayersLivingExtendedStepFamilyAndInLawsFromUnionBetweenTwoNpcsUsecase(
            _ref
                .read(relationshipRepositoriesProvider)
                .relationshipRepositoryImpl,
            _ref.read(personUsecasesProvider),
            _ref
                .read(relationshipRepositoriesProvider)
                .parentChildLinkRepositoryImpl,
            findPersonsRelationshipWithFamilyMembersSpouseUsecase,
            getAllParentAdditionsToTheFamilyFromFamilyMembersSpouseUsecase,
            getAllSiblingAdditionsAlongWithTheirChildrenFromFamilyMembersSpouseUsecase,
            getAllChildrenAdditionsToTheFamilyFromFamilyMembersSpouseUsecase,
          );

  GetPlayersLivingStepFamilyAndInlawsUsingTheirSpouseUsecase
      get getPlayersLivingStepFamilyAndInlawsUsingTheirSpouseUsecase =>
          GetPlayersLivingStepFamilyAndInlawsUsingTheirSpouseUsecase(
            getParentsThroughDeductionUsecase,
            getSiblingsThroughDeductionUsecase,
            getChildrenOfPersonNotBelongingToAnotherPersonUsecase,
          );

  ProcessRelationshipChangesFromNpcDivorceUsecase
      get processRelationshipChangesFromNpcDivorceUsecase =>
          ProcessRelationshipChangesFromNpcDivorceUsecase(
            convertTemporaryFamilialRelationshipToPastFamilyUsecase,
            getPlayersLivingExtendedStepFamilyAndInLawsFromUnionBetweenTwoNpcsUsecase,
            _ref.read(journalUsecasesProvider),
          );

  ProcessRelationshipChangesFromNpcMarriageUsecase
      get processRelationshipChangesFromNpcMarriageUsecase =>
          ProcessRelationshipChangesFromNpcMarriageUsecase(
            createMultipleRelationshipsFromPersonPlatonicRelationshipTypePairUsecase,
            getPlayersLivingExtendedStepFamilyAndInLawsFromUnionBetweenTwoNpcsUsecase,
            _ref.read(journalUsecasesProvider),
          );

  ProcessRelationshipChangesFromPlayerDivorceUsecase
      get processRelationshipChangesFromPlayerDivorceUsecase =>
          ProcessRelationshipChangesFromPlayerDivorceUsecase(
            _ref
                .read(relationshipRepositoriesProvider)
                .relationshipRepositoryImpl,
            _ref
                .read(relationshipRepositoriesProvider)
                .romanticRelationshipInfoRepositoryImpl,
            getPlayersLivingStepFamilyAndInlawsUsingTheirSpouseUsecase,
            convertTemporaryFamilialRelationshipToPastFamilyUsecase,
            _ref.read(journalUsecasesProvider),
          );

  ProcessRelationshipChangesFromPlayerMarriageUsecase
      get processRelationshipChangesFromPlayerMarriageUsecase =>
          ProcessRelationshipChangesFromPlayerMarriageUsecase(
            _ref.read(journalUsecasesProvider),
            getPlayersLivingStepFamilyAndInlawsUsingTheirSpouseUsecase,
            createMultipleRelationshipsFromPersonPlatonicRelationshipTypePairUsecase,
          );

  ConvertTemporaryFamilialRelationshipToPastFamilyUsecase
      get convertTemporaryFamilialRelationshipToPastFamilyUsecase =>
          ConvertTemporaryFamilialRelationshipToPastFamilyUsecase(
            _ref
                .read(relationshipRepositoriesProvider)
                .relationshipRepositoryImpl,
          );

  SetupNewGenerationPlayerRelationshipsUsecase
      get setupNewGenerationPlayerRelationshipsUsecase =>
          SetupNewGenerationPlayerRelationshipsUsecase(
            createPlatonicRelationshipOrGraveUsecase,
            getParentsThroughDeductionUsecase,
            getSiblingsThroughDeductionUsecase,
            getChildrenThroughDeductionUsecase,
            getGrandChildrenThroughDeductionUsecase,
            getGreatGrandChildrenThroughDeductionUsecase,
            getGrandParentsThroughDeductionUsecase,
            getGreatGrandParentsThroughDeductionUsecase,
            getPiblingsThroughDeductionUsecase,
            getCousinsThroughDeductionUsecase,
            getGrandCousinsThroughDeductionUsecase,
            getGreatGrandCousinsThroughDeductionUsecase,
            getNiblingsThroughDeductionUsecase,
            getGrandNiblingsThroughDeductionUsecase,
            getGreatGrandNiblingsThroughDeductionUsecase,
            getParentInLawsThroughDeductionUsecase,
            getChildrenInLawThroughDeductionUsecase,
            getSiblingInLawsThroughDeductionUsecase,
          );
}
