import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_type_info_pair.dart';
import 'package:toplife/main_systems/system_person/util/get_fullname_string.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_and_romantic_relationship_label_from_enum.dart';

String createSpouseParentIntroductionString({
  required Map<PersonRelationshipTypeInfoPair, Person>
      familialSpouseToParentMap,
  required List<Person> parentsWithNoFamilialSpouse,
}) {
  final StringBuffer parentsIntroductionBuffer = StringBuffer();

  //have to use a counter to keep track of our position in the map
  int counter = 0;

  for (var familialSpouseToParent in familialSpouseToParentMap.entries) {
    //if it is the last element and not the first and the parent persons with no familial spouse list is empty
    if ((counter == (familialSpouseToParentMap.length - 1)) &&
        (counter != 0) &&
        (parentsWithNoFamilialSpouse.isEmpty)) {
      //add and to the string
      parentsIntroductionBuffer.write("${TextConstants.and.toLowerCase()} ");
    }

    //no matter the case
    //add the relationship label and the name of the spouse and parent to the string
    final PersonRelationshipTypeInfoPair spouse = familialSpouseToParent.key;

    final Person parent = familialSpouseToParent.value;

    final String spouseRelationshipLabel =
        getPlatonicAndRomanticRelationshipLabelFromEnum(
      genderString: spouse.person.gender,
      platonicRelationshipTypesEnum:
          spouse.relationshipTypeInfo.platonicRelationshipTypes,
      romanticRelationshipTypeEnum:
          spouse.relationshipTypeInfo.romanticRelationshipType,
      previousFamilialRelationshipEnum:
          spouse.relationshipTypeInfo.previousFamilialRelationship,
      isCoParent: spouse.relationshipTypeInfo.isCoParent,
      activeRomance: spouse.relationshipTypeInfo.activeRomance,
    );

    final String spouseName = getFullNameString(
      firstName: spouse.person.firstName,
      lastName: spouse.person.lastName,
    );

    final String parentName = getFullNameString(
      firstName: parent.firstName,
      lastName: parent.lastName,
    );

    parentsIntroductionBuffer.write(
        "$spouseName's (${spouseRelationshipLabel.toLowerCase()}) ${TextConstants.spouse.toLowerCase()}, $parentName, ");

    //increase counter
    counter++;
  }

  //if parents without familial spouse is not empty
  //AND spouse parent map is not empty(we dont want to start the sentence with 'along with')
  if (parentsWithNoFamilialSpouse.isNotEmpty &&
      familialSpouseToParentMap.isNotEmpty) {
    parentsIntroductionBuffer
        .write("${TextConstants.alongWith.toLowerCase()} ");
  }

  //parents WITHOUT familial spouse come next
  for (var parentWithNoFamilialSpouse in parentsWithNoFamilialSpouse) {
    //if it is the last person in the list AND NOT the first
    if ((parentWithNoFamilialSpouse == parentsWithNoFamilialSpouse.last) &&
        parentWithNoFamilialSpouse != parentsWithNoFamilialSpouse.first) {
      //add and to the string
      parentsIntroductionBuffer.write("${TextConstants.and.toLowerCase()} ");
    }

    //for all
    final String name = getFullNameString(
      firstName: parentWithNoFamilialSpouse.firstName,
      lastName: parentWithNoFamilialSpouse.lastName,
    );

    parentsIntroductionBuffer.write("$name, ");
  }

  return parentsIntroductionBuffer.toString();
}
