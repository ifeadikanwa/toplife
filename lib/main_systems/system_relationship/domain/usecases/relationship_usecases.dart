import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/journal/journal_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/add_to_family/add_child_to_npc_family_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/check/check_if_person_is_in_player_family_lineage_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/create/create_multiple_relationships_from_person_platonic_relationship_type_pair_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/create/create_parent_child_link_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/create/create_platonic_relationship_or_grave_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/create/create_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/find_relationship/find_persons_familial_relationship_to_player_through_parent_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/find_relationship/find_persons_relationship_with_family_members_spouse_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/generate/generate_acquaintances_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get/get_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_groups/get_all_acquaintances_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_groups/get_all_active_partners_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_groups/get_all_children_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_groups/get_all_exes_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_groups/get_all_friends_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_groups/get_all_in_laws_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_groups/get_all_parents_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_groups/get_all_partners_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_groups/get_all_past_family_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_groups/get_all_relationships_involving_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_groups/get_all_relatives_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_groups/get_all_siblings_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_groups/get_all_step_children_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get/get_marriage_partner_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get/get_total_romantic_relationship_duration_usecase.dart';
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
import 'package:toplife/main_systems/system_relationship/domain/usecases/process_relationship_changes/process_relationship_changes_from_npc_divorce_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/process_relationship_changes/process_relationship_changes_from_npc_marriage_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/process_relationship_changes/process_relationship_changes_from_player_divorce_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/process_relationship_changes/process_relationship_changes_from_player_marriage_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/process_relationship_changes/process_relationship_changes_from_the_addition_of_persons_child_to_the_game_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/rearrange_relationship_lists/rearrange_childrens_tab_relationships_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/rearrange_relationship_lists/rearrange_inlaws_tab_relationships_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/rearrange_relationship_lists/rearrange_parents_tab_relationships_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/rearrange_relationship_lists/rearrange_partners_tab_relationships_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/rearrange_relationship_lists/rearrange_relatives_tab_relationships_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/rearrange_relationship_lists/rearrange_siblings_tab_relationships_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_converters/convert_relationship_to_grave_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_converters/convert_temporary_familial_relationship_to_past_family_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/romantic_relationships/end_all_romantic_relationships_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/romantic_relationships/end_romantic_relationship_and_return_updated_object_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/romantic_relationships/start_romantic_relationship_and_return_updated_object_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/setup_relationships/setup_new_generation_player_relationships_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_relationship_level_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_all_in_laws_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_childrens_tab_relationships_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_all_exes_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_all_friends_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_all_graves_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_parents_tab_relationships_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_partners_tab_relationships_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_all_past_family_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_all_relationships_involving_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_relatives_tab_relationships_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_siblings_tab_relationships_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/watch/watch_marriage_partner_relationship_usecase.dart';

class RelationshipUsecases {
  final Ref _ref;

  const RelationshipUsecases({required Ref ref}) : _ref = ref;

  GetChildrenThroughDeductionUsecase get getChildrenThroughDeductionUsecase =>
      GetChildrenThroughDeductionUsecase(
        _ref
            .read(relationshipRepositoriesProvider)
            .parentChildLinkRepositoryImpl,
        _ref
            .read(relationshipRepositoriesProvider)
            .relationshipRepositoryImpl,
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
        _ref
            .read(relationshipRepositoriesProvider)
            .relationshipRepositoryImpl,
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
        _ref
            .read(relationshipRepositoriesProvider)
            .relationshipRepositoryImpl,
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
            .read(relationshipRepositoriesProvider)
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
        _ref
            .read(relationshipRepositoriesProvider)
            .relationshipRepositoryImpl,
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
        _ref
            .read(relationshipRepositoriesProvider)
            .relationshipRepositoryImpl,
      );

  GetRelationshipUsecase get getRelationshipUsecase =>
      GetRelationshipUsecase(
        _ref
            .read(relationshipRepositoriesProvider)
            .relationshipRepositoryImpl,
      );

  UpdateRelationshipUsecase get updateRelationshipUsecase =>
      UpdateRelationshipUsecase(
        _ref
            .read(relationshipRepositoriesProvider)
            .relationshipRepositoryImpl,
      );

