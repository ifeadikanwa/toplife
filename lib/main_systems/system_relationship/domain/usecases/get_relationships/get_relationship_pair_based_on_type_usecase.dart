import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/acquaintance.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/child.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/friend.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/inlaw.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/parent.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/partner.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/relative.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/sibling.dart';

class GetRelationshipPairBasedOnTypeUsecase {
  final RelationshipRepositories _relationshipRepositories;
  final PersonUsecases _personUsecases;

  const GetRelationshipPairBasedOnTypeUsecase({
    required RelationshipRepositories relationshipRepositories,
    required PersonUsecases personUsecases,
  })  : _relationshipRepositories = relationshipRepositories,
        _personUsecases = personUsecases;

  Future<RelationshipPair?> execute({
    required int mainPersonID,
    required int relationshipPersonID,
    required String informalRelationshipType,
  }) async {
    //go through different relationship types
    //if it is a match
    //search the matching table for the id
    //if you find it
    //search the person table for the person

    //if no relationship type match return null

    if (informalRelationshipType ==
        InformalRelationshipType.acquaintance.name) {
      return getAcquaintanceRelationshipPair(
        mainPersonID: mainPersonID,
        acquaintanceID: relationshipPersonID,
      );
    } else if (informalRelationshipType ==
        InformalRelationshipType.friend.name) {
      return getFriendRelationshipPair(
        mainPersonID: mainPersonID,
        friendID: relationshipPersonID,
      );
    } else if (informalRelationshipType ==
        InformalRelationshipType.parent.name) {
      return getParentRelationshipPair(
        mainPersonID: mainPersonID,
        parentID: relationshipPersonID,
      );
    } else if (informalRelationshipType ==
        InformalRelationshipType.sibling.name) {
      return getSiblingRelationshipPair(
        mainPersonID: mainPersonID,
        siblingID: relationshipPersonID,
      );
    } else if (informalRelationshipType ==
        InformalRelationshipType.partner.name) {
      return getPartnerRelationshipPair(
        mainPersonID: mainPersonID,
        partnerID: relationshipPersonID,
      );
    } else if (informalRelationshipType ==
        InformalRelationshipType.child.name) {
      return getChildRelationshipPair(
        mainPersonID: mainPersonID,
        childID: relationshipPersonID,
      );
    } else if (informalRelationshipType ==
        InformalRelationshipType.relative.name) {
      return getRelativeRelationshipPair(
        mainPersonID: mainPersonID,
        relativeID: relationshipPersonID,
      );
    } else if (informalRelationshipType ==
        InformalRelationshipType.inLaw.name) {
      return getInLawRelationshipPair(
        mainPersonID: mainPersonID,
        inLawID: relationshipPersonID,
      );
    }

    return null;
  }

  //Relationship pair getters

  Future<RelationshipPair?> getAcquaintanceRelationshipPair({
    required int mainPersonID,
    required int acquaintanceID,
  }) async {
    final Acquaintance? acquaintance = await _relationshipRepositories
        .acquaintanceRepositoryImpl
        .getAcquaintance(
      mainPersonID,
      acquaintanceID,
    );

    if (acquaintance != null) {
      final Person? person = await _personUsecases.getPersonUsecase.execute(
        personID: acquaintanceID,
      );

      if (person != null) {
        return RelationshipPair<Acquaintance, Person>(
          relationship: acquaintance,
          person: person,
        );
      }
    }

    return null;
  }

  Future<RelationshipPair?> getFriendRelationshipPair({
    required int mainPersonID,
    required int friendID,
  }) async {
    final Friend? friend =
        await _relationshipRepositories.friendRepositoryImpl.getFriend(
      mainPersonID,
      friendID,
    );

    if (friend != null) {
      final Person? person = await _personUsecases.getPersonUsecase.execute(
        personID: friendID,
      );

      if (person != null) {
        return RelationshipPair<Friend, Person>(
          relationship: friend,
          person: person,
        );
      }
    }

    return null;
  }

  Future<RelationshipPair?> getParentRelationshipPair({
    required int mainPersonID,
    required int parentID,
  }) async {
    final Parent? parent =
        await _relationshipRepositories.parentRepositoryImpl.getParent(
      mainPersonID,
      parentID,
    );

    if (parent != null) {
      final Person? person = await _personUsecases.getPersonUsecase.execute(
        personID: parentID,
      );

      if (person != null) {
        return RelationshipPair<Parent, Person>(
          relationship: parent,
          person: person,
        );
      }
    }

    return null;
  }

  Future<RelationshipPair?> getPartnerRelationshipPair({
    required int mainPersonID,
    required int partnerID,
  }) async {
    final Partner? partner =
        await _relationshipRepositories.partnerRepositoryImpl.getAPartner(
      mainPersonID,
      partnerID,
    );

    if (partner != null) {
      final Person? person = await _personUsecases.getPersonUsecase.execute(
        personID: partnerID,
      );

      if (person != null) {
        return RelationshipPair<Partner, Person>(
          relationship: partner,
          person: person,
        );
      }
    }

    return null;
  }

  Future<RelationshipPair?> getChildRelationshipPair({
    required int mainPersonID,
    required int childID,
  }) async {
    final Child? child =
        await _relationshipRepositories.childRepositoryImpl.getChild(
      mainPersonID,
      childID,
    );

    if (child != null) {
      final Person? person = await _personUsecases.getPersonUsecase.execute(
        personID: childID,
      );

      if (person != null) {
        return RelationshipPair<Child, Person>(
          relationship: child,
          person: person,
        );
      }
    }

    return null;
  }

  Future<RelationshipPair?> getSiblingRelationshipPair({
    required int mainPersonID,
    required int siblingID,
  }) async {
    final Sibling? sibling =
        await _relationshipRepositories.siblingRepositoryImpl.getSibling(
      mainPersonID,
      siblingID,
    );

    if (sibling != null) {
      final Person? person = await _personUsecases.getPersonUsecase.execute(
        personID: siblingID,
      );

      if (person != null) {
        return RelationshipPair<Sibling, Person>(
          relationship: sibling,
          person: person,
        );
      }
    }

    return null;
  }

  Future<RelationshipPair?> getRelativeRelationshipPair({
    required int mainPersonID,
    required int relativeID,
  }) async {
    final Relative? relative =
        await _relationshipRepositories.relativeRepositoryImpl.getRelative(
      mainPersonID,
      relativeID,
    );

    if (relative != null) {
      final Person? person = await _personUsecases.getPersonUsecase.execute(
        personID: relativeID,
      );

      if (person != null) {
        return RelationshipPair<Relative, Person>(
          relationship: relative,
          person: person,
        );
      }
    }

    return null;
  }

  Future<RelationshipPair?> getInLawRelationshipPair({
    required int mainPersonID,
    required int inLawID,
  }) async {
    final InLaw? inLaw =
        await _relationshipRepositories.inLawRepositoryImpl.getInLaw(
      mainPersonID,
      inLawID,
    );

    if (inLaw != null) {
      final Person? person = await _personUsecases.getPersonUsecase.execute(
        personID: inLawID,
      );

      if (person != null) {
        return RelationshipPair<InLaw, Person>(
          relationship: inLaw,
          person: person,
        );
      }
    }

    return null;
  }
}
