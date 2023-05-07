import 'package:toplife/main_systems/system_person/domain/usecases/update_specific_stats/update_hunger_stats_usecase.dart';

class EatUsecase {
  final UpdateHungerStatsUsecase _updateHungerStatsUsecase;

  const EatUsecase(this._updateHungerStatsUsecase);

  Future<void> execute({required int personID, required int nutrition}) async {
    await _updateHungerStatsUsecase.execute(
      mainPersonID: personID,
      change: nutrition,
      override: false,
    );
  }
}
