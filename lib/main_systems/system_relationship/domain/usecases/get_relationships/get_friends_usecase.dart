import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/friend.dart';

class GetFriendsUsecase {
  final RelationshipRepositories _relationshipRepositories;

  const GetFriendsUsecase({
    required RelationshipRepositories relationshipRepositories,
  }) : _relationshipRepositories = relationshipRepositories;

  Future<List<Friend>> execute(int mainPersonID) async {
    return await _relationshipRepositories.friendRepositoryImpl
        .getAllFriends(mainPersonID);
  }
}
