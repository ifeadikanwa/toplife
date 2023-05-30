import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/chat_interaction/chat_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class GameRelationshipInteractions {
  final RelationshipUsecases _relationshipUsecases;
  final JournalUsecases _journalUsecases;
  final PersonUsecases _personUsecases;

  const GameRelationshipInteractions(
    this._relationshipUsecases,
    this._journalUsecases,
    this._personUsecases,
  );

  //getter will be here, it will be called directly by relationship action screens view model

  ChatInteraction get chatInteraction => ChatInteraction(
        _relationshipUsecases,
        _journalUsecases,
        _personUsecases,
      );

  List<RelationshipInteraction> get all => [
        ChatInteraction(
          _relationshipUsecases,
          _journalUsecases,
          _personUsecases,
        ),
      ];

  List<RelationshipInteraction> get baby => [];

  List<RelationshipInteraction> get disownedChild => [];
}
