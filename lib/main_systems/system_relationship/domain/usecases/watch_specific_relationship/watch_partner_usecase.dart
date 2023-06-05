import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/partner_repository.dart';

class WatchPartnerUsecase {
  final PartnerRepository _partnerRepository;

  const WatchPartnerUsecase(this._partnerRepository);

  Stream<Partner?> execute({
    required int mainPersonID,
    required int partnerID,
  }) {
    return _partnerRepository.watchAPartner(mainPersonID, partnerID);
  }
}
