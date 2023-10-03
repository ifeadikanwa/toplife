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
  BoolColumn get openToMarriage => boolean()();
  BoolColumn get openToSexWorkerPartner => boolean()();
  BoolColumn get openToAbortion => boolean()();
  BoolColumn get openToSurrogacy => boolean()();
  BoolColumn get openToAlternativeFertilityMethods => boolean()();
  BoolColumn get openToSigningPrenup => boolean()();
  BoolColumn get wantsPartnerToSignPrenup => boolean()();
  BoolColumn get openToCrimes => boolean()();
  BoolColumn get openToStayAtHomeParenting => boolean()();
  BoolColumn get openToPremaritalSex => boolean()();
  BoolColumn get openToWorkingAJob => boolean()();
  BoolColumn get openToBeingPregnant => boolean()();
  BoolColumn get openToHavingChildren => boolean()();
  //
  //partner: will demand marriage if the player gets pregnant(female player) or the partner gets pregnant(male player)
  //parents: will kick player out if player gets pregnant or their female partner gets pregnant. we can schedule an event where the parents basically come around and ask to see their grandchild.
  BoolColumn get openToHavingChildrenOutsideAMarriage => boolean()();
  //
  //partner: if they had their first child with the player without being in a relationship, we schedule events where they basically want to have another kid and ask the player to make one with them.
  BoolColumn get openToHavingMultipleCoparents => boolean()();
  BoolColumn get openToCheating => boolean()();

  //  
  //A gay person that is not open to gay people will be agree to a sexual relationship but not an exclusive relationship
  //That means they might have sex with other gay people but they will never date or marry a gay person unless they change their stance.
  //These are the people that end up in a fake straight relationship.
  //
  //A straight person with this stance will just have a hard time building a relationship with gay people
  BoolColumn get openToGayPeople => boolean()();
}
