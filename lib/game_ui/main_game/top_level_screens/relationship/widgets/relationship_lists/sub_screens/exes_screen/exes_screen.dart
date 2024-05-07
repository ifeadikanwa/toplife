import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/watch/relationship/relationship_tabs/exes_tab_relationships_provider.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/empty_relationship_list_screen.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/relationship_list_screen.dart';

@RoutePage()
class ExesScreen extends ConsumerWidget {
  const ExesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataProvider = ref.watch(exesTabRelationshipsProvider);

    return dataProvider.when(
      data: (data) {
        return (data.content.isEmpty)
            ? const EmptyRelationshipListScreen()
            : RelationshipListScreen(
                relationshipsData: data,
              );
      },
      error: (error, stackTrace) => Container(),
      loading: () => Container(),
    );
  }
}
