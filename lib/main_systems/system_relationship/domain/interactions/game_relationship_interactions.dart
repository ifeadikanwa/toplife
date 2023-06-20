import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/chat_interaction/chat_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/compliment_interaction/compliment_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/send_food_interaction/send_food_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/send_money_interaction/send_money_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/torment_interaction/torment_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

class GameRelationshipInteractions {
  final RelationshipUsecases _relationshipUsecases;
  final JournalUsecases _journalUsecases;
  final PersonUsecases _personUsecases;
  final ShopAndStorageUsecases _shopAndStorageUsecases;

  const GameRelationshipInteractions(
    this._relationshipUsecases,
    this._journalUsecases,
    this._personUsecases,
    this._shopAndStorageUsecases,
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
      );

  SendFoodInteraction get sendFoodInteraction => SendFoodInteraction(
        _relationshipUsecases,
        _journalUsecases,
        _personUsecases,
        _shopAndStorageUsecases,
      );

  SendMoneyInteraction get sendMoneyInteraction => SendMoneyInteraction(
        _relationshipUsecases,
        _journalUsecases,
        _personUsecases,
      );

  //*INTERACTION LISTS
  List<RelationshipInteraction> get all => [
        chatInteraction,
        complimentInteraction,
        tormentInteraction,
        sendFoodInteraction,
        sendMoneyInteraction,
      ];

  List<RelationshipInteraction> get baby => [];

  List<RelationshipInteraction> get disownedChild => [];
}
