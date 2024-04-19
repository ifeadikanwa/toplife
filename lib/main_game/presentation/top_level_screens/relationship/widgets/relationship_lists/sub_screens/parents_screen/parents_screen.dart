import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/watch/relationship/relationship_tabs/parents_tab_relationships_provider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/empty_relationship_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/relationship_list_screen.dart';

@RoutePage()
class ParentsScreen extends ConsumerWidget {
  const ParentsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataProvider = ref.watch(parentsTabRelationshipsProvider);

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
