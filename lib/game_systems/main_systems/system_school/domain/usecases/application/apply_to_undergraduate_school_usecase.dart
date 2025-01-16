import 'dart:math';

import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/school_info.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/model/info_models/school_application_response.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/get_or_create_degree_usecase.dart';

class ApplyToUndergraduateSchoolUsecase {
  final GetOrCreateDegreeUsecase _getOrCreateDegreeUsecase;

  const ApplyToUndergraduateSchoolUsecase({
    required GetOrCreateDegreeUsecase getOrCreateDegreeUsecase,
  })  : _getOrCreateDegreeUsecase = getOrCreateDegreeUsecase;

  Future<SchoolApplicationResponse> execute(
      {required Degree degree, required int gameEconomy}) async {
    //everyone qualifies for undergraduate school
    //here the application result, school fees, and scholarship info is calculated
    //all tha admission information is made ready here and the popup will reveal the info as the user request it.
    //(example if the user has scholarship but they didnt apply for it in the popup then they dont get it.)

    //takes in the chosen degree.
    //takes in game economy.
    //find degree in the table or else create it
    //returns application response

    final Degree degreeRecord =
        await _getOrCreateDegreeUsecase.execute(degree: degree);

    return SchoolApplicationResponse(
      degreeID: degreeRecord.id,
      accepted: true,
      //amount = base cost * game economy + (1-5% of base cost for variability)
      schoolFeesPerSemesterAmount:
          SchoolInfo.undergraduateDegreeBaseCost * gameEconomy +
              (0.05 *
                      Random().nextDouble() *
                      SchoolInfo.undergraduateDegreeBaseCost)
                  .toInt(),
      appliedForScholarship: false,
      //scholarship = random percentage between 0-30%
      scholarshipPercentage: Random().nextInt(4) * 10,
    );
  }
}
