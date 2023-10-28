import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_types_list_pair.dart';
import 'package:toplife/main_systems/system_relationship/util/get_platonic_relationship_label.dart';

String createBasicParentIntroductionString({
  required List<PersonPlatonicRelationshipTypesListPair>
      parentsWithRelationshipList,
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
    final PersonPlatonicRelationshipTypesListPair parent =
        parentsWithRelationshipList[i];

    final String relationshipLabel = getPlatonicRelationshipLabel(
      platonicRelationshipTypeList: parent.platonicRelationshipTypesList,
      genderString: parent.person.gender,
      previousFamilialRelationship: parent.previousFamilialRelationship,
    );

    final String name = "${parent.person.firstName} ${parent.person.lastName}";

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
    final String name =
        "${parentWithoutRelationshipPerson.firstName} ${parentWithoutRelationshipPerson.lastName}";

    parentsIntroductionBuffer.write("$name, ");
  }

  return parentsIntroductionBuffer.toString();
}
