import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/list_templates/case/list_view_item_case.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/list_item/relationship_label_and_name.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/relationship_bar.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_grave_pair.dart';
import 'package:toplife/main_systems/system_person/util/get_fullname_string.dart';

class GravesListItem extends StatelessWidget {
  final PersonGravePair personGravePair;

  const GravesListItem({
    super.key,
    required this.personGravePair,
  });

  @override
  Widget build(BuildContext context) {
    return ListViewItemCase(
      onTap: () {},
      content: Row(
        children: [
          // RelationshipAvatar(avatarImagePath: avatarImagePath),
          const AddHorizontalSpace(width: listRowItemsSpacing),
          relationshipInfo(),
        ],
      ),
    );
  }

  Widget relationshipInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RelationshipLabelAndName(
            relationshipLabel: personGravePair.grave.relationshipLabel,
            name: getFullNameString(
              firstName: personGravePair.person.firstName,
              lastName: personGravePair.person.lastName,
            ),
          ),
          RelationshipBar(
            relationshipAmount: personGravePair.grave.relationshipLevel,
          )
        ],
      ),
    );
  }
}
