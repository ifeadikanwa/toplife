
import 'package:toplife/core/utils/get_random_value_from_collections.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/job_type.dart';
import 'package:toplife/main_systems/system_job/util/company_names.dart';

String getRandomCompanyName(String jobType) {
  //science, medical, pharmacy
  if (jobType == JobType.science.name ||
      jobType == JobType.medical.name ||
      jobType == JobType.medical.name) {
    return getRandomValueFromSet(set: CompanyNames.scienceCompanyNamesList);
  }
  //sex work
  else if (jobType == JobType.sexWork.name) {
    return getRandomValueFromSet(set: CompanyNames.sexWorkCompanyNamesList);
  }
  //law
  else if (jobType == JobType.law.name) {
    return getRandomValueFromSet(set: CompanyNames.lawCompanyNamesList);
  }
  //engineering
  else if (jobType == JobType.engineering.name) {
    return getRandomValueFromSet(set: CompanyNames.engineeringCompanyNamesList);
  }
  //creative, communication
  else if (jobType == JobType.creative.name ||
      jobType == JobType.communication.name) {
    return getRandomValueFromSet(set: CompanyNames.creativeCompanyNamesList);
  }
  //education
  else if (jobType == JobType.education.name) {
    return getRandomValueFromSet(set: CompanyNames.educationCompanyNamesList);
  }
  //tech, finance, white collar
  else if (jobType == JobType.tech.name ||
      jobType == JobType.finance.name ||
      jobType == JobType.whiteCollar.name) {
    return getRandomValueFromSet(set: CompanyNames.corporateCompanyNamesList);
  }
  //blueCollar, social work
  else {
    return getRandomValueFromSet(set: CompanyNames.workCompanyNamesList);
  }
}
