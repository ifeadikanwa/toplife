import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/acquaintance_repository.dart';

class WatchAcquaintanceUsecase {
  final AcquaintanceRepository _acquaintanceRepository;

  const WatchAcquaintanceUsecase(this._acquaintanceRepository);

  Stream<Acquaintance?> execute({
    required int mainPersonID,
    required int acquaintanceID,
  }) {
    return _acquaintanceRepository.watchAcquaintance(mainPersonID, acquaintanceID);
  }
}
