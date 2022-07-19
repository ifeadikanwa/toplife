import 'dart:math';

import 'package:toplife/main_systems/system_job/job_info/constants/job_type.dart';
import 'package:toplife/main_systems/system_job/util/company_names.dart';

String getRandomCompanyName(String jobType) {
  //science, medical, pharmacy
  if (jobType == JobType.science.name ||
      jobType == JobType.medical.name ||
      jobType == JobType.medical.name) {
    return CompanyNames.scienceCompanyNamesList.elementAt(
      Random().nextInt(CompanyNames.scienceCompanyNamesList.length),
    );
  }
  //sex work
  else if (jobType == JobType.sexWork.name) {
    return CompanyNames.sexWorkCompanyNamesList.elementAt(
      Random().nextInt(CompanyNames.sexWorkCompanyNamesList.length),
    );
  }
  //law
  else if (jobType == JobType.law.name) {
    return CompanyNames.lawCompanyNamesList.elementAt(
      Random().nextInt(CompanyNames.lawCompanyNamesList.length),
    );
  }
  //engineering
  else if (jobType == JobType.engineering.name) {
    return CompanyNames.engineeringCompanyNamesList.elementAt(
      Random().nextInt(CompanyNames.engineeringCompanyNamesList.length),
    );
  }
  //creative, communication
  else if (jobType == JobType.creative.name ||
      jobType == JobType.communication.name) {
    return CompanyNames.creativeCompanyNamesList.elementAt(
      Random().nextInt(CompanyNames.creativeCompanyNamesList.length),
    );
  }
  //education
  else if (jobType == JobType.education.name) {
    return CompanyNames.educationCompanyNamesList.elementAt(
      Random().nextInt(CompanyNames.educationCompanyNamesList.length),
    );
  }
  //tech, finance, white collar
  else if (jobType == JobType.tech.name ||
      jobType == JobType.finance.name ||
      jobType == JobType.whiteCollar.name) {
    return CompanyNames.corporateCompanyNamesList.elementAt(
      Random().nextInt(CompanyNames.corporateCompanyNamesList.length),
    );
  }
  //blueCollar, social work
  else {
    return CompanyNames.workCompanyNamesList.elementAt(
      Random().nextInt(CompanyNames.workCompanyNamesList.length),
    );
  }
}
