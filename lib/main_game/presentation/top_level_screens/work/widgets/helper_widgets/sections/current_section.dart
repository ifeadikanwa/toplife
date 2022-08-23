import 'package:flutter/material.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/work/widgets/helper_widgets/list_item/current_work_list_item.dart';
import 'package:toplife/main_game/presentation/top_level_screens/work/widgets/helper_widgets/sections/helper_widgets/work_section.dart';
import 'package:toplife/main_systems/system_job/domain/model/employment.dart';
import 'package:toplife/main_systems/system_job/domain/model/info_models/job_pair.dart';
import 'package:toplife/main_systems/system_job/domain/model/job.dart';
import 'package:toplife/main_systems/system_job/util/get_full_job_title.dart';
import 'package:toplife/main_systems/system_school/domain/model/degree.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/school_pair.dart';
import 'package:toplife/main_systems/system_school/domain/model/school.dart';

class CurrentSection extends StatelessWidget {
  final SchoolPair<School, Degree>? currentSchool;
  final List<JobPair<Employment, Job>> currentEmployments;
  const CurrentSection({
    Key? key,
    this.currentSchool,
    required this.currentEmployments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (currentSchool == null && currentEmployments.isEmpty)
        ? const SizedBox()
        : WorkSection(
            sectionTitle: TextConstants.current,
            sections: [
              (currentSchool == null)
                  ? const SizedBox()
                  : GestureDetector(
                      onTap: () {},
                      child: CurrentWorkListItem(
                        workTitle: currentSchool!.school.name,
                        performance: currentSchool!.school.grades,
                      ),
                    ),
              ...employmentWidgets(currentEmployments),
            ],
          );
  }

  List<GestureDetector> employmentWidgets(
    List<JobPair<Employment, Job>> employments,
  ) {
    List<GestureDetector> employmentsWidgets = [];

    for (var employment in employments) {
      employmentsWidgets.add(
        GestureDetector(
          onTap: () {},
          child: CurrentWorkListItem(
            workTitle: getFullJobTitle(
              employment.employment.currentLevel,
              employment.job,
            ),
            performance: employment.employment.jobPerformance,
          ),
        ),
      );
    }

    return employmentsWidgets;
  }
}
