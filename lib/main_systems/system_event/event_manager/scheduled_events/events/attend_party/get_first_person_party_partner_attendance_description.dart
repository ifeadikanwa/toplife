import 'dart:math';

import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_party/party_event_descriptions.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/partner.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_relationship/util/get_active_partner_label.dart';

class GetFirstPersonPartyPartnerAttendanceDescription {
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;

  const GetFirstPersonPartyPartnerAttendanceDescription(
    this._personUsecases,
    this._relationshipUsecases,
  );

  Future<String> execute({
    required int mainPlayerID,
  }) async {
    final Partner? currentPartner = await _relationshipUsecases
        .getCurrentPartnerUsecase
        .execute(mainPlayerID);

    if (currentPartner != null) {
      final Person? partnerPerson =
          await _personUsecases.getPersonUsecase.execute(
        personID: currentPartner.partnerID,
      );

      if (partnerPerson != null) {
        final partnerRelationshipLabel = getActivePartnerLabel(
          partnerPerson.gender,
          currentPartner.partnerRelationshipType,
        );

        final bool partnerAgreedToCome =
            Chance.getTrueOrFalseBasedOnPercentageChance(
          trueChancePercentage: 70,
        );

        final int currentRelationship = currentPartner.relationship;

        late final String firstPersonPartnerAttendanceDesc;

        if (partnerAgreedToCome) {
          firstPersonPartnerAttendanceDesc =
              "My $partnerRelationshipLabel, ${partnerPerson.firstName} agreed to accompany me.";

          _relationshipUsecases.updatePartnerRelationshipUsecase.execute(
            currentPartner.copyWith(
              relationship: currentRelationship + Random().nextInt(15),
            ),
          );
        } else {
          firstPersonPartnerAttendanceDesc =
              "My $partnerRelationshipLabel, ${partnerPerson.firstName} didn't come with me, ${PartyEventDescriptions.getRandomFirstPersonPartnerExcuse(partnerPerson.gender)}";

          _relationshipUsecases.updatePartnerRelationshipUsecase.execute(
            currentPartner.copyWith(
              relationship: currentRelationship - Random().nextInt(15),
            ),
          );
        }

        return firstPersonPartnerAttendanceDesc;
      }
    }

    return "";
  }
}
