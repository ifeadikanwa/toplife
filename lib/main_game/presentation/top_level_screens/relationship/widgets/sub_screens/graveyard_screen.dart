import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/graveyard_list_item.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class GraveyardScreen extends StatelessWidget {
  final List<Graveyard> graveyards;
  const GraveyardScreen({Key? key, required this.graveyards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: graveyards.length,
      itemBuilder: (context, index) {
        //relationship label
        final String relationshipLabel = graveyards[index].relationshipType;

        //name
        final name = graveyards[index].fullName;

        //day of death
        final dayOfDeath = graveyards[index].dayOfDeath;

        return GraveyardListItem(
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

