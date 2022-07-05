import 'package:toplife/main_systems/system_job/domain/model/job.dart';
import 'package:toplife/main_systems/system_job/job_info/jobs/degree/communications_jobs.dart';
import 'package:toplife/main_systems/system_job/job_info/jobs/degree/creative_jobs.dart';
import 'package:toplife/main_systems/system_job/job_info/jobs/degree/education_jobs.dart';
import 'package:toplife/main_systems/system_job/job_info/jobs/degree/engineering_jobs.dart';
import 'package:toplife/main_systems/system_job/job_info/jobs/degree/finance_jobs.dart';
import 'package:toplife/main_systems/system_job/job_info/jobs/degree/law_jobs.dart';
import 'package:toplife/main_systems/system_job/job_info/jobs/degree/medical_jobs.dart';
import 'package:toplife/main_systems/system_job/job_info/jobs/degree/pharmacy_jobs.dart';
import 'package:toplife/main_systems/system_job/job_info/jobs/degree/science_jobs.dart';
import 'package:toplife/main_systems/system_job/job_info/jobs/degree/social_work_jobs.dart';
import 'package:toplife/main_systems/system_job/job_info/jobs/degree/tech_jobs.dart';
import 'package:toplife/main_systems/system_job/job_info/jobs/general/full_time_general_jobs.dart';
import 'package:toplife/main_systems/system_job/job_info/jobs/general/part_time_general_jobs.dart';

class GameJobs {
  static Set<Job> jobs = {
    // medical
    ...MedicalJobs.list,
    // whiteCollar, blueCollar & sexWork part time general
    ...PartTimeGeneralJobs.list,
    // whiteCollar, blueCollar & sexWork full time general
    ...FullTimeGeneralJobs.list,
    // education
    ...EducationJobs.list,
    // creative
    ...CreativeJobs.list,
    // communication
    ...CommunicationsJobs.list,
    // pharmacy
    ...PharmacyJobs.list,
    // science
    ...ScienceJobs.list,
    // engineering
    ...EngineeringJobs.list,
    // finance
    ...FinanceJobs.list,
    // socialWork
    ...SocialWorkJobs.list,
    // law
    ...LawJobs.list,
    // tech
    ...TechJobs.list,
  };
}
