import 'dart:async';

import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/attendable_event_info.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_text.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attendable_events/util/check_if_event_is_party.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attendable_events/util/get_attendable_event_text.dart';
import 'package:toplife/main_systems/system_event/util/convert_event_type_string_to_enum.dart';
import 'package:toplife/main_systems/system_event/util/get_attendable_event_location.dart';
import 'package:toplife/main_systems/system_event/util/get_attendable_event_time.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_relationship/util/label/get_platonic_and_romantic_relationship_label_from_string.dart.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/storeroom_item_pair.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

class GetAttendableEventInformation {
  final RelationshipUsecases _relationshipUsecases;
  final AgeUsecases _ageUsecases;
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  final PersonUsecases _personUsecases;

  const GetAttendableEventInformation(
    this._relationshipUsecases,
    this._ageUsecases,
    this._shopAndStorageUsecases,
    this._personUsecases,
  );

  Future<AttendableEventInfo?> execute({
    required Event event,
    required Person eventMainPerson,
    required int currentPlayerId,
  }) async {
    // get event type
    final EventType? eventType = convertEventTypeStringToEnum(event.eventType);

    //get the relationship between player and event main person
    final Relationship? relationshipWithPlayer =
        await _relationshipUsecases.getRelationshipUsecase.execute(
      firstPersonID: currentPlayerId,
      secondPersonID: eventMainPerson.id,
    );

    //if there is a valid relationship and event type
    if (relationshipWithPlayer != null && eventType != null) {
      //get relationship label
      final String relationshipLabel =
          getPlatonicAndRomanticRelationshipLabelFromString(
        genderString: eventMainPerson.gender,
        platonicRelationshipTypeString:
            relationshipWithPlayer.platonicRelationshipType,
        romanticRelationshipTypeString:
            relationshipWithPlayer.romanticRelationshipType,
        previousFamilialRelationshipString:
            relationshipWithPlayer.previousFamilialRelationship,
        isCoParent: relationshipWithPlayer.isCoParent,
        activeRomance: relationshipWithPlayer.activeRomance,
      );

      //get age
      final Age eventMainPersonAge = _ageUsecases.getPersonsAgeUsecase.execute(
        dayOfBirth: eventMainPerson.dayOfBirth,
        currentDay: event.eventDay,
      );

      //Get all the event Text for this event
      final EventText eventText = GetAttendableEventText.execute(
        eventType: eventType,
        eventMainPerson: eventMainPerson,
        relationshipLabel: relationshipLabel,
        age: eventMainPersonAge,
      );

      //check if the event is a party
      final bool isParty = checkIfEventIsParty(eventType);

      //get player spouse
      final Relationship? playerSpouse = await _relationshipUsecases
          .getMarriagePartnerRelationshipUsecase
          .execute(
        personID: currentPlayerId,
      );
      //check if player has spouse
      final bool hasActiveSpouse = playerSpouse != null;

      //false -> attend alone, true -> attend with partner
      final List<bool> attendWithOptions =
          (hasActiveSpouse) ? [false, true] : [false];

      //get and set gift options in storage
      final List<StoreroomItemPair> giftOptionsInStorage =
          await _shopAndStorageUsecases.getStoreroomItemPairsUsecase.execute(
        currentPlayerId,
      );

      //get and set player max money
      final int maxPlayerMoney =
          await _personUsecases.getPlayerMoneyUsecase.execute(
        mainPlayerID: currentPlayerId,
      );

      //get event time string
      final String eventTime = getAttendableEventTime(
        event: event,
      );

      //get event location string
      final String eventLocation = getAttendableEventLocation(
        state: eventMainPerson.currentState,
        country: eventMainPerson.currentCountry,
      );

      return AttendableEventInfo(
        eventText: eventText,
        eventTime: eventTime,
        eventLocation: eventLocation,
        eventType: eventType,
        isParty: isParty,
        maxPlayerMoney: maxPlayerMoney,
        attendWithOptions: attendWithOptions,
        giftOptionsInStorage: giftOptionsInStorage,
      );
    }

    //return null
    return null;
  }
}
