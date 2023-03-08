import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/partner_repository.dart';

class WatchAllCoparentsUsecase {
  final PartnerRepository _partnerRepository;

  WatchAllCoparentsUsecase(this._partnerRepository);

  Stream<List<Partner>> execute({required int mainPersonID}) {
    return _partnerRepository.watchAllCoparents(mainPersonID);
  }
}
