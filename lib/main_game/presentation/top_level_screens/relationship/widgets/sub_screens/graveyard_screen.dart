import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/graveyard_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/relationship_list_screen.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/graveyard.dart';

class GraveyardScreen extends StatelessWidget {
  final List<Graveyard> graveyards;
  const GraveyardScreen({Key? key, required this.graveyards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelationshipListScreen(
      listView: ListView.separated(
        itemCount: graveyards.length,
        itemBuilder: (context, index) {
          //relationship label
          final String relationshipLabel = graveyards[index].relationshipType;

          //name
          final name = graveyards[index].fullName;

          //day of death
          final dayOfDeath = graveyards[index].dayOfDeath;

          return GraveyardListItem(
              avatarImagePath: "assets/images/black_woman_placeholder.jpg",
              relationshipLabel: relationshipLabel,
              name: name,
              dayOfDeath: dayOfDeath);
        },
        separatorBuilder: (context, index) {
          return listDivider;
        },
      ),
    );
  }
}

const testGraveyards = [
  Graveyard(
    mainPersonID: 1,
    deadPersonID: 2,
    relationshipType: "Mother",
    dayOfDeath: 45,
    fullName: "Fiona Merril",
    ageAtDeath: "Element",
  ),
  Graveyard(
    mainPersonID: 1,
    deadPersonID: 2,
    relationshipType: "Father",
    dayOfDeath: 45,
    fullName: "Hewie Merril",
    ageAtDeath: "Element",
  ),
  Graveyard(
    mainPersonID: 1,
    deadPersonID: 2,
    relationshipType: "Son",
    dayOfDeath: 45,
    fullName: "Jack Merril",
    ageAtDeath: "Element",
  ),
];
