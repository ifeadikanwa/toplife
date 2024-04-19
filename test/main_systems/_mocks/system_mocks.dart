import 'package:mockito/annotations.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_manager.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/job_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/recurring_bills_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/get_family_through_deductions/get_siblings_through_deduction_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/school_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

@GenerateNiceMocks([
  //person
  MockSpec<Person>(),
  MockSpec<Stats>(),
  MockSpec<Stance>(),
  MockSpec<PersonUsecases>(),

  //game
  MockSpec<Game>(),
  MockSpec<GameUsecases>(),

  //job
  MockSpec<Job>(),
  MockSpec<JobUsecases>(),

  //school
  MockSpec<School>(),
  MockSpec<SchoolRelationship>(),
  MockSpec<SchoolProject>(),
  MockSpec<SchoolUsecases>(),

  //journal
  MockSpec<Journal>(),
  MockSpec<JournalUsecases>(),

  //event
  MockSpec<Event>(),
  MockSpec<EventManager>(),

  //recurring bills and loans
  MockSpec<RecurringBill>(),
  MockSpec<RecurringBillsUsecases>(),

  //relationship
  MockSpec<RelationshipUsecases>(),
  MockSpec<GetSiblingsThroughDeductionUsecase>(),

  //shop and storage
  MockSpec<ShopAndStorageUsecases>(),

  //age
  MockSpec<AgeUsecases>(),

  //dialog
  MockSpec<DialogHandler>(),
])
void main() {}
