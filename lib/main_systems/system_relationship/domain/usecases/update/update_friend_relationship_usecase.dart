import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/friend.dart';

class UpdateFriendRelationshipUsecase {
  final RelationshipRepositories _relationshipRepositories;

  const UpdateFriendRelationshipUsecase({
    required RelationshipRepositories relationshipRepositories,
  }) : _relationshipRepositories = relationshipRepositories;

  Future<void> execute(Friend friend) async {
    return await _relationshipRepositories.friendRepositoryImpl.updateFriend(
      friend,
    );
  }
}
