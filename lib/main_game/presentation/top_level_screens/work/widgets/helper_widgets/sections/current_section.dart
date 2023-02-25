import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/list_templates/section.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/work/widgets/helper_widgets/list_item/current_work_list_item.dart';
import 'package:toplife/main_systems/system_job/domain/model/employment.dart';
import 'package:toplife/main_systems/system_job/domain/model/info_models/employment_pair.dart';
import 'package:toplife/main_systems/system_job/domain/model/job.dart';
import 'package:toplife/main_systems/system_job/util/get_full_job_title.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/school_pair.dart';

class CurrentSection extends StatelessWidget {
  final SchoolPair<School, Degree>? currentSchool;
  final List<EmploymentPair<Employment, Job>> currentEmployments;
  const CurrentSection({
    Key? key,
    this.currentSchool,
    required this.currentEmployments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (currentSchool == null && currentEmployments.isEmpty)
        ? const SizedBox()
        : Section(
            sectionTitle: TextConstants.current,
            sectionItems: [
              (currentSchool == null)
                  ? const SizedBox()
                  : CurrentWorkListItem(
                      workTitle: currentSchool!.school.name,
                      performance: currentSchool!.school.grades,
                      onTap: () {},
                    ),
              ...employmentWidgets(currentEmployments),
            ],
          );
  }

  List<CurrentWorkListItem> employmentWidgets(
    List<EmploymentPair<Employment, Job>> employments,
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
