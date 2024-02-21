import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/numbers/get_random_int_in_positive_range.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range_constants.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/existing_relationship_override_instruction.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_relationship/util/get_acquaintance_relationship_from_template.dart';
import 'package:toplife/main_systems/system_school/constants/school_info.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/precollege_person_pair.dart';
import 'package:toplife/main_systems/system_school/domain/repository/precollege_repository.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/create/create_or_update_precollege_usecase.dart';
import 'package:toplife/main_systems/system_school/util/generate_precollege_with_random_grade.dart';

class GeneratePrecollegeSchoolmatesUsecase {
  final PrecollegeRepository _precollegeRepository;
  final CreateOrUpdatePrecollegeUsecase _createOrUpdatePrecollegeUsecase;
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;

  const GeneratePrecollegeSchoolmatesUsecase(
    this._precollegeRepository,
    this._createOrUpdatePrecollegeUsecase,
    this._personUsecases,
    this._relationshipUsecases,
  );

  //this will be used for first time generation AND maintaining schoolmate population after
  //return a list of all new schoolmates
  Future<List<Person>> execute({
    required int schoolID,
    required LifeStage precollegeLifeStage,
    required SchoolType precollegeSchoolType,
    required int currentPlayerID,
    required int currentGameID,
    required int currentDay,
    required String currentCountryString,
    required String currentStateString,
  }) async {
    //get all existing schoolmates precollege
    final List<Precollege> existingSchoolmatesPrecolleges =
        await _precollegeRepository.getAllActiveStudentsOfASchool(schoolID);

    //list to store all precollege - person pairs
    final List<PrecollegePersonPair> existingSchoolmatesPrecollegePersonPairs =
        [];

    //get person object for all existing precollege record
    for (int i = 0; i < existingSchoolmatesPrecolleges.length; i++) {
      //current
      final Precollege existingPrecollege = existingSchoolmatesPrecolleges[i];

      //get person
      final Person? person = await _personUsecases.getPersonUsecase
          .execute(personID: existingPrecollege.personId);

      //if it is valid
      if (person != null) {
        //if it is the player remove them from the list, they don't count
        if (person.id == currentPlayerID) {
          //remove them from existing schoolmates list
          existingSchoolmatesPrecolleges.remove(existingPrecollege);
        }
        //
        //check if they are dead
        else if (person.dead) {
          //make their record inactive
          await _precollegeRepository.updatePrecollege(
            existingPrecollege.copyWith(
              active: false,
            ),
          );
          //remove them from existing schoolmates list
          existingSchoolmatesPrecolleges.remove(existingPrecollege);
        }
        //if they are alive
        else {
          //add them to the list
          existingSchoolmatesPrecollegePersonPairs.add(
            PrecollegePersonPair(
              precollege: existingPrecollege,
              person: person,
            ),
          );
        }
      }
    }

    //find out how many female and male students we need to generate
    int numberOfFemaleStudentsNeeded = 0;
    int numberOfMaleStudentsNeeded = 0;

    for (var gender in Gender.values) {
      //get existing students count
      final int numberOfExistingStudentsForGender = (gender == Gender.Female)
          ? existingSchoolmatesPrecollegePersonPairs
              .where((element) => element.person.gender == Gender.Female.name)
              .length
          : existingSchoolmatesPrecollegePersonPairs
              .where((element) => element.person.gender == Gender.Male.name)
              .length;

      //if the number of existing students is less than the minimum required population
      if (numberOfExistingStudentsForGender <
          SchoolInfo.precollegeSchoolmatesPopulationRangePerGender.min) {
        //choose a random number for required
        final int required = getRandomIntInPositiveRange(
          min: SchoolInfo.precollegeSchoolmatesPopulationRangePerGender.min,
          max: SchoolInfo.precollegeSchoolmatesPopulationRangePerGender.max,
        );


        //calculate needed
        if (gender == Gender.Female) {
          numberOfFemaleStudentsNeeded =
              required - numberOfExistingStudentsForGender;
        } else {
          numberOfMaleStudentsNeeded =
              required - numberOfExistingStudentsForGender;
        }
      }
    }

    //
    //
    final List<Person> newlyAddedStudents = [];

    //if we need people let's generate them
    if (numberOfMaleStudentsNeeded > 0 || numberOfFemaleStudentsNeeded > 0) {
      //First we want to use people that already exist in the world

      //get people in the lifestage, country and state
      final List<Person> foundPeople = await _personUsecases
          .getLivingPeopleInSpecificLifeStageAndCountryUsecase
          .execute(
        currentDay: currentDay,
        lifeStage: precollegeLifeStage,
        countryString: currentCountryString,
        stateString: currentStateString,
      );

      //remove everyone who is already a student at the school from the list
      foundPeople.removeWhere(
        (foundPerson) => existingSchoolmatesPrecolleges.any(
          (element) => element.personId == foundPerson.id,
        ),
      );

      //Take from the found people list:

      //make sure the female number needed is not zero
      // then filter the list for only female people, take the needed amount and add to the new students list
      if (numberOfFemaleStudentsNeeded > 0) {
        newlyAddedStudents.addAll(
          foundPeople
              .where((element) => element.gender == Gender.Female.name)
              .take(numberOfFemaleStudentsNeeded),
        );

        //update the needed number
        numberOfFemaleStudentsNeeded -= newlyAddedStudents
            .where((element) => element.gender == Gender.Female.name)
            .length;
      }

      //make sure the male number needed is not zero
      // then filter the list for only male people, take the needed amount and add to the new students list
      if (numberOfMaleStudentsNeeded > 0) {
        newlyAddedStudents.addAll(
          foundPeople
              .where((element) => element.gender == Gender.Male.name)
              .take(numberOfMaleStudentsNeeded),
        );
        //update the needed number
        numberOfMaleStudentsNeeded -= newlyAddedStudents
            .where((element) => element.gender == Gender.Male.name)
            .length;
      }

      //For everyone we've added from the foundPeople list, we want to connect them to the player
      for (var newStudent in newlyAddedStudents) {
        //create acquaintance relationship with the player if none exists
        //if a relationship already exist, don't touch it
        await _relationshipUsecases.createRelationshipUsecase.execute(
          relationship: getAcquaintanceRelationshipFromTemplate(
            firstPersonID: currentPlayerID,
            secondPersonID: newStudent.id,
            interestedInRelationship:
                Chance.getTrueOrFalseBasedOnPercentageChance(
              trueChancePercentage: 75,
            ),
          ),
          existingRelationshipOverrideInstruction:
              ExistingRelationshipOverrideInstruction.nothing,
        );
      }

      //now we generate people from scratch to fill up whatever vacancy is left

      //female students
      if (numberOfFemaleStudentsNeeded > 0) {
        newlyAddedStudents.addAll(
          await _relationshipUsecases.generateAcquaintancesUsecase.execute(
            numberOfPeople: numberOfFemaleStudentsNeeded,
            allowChanceNotInterestedInRelationship: true,
            currentPlayerID: currentPlayerID,
            currentGameID: currentGameID,
            currentDay: currentDay,
            currentCountryString: currentCountryString,
            currentStateString: currentStateString,
            possibleLifeStages: [precollegeLifeStage],
            gender: Gender.Female,
          ),
        );
      }

      //male students
      if (numberOfMaleStudentsNeeded > 0) {
        newlyAddedStudents.addAll(
          await _relationshipUsecases.generateAcquaintancesUsecase.execute(
            numberOfPeople: numberOfMaleStudentsNeeded,
            allowChanceNotInterestedInRelationship: true,
            currentPlayerID: currentPlayerID,
            currentGameID: currentGameID,
            currentDay: currentDay,
            currentCountryString: currentCountryString,
            currentStateString: currentStateString,
            possibleLifeStages: [precollegeLifeStage],
            gender: Gender.Male,
          ),
        );
      }

      //NOW WE SHOULD HAVE ALL THE NEW STUDENTS WE NEED
      for (var newStudent in newlyAddedStudents) {
        //get student stats
        final Stats? studentStats =
            await _personUsecases.getPersonStatsUsecase.execute(
          newStudent.id,
        );

        //get student intelligence, generate a random one if we didn't find a valid stats
        final int studentIntelligence = studentStats?.intellect ??
            getRandomIntInPositiveRange(
              min: StatsRangeConstants.defaultRange.min,
              max: StatsRangeConstants.defaultRange.max,
            );

        //generate precollege with random grade
        final Precollege precollege = generatePrecollegeWithRandomGrade(
            studentID: newStudent.id,
            precollegeSchoolType: precollegeSchoolType,
            schoolID: schoolID,
            active: true,
            intelligenceStats: studentIntelligence);

        //create it or update existing record
        await _createOrUpdatePrecollegeUsecase.execute(
          precollege: precollege,
        );
      }
    }

    return newlyAddedStudents;
  }
}
