import 'package:toplife/main_systems/system_person/domain/usecases/update_specific_stats/update_energy_stats_usecase.dart';

class SleepUsecase {
  final UpdateEnergyStatsUsecase _updateEnergyStatsUsecase;

  const SleepUsecase(this._updateEnergyStatsUsecase);

  //let people pick hours and minutes to sleep for
  Future<void> execute({required int personID, required double hours}) async {
    final gainedEnergy = (hours * 10).floor();

    await _updateEnergyStatsUsecase.execute(
      mainPersonID: personID,
      change: gainedEnergy,
      override: false,
    );
  }
}
