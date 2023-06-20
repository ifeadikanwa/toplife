import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

abstract class RelationshipInteraction extends Equatable {
  abstract final String title;
  abstract final String description;
  abstract final int durationInMinutes;
  //rules that check who this interaction is available for
  bool isAvailable({
    required AgeUsecases ageUsecases,
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
    required RelationshipPair relationshipPair,
    required String relationshipLabel,
    required InformalRelationshipType informalRelationshipType,
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
