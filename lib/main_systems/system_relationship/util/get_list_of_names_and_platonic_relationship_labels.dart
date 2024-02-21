import 'package:toplife/main_systems/system_person/domain/model/info_models/person_platonic_relationship_type_pair.dart';
import 'package:toplife/main_systems/system_relationship/util/get_name_and_platonic_relationship_label.dart';

String getListOfNamesAndPlatonicRelationshipLabels(
  List<PersonPlatonicRelationshipTypePair>
      personPlatonicRelationshipTypePairsList,
) {
  final StringBuffer listOfNamesAndLabelsBuffer = StringBuffer();

  //add each person on the list
  for (var personPlatonicRelationshipPair
      in personPlatonicRelationshipTypePairsList) {
    listOfNamesAndLabelsBuffer.write(
      getNameAndPlatonicRelationshipLabel(
        firstName: personPlatonicRelationshipPair.person.firstName,
        lastName: personPlatonicRelationshipPair.person.lastName,
        platonicRelationshipTypeList: [
          personPlatonicRelationshipPair.platonicRelationshipType,
        ],
        genderString: personPlatonicRelationshipPair.person.gender,
        previousFamilialRelationship: null,
      ),
    );

    //if it is the last element
    if (personPlatonicRelationshipPair ==
        personPlatonicRelationshipTypePairsList.last) {
      //add a full stop and extra line spacing
      listOfNamesAndLabelsBuffer.write(".\n");
    }
    //if it isn't the last
    else {
      //add a comma and spacing for the next list item
      listOfNamesAndLabelsBuffer.write(",\n");
    }
  }

  return listOfNamesAndLabelsBuffer.toString();
}
