import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/watch/relationship/relationship_tabs/graves_tab_relationships_provider.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/empty_relationship_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/list_item/graves_list_item.dart';

@RoutePage()
class GravesScreen extends ConsumerWidget {
  const GravesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataProvider = ref.watch(gravesTabRelationshipsProvider);

    return dataProvider.when(
      data: (data) {
        return (data.isEmpty)
            ? const EmptyRelationshipListScreen()
            : ListView.separated(
                itemBuilder: (context, index) {
                  return GravesListItem(
                    personGravePair: data[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const ListDivider();
                },
                itemCount: data.length,
              );
      },
      error: (error, stackTrace) => Container(),
      loading: () => Container(),
    );
  }
}
