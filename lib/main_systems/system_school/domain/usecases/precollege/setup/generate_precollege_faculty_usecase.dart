import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_school/constants/faculty_role.dart';
import 'package:toplife/main_systems/system_school/constants/school_category.dart';
import 'package:toplife/main_systems/system_school/constants/school_info.dart';
import 'package:toplife/main_systems/system_school/domain/model/info_models/faculty_role_person_pair.dart';
import 'package:toplife/main_systems/system_school/domain/repository/faculty_repository.dart';

class GeneratePrecollegeFacultyUsecase {
  final FacultyRepository _facultyRepository;
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;

  const GeneratePrecollegeFacultyUsecase(
    this._facultyRepository,
    this._personUsecases,
    this._relationshipUsecases,
  );

  //this will be used for first time generation AND maintaining faculty population after
  //return a list of all new faculty members
  Future<List<FacultyRolePersonPair>> execute({
    required int schoolID,
    required int currentPlayerID,
    required int currentGameID,
    required int currentDay,
    required String currentCountryString,
    required String currentStateString,
  }) async {
    //get all existing faculty members
    final List<Faculty> existingFaculties =
        await _facultyRepository.getAllFacultyForSchool(
      schoolID,
    );

    //Do clean up: remove any dead existing faculty member
    for (int i = 0; i < existingFaculties.length; i++) {
      //current
      final Faculty currentFaculty = existingFaculties[i];
      //get their person object
      final Person? person = await _personUsecases.getPersonUsecase.execute(
        personID: currentFaculty.personId,
      );

      //if it is valid and they are dead,
      if (person != null && person.dead) {
        //delete their faculty record
        await _facultyRepository.deleteFaculty(person.id);

        //remove them from the local list
        existingFaculties.remove(currentFaculty);
      }
    }

    //get all precollege faculty roles
    final List<FacultyRole> precollegeFacultyRoles = FacultyRole.values
        .where((element) => element.schoolCategory == SchoolCategory.precollege)
        .toList();

    //list of all newly added faculty
    final List<FacultyRolePersonPair> newlyAddedFaculty = [];

    //for each role we want to decide how many we need to generate and then generate it
    for (var facultyRole in precollegeFacultyRoles) {
      //existing
      final int numberOfExistingFacultyInThisRole = existingFaculties
          .where((element) => element.role == facultyRole.name)
          .length;

      //needed = required - number of existing
      final int neededForRole =
          (facultyRole.population) - numberOfExistingFacultyInThisRole;

      // if we need at least 1 person for the role, then generate

      if (neededForRole > 0) {
        //generate acquaintances for the role
        final List<Person> generatedPeople =
            await _relationshipUsecases.generateAcquaintancesUsecase.execute(
          numberOfPeople: neededForRole,
          allowChanceNotInterestedInRelationship: true,
          currentPlayerID: currentPlayerID,
          currentGameID: currentGameID,
          currentDay: currentDay,
          currentCountryString: currentCountryString,
          currentStateString: currentStateString,
          possibleLifeStages: SchoolInfo.possibleLifeStagesForPrecollegeFaculty,
        );

        //make the generated people faculty
        for (var generatedPerson in generatedPeople) {
          //create
          await _facultyRepository.createOrUpdateFaculty(
            Faculty(
              personId: generatedPerson.id,
              schoolId: schoolID,
              role: facultyRole.name,
            ),
          );

          //add to the list
          newlyAddedFaculty.add(
            FacultyRolePersonPair(
              facultyRole: facultyRole,
              person: generatedPerson,
            ),
          );
        }
      }
    }

    return newlyAddedFaculty;
  }
}
