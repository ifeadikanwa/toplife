import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/relationships/relationship_list_item.dart';

class RelationshipsList extends StatelessWidget {
  const RelationshipsList({Key? key}) : super(key: key);

  //* Building the relationships page
  //* Have a single scrollview with a column.
  //* then have methods that builds each part of the list stacked on top each other
  //* these methods check if there is any data to display and uses this info to decode whether to show that section or not(header & list)
  //* OR use tabs

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Colors.black,
          );
        },
        itemBuilder: ((context, index) {
          return const RelationshipListItem();
        }),
      ),
    );
  }
}
