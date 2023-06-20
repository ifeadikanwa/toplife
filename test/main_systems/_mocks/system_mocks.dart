import 'package:mockito/annotations.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_manager.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/job_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/recurring_bills_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/school_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

@GenerateMocks([
  //person
  Person,
  Stats,
  Stance,
  PersonUsecases,

  //game
  Game,
  GameUsecases,

  //job
  Job,
  JobUsecases,

  //school
  School,
  SchoolRelationship,
  SchoolProject,
  SchoolUsecases,

  //journal
  Journal,
  JournalUsecases,

  //event
  Event,
  EventManager,

  //recurring bills and loans
  RecurringBill,
  RecurringBillsUsecases,

  //relationship
  RelationshipUsecases,

  //shop and storage
  ShopAndStorageUsecases,
])
void main() {}
