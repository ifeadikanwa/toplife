import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/age/age_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/journal/journal_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/chat_interaction/chat_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/compliment_interaction/compliment_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/send_food_interaction/send_food_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/send_money_interaction/send_money_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/torment_interaction/torment_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_interaction.dart';

class GameRelationshipInteractions {
  final Ref _ref;

  const GameRelationshipInteractions({required Ref ref}) : _ref = ref;

  //getter will be here, it will be called directly by relationship action screens view model

  //*ALL INTERACTION INSTANCES
  ChatInteraction get chatInteraction => ChatInteraction(
        _ref.read(relationshipUsecasesProvider),
        _ref.read(journalUsecasesProvider),
      );

  ComplimentInteraction get complimentInteraction => ComplimentInteraction(
        _ref.read(relationshipUsecasesProvider),
        _ref.read(journalUsecasesProvider),
      );

  TormentInteraction get tormentInteraction => TormentInteraction(
        _ref.read(relationshipUsecasesProvider),
        _ref.read(journalUsecasesProvider),
        _ref.read(ageUsecasesProvider),
      );

  SendFoodInteraction get sendFoodInteraction => SendFoodInteraction(
        _ref.read(relationshipUsecasesProvider),
        _ref.read(journalUsecasesProvider),
        _ref.read(shopAndStorageUsecasesProvider),
        _ref.read(ageUsecasesProvider),
      );

  SendMoneyInteraction get sendMoneyInteraction => SendMoneyInteraction(
        _ref.read(relationshipUsecasesProvider),
        _ref.read(journalUsecasesProvider),
        _ref.read(personUsecasesProvider),
        _ref.read(ageUsecasesProvider),
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
