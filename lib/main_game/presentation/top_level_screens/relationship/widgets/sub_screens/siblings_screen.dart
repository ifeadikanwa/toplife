import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/sibling.dart';
import 'package:toplife/main_systems/system_relationship/util/get_sibling_relationship_label.dart';

class SiblingsScreen extends StatelessWidget {
  final List<RelationshipPair<Sibling, Person>> siblings;
  const SiblingsScreen({
    Key? key,
    required this.siblings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: siblings.length,
      itemBuilder: (context, index) {
        //relationship label
        final relationshipType =
            siblings[index].relationship.siblingRelationshipType;
        final gender = siblings[index].person.gender;
        final String relationshipLabel =
            getSiblingRelationshipLabel(relationshipType, gender);

        //name
        final name =
            "${siblings[index].person.firstName} ${siblings[index].person.lastName}";

        //relationship amount
        final relationshipAmount = siblings[index].relationship.relationship;

        return RelationshipListItem(
            onTap: () {},
            avatarImagePath: "assets/images/black_woman_placeholder.jpg",
            relationshipLabel: relationshipLabel,
            name: name,
            relationshipAmount: relationshipAmount);
      },
      separatorBuilder: (context, index) {
        return const ListDivider();
      },
    );
  }
}
