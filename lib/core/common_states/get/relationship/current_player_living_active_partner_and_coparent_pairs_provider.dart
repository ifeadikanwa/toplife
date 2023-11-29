// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
// import 'package:toplife/core/common_states/watch/relationship/players_relationships/current_player_active_partners_provider.dart';
// import 'package:toplife/core/common_states/watch/relationship/players_relationships/current_player_coparents_provider.dart';
// import 'package:toplife/core/data_source/drift_database/database_provider.dart';
// import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

// final currentPlayerLivingActivePartnerAndCoparentPairsProvider =
//     FutureProvider<List<RelationshipPair<Partner>>>((ref) async {
      
//   //combined list of active partners and coparents
//   //arrange the partners list in order -> active partner, inactive partner
//   final List<Partner> activePartnersAndCoparents = [
//     ...(await ref.watch(currentPlayerActivePartnersProvider.future)),
//     ...(await ref.watch(currentPlayerCoparentsProvider.future)),
//   ];

//   return ref
//       .watch(relationshipUsecasesProvider)
//       .getPartnerRelationshipPairsFromPartnersUsecase
//       .execute(
//         partners: activePartnersAndCoparents,
//         onlyLivingPeople: true,
//       );
// });
