import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/list_templates/section.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/work/widgets/helper_widgets/list_item/current_work_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/work/widgets/helper_widgets/sections/current_section/current_section_view_model.dart';
import 'package:toplife/main_systems/system_job/domain/model/info_models/employment_pair.dart';
import 'package:toplife/main_systems/system_job/util/get_full_job_title.dart';

class CurrentSection extends ConsumerWidget {
  const CurrentSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSectionViewModelDataProvider =
        ref.watch(currentSectionViewModelProvider);

    return currentSectionViewModelDataProvider.when(
      data: (currentSchoolAndEmployments) {
        return (currentSchoolAndEmployments.schoolPair == null &&
                currentSchoolAndEmployments.employmentPairs.isEmpty)
            ? const SizedBox()
            : Section(
                sectionTitle: TextConstants.current,
                sectionItems: [
                  (currentSchoolAndEmployments.schoolPair == null)
                      ? const SizedBox()
                      : CurrentWorkListItem(
                          workTitle: currentSchoolAndEmployments
                              .schoolPair!.school.name,
                          performance: currentSchoolAndEmployments
                              .schoolPair!.school.grades,
                          onTap: () {},
                        ),
                  ...employmentWidgets(
                      currentSchoolAndEmployments.employmentPairs),
                ],
              );
      },
      error: (error, stackTrace) => Container(),
      loading: () => const Section(
        sectionTitle: TextConstants.current,
        sectionItems: [],
      ),
    );
  }

  List<CurrentWorkListItem> employmentWidgets(
    List<EmploymentPair> employments,
  ) {
    List<CurrentWorkListItem> employmentsWidgets = [];

    for (var employment in employments) {
      employmentsWidgets.add(
        CurrentWorkListItem(
          workTitle: getFullJobTitle(
            employment.employment.currentLevel,
            employment.job,
          ),
          performance: employment.employment.jobPerformance,
          onTap: () {},
        ),
      );
    }

    return employmentsWidgets;
  }
}
