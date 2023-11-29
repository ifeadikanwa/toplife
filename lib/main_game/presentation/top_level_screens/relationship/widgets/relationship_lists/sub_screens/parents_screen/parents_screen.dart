import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
// import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/empty_relationship_list_screen.dart';
// import 'package:toplife/core/text_constants.dart';
// import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/list_item/relationship_list_item_with_header.dart';
// import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/sub_screens/parents_screen/parents_screen_view_model.dart';
import 'package:toplife/main_systems/system_person/constants/emotional_state.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/main_systems/system_person/constants/zodiac_sign.dart';
// import 'package:toplife/main_systems/system_relationship/constants/parent_relationship_type.dart';
// import 'package:toplife/main_game/presentation/top_level_screens/relationship/widgets/relationship_lists/helper_widgets/list_item/relationship_list_item/relationship_list_item.dart';
// import 'package:toplife/main_systems/system_relationship/util/get_parent_relationship_label.dart';

class ParentsScreen extends ConsumerWidget {
  const ParentsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
    // final parentsScreenViewModel = ref.watch(parentsScreenViewModelProvider);

    // return parentsScreenViewModel.when(
    //   data: (parentsList) {
    //     return (parentsList.isEmpty)
    //         ? const EmptyRelationshipListScreen()
    //         : ListView.separated(
    //             itemCount: parentsList.length,
    //             itemBuilder: (context, index) {
    //               // if the parent is a step or main parent they fall under the parent category
    //               //if it is a grand parent they fall under the grand parents category

    //               //rearrange list

    //               //if it is the first item in the list or if the previous item has a different type
    //               //if it is greater than 0 and the type is step or main: do the regular.
    //               //else we want to add a header:
    //               //parent if step or main, grandparent if grand.

    //               //relationship label
    //               final relationshipType =
    //                   parentsList[index].relationship.parentRelationshipType;
    //               final gender = parentsList[index].person.gender;

    //               final String relationshipLabel =
    //                   getParentRelationshipLabel(relationshipType, gender);

    //               //name
    //               final name =
    //                   "${parentsList[index].person.firstName} ${parentsList[index].person.lastName}";

    //               //relationship amount
    //               final relationshipAmount =
    //                   parentsList[index].relationship.relationship;

    //               //person ID
    //               final int personID = parentsList[index].person.id;

    //               //Check if it needs a header
    //               if (index == 0 ||
    //                   relationshipType !=
    //                       parentsList[index - 1]
    //                           .relationship
    //                           .parentRelationshipType) {
    //                 //don't create a header for step-parents
    //                 if (index > 0 &&
    //                     relationshipType != ParentRelationshipType.grand.name) {
    //                   //do nothing
    //                 }
    //                 //create a header
    //                 else {
    //                   late final String sectionTitle;

    //                   if (relationshipType ==
    //                       ParentRelationshipType.grand.name) {
    //                     sectionTitle = TextConstants.grandparents;
    //                   } else {
    //                     sectionTitle = TextConstants.parents;
    //                   }
    //                   return RelationshipListItemWithHeader(
    //                     onTap: () {
    //                       ref
    //                           .read(parentsScreenViewModelProvider.notifier)
    //                           .goToRelationshipActionsScreen(
    //                             context: context,
    //                             relationshipPersonID: personID,
    //                           );
    //                     },
    //                     sectionTitle: sectionTitle,
    //                     avatarImagePath:
    //                         parentsList[index].person.gender == "Male"
    //                             ? "assets/images/blank_male_1.png"
    //                             : "assets/images/blank_female_2.png",
    //                     relationshipLabel: relationshipLabel,
    //                     name: name,
    //                     relationshipAmount: relationshipAmount,
    //                     personID: personID,
    //                   );
    //                 }
    //               }

    //               //No header needed if you get here
    //               return RelationshipListItem(
    //                 onTap: () {
    //                   ref
    //                       .read(parentsScreenViewModelProvider.notifier)
    //                       .goToRelationshipActionsScreen(
    //                         context: context,
    //                         relationshipPersonID: personID,
    //                       );
    //                 },
    //                 avatarImagePath: parentsList[index].person.gender == "Male"
    //                     ? "assets/images/blank_male_1.png"
    //                     : "assets/images/blank_female_2.png",
    //                 relationshipLabel: relationshipLabel,
    //                 name: name,
    //                 relationshipAmount: relationshipAmount,
    //                 personID: personID,
    //               );
    //             },
    //             separatorBuilder: (context, index) {
    //               return const ListDivider();
    //             },
    //           );
    //   },
    //   error: (error, stackTrace) => Container(),
    //   loading: () => Container(),
    // );
  }
}

final dummyPlayer = Person(
  id: DatabaseConstants.dummyId,
  gameId: 1,
  firstName: "Ryan",
  lastName: "Howard",
  dayOfBirth: 89,
  gender: Gender.Male.name,
  subjectPronoun: Gender.Male.subjectPronoun,
  objectPronoun: Gender.Male.objectPronoun,
  possessivePronoun: Gender.Male.possessivepronoun,
  sexuality: Sexuality.Straight.name,
  birthState: "Michigan",
  birthCountry: "United States",
  currentState: "Michigan",
  currentCountry: "United States",
  money: 864000,
  emotionalState: EmotionalState.normal.name,
  zodiacSign: ZodiacSign.Libra.name,
  transportMode: "bus",
  drivingMode: "normal",
  hasDriversLicense: false,
  hasFertilityIssues: false,
  onBirthControl: false,
  isSterile: false,
  sickly: false,
  dead: false,
);
