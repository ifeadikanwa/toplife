import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

class GetFriendRelationshipPairsFromFriendsUsecase {
  final PersonUsecases _personUsecases;

  GetFriendRelationshipPairsFromFriendsUsecase(
    this._personUsecases,
  );

  Future<List<RelationshipPair<Friend>>> execute({
    required List<Friend> friends,
    required bool onlyLivingPeople,
  }) async {
    List<RelationshipPair<Friend>> friendPairs = [];

    for (var friend in friends) {
      final Person? person = await _personUsecases.getPersonUsecase
          .execute(personID: friend.friendId);

      if (person != null) {
        if (onlyLivingPeople == false || person.dead == false) {
          friendPairs.add(
            RelationshipPair<Friend>(
              relationship: friend,
              person: person,
              informalRelationshipType: InformalRelationshipType.friend,
            ),
          );
        }
      }
    }

    return friendPairs;
  }
}
