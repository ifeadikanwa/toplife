import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/config/routing/app_router.gr.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_search_info.dart';

final navigateToRelationshipActionsScreenNotifierProvider =
    StateNotifierProvider<NavigateToRelationshipActionsScreenNotifier,
        RelationshipSearchInfo?>((ref) {
  return NavigateToRelationshipActionsScreenNotifier();
});

class NavigateToRelationshipActionsScreenNotifier
    extends StateNotifier<RelationshipSearchInfo?> {
  //initializes with null
  NavigateToRelationshipActionsScreenNotifier() : super(null);

  //navigator function
  void execute({
    required BuildContext context,
    required int relationshipPersonID,
    required InformalRelationshipType relationshipType,
  }) {
    //set state
    state = RelationshipSearchInfo(
      relationshipPersonID: relationshipPersonID,
      informalRelationshipType: relationshipType,
    );

    //navigate
    AutoRouter.of(context).push(const RelationshipActionsRoute());
  }
}
