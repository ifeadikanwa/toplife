import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/partner_repository.dart';

class WatchAllActivePartnersUsecase {
  final PartnerRepository _partnerRepository;

  WatchAllActivePartnersUsecase(this._partnerRepository);

  Stream<List<Partner>> execute({required int mainPersonID}) {
    return _partnerRepository.watchAllActivePartners(mainPersonID);
  }
}
