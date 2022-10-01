import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/game_manager/data/dao/game_dao_impl.dart';
import 'package:toplife/game_manager/data/repository/game_repository_impl.dart';
import 'package:toplife/game_manager/domain/model/game.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/game_manager/presentation/game_manager_viewmodel.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_event/data/dao/event_dao_impl.dart';
import 'package:toplife/main_systems/system_event/data/repository/event_repository_impl.dart';
import 'package:toplife/main_systems/system_event/domain/repository/event_repository.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_manager.dart';
import 'package:toplife/main_systems/system_journal/data/dao/journal_dao_impl.dart';
import 'package:toplife/main_systems/system_journal/data/repository/journal_repository_impl.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/data/dao/baby_traits_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/person_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/relationship_traits_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/stance_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/dao/stats_dao_impl.dart';
import 'package:toplife/main_systems/system_person/data/repository/person_repositories.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/acquaintance_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/child_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/friend_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/graveyard_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/inlaw_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/parent_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/partner_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/relative_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/sibling_dao_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repositories.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

final ageUsecasesProvider = Provider<AgeUsecases>(((ref) {
  return AgeUsecases();
}));

final personUsecasesProvider = Provider<PersonUsecases>(((ref) {
  return PersonUsecases(
    personRepositories: PersonRepositories(
      personDao: PersonDaoImpl(),
      statsDao: StatsDaoImpl(),
      relationshipTraitsDao: RelationshipTraitsDaoImpl(),
      babyTraitsDao: BabyTraitsDaoImpl(),
      stanceDao: StanceDaoImpl(),
    ),
    ageUsecases: ref.watch(ageUsecasesProvider),
  );
}));

final relationshipUsecasesProvider = Provider<RelationshipUsecases>(((ref) {
  return RelationshipUsecases(
    relationshipRepositories: RelationshipRepositories(
      parentDao: ParentDaoImpl(),
      childDao: ChildDaoImpl(),
      siblingDao: SiblingDaoImpl(),
      partnerDao: PartnerDaoImpl(),
      friendDao: FriendDaoImpl(),
      acquaintanceDao: AcquaintanceDaoImpl(),
      relativeDao: RelativeDaoImpl(),
      inLawDao: InLawDaoImpl(),
      graveyardDao: GraveyardDaoImpl(),
    ),
    personUsecases: ref.watch(personUsecasesProvider),
  );
}));

final journalUsecasesProvider = Provider<JournalUsecases>(((ref) {
  return JournalUsecases(
    journalRepository: JournalRepositoryImpl(
      journalDao: JournalDaoImpl(),
    ),
  );
}));

final eventManagerProvider = Provider<EventManager>(((ref) {
  return EventManager(
      relationshipUsecases: ref.watch(relationshipUsecasesProvider),
      personUsecases: ref.watch(personUsecasesProvider),
      ageUsecases: ref.watch(ageUsecasesProvider),
      journalUsecases: ref.watch(journalUsecasesProvider),
      eventRepository: EventRepositoryImpl(eventDao: EventDaoImpl()));
}));

final eventRepositoryProvider = Provider<EventRepository>(((ref) {
  return EventRepositoryImpl(eventDao: EventDaoImpl());
}));

final currentGameProvider = StateProvider<Game?>(((ref) {
  final game = ref.watch(gameManagerViewModel);
  return game.valueOrNull;
}));

final gameManagerViewModel =
    StateNotifierProvider<GameManagerViewModel, AsyncValue<Game?>>((ref) {
  return GameManagerViewModel(gameUsecases: ref.watch(gameUsecasesProvider));
});

final gameUsecasesProvider = Provider<GameUsecases>(
  ((ref) => GameUsecases(
        ref.watch(gameRepositoryImplProvider),
        ref.watch(personUsecasesProvider),
        ref.watch(relationshipUsecasesProvider),
        ref.watch(ageUsecasesProvider),
      )),
);

final gameRepositoryImplProvider = Provider<GameRepositoryImpl>(
    ((ref) => GameRepositoryImpl(ref.watch(gameDaoImplProvider))));

final gameDaoImplProvider = Provider<GameDaoImpl>(((ref) => GameDaoImpl()));
