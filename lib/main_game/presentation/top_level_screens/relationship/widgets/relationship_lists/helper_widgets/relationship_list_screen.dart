import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/utils/sectioned_list/sectioned_list.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/list_item/relationship_list_item/relationship_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/list_item/relationship_list_item_with_header.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';

class RelationshipListScreen extends StatelessWidget {
  final SectionedList<PersonRelationshipPair> relationshipsData;

  const RelationshipListScreen({
    super.key,
    required this.relationshipsData,
  });

  @override
  Widget build(BuildContext context) {
    //get the actual list of relationships
    final List<PersonRelationshipPair> personRelationshipPairs =
        relationshipsData.content;

    //put the passed in arg in a local variable so we can do type checks conveniently
    final data = relationshipsData;

    return ListView.separated(
      itemBuilder: (context, index) {
        //The only thing outside the ordinary we want to do is:
        //if it is a sectioned list
        //we want to check if the current index is the start of a new heading

        if (data is Sectioned<PersonRelationshipPair>) {
          //we get a title is it is the start of a new heading
          final String? sectionTitle = data.getSectionTitle(index);

          if (sectionTitle != null) {
            return RelationshipListItemWithHeader(
              sectionTitle: sectionTitle,
              personRelationshipPair: personRelationshipPairs[index],
            );
          }
        }

        //if it is not a sectioned list Or not the start of a new heading
        //return relationship list item
        return RelationshipListItem(
          personRelationshipPair: personRelationshipPairs[index],
        );
      },
      separatorBuilder: (context, index) {
        //don't add the separator if the current list item is the last in a section

        if (data is Sectioned<PersonRelationshipPair> &&
            data.endOfSection(index)) {
          //return nothing
          return const SizedBox();
        }

        return const ListDivider();
      },
      itemCount: personRelationshipPairs.length,
    );
  }
}