  UpdateRelationshipLevelUsecase get updateRelationshipLevelUsecase =>
      UpdateRelationshipLevelUsecase(
        _ref
            .read(relationshipRepositoriesProvider)
            .relationshipRepositoryImpl,
      );

  ConvertRelationshipToGraveUsecase get convertRelationshipToGraveUsecase =>
      ConvertRelationshipToGraveUsecase(
        _ref
            .read(relationshipRepositoriesProvider)
            .relationshipRepositoryImpl,
        _ref
            .read(relationshipRepositoriesProvider)
            .graveRepositoryImpl,
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
        _ref
            .read(relationshipRepositoriesProvider)
            .graveRepositoryImpl,
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

  GetAllChildrenUsecase get getAllChildrenUsecase =>
      GetAllChildrenUsecase(
          _ref
              .read(relationshipRepositoriesProvider)
              .relationshipRepositoryImpl);

  GetAllExesUsecase get getAllExesUsecase =>
      GetAllExesUsecase(
          _ref
              .read(relationshipRepositoriesProvider)
              .relationshipRepositoryImpl);

  GetAllFriendsUsecase get getAllFriendsUsecase =>
      GetAllFriendsUsecase(
          _ref
              .read(relationshipRepositoriesProvider)
              .relationshipRepositoryImpl);

  GetAllInLawsUsecase get getAllInLawsUsecase =>
      GetAllInLawsUsecase(
          _ref
              .read(relationshipRepositoriesProvider)
              .relationshipRepositoryImpl);

  GetAllParentsUsecase get getAllParentsUsecase =>
      GetAllParentsUsecase(
          _ref
              .read(relationshipRepositoriesProvider)
              .relationshipRepositoryImpl);

  GetAllPartnersUsecase get getAllPartnersUsecase =>
      GetAllPartnersUsecase(
          _ref
              .read(relationshipRepositoriesProvider)
              .relationshipRepositoryImpl);

  GetAllPastFamilyUsecase get getAllPastFamilyUsecase =>
      GetAllPastFamilyUsecase(_ref
          .read(relationshipRepositoriesProvider)
          .relationshipRepositoryImpl);

  GetAllRelationshipsInvolvingUsecase get getAllRelationshipsInvolvingUsecase =>
      GetAllRelationshipsInvolvingUsecase(_ref
          .read(relationshipRepositoriesProvider)
          .relationshipRepositoryImpl);

  GetAllRelativesUsecase get getAllRelativesUsecase =>
      GetAllRelativesUsecase(
          _ref
              .read(relationshipRepositoriesProvider)
              .relationshipRepositoryImpl);

  GetAllSiblingsUsecase get getAllSiblingsUsecase =>
      GetAllSiblingsUsecase(
          _ref
              .read(relationshipRepositoriesProvider)
              .relationshipRepositoryImpl);

  GetAllStepChildrenUsecase get getAllStepChildrenUsecase =>
      GetAllStepChildrenUsecase(_ref
          .read(relationshipRepositoriesProvider)
          .relationshipRepositoryImpl);

  GetMarriagePartnerRelationshipUsecase
  get getMarriagePartnerRelationshipUsecase =>
      GetMarriagePartnerRelationshipUsecase(_ref
          .read(relationshipRepositoriesProvider)
          .relationshipRepositoryImpl);

  WatchRelationshipUsecase get watchRelationshipUsecase =>
      WatchRelationshipUsecase(_ref
          .read(relationshipRepositoriesProvider)
          .relationshipRepositoryImpl);

  WatchAllGravesUsecase get watchAllGravesUsecase =>
      WatchAllGravesUsecase(
          _ref
              .read(relationshipRepositoriesProvider)
              .graveRepositoryImpl);

  WatchChildrensTabRelationshipsUsecase
  get watchChildrensTabRelationshipsUsecase =>
      WatchChildrensTabRelationshipsUsecase(_ref
          .read(relationshipRepositoriesProvider)
          .relationshipRepositoryImpl);

  WatchAllExesUsecase get watchAllExesUsecase =>
      WatchAllExesUsecase(
          _ref
              .read(relationshipRepositoriesProvider)
              .relationshipRepositoryImpl);

  WatchAllFriendsUsecase get watchAllFriendsUsecase =>
      WatchAllFriendsUsecase(
          _ref
              .read(relationshipRepositoriesProvider)
              .relationshipRepositoryImpl);

  WatchAllInLawsUsecase get watchAllInLawsUsecase =>
      WatchAllInLawsUsecase(
          _ref
              .read(relationshipRepositoriesProvider)
              .relationshipRepositoryImpl);

  WatchParentsTabRelationshipsUsecase get watchParentsTabRelationshipsUsecase =>
      WatchParentsTabRelationshipsUsecase(_ref
          .read(relationshipRepositoriesProvider)
          .relationshipRepositoryImpl);

  WatchPartnersTabRelationshipsUsecase
  get watchPartnersTabRelationshipsUsecase =>
      WatchPartnersTabRelationshipsUsecase(_ref
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

  WatchRelativesTabRelationshipsUsecase
  get watchRelativesTabRelationshipsUsecase =>
      WatchRelativesTabRelationshipsUsecase(_ref
          .read(relationshipRepositoriesProvider)
          .relationshipRepositoryImpl);

  WatchSiblingsTabRelationshipsUsecase
  get watchSiblingsTabRelationshipsUsecase =>
      WatchSiblingsTabRelationshipsUsecase(_ref
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

  RearrangeChildrensTabRelationshipsUsecase
  get rearrangeChildrensTabRelationshipsUsecase =>
      RearrangeChildrensTabRelationshipsUsecase();

  RearrangeInLawsTabRelationshipsUsecase
  get rearrangeInLawsTabRelationshipsUsecase =>
      RearrangeInLawsTabRelationshipsUsecase();

  RearrangeParentsTabRelationshipsUsecase
  get rearrangeParentsTabRelationshipsUsecase =>
      RearrangeParentsTabRelationshipsUsecase();

  RearrangePartnersTabRelationshipsUsecase
  get rearrangePartnersTabRelationshipsUsecase =>
      RearrangePartnersTabRelationshipsUsecase();

  RearrangeRelativesTabRelationshipsUsecase
  get rearrangeRelativesTabRelationshipsUsecase =>
      RearrangeRelativesTabRelationshipsUsecase();

  RearrangeSiblingsTabRelationshipsUsecase
  get rearrangeSiblingsTabRelationshipsUsecase =>
      RearrangeSiblingsTabRelationshipsUsecase();

  GetTotalRomanticRelationshipDuration
  get getTotalRomanticRelationshipDuration =>
      const GetTotalRomanticRelationshipDuration();

  EndRomanticRelationshipAndReturnUpdatedObjectUsecase
  get endRomanticRelationshipAndReturnUpdatedObjectUsecase =>
      EndRomanticRelationshipAndReturnUpdatedObjectUsecase(
        _ref
            .read(relationshipRepositoriesProvider)
            .relationshipRepositoryImpl,
      );

  StartRomanticRelationshipAndReturnUpdatedObjectUsecase
  get startRomanticRelationshipAndReturnUpdatedObjectUsecase =>
      StartRomanticRelationshipAndReturnUpdatedObjectUsecase(
        _ref
            .read(relationshipRepositoriesProvider)
            .relationshipRepositoryImpl,
        createRelationshipUsecase,
      );

  EndAllActiveRomanticRelationshipsUsecase
  get endAllActiveRomanticRelationshipsUsecase =>
      EndAllActiveRomanticRelationshipsUsecase(
        _ref
            .read(relationshipRepositoriesProvider)
            .relationshipRepositoryImpl,
        endRomanticRelationshipAndReturnUpdatedObjectUsecase,
      );

  GenerateAcquaintancesUsecase get generateAcquaintancesUsecase =>
      GenerateAcquaintancesUsecase(
        _ref.read(personUsecasesProvider),
        createRelationshipUsecase,
      );
}
