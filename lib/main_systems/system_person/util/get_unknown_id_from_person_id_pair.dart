import 'package:toplife/main_systems/system_person/domain/model/info_models/person_id_pair.dart';

int getUnkownIdFromPersonIdPair({
  required PersonIdPair personIdPair,
  required int knownId,
}) {
  //if the known id = first id, then unkown id = second id
  //else unkown id = first id
  return (personIdPair.firstId == knownId)
      ? personIdPair.secondId
      : personIdPair.firstId;
}
