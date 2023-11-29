// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
// import 'package:toplife/core/common_states/watch/relationship/players_relationships/current_player_inlaws_provider.dart';
// import 'package:toplife/core/data_source/drift_database/database_provider.dart';
// import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

// final currentPlayerLivingInLawPairsProvider =
//     FutureProvider<List<RelationshipPair<InLaw>>>((ref) async {
//   final List<InLaw> allInLaws =
//       await ref.watch(currentPlayerInLawsProvider.future);

//   return ref
//       .watch(relationshipUsecasesProvider)
//       .getInLawRelationshipPairsFromInLawsUsecase
//       .execute(
//         inLaws: allInLaws,
//         onlyLivingPeople: true,
//       );
// });
