import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_pair.dart';

abstract class RelationshipInteraction extends Equatable {
  abstract final String title;
  abstract final String description;
  abstract final int durationInMinutes;

  //rules that check who this interaction is available for
  bool isAvailable({
    required int currentDay,
    required Person currentPlayer,
    required Person relationshipPerson,
    required bool livingTogether,
  });

  //the execution of the interaction.
  //No checks are done here because if this was available for execution it must have passed the isAvailable check.
  Future<void> execute({
    required BuildContext context,
    required Game currentGame,
    required Person currentPlayer,
    required PersonRelationshipPair personRelationshipPair,
    required String relationshipLabel,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        durationInMinutes,
        isAvailable,
        execute,
      ];
}
