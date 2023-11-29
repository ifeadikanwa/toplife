import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GravesScreen extends ConsumerWidget {
  const GravesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();

    // final gravesScreenViewModel = ref.watch(gravesScreenViewModelProvider);

    // return gravesScreenViewModel.when(
    //   data: (graves) {
    //     return (graves.isEmpty)
    //         ? const EmptyRelationshipListScreen()
    //         : ListView.separated(
    //             itemCount: graves.length,
    //             itemBuilder: (context, index) {
    //               //relationship label
    //               final String relationshipLabel =
    //                   graves[index].relationshipType;

    //               //name
    //               final name = graves[index].fullName;

    //               //day of death
    //               final dayOfDeath = graves[index].dayOfDeath;

    //               return GravesListItem(
    //                   onTap: () {},
    //                   avatarImagePath: "assets/images/indian_woman_face.png",
    //                   relationshipLabel: relationshipLabel,
    //                   name: name,
    //                   dayOfDeath: dayOfDeath);
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
