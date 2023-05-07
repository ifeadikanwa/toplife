import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_relationships/get_relationship_pair_based_on_type_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_acquaintance_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_child_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_friend_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_inlaw_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_parent_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_partner_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_relative_relationship_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/update/update_sibling_relationship_usecase.dart';

class UpdateAnyRelationshipAmountUsecase {
  final GetRelationshipPairBasedOnTypeUsecase
      _getRelationshipPairBasedOnTypeUsecase;

  final UpdateParentRelationshipUsecase _updateParentRelationshipUsecase;
  final UpdatePartnerRelationshipUsecase _updatePartnerRelationshipUsecase;
  final UpdateSiblingRelationshipUsecase _updateSiblingRelationshipUsecase;
  final UpdateChildRelationshipUsecase _updateChildRelationshipUsecase;
  final UpdateInLawRelationshipUsecase _updateInLawRelationshipUsecase;
  final UpdateFriendRelationshipUsecase _updateFriendRelationshipUsecase;
  final UpdateRelativeRelationshipUsecase _updateRelativeRelationshipUsecase;
  final UpdateAcquaintanceRelationshipUsecase
      _updateAcquaintanceRelationshipUsecase;

  const UpdateAnyRelationshipAmountUsecase({
    required GetRelationshipPairBasedOnTypeUsecase
        getRelationshipPairBasedOnTypeUsecase,
    required UpdateParentRelationshipUsecase updateParentRelationshipUsecase,
    required UpdatePartnerRelationshipUsecase updatePartnerRelationshipUsecase,
    required UpdateSiblingRelationshipUsecase updateSiblingRelationshipUsecase,
    required UpdateChildRelationshipUsecase updateChildRelationshipUsecase,
    required UpdateInLawRelationshipUsecase updateInLawRelationshipUsecase,
    required UpdateFriendRelationshipUsecase updateFriendRelationshipUsecase,
    required UpdateRelativeRelationshipUsecase
        updateRelativeRelationshipUsecase,
    required UpdateAcquaintanceRelationshipUsecase
        updateAcquaintanceRelationshipUsecase,
  })  : _getRelationshipPairBasedOnTypeUsecase =
            getRelationshipPairBasedOnTypeUsecase,
        _updateParentRelationshipUsecase = updateParentRelationshipUsecase,
        _updatePartnerRelationshipUsecase = updatePartnerRelationshipUsecase,
        _updateSiblingRelationshipUsecase = updateSiblingRelationshipUsecase,
        _updateChildRelationshipUsecase = updateChildRelationshipUsecase,
        _updateInLawRelationshipUsecase = updateInLawRelationshipUsecase,
        _updateFriendRelationshipUsecase = updateFriendRelationshipUsecase,
        _updateRelativeRelationshipUsecase = updateRelativeRelationshipUsecase,
        _updateAcquaintanceRelationshipUsecase =
            updateAcquaintanceRelationshipUsecase;

  Future<void> execute({
    required PersonUsecases personUsecases,
    required int mainPersonID,
    required int relationshipPersonID,
    required String relationshipToMainPerson,
    required int change,
  }) async {
    final RelationshipPair? relationshipPair =
        await _getRelationshipPairBasedOnTypeUsecase.execute(
      personUsecases: personUsecases,
      mainPersonID: mainPersonID,
      relationshipPersonID: relationshipPersonID,
      informalRelationshipType: relationshipToMainPerson,
    );

    if (relationshipPair != null) {
      //parent
      if (relationshipPair.relationship is Parent) {
        final Parent parent = relationshipPair.relationship as Parent;

        await _updateParentRelationshipUsecase.execute(
          parent.copyWith(
            relationship: parent.relationship + change,
          ),
        );
      }

      //child
      else if (relationshipPair.relationship is Child) {
        final Child child = relationshipPair.relationship as Child;
        await _updateChildRelationshipUsecase.execute(
          child.copyWith(
            relationship: child.relationship + change,
          ),
        );
      }

      //partner
      else if (relationshipPair.relationship is Partner) {
        final Partner partner = relationshipPair.relationship as Partner;
        await _updatePartnerRelationshipUsecase.execute(
          partner.copyWith(
            relationship: partner.relationship + change,
          ),
        );
      }

      //sibling
      else if (relationshipPair.relationship is Sibling) {
        final Sibling sibling = relationshipPair.relationship as Sibling;
        await _updateSiblingRelationshipUsecase.execute(
          sibling.copyWith(
            relationship: sibling.relationship + change,
          ),
        );
      }

      //relative
      else if (relationshipPair.relationship is Relative) {
        final Relative relative = relationshipPair.relationship as Relative;
        await _updateRelativeRelationshipUsecase.execute(
          relative.copyWith(
            relationship: relative.relationship + change,
          ),
        );
      }

      //friend
      else if (relationshipPair.relationship is Friend) {
        final Friend friend = relationshipPair.relationship as Friend;
        await _updateFriendRelationshipUsecase.execute(
          friend.copyWith(
            relationship: friend.relationship + change,
          ),
        );
      }

      //inlaw
      else if (relationshipPair.relationship is InLaw) {
        final InLaw inLaw = relationshipPair.relationship as InLaw;
        await _updateInLawRelationshipUsecase.execute(
          inLaw.copyWith(
            relationship: inLaw.relationship + change,
          ),
        );
      }

      //acquaintance
      else if (relationshipPair.relationship is Acquaintance) {
        final Acquaintance acquaintance =
            relationshipPair.relationship as Acquaintance;
        await _updateAcquaintanceRelationshipUsecase.execute(
          acquaintance.copyWith(
            relationship: acquaintance.relationship + change,
          ),
        );
      }
    }
  }
}
