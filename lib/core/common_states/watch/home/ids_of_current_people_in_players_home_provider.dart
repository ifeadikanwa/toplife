import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/watch/home/current_people_in_players_home_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

part 'ids_of_current_people_in_players_home_provider.g.dart';

@riverpod
Future<List<int>> idsOfCurrentPeopleInPlayersHome(
  IdsOfCurrentPeopleInPlayersHomeRef ref,
) async {
  final List<CurrentHome> peopleInPlayersCurrentHome =
      await ref.watch(currentPeopleInPlayersHomeProvider.future);

  final List<int> idsOfPeopleInPlayersCurrentHome = peopleInPlayersCurrentHome
      .map((personCurrentHome) => personCurrentHome.personId)
      .toList();

  return idsOfPeopleInPlayersCurrentHome;
}
