import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/chat_interaction/chat_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/compliment_interaction/compliment_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/torment_interaction/torment_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class GameRelationshipInteractions {
  final RelationshipUsecases _relationshipUsecases;
  final JournalUsecases _journalUsecases;
  final PersonUsecases _personUsecases;
  final AgeUsecases _ageUsecases;

  const GameRelationshipInteractions(
    this._relationshipUsecases,
    this._journalUsecases,
    this._personUsecases,
    this._ageUsecases,
  );

  //getter will be here, it will be called directly by relationship action screens view model

  //*ALL INTERACTION INSTANCES
  ChatInteraction get chatInteraction => ChatInteraction(
        _relationshipUsecases,
        _journalUsecases,
        _personUsecases,
      );

  ComplimentInteraction get complimentInteraction => ComplimentInteraction(
        _relationshipUsecases,
        _journalUsecases,
        _personUsecases,
      );

  TormentInteraction get tormentInteraction => TormentInteraction(
        _relationshipUsecases,
        _journalUsecases,
        _personUsecases,
        _ageUsecases,
      );

  //*INTERACTION LISTS
  List<RelationshipInteraction> get all => [
        chatInteraction,
        complimentInteraction,
        tormentInteraction,
      ];

  List<RelationshipInteraction> get baby => [];

  List<RelationshipInteraction> get disownedChild => [];
}
