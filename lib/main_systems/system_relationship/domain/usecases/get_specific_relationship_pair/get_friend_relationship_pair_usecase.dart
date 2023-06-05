import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/friend_repository.dart';

class GetFriendRelationshipPairUsecase {
  final PersonUsecases _personUsecases;
  final FriendRepository _friendRepository;

  GetFriendRelationshipPairUsecase(
    this._personUsecases,
    this._friendRepository,
  );

  Future<RelationshipPair<Friend>?> execute({
    required int mainPersonID,
    required int friendID,
  }) async {

    final Person? person =
        await _personUsecases.getPersonUsecase.execute(personID: friendID);

    if (person != null) {
      final Friend? friend = await _friendRepository.getFriend(
        mainPersonID,
        friendID,
      );

      if (friend != null) {
        return RelationshipPair<Friend>(
          relationship: friend,
          person: person,
          informalRelationshipType: InformalRelationshipType.friend,
        );
      }
    }
    
    return null;
  }
}
