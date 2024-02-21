import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/numbers/get_random_int_in_positive_range.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_event/funeral_descriptions.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attend_event/party_event_descriptions.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_id_pair.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_person/util/get_fullname_string.dart';
import 'package:toplife/main_systems/system_person/util/get_unknown_id_from_person_id_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_and_romantic_relationship_label_from_string.dart.dart';

class GetFirstPersonEventPartnerAttendanceDescription {
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;

  const GetFirstPersonEventPartnerAttendanceDescription(
    this._personUsecases,
    this._relationshipUsecases,
  );

  Future<String> execute(
      {required int mainPlayerID, required EventType eventType}) async {
    final Relationship? currentSpouseRelationship = await _relationshipUsecases
        .getMarriagePartnerRelationshipUsecase
        .execute(personID: mainPlayerID);

    if (currentSpouseRelationship != null) {
      final int spouseID = getUnkownIdFromPersonIdPair(
        personIdPair: PersonIdPair(
          firstId: currentSpouseRelationship.firstPersonId,
          secondId: currentSpouseRelationship.secondPersonId,
        ),
        knownId: mainPlayerID,
      );
      final spousePerson =
          await _personUsecases.getPersonUsecase.execute(personID: spouseID);

      if (spousePerson != null) {
        final partnerRelationshipLabel =
            getPlatonicAndRomanticRelationshipLabelFromString(
          genderString: spousePerson.gender,
          platonicRelationshipTypeString:
              currentSpouseRelationship.platonicRelationshipType,
          romanticRelationshipTypeString:
              currentSpouseRelationship.romanticRelationshipType,
          previousFamilialRelationshipString:
              currentSpouseRelationship.previousFamilialRelationship,
          isCoParent: currentSpouseRelationship.isCoParent,
          activeRomance: currentSpouseRelationship.activeRomance,
        );

        final bool partnerAgreedToCome =
            Chance.getTrueOrFalseBasedOnPercentageChance(
          trueChancePercentage: 70,
        );

        late final String firstPersonPartnerAttendanceDesc;

        late final int relationshipChange;

        final String spouseFullName = getFullNameString(
          firstName: spousePerson.firstName,
          lastName: spousePerson.lastName,
        );

        if (partnerAgreedToCome) {
          firstPersonPartnerAttendanceDesc =
              "My $partnerRelationshipLabel, $spouseFullName agreed to accompany me.";

          relationshipChange = getRandomIntInPositiveRange(
            min: 0,
            max: 15,
          );
        } else {
          //get partner excuse
          late final String partnerExcuse;
          switch (eventType) {
            //special case
            case EventType.funeral:
              partnerExcuse =
                  FuneralDescriptions.getRandomFirstPersonPartnerExcuse(
                spousePerson.gender,
              );
            //others
            case EventType.birthdayParty:
            case EventType.wedding:
            case EventType.graduation:
            case EventType.schoolAdmission:
            case EventType.engagement:
            case EventType.birthday:
            case EventType.death:
            case EventType.askForSchoolTuition:
            case EventType.employment:
              partnerExcuse = PartyEventDescriptions
                  .getRandomGeneralFirstPersonPartnerExcuse(
                      spousePerson.gender);
          }

          //build sentence
          firstPersonPartnerAttendanceDesc =
              "My $partnerRelationshipLabel, $spouseFullName didn't come with me, $partnerExcuse";

          relationshipChange = -(getRandomIntInPositiveRange(
            min: 0,
            max: 30,
          ));
        }

        //update relationship level
        await _relationshipUsecases.updateRelationshipLevelUsecase.execute(
          firstPersonID: currentSpouseRelationship.firstPersonId,
          secondPersonID: currentSpouseRelationship.secondPersonId,
          change: relationshipChange,
        );

        return firstPersonPartnerAttendanceDesc;
      }
    }

    return "";
  }
}
