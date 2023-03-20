import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/list_templates/action_list_item.dart';
import 'package:toplife/core/common_widgets/list_templates/section.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/activities/constants/activities_screen_text.dart';

class ActivitiesSection extends ConsumerWidget {
  const ActivitiesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final activitiesSectionViewModel =
    //     ref.watch(activitiesSectionViewModelProvider);

    return Section(
      sectionTitle: TextConstants.activities,
      sectionItems: [
        ActionListItem(
          icon: Icons.favorite,
          actionTitle: ActivitiesScreenText.findLove,
          actionDescription: ActivitiesScreenText.findLoveDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.self_improvement,
          actionTitle: ActivitiesScreenText.selfCare,
          actionDescription: ActivitiesScreenText.selfCareDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.child_care,
          actionTitle: ActivitiesScreenText.daycare,
          actionDescription: ActivitiesScreenText.daycareDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.escalator_warning,
          actionTitle: ActivitiesScreenText.adoptAChild,
          actionDescription: ActivitiesScreenText.adoptAChildDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.pets,
          actionTitle: ActivitiesScreenText.getAPet,
          actionDescription: ActivitiesScreenText.getAPetDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.commute,
          actionTitle: ActivitiesScreenText.transportation,
          actionDescription: ActivitiesScreenText.transportationDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.celebration,
          actionTitle: ActivitiesScreenText.throwAParty,
          actionDescription: ActivitiesScreenText.throwAPartyDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.diversity_1_outlined,
          actionTitle: ActivitiesScreenText.funWithFamily,
          actionDescription: ActivitiesScreenText.funWithFamilyDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.nightlife,
          actionTitle: ActivitiesScreenText.funInTheCity,
          actionDescription: ActivitiesScreenText.funInTheCityDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.sports_martial_arts_outlined,
          actionTitle: ActivitiesScreenText.commitACrime,
          actionDescription: ActivitiesScreenText.commitAcrimeDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.local_hospital,
          actionTitle: ActivitiesScreenText.hospital,
          actionDescription: ActivitiesScreenText.hospitalDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.healing,
          actionTitle: ActivitiesScreenText.rehab,
          actionDescription: ActivitiesScreenText.rehabDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.gavel,
          actionTitle: ActivitiesScreenText.court,
          actionDescription: ActivitiesScreenText.courtDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.translate,
          actionTitle: ActivitiesScreenText.learnALanguage,
          actionDescription: ActivitiesScreenText.learnALanguageDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.flight_takeoff,
          actionTitle: ActivitiesScreenText.vacation,
          actionDescription: ActivitiesScreenText.vacationDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.travel_explore,
          actionTitle: ActivitiesScreenText.relocate,
          actionDescription: ActivitiesScreenText.relocateDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.edit,
          actionTitle: ActivitiesScreenText.changeYourName,
          actionDescription: ActivitiesScreenText.changeYourNameDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.emoji_people,
          actionTitle: ActivitiesScreenText.sexuality,
          actionDescription: ActivitiesScreenText.sexualityDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.summarize_outlined,
          actionTitle: ActivitiesScreenText.willAndTestament,
          actionDescription: ActivitiesScreenText.willAndTestamentDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.volunteer_activism_outlined,
          actionTitle: ActivitiesScreenText.charity,
          actionDescription: ActivitiesScreenText.charityDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.photo_camera_outlined,
          actionTitle: ActivitiesScreenText.photoAlbums,
          actionDescription: ActivitiesScreenText.photoAlbumsDesc,
          onTap: () {},
        ),
        ActionListItem(
          icon: Icons.auto_awesome,
          actionTitle: ActivitiesScreenText.readYourHoroscope,
          actionDescription: ActivitiesScreenText.readYourHoroscopeDesc,
          hasDivider: false,
          onTap: () {},
        ),
      ],
    );
  }
}
