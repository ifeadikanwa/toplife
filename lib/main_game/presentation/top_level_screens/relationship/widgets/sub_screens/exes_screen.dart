import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/helper_widgets/list_item/relationship_list_item.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/util/get_ex_relationship_label.dart';
import 'package:toplife/main_systems/system_relationship/util/get_partner_relationship_type_enum.dart';

class ExesScreen extends StatelessWidget {
  final List<RelationshipPair<Partner>> exes;
  const ExesScreen({
    Key? key,
    required this.exes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: exes.length,
      itemBuilder: (context, index) {
        //relationship label
        final relationshipType =
            exes[index].relationship.partnerRelationshipType;
        final gender = exes[index].person.gender;

        final relationshipTypeEnum =
            getPartnerRelationshipTypeEnum(relationshipType);

        final String relationshipLabel =
            getExRelationshipLabel(gender, relationshipTypeEnum);

        //name
        final name =
            "${exes[index].person.firstName} ${exes[index].person.lastName}";

        //relationship amount
        final relationshipAmount = exes[index].relationship.relationship;

        //living together
        final currentlyLivingTogether =
            exes[index].relationship.currentlyLivingTogether;

        return RelationshipListItem(
          onTap: () {},
          avatarImagePath: "assets/images/indian_woman_face.png",
          relationshipLabel: relationshipLabel,
          name: name,
          relationshipAmount: relationshipAmount,
          currentlyLivingTogether: currentlyLivingTogether,
        );
      },
      separatorBuilder: (context, index) {
        return const ListDivider();
      },
    );
  }
}
