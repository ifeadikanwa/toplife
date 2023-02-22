import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/graves_list_item.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class GravesScreen extends StatelessWidget {
  final List<Grave> graves;
  const GravesScreen({Key? key, required this.graves}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: graves.length,
      itemBuilder: (context, index) {
        //relationship label
        final String relationshipLabel = graves[index].relationshipType;

        //name
        final name = graves[index].fullName;

        //day of death
        final dayOfDeath = graves[index].dayOfDeath;

        return GravesListItem(
            onTap: () {},
            avatarImagePath: "assets/images/black_woman_placeholder.jpg",
            relationshipLabel: relationshipLabel,
            name: name,
            dayOfDeath: dayOfDeath);
      },
      separatorBuilder: (context, index) {
        return const ListDivider();
      },
    );
  }
}
