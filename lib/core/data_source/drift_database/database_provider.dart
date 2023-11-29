import 'dart:io';

// These imports are used to open the database
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:toplife/game_manager/data/dao/game_dao_impl.dart';
import 'package:toplife/game_manager/domain/model/game.dart';
import 'package:toplife/main_systems/system_event/data/dao/event_dao_impl.dart';
import 'package:toplife/main_systems/system_job/data/dao/job_dao_impl.dart';
import 'package:toplife/main_systems/system_job/data/dao/employment_dao_impl.dart';
import 'package:toplife/main_systems/system_job/data/dao/job_relationship_dao_impl.dart';
import 'package:toplife/main_systems/system_job/domain/model/employment.dart';
import 'package:toplife/main_systems/system_job/domain/model/job_relationship.dart';
import 'package:toplife/main_systems/system_job/domain/model/job.dart';
import 'package:toplife/main_systems/system_person/data/dao/appearance_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/death_record_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/deplete_stats_flag_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/baby_traits_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/personality_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/piercing_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/stance_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/stats_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/tattoo_dao_impl.dart';
import 'package:toplife/main_systems/system_person/domain/model/appearance.dart';
import 'package:toplife/main_systems/system_person/domain/model/baby_traits.dart';
import 'package:toplife/main_systems/system_person/domain/model/death_record.dart';
import 'package:toplife/main_systems/system_person/domain/model/deplete_stats_flag.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/model/personality.dart';
import 'package:toplife/main_systems/system_person/domain/model/piercing.dart';
import 'package:toplife/main_systems/system_person/domain/model/stance.dart';
import 'package:toplife/main_systems/system_person/domain/model/stats.dart';
import 'package:toplife/main_systems/system_person/domain/model/tattoo.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/data/dao/recurring_bill_dao_impl.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/model/recurring_bill.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/acquaintance_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/child_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/friend_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/grave_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/inlaw_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/parent_child_link_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/parent_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/partner_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/relationship_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/relative_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/romantic_relationship_info_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/sibling_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/acquaintance.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/child.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/friend.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/grave.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/inlaw.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/parent.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/parent_child_link.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/partner.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/relationship.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/relative.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/romantic_relationship_info.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/sibling.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';
import 'package:toplife/main_systems/system_school/data/dao/degree_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/dao/school_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/dao/school_project_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/dao/school_relationship_dao_impl.dart';
import 'package:toplife/main_systems/system_school/domain/model/degree.dart';
import 'package:toplife/main_systems/system_school/domain/model/school.dart';
import 'package:toplife/main_systems/system_school/domain/model/school_project.dart';
import 'package:toplife/main_systems/system_school/domain/model/school_relationship.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/car_problem_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/current_home_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/storeroom_item_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car_problem.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/current_home.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/storeroom_item.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/car_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/food_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/fridge_food_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/item_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/jewelry_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/data/dao/house_dao_impl.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/food.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/fridge_food.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/house.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/item.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/jewelry.dart';
import 'package:toplife/main_systems/system_journal/domain/model/journal.dart';
import 'package:toplife/main_systems/system_journal/data/dao/journal_dao_impl.dart';

part 'database_provider.g.dart';

@DriftDatabase(
  tables: [
    GameTable,
    PersonTable,
    AppearanceTable,
    StatsTable,
    DepleteStatsFlagTable,
    PersonalityTable,
    StanceTable,
    TattooTable,
    PiercingTable,
    BabyTraitsTable,
    DeathRecordTable,
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
    CarTable,
    CarProblemTable,
    FoodTable,
    FridgeFoodTable,
    HouseTable,
    CurrentHomeTable,
    ItemTable,
    JewelryTable,
    StoreroomItemTable,
    JournalTable,
    RecurringBillTable,
    DegreeTable,
    SchoolProjectTable,
    SchoolRelationshipTable,
    SchoolTable,
    JobTable,
    EmploymentTable,
    JobRelationshipTable,
    ParentChildLinkTable,
    RelationshipTable,
    RomanticRelationshipInfoTable,
  ],
  daos: [
    GameDaoImpl,
    PersonDaoImpl,
    AppearanceDaoImpl,
    StatsDaoImpl,
    DepleteStatsFlagDaoImpl,
    StanceDaoImpl,
    PersonalityDaoImpl,
    TattooDaoImpl,
    PiercingDaoImpl,
    BabyTraitsDaoImpl,
    DeathRecordDaoImpl,
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
    CarDaoImpl,
    CarProblemDaoImpl,
    FoodDaoImpl,
    FridgeFoodDaoImpl,
    HouseDaoImpl,
    CurrentHomeDaoImpl,
    ItemDaoImpl,
    JewelryDaoImpl,
    StoreroomItemDaoImpl,
    JournalDaoImpl,
    RecurringBillDaoImpl,
    DegreeDaoImpl,
    SchoolDaoImpl,
    SchoolProjectDaoImpl,
    SchoolRelationshipDaoImpl,
    JobDaoImpl,
    EmploymentDaoImpl,
    JobRelationshipDaoImpl,
    ParentChildLinkDaoImpl,
    RelationshipDaoImpl,
    RomanticRelationshipInfoDaoImpl,
  ],
)
class DatabaseProvider extends _$DatabaseProvider {
  DatabaseProvider() : super(_openConnection());

  DatabaseProvider.forTesting(super.e);

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
    // put the database file, into the documents folder for your app.
    //Note: when debuging on windows the db file is in documents folder
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'game_db.sqlite'));

    return NativeDatabase.createInBackground(file, logStatements: true);
  });
}
