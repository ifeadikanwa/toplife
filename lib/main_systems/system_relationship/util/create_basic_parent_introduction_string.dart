import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_type_info_pair.dart';
import 'package:toplife/main_systems/system_person/util/get_fullname_string.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_and_romantic_relationship_label_from_enum.dart';

String createBasicParentIntroductionString({
  required List<PersonRelationshipTypeInfoPair> parentsWithRelationshipList,
  required List<Person> parentsWithoutRelationshipList,
}) {
  final StringBuffer parentsIntroductionBuffer = StringBuffer();

  //the parents with relationships come first
  for (var i = 0; i < parentsWithRelationshipList.length; i++) {
    //if it is the last element and not the first and the parent persons with no relationship list is not empty
    if ((i == (parentsWithRelationshipList.length - 1)) &&
        (i != 0) &&
        (parentsWithoutRelationshipList.isEmpty)) {
      //add and to the string
      parentsIntroductionBuffer.write("${TextConstants.and.toLowerCase()} ");
    }

    //no matter the case
    //add the relationship label and the name of the parent to the string
    final PersonRelationshipTypeInfoPair parent =
        parentsWithRelationshipList[i];

    final String relationshipLabel =
        getPlatonicAndRomanticRelationshipLabelFromEnum(
      genderString: parent.person.gender,
      platonicRelationshipTypesEnum:
          parent.relationshipTypeInfo.platonicRelationshipTypes,
      romanticRelationshipTypeEnum:
          parent.relationshipTypeInfo.romanticRelationshipType,
      previousFamilialRelationshipEnum:
          parent.relationshipTypeInfo.previousFamilialRelationship,
      isCoParent: parent.relationshipTypeInfo.isCoParent,
      activeRomance: parent.relationshipTypeInfo.activeRomance,
    );

    final String name = getFullNameString(
      firstName: parent.person.firstName,
      lastName: parent.person.lastName,
    );

    parentsIntroductionBuffer
        .write("$name (${relationshipLabel.toLowerCase()}), ");
  }

  //parents WITHOUT relationships come next
  for (var parentWithoutRelationshipPerson in parentsWithoutRelationshipList) {
    //we dont want to do this if the parent with rel list is empty and we have only one element(this is the first and last element so we cant start sentence with 'and')
    //so
    //do: if this is last element AND the list has multiple elements (there were parents before this person)
    //OR do: if this is the last element AND the previous list is not empty (we cant start the sentence with 'and')
    if (parentWithoutRelationshipPerson ==
            parentsWithoutRelationshipList.last &&
        (parentsWithRelationshipList.isNotEmpty ||
            (parentsWithoutRelationshipList.length != 1))) {
      //add and to the string
      parentsIntroductionBuffer.write("${TextConstants.and.toLowerCase()} ");
    }

    //for all
    final String name = getFullNameString(
      firstName: parentWithoutRelationshipPerson.firstName,
      lastName: parentWithoutRelationshipPerson.lastName,
    );

    parentsIntroductionBuffer.write("$name, ");
  }

  return parentsIntroductionBuffer.toString();
}
