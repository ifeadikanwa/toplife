import 'package:drift/drift.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

@DataClassName("Stance")
class StanceTable extends Table {
  @override
  String? get tableName => "stance";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get personId => integer().references(
        PersonTable,
        #id,
        onUpdate: KeyAction.cascade,
        onDelete: KeyAction.cascade,
      )();
  BoolColumn get openToAdoption => boolean()();
  BoolColumn get openToSexWorkerPartner => boolean()();
  BoolColumn get openToAbortion => boolean()();
  BoolColumn get openToSurrogacy => boolean()();
  BoolColumn get openToAlternativeFertilityMethods => boolean()();
  BoolColumn get openToSigningPrenup => boolean()();
  BoolColumn get wantsPartnerToSignPrenup => boolean()();
  BoolColumn get openToCrimes => boolean()();
  BoolColumn get openToStayAtHomeParenting => boolean()();
  BoolColumn get openToPremaritalSex => boolean()();
}
