import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/watch/home/current_people_in_players_home_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

//provides a list of person Ids for people currently in the players home
final relationshipListItemViewModelProvider =
    FutureProvider<List<int>>((ref) async {
  final List<CurrentHome> peopleInPlayersCurrentHome =
      await ref.watch(currentPeopleInPlayersHomeProvider.future);

  final List<int> idsOfPeopleInPlayersCurrentHome = peopleInPlayersCurrentHome
      .map((personCurrentHome) => personCurrentHome.personId)
      .toList();

  return idsOfPeopleInPlayersCurrentHome;
});
