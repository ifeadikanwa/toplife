import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/update_specific_stats/update_athleticism_stats_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/update_specific_stats/update_energy_stats_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/update_specific_stats/update_health_stats_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/update_specific_stats/update_hunger_stats_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/update_specific_stats/update_intellect_stats_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/update_specific_stats/update_looks_stats_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/update_specific_stats/update_mood_stats_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/update_specific_stats/update_sober_stats_usecase.dart';

class UpdateStatsUsecase {
  final UpdateEnergyStatsUsecase _updateEnergyStatsUsecase;
  final UpdateHealthStatsUsecase _updateHealthStatsUsecase;
  final UpdateMoodStatsUsecase _updateMoodStatsUsecase;
  final UpdateHungerStatsUsecase _updateHungerStatsUsecase;
  final UpdateIntellectStatsUsecase _updateIntellectStatsUsecase;
  final UpdateSoberStatsUsecase _updateSoberStatsUsecase;
  final UpdateLooksStatsUsecase _updateLooksStatsUsecase;
  final UpdateAthleticismStatsUsecase _updateAthleticismStatsUsecase;

  const UpdateStatsUsecase(
    this._updateEnergyStatsUsecase,
    this._updateHealthStatsUsecase,
    this._updateMoodStatsUsecase,
    this._updateHungerStatsUsecase,
    this._updateIntellectStatsUsecase,
    this._updateSoberStatsUsecase,
    this._updateLooksStatsUsecase,
    this._updateAthleticismStatsUsecase,
  );

  Future<void> execute({
    required int mainPersonID,
    required bool override,
    int? energy,
    int? hunger,
    int? mood,
    int? health,
    int? sober,
    int? looks,
    int? athleticism,
    int? intellect,
  }) async {
    if (energy != null) {
      await _updateEnergyStatsUsecase.execute(
        mainPersonID: mainPersonID,
        change: energy,
        override: override,
      );
    }

    if (hunger != null) {
      await _updateHungerStatsUsecase.execute(
        mainPersonID: mainPersonID,
        change: hunger,
        override: override,
      );
    }

    if (health != null) {
      await _updateHealthStatsUsecase.execute(
        mainPersonID: mainPersonID,
        change: health,
        override: override,
      );
    }

    if (mood != null) {
      await _updateMoodStatsUsecase.execute(
        mainPersonID: mainPersonID,
        change: mood,
        override: override,
      );
    }

    if (athleticism != null) {
      await _updateAthleticismStatsUsecase.execute(
        mainPersonID: mainPersonID,
        change: athleticism,
        override: override,
      );
    }

    if (sober != null) {
      await _updateSoberStatsUsecase.execute(
        mainPersonID: mainPersonID,
        change: sober,
        override: override,
      );
    }

    if (looks != null) {
      await _updateLooksStatsUsecase.execute(
        mainPersonID: mainPersonID,
        change: looks,
        override: override,
      );
    }

    if (intellect != null) {
      await _updateIntellectStatsUsecase.execute(
        mainPersonID: mainPersonID,
        change: intellect,
        override: override,
      );
    }
  }
}
