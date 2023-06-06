import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/partner_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/partner.dart';

part 'partner_dao_impl.g.dart';

@DriftAccessor(tables: [PartnerTable])
class PartnerDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$PartnerDaoImplMixin
    implements PartnerDao {
  PartnerDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<Partner> createPartner(Partner partner) async {
    final Partner checkedPartner = partner.copyWith(
      relationship: crossCheckStat(partner.relationship),
    );

    await into(partnerTable).insertOnConflictUpdate(checkedPartner);
    return checkedPartner;
  }

  @override
  Future<void> deletePartner(int mainPersonID, int partnerID) {
    return (delete(partnerTable)
          ..where(
            (partner) =>
                partner.mainPersonId.equals(mainPersonID) &
                partner.partnerId.equals(partnerID),
          ))
        .go();
  }

  @override
  Future<Partner?> getAPartner(int mainPersonID, int partnerID) {
    return (select(partnerTable)
          ..where(
            (partner) =>
                partner.mainPersonId.equals(mainPersonID) &
                partner.partnerId.equals(partnerID),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<List<Partner>> getAllActivePartners(int mainPersonID) {
    return (select(partnerTable)
          ..where(
            (partner) =>
                partner.mainPersonId.equals(mainPersonID) &
                partner.isActive.equals(true),
          ))
        .get();
  }

  @override
  Future<List<Partner>> getAllCoparents(int mainPersonID) {
    return (select(partnerTable)
          ..where(
            (partner) =>
                partner.mainPersonId.equals(mainPersonID) &
                partner.isCoParent.equals(true) &
                partner.isActive.equals(false),
          ))
        .get();
  }

  @override
  Future<List<Partner>> getAllExes(int mainPersonID) {
    return (select(partnerTable)
          ..where(
            (partner) =>
                partner.mainPersonId.equals(mainPersonID) &
                partner.isActive.equals(false),
          ))
        .get();
  }

  @override
  Future<List<Partner>> getAllPartners(int mainPersonID) {
    return (select(partnerTable)
          ..where(
            (partner) => partner.mainPersonId.equals(mainPersonID),
          ))
        .get();
  }

  @override
  Future<Partner?> getCurrentPartner(int mainPersonID) {
    return (select(partnerTable)
          ..where(
            (partner) =>
                partner.mainPersonId.equals(mainPersonID) &
                partner.isActive.equals(true),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updatePartner(Partner partner) {
    final Partner checkedPartner = partner.copyWith(
      relationship: crossCheckStat(partner.relationship),
    );
    return update(partnerTable).replace(checkedPartner);
  }

  @override
  Stream<Partner?> watchAPartner(int mainPersonID, int partnerID) {
    return (select(partnerTable)
          ..where(
            (partner) =>
                partner.mainPersonId.equals(mainPersonID) &
                partner.partnerId.equals(partnerID),
          )
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Stream<List<Partner>> watchAllActivePartners(int mainPersonID) {
    return (select(partnerTable)
          ..where(
            (partner) =>
                partner.mainPersonId.equals(mainPersonID) &
                partner.isActive.equals(true),
          ))
        .watch();
  }

  @override
  Stream<List<Partner>> watchAllCoparents(int mainPersonID) {
    return (select(partnerTable)
          ..where(
            (partner) =>
                partner.mainPersonId.equals(mainPersonID) &
                partner.isCoParent.equals(true) &
                partner.isActive.equals(false),
          ))
        .watch();
  }

  @override
  Stream<List<Partner>> watchAllExes(int mainPersonID) {
    return (select(partnerTable)
          ..where(
            (partner) =>
                partner.mainPersonId.equals(mainPersonID) &
                partner.isActive.equals(false),
          ))
        .watch();
  }

  @override
  Stream<List<Partner>> watchAllPartners(int mainPersonID) {
    return (select(partnerTable)
          ..where(
            (partner) => partner.mainPersonId.equals(mainPersonID),
          ))
        .watch();
  }
}
