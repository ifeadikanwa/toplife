import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_person/util/get_fullname_string.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_relationship/util/check/check_if_platonic_relationship_type_contains.dart';
import 'package:toplife/main_systems/system_relationship/util/label/get_platonic_and_romantic_relationship_label_from_string.dart.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/precollege_info.dart';
import 'package:toplife/main_systems/system_school/domain/repository/school_repository.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/precollege/grades/get_specific_precollege_grade_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/precollege/manage/get_specific_precollege_school_usecase.dart';
import 'package:toplife/main_systems/system_school/util/convert_grade_number_to_grade_letter.dart';
import 'package:toplife/main_systems/system_school/util/get_precollege_naming_suffix_for_a_lifestage_in_a_country.dart';

class ReportPlayerAndNPCPrecollegeGraduationGradeUsecase {
  final PersonUsecases _personUsecases;
  final GetSpecificPrecollegeSchoolUsecase _getSpecificPrecollegeSchoolUsecase;
  final GetSpecificPrecollegeGradeUsecase _getSpecificPrecollegeGradeUsecase;
  final SchoolRepository _schoolRepository;
  final RelationshipUsecases _relationshipUsecases;
  final JournalUsecases _journalUsecases;
  final DialogHandler _dialogHandler;

  const ReportPlayerAndNPCPrecollegeGraduationGradeUsecase(
    this._personUsecases,
    this._getSpecificPrecollegeSchoolUsecase,
    this._getSpecificPrecollegeGradeUsecase,
    this._schoolRepository,
    this._relationshipUsecases,
    this._journalUsecases,
    this._dialogHandler,
  );

  Future<void> execute({
    required int personID,
    required int currentPlayerID,
    required int currentDay,
    required SchoolType precollegeSchoolType,
  }) async {
    //get person
    final Person? person = await _personUsecases.getPersonUsecase.execute(
      personID: personID,
    );

    //get the precollege record
    final PrecollegeInfo? precollegeInfo =
        await _getSpecificPrecollegeSchoolUsecase.execute(
      personID: personID,
      precollegeSchoolType: precollegeSchoolType,
    );

    //get their grade for the precollege school type
    final int numberGrade = await _getSpecificPrecollegeGradeUsecase.execute(
      personID: personID,
      precollegeSchoolType: precollegeSchoolType,
    );
    final String letterGrade = convertGradeNumberToGradeLetter(
      gradeNumber: numberGrade,
    );

    //if person and precollege record is valid (if there is no valid precollege, we can't claim they graduated)
    if (person != null && precollegeInfo != null) {
      //get the school attended
      final School? school = await _schoolRepository.getSchool(
        precollegeInfo.precollege.currentSchoolId,
      );

      //if school is valid
      if (school != null) {
        //check if the person is the current player
        final bool personIsCurrentPlayer = person.id == currentPlayerID;

        //get the report journal entry
        String journalEntry = "";

        //if it is the current player
        if (personIsCurrentPlayer) {
          journalEntry =
              "I graduated from ${school.name} with a grade of $letterGrade";
        }
        //if it is not the player, we only want to report if the person has a non-acquaintance relationship with the player
        else {
          final Relationship? relationship =
              await _relationshipUsecases.getRelationshipUsecase.execute(
            firstPersonID: currentPlayerID,
            secondPersonID: person.id,
          );

          if (relationship != null &&
              !checkIfPlatonicRelationshipTypeStringContains(
                relationship.platonicRelationshipType,
                PlatonicRelationshipType.acquaintance,
              )) {
            //get relationship label
            final String relationshipLabel =
                getPlatonicAndRomanticRelationshipLabelFromString(
              genderString: person.gender,
              platonicRelationshipTypeString:
                  relationship.platonicRelationshipType,
              romanticRelationshipTypeString:
                  relationship.romanticRelationshipType,
              previousFamilialRelationshipString:
                  relationship.previousFamilialRelationship,
              isCoParent: relationship.isCoParent,
              activeRomance: relationship.activeRomance,
            );

            final String fullName = getFullNameString(
              firstName: person.firstName,
              lastName: person.lastName,
            );
            journalEntry =
                "My $relationshipLabel, $fullName graduated from ${school.name} with a grade of $letterGrade";
          }
        }

        //log in journal, if we have an entry
        if (journalEntry.isNotEmpty) {
          await _journalUsecases.addToJournalUsecase.execute(
            gameID: person.gameId,
            day: currentDay,
            mainPlayerID: currentPlayerID,
            entry: journalEntry,
          );
        }

        //if it is the player, we want to show a dialog
        if (personIsCurrentPlayer) {
          //get the precollege naming suffix
          final String precollegeNamingSuffix =
              getPrecollegeNamingSuffixForALifeStageInACountry(
            lifeStage: precollegeInfo.lifeStage,
            countryString: person.currentCountry,
          );

          //show dialog
          return _dialogHandler.showResultDialog(
            title: "$precollegeNamingSuffix Graduate",
            result: SentenceUtil.convertFromFirstPersonToSecondPerson(
              firstPersonSentence: journalEntry,
            ),
          );
        }
      }
    }
  }
}
