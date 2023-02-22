import 'dart:io';

// These imports are used to open the database
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:toplife/game_manager/data/dao/game_dao_impl.dart';
import 'package:toplife/game_manager/domain/model/game.dart';
import 'package:toplife/main_systems/system_event/data/dao/event_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/relationship_traits_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/baby_traits_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/stance_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/stats_dao_impl.dart';
import 'package:toplife/main_systems/system_person/domain/model/baby_traits.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/model/relationship_traits.dart';
import 'package:toplife/main_systems/system_person/domain/model/stance.dart';
import 'package:toplife/main_systems/system_person/domain/model/stats.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/acquaintance_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/child_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/friend_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/grave_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/inlaw_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/parent_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/partner_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/relative_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/sibling_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/acquaintance.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/child.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/friend.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/grave.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/inlaw.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/parent.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/partner.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/relative.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/sibling.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';

part 'database_provider.g.dart';

@DriftDatabase(
  tables: [
    GameTable,
    PersonTable,
    StatsTable,
    StanceTable,
    BabyTraitsTable,
    RelationshipTraitsTable,
    AcquaintanceTable,
    ChildTable,
    FriendTable,
    GraveTable,
    InLawTable,
    ParentTable,
    PartnerTable,
    RelativeTable,
    SiblingTable,
    EventTable,
  ],
  daos: [
    GameDaoImpl,
    PersonDaoImpl,
    StatsDaoImpl,
    StanceDaoImpl,
    BabyTraitsDaoImpl,
    RelationshipTraitsDaoImpl,
    AcquaintanceDaoImpl,
    ChildDaoImpl,
    FriendDaoImpl,
    GraveDaoImpl,
    InLawDaoImpl,
    ParentDaoImpl,
    PartnerDaoImpl,
    RelativeDaoImpl,
    SiblingDaoImpl,
    EventDaoImpl,
  ],
)
class DatabaseProvider extends _$DatabaseProvider {
  DatabaseProvider() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        //enabling foriegn keys
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called drift_test.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'game_db.sqlite'));

    return NativeDatabase.createInBackground(file, logStatements: true);
  });
}
