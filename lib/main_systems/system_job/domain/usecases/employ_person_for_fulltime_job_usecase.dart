import 'dart:math';

import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/main_systems/system_job/constants/full_time_job_info.dart';
import 'package:toplife/main_systems/system_job/data/repository/job_repositories.dart';
import 'package:toplife/main_systems/system_job/domain/model/info_models/job_interview_response.dart';
import 'package:toplife/main_systems/system_job/domain/model/info_models/job_location_pair.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/end_all_active_fulltime_employment_usecase.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/job_type.dart';
import 'package:toplife/main_systems/system_job/util/get_random_company_name.dart';

class EmployPersonForFullTimeJobUsecase {
  final EndAllActiveFullTimeEmploymentUsecase
      _endAllActiveFullTimeEmploymentUsecase;

  final JobRepositories _jobRepositories;

  const EmployPersonForFullTimeJobUsecase({
    required EndAllActiveFullTimeEmploymentUsecase
        endAllActiveFullTimeEmploymentUsecase,
    required JobRepositories jobRepositories,
  })  : _endAllActiveFullTimeEmploymentUsecase =
            endAllActiveFullTimeEmploymentUsecase,
        _jobRepositories = jobRepositories;

  Future<void> execute({
    required int mainPersonID,
    required int gameEconomy,
    required int currentDay,
    required JobLocationPair jobLocationPair,
    required JobInterviewResponse jobInterviewResponse,
  }) async {
    //get job from the pair
    final Job job = jobLocationPair.job;

    //end any active fulltime employment
    await _endAllActiveFullTimeEmploymentUsecase.execute(
      mainPersonID: mainPersonID,
      currentDay: currentDay,
    );

    //check if job exists in the table
    //if it does get the job id
    //if it doesnt create a new record for it
    //use the job id and the job interview response to create a new employment

    final jobRecord = await _jobRepositories.jobRepositoryImpl
        .findFullTimeJobWithJobTitle(job.jobTitle);

    late final int jobID;

    //if job exist in table use its id
    //and sieze the opportunity to update the record with details from the job object
    if (jobRecord != null) {
      jobID = jobRecord.id;

      final updatedJob = jobRecord.copyWith(
        jobType: job.jobType,
        companySuffix: job.companySuffix,
        employmentType: job.employmentType,
        getsTips: job.getsTips,
        levelOneTitle: job.levelOneTitle,
        levelOneBasePay: job.levelOneBasePay,
        levelTwoTitle: job.levelTwoTitle,
        levelTwoBasePay: job.levelTwoBasePay,
        levelThreeTitle: job.levelThreeTitle,
        levelThreeBasePay: job.levelThreeBasePay,
        qualifiedDisciplines: job.qualifiedDisciplines,
        qualifiedBranches: job.qualifiedBranches,
        healthInsuranceCoverage: job.healthInsuranceCoverage,
      );

      await _jobRepositories.jobRepositoryImpl.updateJob(updatedJob);
    }
    //if job doesnt exist in table, add it to the table and use the new record id
    else {
      final createdJobRecord =
          await _jobRepositories.jobRepositoryImpl.createJob(job);

      jobID = createdJobRecord.id;
    }

    //fulltime jobs are usually 9-5 with the exception of certain jobs

    late final Employment employment;

    //if job type is medical then use the medical configs
    if (job.jobType == JobType.medical.name) {
      final isDayShiftEmployment = Chance.getTrueOrFalse();

      employment = Employment(
        id: DatabaseConstants.dummyId,
        jobId: jobID,
        mainPersonId: mainPersonID,
        companyName: getRandomCompanyName(job.jobType),
        companyCountry: jobLocationPair.country,
        companyState: jobLocationPair.state,
        companySettlement: jobLocationPair.settlement,
        startTime: isDayShiftEmployment
            ? FullTimeJobInfo.medicalFullTimeJobDayShiftStartTimeInMinutes
            : FullTimeJobInfo.medicalFullTimeJobNightShiftStartTimeInMinutes,
        shiftLength: FullTimeJobInfo.medicalFullTimeJobShiftLength,
        dayOff: Random().nextInt(5) + 1, //btw 1-5
        isDayShift: isDayShiftEmployment,
        currentLevel: jobInterviewResponse.jobLevel,
        currentPay:
            getCurrentPay(job, jobInterviewResponse.jobLevel, gameEconomy),
        raisesGiven: 0,
        jobPerformance: FullTimeJobInfo.defaultJobPerformance,
        daysOfConsistentGoodPerformance: 0,
        vacationDaysLeft: FullTimeJobInfo.defaultVacationDays,
        onLeave: false,
        firstDay: currentDay,
        lastDay: 0,
        wasFired: false,
        isActive: true,
      );
    }
    //if it is blue collar work use blue collar config
    else if (job.jobType == JobType.blueCollar.name) {
      employment = Employment(
        id: DatabaseConstants.dummyId,
        jobId: jobID,
        mainPersonId: mainPersonID,
        companyName: getRandomCompanyName(job.jobType),
        companyCountry: jobLocationPair.country,
        companyState: jobLocationPair.state,
        companySettlement: jobLocationPair.settlement,
        startTime: FullTimeJobInfo.blueCollarFullTimeJobStartTimeInMinutes,
        shiftLength: FullTimeJobInfo.defaultFullTimeJobShiftLength,
        dayOff: FullTimeJobInfo.noDayOff,
        isDayShift: true,
        currentLevel: jobInterviewResponse.jobLevel,
        currentPay:
            getCurrentPay(job, jobInterviewResponse.jobLevel, gameEconomy),
        raisesGiven: 0,
        jobPerformance: FullTimeJobInfo.defaultJobPerformance,
        daysOfConsistentGoodPerformance: 0,
        vacationDaysLeft: FullTimeJobInfo.defaultVacationDays,
        onLeave: false,
        firstDay: currentDay,
        lastDay: 0,
        wasFired: false,
        isActive: true,
      );
    }
    //if it is sexwork, use sexwork configs
    else if (job.jobType == JobType.sexWork.name) {
      employment = Employment(
        id: DatabaseConstants.dummyId,
        jobId: jobID,
        mainPersonId: mainPersonID,
        companyName: getRandomCompanyName(job.jobType),
        companyCountry: jobLocationPair.country,
        companyState: jobLocationPair.state,
        companySettlement: jobLocationPair.settlement,
        startTime: FullTimeJobInfo.sexWorkFullTimeJobStartTimeInMinutes,
        shiftLength: FullTimeJobInfo.defaultFullTimeJobShiftLength,
        dayOff: FullTimeJobInfo.noDayOff,
        isDayShift: false,
        currentLevel: jobInterviewResponse.jobLevel,
        currentPay:
            getCurrentPay(job, jobInterviewResponse.jobLevel, gameEconomy),
        raisesGiven: 0,
        jobPerformance: FullTimeJobInfo.defaultJobPerformance,
        daysOfConsistentGoodPerformance: 0,
        vacationDaysLeft: FullTimeJobInfo.defaultVacationDays,
        onLeave: false,
        firstDay: currentDay,
        lastDay: 0,
        wasFired: false,
        isActive: true,
      );
    }
    //it's a standard 9-5
    else {
      employment = Employment(
        id: DatabaseConstants.dummyId,
        jobId: jobID,
        mainPersonId: mainPersonID,
        companyName: getRandomCompanyName(job.jobType),
        companyCountry: jobLocationPair.country,
        companyState: jobLocationPair.state,
        companySettlement: jobLocationPair.settlement,
        startTime: FullTimeJobInfo.defaultFullTimeJobStartTimeInMinutes,
        shiftLength: FullTimeJobInfo.defaultFullTimeJobShiftLength,
        dayOff: FullTimeJobInfo.noDayOff,
        isDayShift: true,
        currentLevel: jobInterviewResponse.jobLevel,
        currentPay:
            getCurrentPay(job, jobInterviewResponse.jobLevel, gameEconomy),
        raisesGiven: 0,
        jobPerformance: FullTimeJobInfo.defaultJobPerformance,
        daysOfConsistentGoodPerformance: 0,
        vacationDaysLeft: FullTimeJobInfo.defaultVacationDays,
        onLeave: false,
        firstDay: currentDay,
        lastDay: 0,
        wasFired: false,
        isActive: true,
      );
    }

    //create the employment
    await _jobRepositories.employmentRepositoryImpl
        .createEmployment(employment);
  }

  int getCurrentPay(Job job, int jobLevel, int gameEconomy) {
    //we take the level pay and we add 1-5% of it to it and then multiply it by the game economy
    late final int currentPay;
    if (jobLevel == 3) {
      currentPay = gameEconomy * job.levelThreeBasePay +
          ((Random().nextDouble() * 5) * job.levelThreeBasePay).toInt();
    } else if (jobLevel == 2) {
      currentPay = gameEconomy * job.levelTwoBasePay +
          ((Random().nextDouble() * 5) * job.levelTwoBasePay).toInt();
    } else {
      currentPay = gameEconomy * job.levelOneBasePay +
          ((Random().nextDouble() * 5) * job.levelOneBasePay).toInt();
    }

    return currentPay;
  }
}
