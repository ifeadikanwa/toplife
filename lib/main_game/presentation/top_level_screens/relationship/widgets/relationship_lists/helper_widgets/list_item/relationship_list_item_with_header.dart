import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/list_templates/helper_widgets/section_header.dart';
import 'package:toplife/core/common_widgets/widget_constants.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/list_item/relationship_list_item/relationship_list_item.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_pair.dart';

class RelationshipListItemWithHeader extends StatelessWidget {
  final String sectionTitle;
  final PersonRelationshipPair personRelationshipPair;

  const RelationshipListItemWithHeader({
    super.key,
    required this.sectionTitle,
    required this.personRelationshipPair,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AddVerticalSpace(height: listHeaderPadding),
        SectionHeader(sectionTitle: sectionTitle),
        const AddVerticalSpace(height: listHeaderPadding),
        RelationshipListItem(
          personRelationshipPair: personRelationshipPair,
        )
      ],
    );
  }
}
