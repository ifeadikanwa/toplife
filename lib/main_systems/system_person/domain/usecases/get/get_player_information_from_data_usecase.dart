import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/job_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/player_information.dart';

class GetPlayerInformationFromDataUsecase {
  final AgeUsecases _ageUsecases;
  const GetPlayerInformationFromDataUsecase(
    this._ageUsecases,
  );

  Future<PlayerInformation> execute({
    required JobUsecases jobUsecases,
    required Game? game,
    required Person? player,
    required Stats? stats,
    required List<Employment> activeEmployments,
  }) async {
    //if player is null, set blank data or else set correct data
    //if stats is null, set blank data or else set correct data
    //convert list of employments

    //create a blank player information
    PlayerInformation playerInformation =
        PlayerInformation.blankPlayerInformation;

    //fill it with data available

    //person data
    if (player != null && game != null) {
      playerInformation = playerInformation.copyWith(
        firstName: player.firstName,
        lastName: player.lastName,
        age: _ageUsecases.getPersonAgeUsecase
            .execute(dayOfBirth: player.dayOfBirth, currentDay: game.currentDay)
            .lifeStage
            .stageName,
        country: player.currentCountry,
      );
    }

    //stats data
    if (stats != null) {
      playerInformation = playerInformation.copyWith(stats: stats);
    }

    //job data
    playerInformation = playerInformation.copyWith(
      jobTitles: await jobUsecases.getJobTitlesFromEmploymentsUsecase.execute(
        employments: activeEmployments,
      ),
    );

    return playerInformation;
  }
}
