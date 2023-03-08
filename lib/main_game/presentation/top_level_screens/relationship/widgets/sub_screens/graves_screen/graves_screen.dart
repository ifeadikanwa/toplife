import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/common_widgets/empty/empty_relationship_list_screen.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/graves_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/sub_screens/graves_screen/graves_screen_view_model.dart';

class GravesScreen extends ConsumerWidget {
  const GravesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gravesScreenViewModel = ref.watch(gravesScreenViewModelProvider);

    return gravesScreenViewModel.when(
      data: (graves) {
        return (graves.isEmpty)
            ? const EmptyRelationshipListScreen()
            : ListView.separated(
                itemCount: graves.length,
                itemBuilder: (context, index) {
                  //relationship label
                  final String relationshipLabel =
                      graves[index].relationshipType;

                  //name
                  final name = graves[index].fullName;

                  //day of death
                  final dayOfDeath = graves[index].dayOfDeath;

                  return GravesListItem(
                      onTap: () {},
                      avatarImagePath: "assets/images/indian_woman_face.png",
                      relationshipLabel: relationshipLabel,
                      name: name,
                      dayOfDeath: dayOfDeath);
                },
                separatorBuilder: (context, index) {
                  return const ListDivider();
                },
              );
      },
      error: (error, stackTrace) => Container(),
      loading: () => Container(),
    );
  }
}
